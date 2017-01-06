/********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: CusLib
 * File: CusLib.hpp
 * Author: renj
 * Created: December 19, 2014
 *******************************************************************/
#include <vector>
#include <map>
#include <string>
#include <sstream>
#include "deelx.h"
#include "Arnc0mx.h"
#include "AsTime.h"

using namespace std;

// This Class defines static Functions for Strings, just Type StringHelper::Functions()
class StringHelper{
	public:
	// Convert String To Value u have to specify the type of the value using StringTo<type>(String)
	template <class T> // Convert String To Value 
	static T StringTo(const string& str)
	{
		istringstream iss(str);
		T num;
		iss >> num;
		return num;
	}

	// Convert Value to String, just to put ToString(Value) no type is needed
	template <class T>
	static string ToString(const T& num)
	{
		stringstream str;
		str << num;
		return str.str();
	}
	
	// Add - Copy(Num) to the end of filename
	static string GetCopyName(const string& filename) 
	{
		stringstream str;
		size_t pos = filename.find(" - Copy");
		if (pos != string::npos)
		{
			size_t pos = filename.find(" - Copy (");
			if (pos != string::npos)
			{
				int num = StringHelper::StringTo<int>(filename.substr(pos + 9, filename.find(")") - pos - 9));
				str << filename.substr(0, pos + 9)<< num+1 << ")";
				return str.str();

			} else 
			{
				str << filename << " (2)";
				return str.str();
			}
			
		} else
		{
			str << filename << " - Copy";
			return str.str();
		}
	}
	
	// Get 4 Digits Line No String 
	template <class T>
	static string GetLineNoStr(const T& num)
	{
		char buff[10];
		sprintf(buff, "%04d ", num);
		string buffStr = buff;
		return buffStr;
	}
	// Convert DTStruct to StringFormat(2000/12/02 16:32)
	static string DTStructToString(DTStructure &DTStruct)
	{
		stringstream ss;
		ss << DTStruct.year << "/";
		if ((int)DTStruct.month < 10) 
			ss << "0";
		ss << (int)DTStruct.month << "/";
		if ((int)DTStruct.day < 10)
			ss << "0";
		ss << (int)DTStruct.day << " ";
		if ((int)DTStruct.hour < 10)
			ss << "0";
		ss << (int)DTStruct.hour <<":";
		if ((int)DTStruct.minute < 10)
			ss << "0";
		ss << (int)DTStruct.minute;
		
		return ss.str();
		
	}
	// Generate some varname according to type
	static string GetVarName(const string&Type, const string& Name)
	{
		stringstream ss;
		int Index;
		if (Name != "")
		{
			int Pos = Name.find_first_of("0123456789");
			Index = StringTo<int>(Name.substr(Pos, Name.size() - Pos)) + 1;
		}
		else
		{
			Index = 0;
		}

		if (Type == "MXPointType")
		{
			ss << "p" << Index;
			
		}
		else if (Type == "MXFrameType")
		{
			ss << "frm" << Index;
		}
		else if (Type == "MXAxisTargetType")
		{
			ss << "ax" << Index;
		}
		else if (Type == "MXToolType")
		{
			ss << "tool" << Index;
		}
		else if (Type == "MXVelocityType")
		{
			ss << "vel" << Index;
		}
		else if (Type == "MXPathDescType")
		{
			ss << "path" << Index;
		}
		else if (Type == "INT")
		{
			ss << "i" << Index;
		}
		else if (Type == "REAL")
		{
			ss << "r" << Index;
		}
		else if (Type == "BOOL")
		{
			ss << "b" << Index;
		}
		else
		{
			return "";
		}
		
		return ss.str();
	}
};

template<class T> // Variable means vector of BasicTypes
class VarType{
	public:
	VarType(){};
	vector<T> Var;
	bool IsConstant;
};

struct VarInfoType
{
	string Name;
	string Type;
	int Size;
	bool IsConstant;
};// Variable info class

class VarListType{
	public:
	map<string, VarType<MXPointType> > Point;
	map<string, VarType<MXFrameType> > Frame;
	map<string, VarType<MXToolType> > Tool;
	map<string, VarType<MXPathDescType> > Path;
	map<string, VarType<MXVelocityType> > Vel;
	map<string, VarType<MXAxisTargetType> > Axis;
	map<string, VarType<INT> > Int;
	map<string, VarType<REAL> > Real;
	map<string, VarType<BOOL> > Bool;	
};

class RegexpType{

	public:
	RegexpType(const string& Text, const vector<string> &Labels, int Mode = 0){
		Regexp.Compile(Text.c_str(), Mode);
		for (int i = 0; i < Labels.size(); ++i)
			GroupNumber[Labels[i]] = Regexp.GetNamedGroupNumber(Labels[i].c_str());
	}

	RegexpType(){}
	
	CRegexpT<char> Regexp;
	map<string, int> GroupNumber;

};

class STHandler{

	public:
	STHandler(){
		
		// VAR (CONSTANT) ... END_VAR
		vector<string> Labels ;
		Labels.push_back("Constant");
		RegexpStrs["VAR"] = "VAR(?<Constant>[ \\t]+CONSTANT)?[ \\t]*\\s?\\n(?<Content>(.*\\s?\\n)*?)END_VAR";
		Regexps["VAR"] = new RegexpType(RegexpStrs["VAR"], Labels);
		
		// Single Variable name : type (:=());
		Labels.clear();
		Labels.push_back("Name");Labels.push_back("Type");Labels.push_back("Content");Labels.push_back("Value");
		RegexpStrs["Single"] = "(?<Name>\\w+)[ \\t]*:[ \\t]*(?<Type>\\w+)\\s*(?<Content>:=\\s*(?<Value>.*))?\\s*;";
		RegexpStrs["SingleTemplate"] = "[ \\t]*:[ \\t]*(?<Type>\\w+)\\s*(?<Content>:=\\s*(?<Value>.*))?\\s*;\\s*";
		Regexps["Single"] = new RegexpType(RegexpStrs["Single"], Labels);
		
		// Array Variable
		Labels.push_back("ArraySize");
		RegexpStrs["Array"] = "(?<Name>\\w+)[ \\t]*:[ \\t]*ARRAY\\[0\\.\\.(?<ArraySize>\\d+)\\][ \\t]+OF[ \\t]+(?<Type>\\w+)\\s*(?<Content>:=\\s*\\[\\s*(?<Value>((.*),\\s*)*(.*))\\s*\\][ \\t]*)?;";
		RegexpStrs["ArrayTemplate"] = "[ \\t]*:[ \\t]*ARRAY\\[0\\.\\.(?<ArraySize>\\d+)\\][ \\t]+OF[ \\t]+(?<Type>\\w+)\\s*(?<Content>:=\\s*\\[\\s*(?<Value>((.*),\\s*)*(.*))\\s*\\][ \\t]*)?;\\s*";
		Regexps["Array"] = new RegexpType(RegexpStrs["Array"], Labels);
		
		// Point/Frame/Vel/Path/Tool/Axis
		string TypeName[6] = { "MXPointType", "MXFrameType", "MXVelocityType", "MXPathDescType", "MXToolType", "MXAxisTargetType" };
		string StrRegs[6] = {
			"(?<Single>\\([\\t]*Pos[ \\t]*:=[ \\t]*\\([ \\t]*x[ \\t]*:=[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*,[ \\t]*y[ \\t]*:=[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*,[ \\t]*z[ \\t]*:=[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*\\)[ \\t]*,[ \\t]*Orient[ \\t]*:=[ \\t]*\\([ \\t]*Angle[ \\t]*:=[ \\t]*\\[[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*,[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*,[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*,[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*\\][ \\t]*,[ \\t]*Type[ \\t]*:=[ \\t]*(\\d)[ \\]*\\)[ \\t]*\\))|(?<Plural>(?<ArraySizePlural>\\d+)\\((?R<Single>)\\))|(?<Zero>(?<ArraySizeZero>\\d*)?\\([ \\t]*0[ \\t]*\\))",
			"(?<Single>\\([\\t]*Pos[ \\t]*:=[ \\t]*\\([ \\t]*x[ \\t]*:=[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*,[ \\t]*y[ \\t]*:=[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*,[ \\t]*z[ \\t]*:=[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*\\)[ \\t]*,[ \\t]*Orient[ \\t]*:=[ \\t]*\\([ \\t]*Angle[ \\t]*:=[ \\t]*\\[[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*,[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*,[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*,[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*\\][ \\t]*,[ \\t]*Type[ \\t]*:=[ \\t]*(\\d)[ \\]*\\)[ \\t]*\\))|(?<Plural>(?<ArraySizePlural>\\d+)\\((?R<Single>)\\))|(?<Zero>(?<ArraySizeZero>\\d*)?\\([ \\t]*0[ \\t]*\\))",
			"(?<Single>\\([ \\t]*v[ \\t]*:=[ \\t]*(\\d+\\.?\\d*)[ \\t]*,[ \\t]*Mode[ \\t]*:=[ \\t]*(\\d)[ \\t]*\\))|(?<Plural>(?<ArraySizePlural>\\d+)\\((?R<Single>)\\))|(?<Zero>(?<ArraySizeZero>\\d*)?\\([ \\t]*0[ \\t]*\\))",
			"(?<Single>\\([ \\t]*Trans[ \\t]*:=[ \\t]*\\([ \\t]*Radius[ \\t]*:=[ \\t]*(\\d+\\.?\\d*)[ \\t]*,[ \\t]*Type[ \\t]*:=[ \\t]*(\\d)[ \\t]*\\)[ \\t]*\\))|(?<Plural>(?<ArraySizePlural>\\d+)\\((?R<Single>)\\))|(?<Zero>(?<ArraySizeZero>\\d*)?\\([ \\t]*0[ \\t]*\\))",
			"(?<Single>\\([ \\t]*Frame[ \\t]*:=[ \\t]*\\([ \\t]*Pos[ \\t]*:=[ \\t]*\\([ \\t]*x[ \\t]*:=[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*,[ \\t]*y[ \\t]*:=[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*,[ \\t]*z[ \\t]*:=[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*\\)[ \\t]*,[ \\t]*Orient[ \\t]*:=[ \\t]*\\([ \\t]*Angle[ \\t]*:=[ \\t]*\\[[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*,[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*,[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*,[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*\\][ \\t]*,[ \\t]*Type[ \\t]*:=[ \\t]*(\\d)[ \\]*\\)[ \\t]*\\)[ \\t]*,[ \\t]*Radius[ \\t]*:=[ \\t]*(\\d+\\.?\\d*)[ \\t]*\\))|(?<Plural>(?<ArraySizePlural>\\d+)\\((?R<Single>)\\))|(?<Zero>(?<ArraySizeZero>\\d*)?\\([ \\t]*0[ \\t]*\\))",
			"(?<Single>\\([ \\t]*JointAxis[ \\t]*:=[ \\t]*\\[[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*,[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*,[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*,[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*,[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*,[ \\t]*(-?\\d+\\.?\\d*)[ \\t]*\\][ \\t]*\\))|(?<Plural>(?<ArraySizePlural>\\d+)\\((?R<Single>)\\))|(?<Zero>(?<ArraySizeZero>\\d*)?\\([ \\t]*0[ \\t]*\\))"
			};
		
		Labels.clear();
		Labels.push_back("Single");Labels.push_back("Plural");Labels.push_back("ArraySizePlural");Labels.push_back("Zero");Labels.push_back("ArraySizeZero");
		
		for (int i = 0; i < 6; ++i)
			{
			Regexps[TypeName[i]] = new RegexpType(StrRegs[i], Labels);
			RegexpStrs[TypeName[i]] = StrRegs[i];
		}
			
		// INT/BOOL/REAL
		string BasicTypeName[3] = {"INT", "BOOL", "REAL"};
		string BasicStrRegs[3] = {
			"(?<Single>(-?\\d+))|(?<Plural>(?<ArraySizePlural>\\d+)\\([\\t ]*(?R<Single>)[\\t ]*\\))",
			"(?<Single>(0|1))|(?<Plural>(?<ArraySizePlural>\\d+)\\([\\t ]*(?R<Single>)[\\t ]*\\))",
			"(?<Single>(-?\\d+\\.?\\d*))|(?<Plural>(?<ArraySizePlural>\\d+)\\([\\t ]*(?R<Single>)[\\t ]*\\))"
			};
		
		Labels.clear();
		Labels.push_back("Single");Labels.push_back("Plural");Labels.push_back("ArraySizePlural");
		
		for (int i = 0; i < 3; ++i)
			{
			Regexps[BasicTypeName[i]] = new RegexpType(BasicStrRegs[i], Labels);
			RegexpStrs[BasicTypeName[i]] = BasicStrRegs[i];
		}		

		Regexps["Common"] = new RegexpType();

	}

	void SetText(const string& Text){
		STText = Text;
	}
	string GetText(void){
		return STText;
	}	
	// "Get" Series
	void GetVarNames(map<string, int> & VarStrings)
	{
		VarStrings.clear();
		
		// Point
		map<string, VarType<MXPointType> >::iterator PointIter = VarList.Point.begin();
		while (PointIter != VarList.Point.end())
		{	
			if (PointIter->second.Var.size() > 1)
				VarStrings.insert(pair<string, int>(PointIter->first + "[]", 1));
			else
				VarStrings.insert(pair<string, int>(PointIter->first, 0));
			++PointIter;
		} 
		// Frame
		map<string, VarType<MXFrameType> >::iterator FrameIter = VarList.Frame.begin();
		while (FrameIter != VarList.Frame.end())
		{
			if (FrameIter->second.Var.size() > 1)
				VarStrings.insert(pair<string, int>(FrameIter->first + "[]", 1));
			else
				VarStrings.insert(pair<string, int>(FrameIter->first, 0));
			++FrameIter;
		}
		// Tool
		map<string, VarType<MXToolType> >::iterator ToolIter = VarList.Tool.begin();
		while (ToolIter != VarList.Tool.end())
		{
			if (ToolIter->second.Var.size() > 1)
				VarStrings.insert(pair<string, int>(ToolIter->first + "[]", 1));
			else
				VarStrings.insert(pair<string, int>(ToolIter->first, 0));
			++ToolIter;
		}
		// Velocity
		map<string, VarType<MXVelocityType> >::iterator VelIter = VarList.Vel.begin();
		while (VelIter != VarList.Vel.end())
		{
			if (VelIter->second.Var.size() > 1)
				VarStrings.insert(pair<string, int>(VelIter->first + "[]", 1));
			else
				VarStrings.insert(pair<string, int>(VelIter->first, 0));

			++VelIter;
		}
		// AxisTarget
		map<string, VarType<MXAxisTargetType> >::iterator AxisIter = VarList.Axis.begin();
		while (AxisIter != VarList.Axis.end())
		{
			if (AxisIter->second.Var.size() > 1)
				VarStrings.insert(pair<string, int>(AxisIter->first + "[]", 1));
			else
				VarStrings.insert(pair<string, int>(AxisIter->first, 0));

			++AxisIter;
		}
		// Path
		map<string, VarType<MXPathDescType> >::iterator PathIter = VarList.Path.begin();
		while (PathIter != VarList.Path.end())
		{
			if (PathIter->second.Var.size() > 1)
				VarStrings.insert(pair<string, int>(PathIter->first + "[]", 1));
			else
				VarStrings.insert(pair<string, int>(PathIter->first, 0));

			++PathIter;
		}
		// Int
		map<string, VarType<INT> >::iterator IntIter = VarList.Int.begin();
		while (IntIter != VarList.Int.end())
		{
			if (IntIter->second.Var.size() > 1)
				VarStrings.insert(pair<string, int>(IntIter->first + "[]", 1));
			else
				VarStrings.insert(pair<string, int>(IntIter->first, 0));
			
			++IntIter;
		}

		// Real
		map<string, VarType<REAL> >::iterator RealIter = VarList.Real.begin();
		while (RealIter != VarList.Real.end())
		{
			if (IntIter->second.Var.size() > 1)
				VarStrings.insert(pair<string, int>(RealIter->first + "[]", 1));
			else
				VarStrings.insert(pair<string, int>(RealIter->first, 0));

			++RealIter;
		}

		// Bool
		map<string, VarType<BOOL> >::iterator BoolIter = VarList.Bool.begin();
		while (BoolIter != VarList.Bool.end())
		{
			if (BoolIter->second.Var.size() > 1)
				VarStrings.insert(pair<string, int>(BoolIter->first + "[]", 1));
			else
				VarStrings.insert(pair<string, int>(BoolIter->first, 0));

			++BoolIter;
		}
		
	}
	
	bool GetInfoFromName(const string &Name, VarInfoType &VarInfo)
	{
		// Point
		map<string, VarType<MXPointType> >::iterator PointIter = VarList.Point.begin();
		while (PointIter != VarList.Point.end())
		{
			if (PointIter->first == Name)
			{
				VarInfo.Name = Name;
				VarInfo.Type = "MXPointType";
				VarInfo.IsConstant = PointIter->second.IsConstant;
				VarInfo.Size = PointIter->second.Var.size();
				return true;
			}		
			++PointIter;
		} 
		// Frame
		map<string, VarType<MXFrameType> >::iterator FrameIter = VarList.Frame.begin();
		while (FrameIter != VarList.Frame.end())
		{
			if (FrameIter->first == Name)
			{
				VarInfo.Name = Name;
				VarInfo.Type = "MXFrameType";
				VarInfo.IsConstant = FrameIter->second.IsConstant;
				VarInfo.Size = FrameIter->second.Var.size();
				return true;
			}

			++FrameIter;
		}
		// Tool
		map<string, VarType<MXToolType> >::iterator ToolIter = VarList.Tool.begin();
		while (ToolIter != VarList.Tool.end())
		{
			if (ToolIter->first == Name)
			{
				VarInfo.Name = Name;
				VarInfo.Type = "MXToolType";
				VarInfo.IsConstant = ToolIter->second.IsConstant;
				VarInfo.Size = ToolIter->second.Var.size();
				return true;
			}

			++ToolIter;
		}
		// Velocity
		map<string, VarType<MXVelocityType> >::iterator VelIter = VarList.Vel.begin();
		while (VelIter != VarList.Vel.end())
		{
			if (VelIter->first == Name)
			{
				VarInfo.Name = Name;
				VarInfo.Type = "MXVelocityType";
				VarInfo.IsConstant = VelIter->second.IsConstant;
				VarInfo.Size = VelIter->second.Var.size();
				return true;
			}

			++VelIter;
		}
		// AxisTarget
		map<string, VarType<MXAxisTargetType> >::iterator AxisIter = VarList.Axis.begin();
		while (AxisIter != VarList.Axis.end())
		{
			if (AxisIter->first == Name)
			{
				VarInfo.Name = Name;
				VarInfo.Type = "MXAxisTargetType";
				VarInfo.IsConstant = AxisIter->second.IsConstant;
				VarInfo.Size = AxisIter->second.Var.size();
				return true;
			}

			++AxisIter;
		}
		// Path
		map<string, VarType<MXPathDescType> >::iterator PathIter = VarList.Path.begin();
		while (PathIter != VarList.Path.end())
		{
			if (PathIter->first == Name)
			{
				VarInfo.Name = Name;
				VarInfo.Type = "MXPathDescType";
				VarInfo.IsConstant = PathIter->second.IsConstant;
				VarInfo.Size = PathIter->second.Var.size();
				return true;
			}

			++PathIter;
		}
		// Int
		map<string, VarType<INT> >::iterator IntIter = VarList.Int.begin();
		while (IntIter != VarList.Int.end())
		{
			if (IntIter->first == Name)
			{
				VarInfo.Name = Name;
				VarInfo.Type = "INT";
				VarInfo.IsConstant = IntIter->second.IsConstant;
				VarInfo.Size = IntIter->second.Var.size();
				return true;
			}

			++IntIter;
		}

		// Real
		map<string, VarType<REAL> >::iterator RealIter = VarList.Real.begin();
		while (RealIter != VarList.Real.end())
		{
			if (RealIter->first == Name)
			{
				VarInfo.Name = Name;
				VarInfo.Type = "REAL";
				VarInfo.IsConstant = RealIter->second.IsConstant;
				VarInfo.Size = RealIter->second.Var.size();
				return true;
			}

			++RealIter;
		}

		// Bool
		map<string, VarType<BOOL> >::iterator BoolIter = VarList.Bool.begin();
		while (BoolIter != VarList.Bool.end())
		{
			if (BoolIter->first == Name)
			{
				VarInfo.Name = Name;
				VarInfo.Type = "BOOL";
				VarInfo.IsConstant = BoolIter->second.IsConstant;
				VarInfo.Size = BoolIter->second.Var.size();
				return true;
			}

			++BoolIter;
		}

		return false;

	}// Get Info according to Name
	bool GetInfoFromType(const string &Type, VarInfoType &VarInfo)
	{
		if (Type == "MXPointType")
		{
			if (PointIter != VarList.Point.end())
			{
				VarInfo.Name = PointIter->first;
				VarInfo.IsConstant = PointIter->second.IsConstant;
				VarInfo.Size = PointIter->second.Var.size();
				VarInfo.Type = Type;
				++PointIter;
				return 1;
			}
			else
				return 0;
		}
		else if (Type == "MXFrameType")
		{
			if (FrameIter != VarList.Frame.end())
			{
				VarInfo.Name = FrameIter->first;
				VarInfo.IsConstant = FrameIter->second.IsConstant;
				VarInfo.Size = FrameIter->second.Var.size();
				VarInfo.Type = Type;
				++FrameIter;
				return 1;
			}
			else
				return 0;
		}
		else if (Type == "MXToolType")
		{
			if (ToolIter != VarList.Tool.end())
			{
				VarInfo.Name = ToolIter->first;
				VarInfo.IsConstant = ToolIter->second.IsConstant;
				VarInfo.Size = ToolIter->second.Var.size();
				VarInfo.Type = Type;
				++ToolIter;
				return 1;
			}
			else
				return 0;
		}
		else if (Type == "MXVelocityType")
		{
			if (VelIter != VarList.Vel.end())
			{
				VarInfo.Name = VelIter->first;
				VarInfo.IsConstant = VelIter->second.IsConstant;
				VarInfo.Size = VelIter->second.Var.size();
				VarInfo.Type = Type;
				++VelIter;
				return 1;
			}
			else
				return 0;
		}
		else if (Type == "MXPathDescType")
		{
			if (PathIter != VarList.Path.end())
			{
				VarInfo.Name = PathIter->first;
				VarInfo.IsConstant = PathIter->second.IsConstant;
				VarInfo.Size = PathIter->second.Var.size();
				VarInfo.Type = Type;
				++PathIter;
				return 1;
			}
			else
				return 0;
		}
		else if (Type == "MXAxisTargetType")
		{
			if (AxisIter != VarList.Axis.end())
			{
				VarInfo.Name = AxisIter->first;
				VarInfo.IsConstant = AxisIter->second.IsConstant;
				VarInfo.Size = AxisIter->second.Var.size();
				VarInfo.Type = Type;
				++AxisIter;
				return 1;
			}
			else
				return 0;
		}
		else if (Type == "REAL")
		{
			if (RealIter != VarList.Real.end())
			{
				VarInfo.Name = RealIter->first;
				VarInfo.IsConstant = RealIter->second.IsConstant;
				VarInfo.Size = RealIter->second.Var.size();
				VarInfo.Type = Type;
				++RealIter;
				return 1;
			}
			else
				return 0;
		}
		else if (Type == "INT")
		{
			if (IntIter != VarList.Int.end())
			{
				VarInfo.Name = IntIter->first;
				VarInfo.IsConstant = IntIter->second.IsConstant;
				VarInfo.Size = IntIter->second.Var.size();
				VarInfo.Type = Type;
				++IntIter;
				return 1;
			}
			else
				return 0;
		}
		else if (Type == "BOOL")
		{
			if (BoolIter != VarList.Bool.end())
			{
				VarInfo.Name = BoolIter->first;
				VarInfo.IsConstant = BoolIter->second.IsConstant;
				VarInfo.Size = BoolIter->second.Var.size();
				VarInfo.Type = Type;
				++BoolIter;
				return 1;
			}
			else
				return 0;
		}
	}
	int GetTypeSize(const string &Type)
	{
		if (Type == "MXPointType")
			return VarList.Point.size();
		else if (Type == "MXAxisTargetType")
			return VarList.Axis.size();
		else if (Type == "MXFrameType")
			return VarList.Frame.size();
		else if (Type == "MXVelocityType")
			return VarList.Vel.size();
		else if (Type == "MXToolType")
			return VarList.Tool.size();
		else if (Type == "MXPathDescType")
			return VarList.Path.size();
		else if (Type == "INT")
			return VarList.Int.size();
		else if (Type == "BOOL")
			return VarList.Bool.size();
		else if (Type == "REAL")
			return VarList.Real.size();
	}
	void SetIter(const string &Type, int Index)
	{
		if (Type == "MXPointType")
		{
			if (Index < VarList.Point.size())
			{
				PointIter = VarList.Point.begin();
				if (Index > 0)
					for (int i = 0; i < Index; ++i, ++PointIter);
					}
		} 
		else if (Type == "MXAxisTargetType")
		{
			if (Index < VarList.Axis.size())
			{
				AxisIter = VarList.Axis.begin();
				if (Index > 0)
					for (int i = 0; i < Index; ++i, ++AxisIter);
					}
		}
		else if (Type == "MXFrameType")
		{
			if (Index < VarList.Frame.size())
			{
				FrameIter = VarList.Frame.begin();
				if (Index > 0)
					for (int i = 0; i < Index; ++i, ++FrameIter);
					}
		}
		else if (Type == "MXToolType")
		{
			if (Index < VarList.Tool.size())
			{
				ToolIter = VarList.Tool.begin();
				if (Index > 0)
					for (int i = 0; i < Index; ++i, ++ToolIter);
					}
		}
		else if (Type == "MXVelocityType")
		{
			if (Index < VarList.Vel.size())
			{
				VelIter = VarList.Vel.begin();
				if (Index > 0)
					for (int i = 0; i < Index; ++i, ++VelIter);
					}
		}
		else if (Type == "MXPathDescType")
		{
			if (Index < VarList.Path.size())
			{
				PathIter = VarList.Path.begin();
				if (Index > 0)
					for (int i = 0; i < Index; ++i, ++PathIter);
					}
		}
		else if (Type == "INT")
		{
			if (Index < VarList.Int.size())
			{
				IntIter = VarList.Int.begin();
				if (Index > 0)
					for (int i = 0; i < Index; ++i, ++IntIter);
					}
		}
		else if (Type == "REAL")
		{
			if (Index < VarList.Real.size())
			{
				RealIter = VarList.Real.begin();
				if (Index > 0)
					for (int i = 0; i < Index; ++i, ++RealIter);
					}
		}
		else if (Type == "BOOL")
		{
			if (Index < VarList.Bool.size())
			{
				BoolIter = VarList.Bool.begin();
				if (Index > 0)
					for (int i = 0; i < Index; ++i, ++BoolIter);
					}
		}

		
	}

	// Read Variable
	bool ReadVariable(const string &Name, MXPointType &Point, int Index = 0)
	{
		if (VarList.Point.find(Name) != VarList.Point.end()) 
		{
			Point = VarList.Point[Name].Var[Index];
			return 1;
		}
		else
			return 0;
	}
	bool ReadVariable(const string &Name, MXFrameType &Frame, int Index = 0)
	{
		if (VarList.Frame.find(Name) != VarList.Frame.end()) 
		{
			Frame = VarList.Frame[Name].Var[Index];
			return 1;
		}
		else
			return 0;
	}
	bool ReadVariable(const string &Name, MXToolType &Tool, int Index = 0)
	{
		if (VarList.Tool.find(Name) != VarList.Tool.end()) 
		{
			Tool = VarList.Tool[Name].Var[Index];
			return 1;
		}
		else
			return 0;
	
	}
	bool ReadVariable(const string &Name, MXPathDescType &Path, int Index = 0)
	{
		if (VarList.Path.find(Name) != VarList.Path.end()) 
		{
			Path = VarList.Path[Name].Var[Index];
			return 1;
		}
		else
			return 0;
		
	}
	bool ReadVariable(const string &Name, MXVelocityType &Vel, int Index = 0)
	{
		if (VarList.Vel.find(Name) != VarList.Vel.end()) 
		{
			Vel = VarList.Vel[Name].Var[Index];
			return 1;
		}
		else
			return 0;
		
	}
	bool ReadVariable(const string &Name, MXAxisTargetType &Axis, int Index = 0)
	{
		if (VarList.Axis.find(Name) != VarList.Axis.end()) 
		{
			Axis = VarList.Axis[Name].Var[Index];
			return 1;
		}
		else
			return 0;
	
	}
	bool ReadVariable(const string &Name, INT &Int, int Index = 0)
	{
		if (VarList.Int.find(Name) != VarList.Int.end()) 
		{
			Int = VarList.Int[Name].Var[Index];
			return 1;
		}
		else
			return 0;
		
	}
	bool ReadVariable(const string &Name, REAL &Real, int Index = 0)
	{
		if (VarList.Real.find(Name) != VarList.Real.end()) 
		{
			Real = VarList.Real[Name].Var[Index];
			return 1;
		}
		else
			return 0;
	
	}
	bool ReadVariable(const string &Name, BOOL &Bool, int Index = 0)
	{
		if (VarList.Bool.find(Name) != VarList.Bool.end()) 
		{
			Bool = VarList.Bool[Name].Var[Index];
			return 1;
		}
		else
			return 0;
		
	}
	
	// Analyse the Text
	bool Parse()
	{
		VarList.Axis.clear();
		VarList.Bool.clear();
		VarList.Frame.clear();
		VarList.Int.clear();
		VarList.Path.clear();
		VarList.Point.clear();
		VarList.Real.clear();
		VarList.Tool.clear();
		VarList.Vel.clear();

		MatchResult resultText;
		// ReadVars
		int VarPos = 0;

		while(true)
		{
			resultText = Regexps["VAR"]->Regexp.Match(STText.c_str(), VarPos);	
			
			if (resultText.IsMatched()){
				
				VarPos = resultText.GetEnd();
				string VarText = STText.substr(resultText.GetStart(), resultText.GetEnd() - resultText.GetStart());
				
				//if its a constant
				bool IsConstant;
				if (!(resultText.GetGroupStart(Regexps["VAR"]->GroupNumber["Constant"]) < 0))
					IsConstant = 1;
				else
					IsConstant = 0;
				
				// Get Every Var Iteratively // Single Variable
				MatchResult resultLine;
				int Pos = 0;
				
				while (true) {
					resultLine = Regexps["Single"]->Regexp.Match(VarText.c_str(), Pos);
					// Single Variable
					if (resultLine.IsMatched()){
															
						Pos = resultLine.GetEnd();
						int GroupNumber = Regexps["Single"]->GroupNumber["Type"];
						string Type = VarText.substr(resultLine.GetGroupStart(GroupNumber), resultLine.GetGroupEnd(GroupNumber) - resultLine.GetGroupStart(GroupNumber));
						GroupNumber = Regexps["Single"]->GroupNumber["Name"];
						string Name = VarText.substr(resultLine.GetGroupStart(GroupNumber), resultLine.GetGroupEnd(GroupNumber) - resultLine.GetGroupStart(GroupNumber));
						
						
						if (!(resultLine.GetGroupStart(Regexps["Single"]->GroupNumber["Content"]) < 0))
						{
							GroupNumber = Regexps["Single"]->GroupNumber["Value"];
							int PosEnd = ReadVar(VarList, Name, Type, IsConstant, VarText.substr(resultLine.GetGroupStart(GroupNumber), resultLine.GetGroupEnd(GroupNumber) - resultLine.GetGroupStart(GroupNumber)), 0);
						} else
						{
							Add(VarList, Name, 1, Type, IsConstant); 
						}
						
					} else
					{
						break;
					}
				}

				Pos = 0;
				
				while (true) {
					resultLine = Regexps["Array"]->Regexp.Match(VarText.c_str(), Pos);
					// Single Variable
					if (resultLine.IsMatched()){
															
						Pos = resultLine.GetEnd();
						int GroupNumber = Regexps["Array"]->GroupNumber["Type"];
						string Type = VarText.substr(resultLine.GetGroupStart(GroupNumber), resultLine.GetGroupEnd(GroupNumber) - resultLine.GetGroupStart(GroupNumber));
						GroupNumber = Regexps["Array"]->GroupNumber["Name"];
						string Name = VarText.substr(resultLine.GetGroupStart(GroupNumber), resultLine.GetGroupEnd(GroupNumber) - resultLine.GetGroupStart(GroupNumber));
						GroupNumber = Regexps["Array"]->GroupNumber["ArraySize"];
						int ArraySize = StringHelper::StringTo<int>(VarText.substr(resultLine.GetGroupStart(GroupNumber), resultLine.GetGroupEnd(GroupNumber) - resultLine.GetGroupStart(GroupNumber))) + 1;
											
						if (!(resultLine.GetGroupStart(Regexps["Array"]->GroupNumber["Content"]) < 0))
						{
							GroupNumber = Regexps["Array"]->GroupNumber["Value"];
							int Pos = 0;
							while(true)
							{
								Pos = ReadVar(VarList, Name, Type, IsConstant, VarText.substr(resultLine.GetGroupStart(GroupNumber), resultLine.GetGroupEnd(GroupNumber) - resultLine.GetGroupStart(GroupNumber)), Pos);
								if ( Pos < 0)
									break;
							}
							Add(VarList,Name,0, Type, IsConstant, ArraySize);
						} else
						{
							Add(VarList, Name, ArraySize, Type, IsConstant); 
						}
						
					} else
					{
						break;
					}
				}
				
				
			} else 
			{
				break;
			}
		}

		PointIter = VarList.Point.begin();
		FrameIter = VarList.Frame.begin();
		ToolIter = VarList.Tool.begin();
		PathIter = VarList.Path.begin();
		AxisIter = VarList.Axis.begin();
		VelIter = VarList.Vel.begin();
		IntIter = VarList.Int.begin();
		RealIter = VarList.Real.begin();
		BoolIter = VarList.Bool.begin();

	}
	
	// Delete the Varialbe
	void DeleteVariable(const string &Name)
	{
		DeleteVariableText(Name);

		VarInfoType VarInfo;
		GetInfoFromName(Name, VarInfo);

		if (VarInfo.Type == "MXPointType")
		{
			VarList.Point.erase(Name);
			PointIter = VarList.Point.begin();
		}
		else if (VarInfo.Type == "MXFrameType")
		{
			VarList.Frame.erase(Name);
			FrameIter = VarList.Frame.begin();
		}
		else if (VarInfo.Type == "MXToolType")
		{
			VarList.Tool.erase(Name);
			ToolIter = VarList.Tool.begin();
		}
		else if (VarInfo.Type == "MXPathDescType")
		{
			VarList.Path.erase(Name);
			PathIter = VarList.Path.begin();
		}
		else if (VarInfo.Type == "MXVelocityType")
		{
			VarList.Vel.erase(Name);
			VelIter = VarList.Vel.begin();
		}
		else if (VarInfo.Type == "MXAxisTargetType")
		{
			VarList.Axis.erase(Name);
			AxisIter = VarList.Axis.begin();
		}
		else if (VarInfo.Type == "INT")
		{
			VarList.Int.erase(Name);
			IntIter = VarList.Int.begin();
		}
		else if (VarInfo.Type == "REAL")
		{
			VarList.Real.erase(Name);
			RealIter = VarList.Real.begin();
		}
		else if (VarInfo.Type == "BOOL")
		{
			VarList.Point.erase(Name);
			BoolIter = VarList.Bool.begin();
		}
	}

	// Add the Variable
	void AddVariable(VarInfoType &VarInfo)
	{
		// Handle the text
		int Pos = LocateVAR(VarInfo.IsConstant);
		stringstream ss;
		ss << VarInfo.Name << " : ";
		if (VarInfo.Size > 1)
			ss << "ARRAY[0.." << VarInfo.Size << "] OF ";
		ss << VarInfo.Type;
		if (VarInfo.IsConstant)
		{
			ss << " := ";
			if (VarInfo.Size == 1)
			{
				if (VarInfo.Type == "INT" || VarInfo.Type == "REAL" || VarInfo.Type == "BOOL")
					ss << "0";
				else
					ss << "(0)";
			}
			else
			{
				ss << "[" << VarInfo.Size << "(0)" << "]";
			}
		}

		ss << ";\r\n";
		STText.insert(Pos, ss.str());
		// Handle the VarList
		if (!GetInfoFromName(VarInfo.Name, VarInfo)) // Check Name
		{
			if (VarInfo.Type == "MXPointType")
			{
				VarType<MXPointType> Var;
				Var.IsConstant = VarInfo.IsConstant;
				MXPointType Point;
				memset(&Point, 0, sizeof(Point));
				Var.Var.insert(Var.Var.end(), VarInfo.Size, Point);
				VarList.Point.insert(pair<string, VarType<MXPointType> >(VarInfo.Name, Var));
				PointIter = VarList.Point.begin();
			}
			else if (VarInfo.Type == "MXFrameType")
			{
				VarType<MXFrameType> Var;
				Var.IsConstant = VarInfo.IsConstant;
				MXFrameType Frame;
				memset(&Frame, 0, sizeof(Frame));
				Var.Var.insert(Var.Var.end(), VarInfo.Size, Frame);
				VarList.Frame.insert(pair<string, VarType<MXFrameType> >(VarInfo.Name, Var));
				FrameIter = VarList.Frame.begin();
			}
			else if (VarInfo.Type == "MXToolType")
			{
				VarType<MXToolType> Var;
				Var.IsConstant = VarInfo.IsConstant;
				MXToolType Tool;
				memset(&Tool, 0, sizeof(Tool));
				Var.Var.insert(Var.Var.end(), VarInfo.Size, Tool);
				VarList.Tool.insert(pair<string, VarType<MXToolType> >(VarInfo.Name, Var));
				ToolIter = VarList.Tool.begin();
			}
			else if (VarInfo.Type == "MXVelocityType")
			{
				VarType<MXVelocityType> Var;
				Var.IsConstant = VarInfo.IsConstant;
				MXVelocityType Vel;
				memset(&Vel, 0, sizeof(Vel));
				Var.Var.insert(Var.Var.end(), VarInfo.Size, Vel);
				VarList.Vel.insert(pair<string, VarType<MXVelocityType> >(VarInfo.Name, Var));
				VelIter = VarList.Vel.begin();
			}
			else if (VarInfo.Type == "MXPathDescType")
			{
				VarType<MXPathDescType> Var;
				Var.IsConstant = VarInfo.IsConstant;
				MXPathDescType Path;
				memset(&Path, 0, sizeof(Path));
				Var.Var.insert(Var.Var.end(), VarInfo.Size, Path);
				VarList.Path.insert(pair<string, VarType<MXPathDescType> >(VarInfo.Name, Var));
				PathIter = VarList.Path.begin();
			}
			else if (VarInfo.Type == "MXAxisTargetType")
			{
				VarType<MXAxisTargetType> Var;
				Var.IsConstant = VarInfo.IsConstant;
				MXAxisTargetType Axis;
				memset(&Axis, 0, sizeof(Axis));
				Var.Var.insert(Var.Var.end(), VarInfo.Size, Axis);
				VarList.Axis.insert(pair<string, VarType<MXAxisTargetType> >(VarInfo.Name, Var));
				AxisIter = VarList.Axis.begin();
			}
			else if (VarInfo.Type == "INT")
			{
				VarType<INT> Var;
				Var.IsConstant = VarInfo.IsConstant;
				Var.Var.insert(Var.Var.end(), VarInfo.Size, 0);
				VarList.Int.insert(pair<string, VarType<INT> >(VarInfo.Name, Var));
				IntIter = VarList.Int.begin();
			}
			else if (VarInfo.Type == "REAL")
			{
				VarType<REAL> Var;
				Var.IsConstant = VarInfo.IsConstant;
				Var.Var.insert(Var.Var.end(), VarInfo.Size, 0.0);
				VarList.Real.insert(pair<string, VarType<REAL> >(VarInfo.Name, Var));
				RealIter = VarList.Real.begin();
			}
			else if (VarInfo.Type == "BOOL")
			{
				VarType<BOOL> Var;
				Var.IsConstant = VarInfo.IsConstant;
				Var.Var.insert(Var.Var.end(), VarInfo.Size, 0);
				VarList.Bool.insert(pair<string, VarType<BOOL> >(VarInfo.Name, Var));
				BoolIter = VarList.Bool.begin();
			}

			
		} 
	}

	// Change the Variable Value(No Attribute change like Size or Isconstant)
	void ModifyVariable(const string &Name, MXPointType &Point, int index = 0)
	{
		// Delete the Text
		int Pos = DeleteVariableText(Name);
		// Modify data
		VarList.Point[Name].Var[index] = Point;
		// Insert the Variable after VAR (CONSTANT)
		if (Pos > 0)
			STText.insert(Pos, TextGenerator(Name, "MXPointType"));
	}

	void ModifyVariable(const string &Name, MXFrameType &Frame, int index = 0)
	{
		// Delete the Text
		int Pos = DeleteVariableText(Name);
		// Modify data
		VarList.Frame[Name].Var[index] = Frame;
		// Insert the Variable after VAR (CONSTANT)
		if (Pos > 0)
			STText.insert(Pos, TextGenerator(Name, "MXFrameType"));
	}

	void ModifyVariable(const string &Name, MXToolType &Tool, int index = 0)
	{
		// Delete the Text
		int Pos = DeleteVariableText(Name);
		// Modify data
		VarList.Tool[Name].Var[index] = Tool;
		// Insert the Variable after VAR (CONSTANT)
		if (Pos > 0)
			STText.insert(Pos, TextGenerator(Name, "MXToolType"));
	}

	void ModifyVariable(const string &Name, MXVelocityType &Vel, int index = 0)
	{
		// Delete the Text
		int Pos = DeleteVariableText(Name);
		// Modify data
		VarList.Vel[Name].Var[index] = Vel;
		// Insert the Variable after VAR (CONSTANT)
		if (Pos > 0)
			STText.insert(Pos, TextGenerator(Name, "MXVelocityType"));
	}
	
	void ModifyVariable(const string &Name, MXPathDescType &Path, int index = 0)
	{
		// Delete the Text
		int Pos = DeleteVariableText(Name);
		// Modify data
		VarList.Path[Name].Var[index] = Path;
		// Insert the Variable after VAR (CONSTANT)
		if (Pos > 0)
			STText.insert(Pos, TextGenerator(Name, "MXPathDescType"));
	}

	void ModifyVariable(const string &Name, MXAxisTargetType &Axis, int index = 0)
	{
		// Delete the Text
		int Pos = DeleteVariableText(Name);
		// Modify data
		VarList.Axis[Name].Var[index] = Axis;
		// Insert the Variable after VAR (CONSTANT)
		if (Pos > 0)
			STText.insert(Pos, TextGenerator(Name, "MXAxisTargetType"));
	}

	void ModifyVariable(const string &Name, INT &Int, int index = 0)
	{
		// Delete the Text
		int Pos = DeleteVariableText(Name);
		// Modify data
		VarList.Int[Name].Var[index] = Int;
		// Insert the Variable after VAR (CONSTANT)
		if (Pos > 0)
			STText.insert(Pos, TextGenerator(Name, "INT"));
	}

	void ModifyVariable(const string &Name, REAL &Real, int index = 0)
	{
		// Delete the Text
		int Pos = DeleteVariableText(Name);
		// Modify data
		VarList.Real[Name].Var[index] = Real;
		// Insert the Variable after VAR (CONSTANT)
		if (Pos > 0)
			STText.insert(Pos, TextGenerator(Name, "REAL"));
	}

	void ModifyVariable(const string &Name, BOOL &Bool, int index = 0)
	{
		// Delete the Text
		int Pos = DeleteVariableText(Name);
		// Modify data
		VarList.Bool[Name].Var[index] = Bool;
		// Insert the Variable after VAR (CONSTANT)
		if (Pos > 0)
			STText.insert(Pos, TextGenerator(Name, "BOOL"));
	}

	private:
	
	string STText;

	map<string, RegexpType*> Regexps;
	map<string, string> RegexpStrs;

	VarListType VarList;

	map<string, VarType<MXPointType> >::iterator PointIter;
	map<string, VarType<MXFrameType> >::iterator FrameIter;
	map<string, VarType<MXToolType> >::iterator ToolIter;
	map<string, VarType<MXPathDescType> >::iterator PathIter;
	map<string, VarType<MXVelocityType> >::iterator VelIter;
	map<string, VarType<MXAxisTargetType> >::iterator AxisIter;
	map<string, VarType<INT> >::iterator IntIter;
	map<string, VarType<REAL> >::iterator RealIter;
	map<string, VarType<BOOL> >::iterator BoolIter;

	int DeleteVariableText(const string &Name)
	{
		// Text Handling
		string RegTextSingle = Name + RegexpStrs["SingleTemplate"];
		Regexps["Common"]->Regexp.Compile(RegTextSingle.c_str());
		MatchResult Result = Regexps["Common"]->Regexp.Match(STText.c_str());
		if (Result.IsMatched())
		{
			STText.replace(Result.GetStart(), Result.GetEnd() - Result.GetStart(), "");
			return Result.GetStart();
		}
		else
		{
			string RegTextArray = Name + RegexpStrs["ArrayTemplate"];
			Regexps["Common"]->Regexp.Compile(RegTextArray.c_str());
			Result = Regexps["Common"]->Regexp.Match(STText.c_str());
			if (Result.IsMatched())
			{
				STText.replace(Result.GetStart(), Result.GetEnd() - Result.GetStart(), "");
				return Result.GetStart();
			}
			else 
				return -1;
		}
	}

	int LocateVAR(bool IsConstant)
	{
		if (IsConstant)
			Regexps["Common"]->Regexp.Compile("^VAR[ \\t]+CONSTANT[ \\t]?\\s?\\n", 2);
		else
			Regexps["Common"]->Regexp.Compile("^VAR[ \\t]?\\s?\\n", 2);
		
		MatchResult Result = Regexps["Common"]->Regexp.Match(STText.c_str());
		if (Result.IsMatched())
			return Result.GetEnd();
		else
			return -1;	
	}

	void Add(VarListType &VarList, string &Name, int Size, string &Type, bool IsConstant, int ArraySize = 0)
	{
		if (Type == "MXPointType")
		{
			MXPointType Point;
			memset(&Point, 0, sizeof(Point));
			if (VarList.Point.find(Name) == VarList.Point.end())
				VarList.Point.insert(pair<string, VarType<MXPointType> >(Name, VarType<MXPointType>()));
			VarList.Point[Name].Var.insert(VarList.Point[Name].Var.end(), Size, Point);
			VarList.Point[Name].IsConstant = IsConstant;
			if (ArraySize != 0)
				VarList.Point[Name].Var.insert(VarList.Point[Name].Var.end(), ArraySize - VarList.Point[Name].Var.size(), Point);
					
		} else if (Type == "MXFrameType")
		{
			MXFrameType Frame;
			memset(&Frame, 0, sizeof(Frame));
			if (VarList.Frame.find(Name) == VarList.Frame.end())
				VarList.Frame.insert(pair<string, VarType<MXFrameType> >(Name, VarType<MXFrameType>()));
			VarList.Frame[Name].Var.insert(VarList.Frame[Name].Var.end(), Size, Frame);
			VarList.Frame[Name].IsConstant = IsConstant;
			if (ArraySize != 0)
				VarList.Frame[Name].Var.insert(VarList.Frame[Name].Var.end(), ArraySize - VarList.Frame[Name].Var.size(), Frame);
					
		} else if (Type == "MXToolType")
		{
			MXToolType Tool;
			memset(&Tool, 0, sizeof(Tool));
			if (VarList.Tool.find(Name) == VarList.Tool.end())
				VarList.Tool.insert(pair<string, VarType<MXToolType> >(Name, VarType<MXToolType>()));
			VarList.Tool[Name].Var.insert(VarList.Tool[Name].Var.end(), Size, Tool);
			VarList.Tool[Name].IsConstant = IsConstant;
			if (ArraySize != 0)
				VarList.Tool[Name].Var.insert(VarList.Tool[Name].Var.end(), ArraySize - VarList.Tool[Name].Var.size(), Tool);
					
		} else if (Type == "MXVelocityType")
		{
			MXVelocityType Vel;
			memset(&Vel, 0, sizeof(Vel));
			if (VarList.Vel.find(Name) == VarList.Vel.end())
				VarList.Vel.insert(pair<string, VarType<MXVelocityType> >(Name, VarType<MXVelocityType>()));
			VarList.Vel[Name].Var.insert(VarList.Vel[Name].Var.end(), Size, Vel);
			VarList.Vel[Name].IsConstant = IsConstant;
			if (ArraySize != 0)
				VarList.Vel[Name].Var.insert(VarList.Vel[Name].Var.end(), ArraySize - VarList.Vel[Name].Var.size(), Vel);
					
		} else if (Type == "MXPathDescType")
		{
			MXPathDescType Path;
			memset(&Path, 0, sizeof(Path));
			if (VarList.Path.find(Name) == VarList.Path.end())
				VarList.Path.insert(pair<string, VarType<MXPathDescType> >(Name, VarType<MXPathDescType>()));
			VarList.Path[Name].Var.insert(VarList.Path[Name].Var.end(), Size, Path);
			VarList.Path[Name].IsConstant = IsConstant;
			if (ArraySize != 0)
				VarList.Path[Name].Var.insert(VarList.Path[Name].Var.end(), ArraySize - VarList.Path[Name].Var.size(), Path);
					
		} else if (Type == "MXAxisTargetType")
		{
			MXAxisTargetType Axis;
			memset(&Axis, 0, sizeof(Axis));
			if (VarList.Axis.find(Name) == VarList.Axis.end())
				VarList.Axis.insert(pair<string, VarType<MXAxisTargetType> >(Name, VarType<MXAxisTargetType>()));
			VarList.Axis[Name].Var.insert(VarList.Axis[Name].Var.end(), Size, Axis);
			VarList.Axis[Name].IsConstant = IsConstant;
			if (ArraySize != 0)
				VarList.Axis[Name].Var.insert(VarList.Axis[Name].Var.end(), ArraySize - VarList.Axis[Name].Var.size(), Axis);
			
		} else if (Type == "INT")
		{
			if (VarList.Int.find(Name) == VarList.Int.end())
				VarList.Int.insert(pair<string, VarType<INT> >(Name, VarType<INT>()));
			VarList.Int[Name].Var.insert(VarList.Int[Name].Var.end(), Size, 0);
			VarList.Int[Name].IsConstant = IsConstant;
			if (ArraySize != 0)
				VarList.Int[Name].Var.insert(VarList.Int[Name].Var.end(), ArraySize - VarList.Int[Name].Var.size(), 0);
		} else if (Type == "BOOL")
		{
			if (VarList.Bool.find(Name) == VarList.Bool.end())
				VarList.Bool.insert(pair<string, VarType<BOOL> >(Name, VarType<BOOL>()));
			VarList.Bool[Name].Var.insert(VarList.Bool[Name].Var.end(), Size, 0);
			VarList.Bool[Name].IsConstant = IsConstant;
			if (ArraySize != 0)
				VarList.Bool[Name].Var.insert(VarList.Bool[Name].Var.end(), ArraySize - VarList.Bool[Name].Var.size(), 0);
		} else if (Type == "REAL")
		{
			if (VarList.Real.find(Name) == VarList.Real.end())
				VarList.Real.insert(pair<string, VarType<REAL> >(Name, VarType<REAL>()));
			VarList.Real[Name].Var.insert(VarList.Real[Name].Var.end(), Size, 0);
			VarList.Real[Name].IsConstant = IsConstant;
			if (ArraySize != 0)
				VarList.Real[Name].Var.insert(VarList.Real[Name].Var.end(), ArraySize - VarList.Real[Name].Var.size(), 0);
		}
		
	}
	
	void Add(VarListType &VarList, string &Name, int Size, bool IsConstant, MXPointType &Point)
	{
		if (VarList.Point.find(Name) == VarList.Point.end())
			VarList.Point.insert(pair<string, VarType<MXPointType> >(Name, VarType<MXPointType>()));
		VarList.Point[Name].Var.insert(VarList.Point[Name].Var.end(), Size, Point);
		VarList.Point[Name].IsConstant = IsConstant;

	}
	
	void Add(VarListType &VarList, string &Name, int Size, bool IsConstant, MXFrameType &Frame)
	{
		if (VarList.Frame.find(Name) == VarList.Frame.end())
			VarList.Frame.insert(pair<string, VarType<MXFrameType> >(Name, VarType<MXFrameType>()));
		VarList.Frame[Name].Var.insert(VarList.Frame[Name].Var.end(), Size, Frame);
		VarList.Frame[Name].IsConstant = IsConstant;
	}
	
	void Add(VarListType &VarList, string &Name, int Size, bool IsConstant, MXToolType &Tool)
	{
		if (VarList.Tool.find(Name) == VarList.Tool.end())
			VarList.Tool.insert(pair<string, VarType<MXToolType> >(Name, VarType<MXToolType>()));
		VarList.Tool[Name].Var.insert(VarList.Tool[Name].Var.end(), Size, Tool);
		VarList.Tool[Name].IsConstant = IsConstant;
	}
	
	void Add(VarListType &VarList, string &Name, int Size, bool IsConstant, MXVelocityType &Vel)
	{
		if (VarList.Vel.find(Name) == VarList.Vel.end())
			VarList.Vel.insert(pair<string, VarType<MXVelocityType> >(Name, VarType<MXVelocityType>()));
		VarList.Vel[Name].Var.insert(VarList.Vel[Name].Var.end(), Size, Vel);
		VarList.Vel[Name].IsConstant = IsConstant;
	}
	
	void Add(VarListType &VarList, string &Name, int Size, bool IsConstant, MXPathDescType &Path)
	{
		if (VarList.Path.find(Name) == VarList.Path.end())
			VarList.Path.insert(pair<string, VarType<MXPathDescType> >(Name, VarType<MXPathDescType>()));
		VarList.Path[Name].Var.insert(VarList.Path[Name].Var.end(), Size, Path);
		VarList.Path[Name].IsConstant = IsConstant;
	}
	
	void Add(VarListType &VarList, string &Name, int Size, bool IsConstant, MXAxisTargetType &Axis)
	{
		if (VarList.Axis.find(Name) == VarList.Axis.end())
			VarList.Axis.insert(pair<string, VarType<MXAxisTargetType> >(Name, VarType<MXAxisTargetType>()));
		VarList.Axis[Name].Var.insert(VarList.Axis[Name].Var.end(), Size, Axis);
		VarList.Axis[Name].IsConstant = IsConstant;
	}
	
	void Add(VarListType &VarList, string &Name, int Size, bool IsConstant, INT &Int)
	{
		if (VarList.Int.find(Name) == VarList.Int.end())
			VarList.Int.insert(pair<string, VarType<INT> >(Name, VarType<INT>()));
		VarList.Int[Name].Var.insert(VarList.Int[Name].Var.end(), Size, Int);
		VarList.Int[Name].IsConstant = IsConstant;
	}
	
	void Add(VarListType &VarList, string &Name, int Size, bool IsConstant, BOOL &Bool)
	{
		if (VarList.Bool.find(Name) == VarList.Bool.end())
			VarList.Bool.insert(pair<string, VarType<BOOL> >(Name, VarType<BOOL>()));
		VarList.Bool[Name].Var.insert(VarList.Bool[Name].Var.end(), Size, Bool);
		VarList.Bool[Name].IsConstant = IsConstant;
	}
	
	void Add(VarListType &VarList, string &Name, int Size, bool IsConstant, REAL &Real)
	{
		if (VarList.Real.find(Name) == VarList.Real.end())
			VarList.Real.insert(pair<string, VarType<REAL> >(Name, VarType<REAL>()));
		VarList.Real[Name].Var.insert(VarList.Real[Name].Var.end(), Size, Real);
		VarList.Real[Name].IsConstant = IsConstant;
	}

	string TextGenerator(const string& Name, const string& Type)
	{
		stringstream ss;
		ss << Name << " : ";
		if (Type == "MXPointType")
		{
			if (VarList.Point[Name].Var.size() == 1)
			{
				ss << "MXPointType := ";
				SingleLineGenerator(VarList.Point[Name].Var[0], ss);
				ss << ";\r\n";
				return ss.str();
			}
			else
			{
				ss << "ARRAY[0.." << (VarList.Point[Name].Var.size() - 1) << "] OF MXPointType := [\r\n";
				int ZeroCount = 0;
				for (int i = 0; i < VarList.Point[Name].Var.size(); ++i)
					{
					if (IsZero(VarList.Point[Name].Var[i]))
						++ZeroCount;
					else
					{
						if (ZeroCount > 0)
						{
							ss << "    ";
							if (ZeroCount > 1)
								ss << ZeroCount;
							ss << "(0), \r\n";
							ZeroCount = 0;
						}
						
						ss << "    ";
						SingleLineGenerator(VarList.Point[Name].Var[i], ss);
						ss << ", \r\n";
						
					}

				}

				string result = ss.str();
				result.erase(result.end() - 4, result.end() - 2);
				result.append("];\r\n");

				return result;
			}
		}
		else if (Type == "MXFrameType")
		{
			if (VarList.Frame[Name].Var.size() == 1)
			{
				ss << "MXFrameType := ";
				SingleLineGenerator(VarList.Frame[Name].Var[0], ss);
				ss << ";\r\n";
				return ss.str();
			}
			else
			{
				ss << "ARRAY[0.." << (VarList.Frame[Name].Var.size() - 1) << "] OF MXFrameType := [\r\n";
				int ZeroCount = 0;
				for (int i = 0; i < VarList.Frame[Name].Var.size(); ++i)
					{
					if (IsZero(VarList.Frame[Name].Var[i]))
						++ZeroCount;
					else
					{
						if (ZeroCount > 0)
						{
							ss << "    ";
							if (ZeroCount > 1)
								ss << ZeroCount;
							ss << "(0), \r\n";
							ZeroCount = 0;
						}
					
						ss << "    ";
						SingleLineGenerator(VarList.Frame[Name].Var[i], ss);
						ss << ", \r\n";
					
					}
				}

				string result = ss.str();
				result.erase(result.end() - 4, result.end() - 2);
				result.append("];\r\n");

				return result;
			}
		}
		else if (Type == "MXToolType")
		{
			if (VarList.Tool[Name].Var.size() == 1)
			{
				ss << "MXToolType := ";
				SingleLineGenerator(VarList.Tool[Name].Var[0], ss);
				ss << ";\r\n";
				return ss.str();
			}
			else
			{
				ss << "ARRAY[0.." << (VarList.Tool[Name].Var.size() - 1) << "] OF MXToolType := [\r\n";
				int ZeroCount = 0;
				for (int i = 0; i < VarList.Tool[Name].Var.size(); ++i)
					{
					if (IsZero(VarList.Tool[Name].Var[i]))
						++ZeroCount;
					else
					{
						if (ZeroCount > 0)
						{
							ss << "    ";
							if (ZeroCount > 1)
								ss << ZeroCount;
							ss << "(0), \r\n";
							ZeroCount = 0;
						}

						ss << "    ";
						SingleLineGenerator(VarList.Tool[Name].Var[i], ss);
						ss << ", \r\n";

					}
				}

				string result = ss.str();
				result.erase(result.end() - 4, result.end() -2);
				result.append("];\r\n");

				return result;
			}
		}
		else if (Type == "MXVelocityType")
		{
			if (VarList.Vel[Name].Var.size() == 1)
			{
				ss << "MXVelocityType := ";
				SingleLineGenerator(VarList.Vel[Name].Var[0], ss);
				ss << ";\r\n";
				return ss.str();
			}
			else
			{
				ss << "ARRAY[0.." << (VarList.Vel[Name].Var.size() - 1) << "] OF MXVelocityType := [\r\n";
				int ZeroCount = 0;
				for (int i = 0; i < VarList.Vel[Name].Var.size(); ++i)
					{
					if (IsZero(VarList.Vel[Name].Var[i]))
						++ZeroCount;
					else
					{
						if (ZeroCount > 0)
						{
							ss << "    ";
							if (ZeroCount > 1)
								ss << ZeroCount;
							ss << "(0), \r\n";
							ZeroCount = 0;
						}
					
						ss << "    ";
						SingleLineGenerator(VarList.Vel[Name].Var[i], ss);
						ss << ", \r\n";
					
					}
				}

				string result = ss.str();
				result.erase(result.end() - 4, result.end() - 2);
				result.append("];\r\n");

				return result;
			}
		} 
		else if (Type == "MXPathDescType")
		{
			if (VarList.Path[Name].Var.size() == 1)
			{
				ss << "MXPathDescType := ";
				SingleLineGenerator(VarList.Path[Name].Var[0], ss);
				ss << ";\r\n";
				return ss.str();
			}
			else
			{
				ss << "ARRAY[0.." << (VarList.Path[Name].Var.size() - 1) << "] OF MXPathDescType := [\r\n";
				int ZeroCount = 0;
				for (int i = 0; i < VarList.Path[Name].Var.size(); ++i)
					{
					if (IsZero(VarList.Path[Name].Var[i]))
						++ZeroCount;
					else
					{
						if (ZeroCount > 0)
						{
							ss << "    ";
							if (ZeroCount > 1)
								ss << ZeroCount;
							ss << "(0), \r\n";
							ZeroCount = 0;
						}
				
						ss << "    ";
						SingleLineGenerator(VarList.Path[Name].Var[i], ss);
						ss << ", \r\n";
					
					}
				}

				string result = ss.str();
				result.erase(result.end() - 4, result.end() - 2);
				result.append("];\r\n");

				return result;
			}
		} 
		else if (Type == "MXAxisTargetType")
		{
			if (VarList.Axis[Name].Var.size() == 1)
			{
				ss << "MXAxisTargetType := ";
				SingleLineGenerator(VarList.Axis[Name].Var[0], ss);
				ss << ";\r\n";
				return ss.str();
			}
			else
			{
				ss << "ARRAY[0.." << (VarList.Axis[Name].Var.size() - 1) << "] OF MXAxisTargetType := [\r\n";
				int ZeroCount = 0;
				for (int i = 0; i < VarList.Axis[Name].Var.size(); ++i)
					{
					if (IsZero(VarList.Axis[Name].Var[i]))
						++ZeroCount;
					else
					{
						if (ZeroCount > 0)
						{
							ss << "    ";
							if (ZeroCount > 1)
								ss << ZeroCount;
							ss << "(0), \r\n";
							ZeroCount = 0;
						}
					
						ss << "    ";
						SingleLineGenerator(VarList.Axis[Name].Var[i], ss);
						ss << ", \r\n";
				
					}
				}

				string result = ss.str();
				result.erase(result.end() - 4, result.end() - 2);
				result.append("];\r\n");

				return result;
			}
		}
		else if (Type == "INT")
		{
			if (VarList.Int[Name].Var.size() == 1)
			{
				ss << "INT := ";
				ss << VarList.Int[Name].Var[0];
				ss << ";\r\n";
				return ss.str();
			}
			else
			{
				ss << "ARRAY[0.." << (VarList.Int[Name].Var.size() - 1) << "] OF INT := [";
				int ZeroCount = 0;
				for (int i = 0; i < VarList.Int[Name].Var.size(); ++i)
					{
					if (VarList.Int[Name].Var[i] == 0)
						++ZeroCount;
					else
					{
						if (ZeroCount > 0)
						{
							if (ZeroCount == 1)
								ss << " 0,";
							else 
								ss << " " << ZeroCount << "(0),";
						}
					
						ss << " " << VarList.Int[Name].Var[i] <<",";
					
					}
				}

				string result = ss.str();
				result.erase(result.end() - 1, result.end());
				result.append("];\r\n");

				return result;
			}
		}
		else if (Type == "REAL")
		{
			if (VarList.Real[Name].Var.size() == 1)
			{
				ss << "REAL := ";
				ss << VarList.Real[Name].Var[0];
				ss << ";\r\n";
				return ss.str();
			}
			else
			{
				ss << "ARRAY[0.." << (VarList.Real[Name].Var.size() - 1) << "] OF REAL := [";
				int ZeroCount = 0;
				for (int i = 0; i < VarList.Real[Name].Var.size(); ++i)
					{
					if (VarList.Real[Name].Var[i] == 0)
						++ZeroCount;
					else
					{
						if (ZeroCount > 0)
						{
							if (ZeroCount == 1)
								ss << " 0,";
							else
								ss << " " << ZeroCount << "(0),";
						}
					
						ss << " " << VarList.Real[Name].Var[i] << ",";
					
					}
				}

				string result = ss.str();
				result.erase(result.end() - 1, result.end());
				result.append("];\r\n");

				return result;
			}
		}
		else if (Type == "BOOL")
		{
			if (VarList.Bool[Name].Var.size() == 1)
			{
				ss << "BOOL := ";
				ss << VarList.Bool[Name].Var[0];
				ss << ";\r\n";
				return ss.str();
			}
			else
			{
				ss << "ARRAY[0.." << (VarList.Bool[Name].Var.size() - 1) << "] OF BOOL := [";
				int ZeroCount = 0;
				for (int i = 0; i < VarList.Bool[Name].Var.size(); ++i)
					{
					if (VarList.Bool[Name].Var[i] == 0)
						++ZeroCount;
					else
					{
						if (ZeroCount > 0)
						{
							if (ZeroCount == 1)
								ss << " 0,";
							else
								ss << " " << ZeroCount << "(0),";
						}
					
						ss << " " << VarList.Bool[Name].Var[i] << ",";
					}
				}

				string result = ss.str();
				result.erase(result.end() - 1, result.end());
				result.append("];\r\n");

				return result;
			}
		}
	}
	
	void SingleLineGenerator(MXPointType& Point, stringstream& ss)
	{
		ss << "(Pos:=(x:=" << Point.Pos.x << ", y:= " << Point.Pos.y << ", z:=" << Point.Pos.z;
		ss << "), Orient:=(Angle:=[" << Point.Orient.Angle[0] << ", " << Point.Orient.Angle[1];
		ss << ", " << Point.Orient.Angle[2] << ", " << Point.Orient.Angle[3] << "], Type:=";
		ss << Point.Orient.Type << "))";
	}

	void SingleLineGenerator(MXFrameType& Frame, stringstream& ss)
	{
		ss << "(Pos:=(x:=" << Frame.Pos.x << ", y:= " << Frame.Pos.y << ", z:=" << Frame.Pos.z;
		ss << "), Orient:=(Angle:=[" << Frame.Orient.Angle[0] << ", " << Frame.Orient.Angle[1];
		ss << ", " << Frame.Orient.Angle[2] << ", " << Frame.Orient.Angle[3] << "], Type:=";
		ss << Frame.Orient.Type << "))";
	}

	void SingleLineGenerator(MXVelocityType& Vel, stringstream& ss)
	{
		ss << "(v:=" << Vel.v << ", Mode:= " << Vel.Mode << ")";
	}

	void SingleLineGenerator(MXPathDescType& Path, stringstream& ss)
	{
		ss << "(Trans:=(Radius:=" << Path.Trans.Radius << ", Type:= " << Path.Trans.Type << "))";
	}

	void SingleLineGenerator(MXToolType& Tool, stringstream& ss) 
	{
		ss << "(Frame:=(Pos:=(x:=" << Tool.Frame.Pos.x << ", y:= " << Tool.Frame.Pos.y << ", z:=" << Tool.Frame.Pos.z;
		ss << "), Orient:=(Angle:=[" << Tool.Frame.Orient.Angle[0] << ", " << Tool.Frame.Orient.Angle[1];
		ss << ", " << Tool.Frame.Orient.Angle[2] << ", " << Tool.Frame.Orient.Angle[3] << "], Type:=";
		ss << Tool.Frame.Orient.Type << ")), Radius:=" << Tool.Radius << ")";
	}

	void SingleLineGenerator(MXAxisTargetType& Axis, stringstream& ss)
	{
		ss << "(JointAxis:=[" << Axis.JointAxis[0] << ", " << Axis.JointAxis[1] << ", " << Axis.JointAxis[2];
		ss << ", " << Axis.JointAxis[3] << ", " << Axis.JointAxis[4] << ", " << Axis.JointAxis[5] << "])";
	}

	bool IsZero(MXPointType &Point)
	{
		return Point.Pos.x == 0 && Point.Pos.y == 0 && Point.Pos.z == 0 && Point.Orient.Angle[0] == 0
			&& Point.Orient.Angle[1] == 0 && Point.Orient.Angle[2] == 0 && Point.Orient.Angle[3] == 0
			&& Point.Orient.Type == 0;
	}

	bool IsZero(MXFrameType &Frame)
	{
		return Frame.Pos.x == 0 && Frame.Pos.y == 0 && Frame.Pos.z == 0 && Frame.Orient.Angle[0] == 0
			&& Frame.Orient.Angle[1] == 0 && Frame.Orient.Angle[2] == 0 && Frame.Orient.Angle[3] == 0
			&& Frame.Orient.Type == 0;
	}

	bool IsZero(MXToolType &Tool)
	{
		return Tool.Frame.Pos.x == 0 && Tool.Frame.Pos.y == 0 && Tool.Frame.Pos.z == 0 && Tool.Frame.Orient.Angle[0] == 0
			&& Tool.Frame.Orient.Angle[1] == 0 && Tool.Frame.Orient.Angle[2] == 0 && Tool.Frame.Orient.Angle[3] == 0
			&& Tool.Frame.Orient.Type == 0 && Tool.Radius == 0;
	}

	bool IsZero(MXVelocityType &Vel)
	{
		return Vel.v == 0 && Vel.Mode == 0;
	}

	bool IsZero(MXPathDescType &Path)
	{
		return Path.Trans.Radius == 0 && Path.Trans.Type == 0;
	}

	bool IsZero(MXAxisTargetType &Axis)
	{
		return Axis.JointAxis[0] == 0 && Axis.JointAxis[1] == 0 && Axis.JointAxis[2] == 0 
			&& Axis.JointAxis[3] == 0 && Axis.JointAxis[4] == 0 && Axis.JointAxis[5] == 0;
	}
	// read info from one line
	int ReadVar(VarListType &VarList, string Name, string Type, bool IsConstant, const string & Text, int Pos)
	{
		MatchResult Result;
		Result = Regexps[Type]->Regexp.Match(Text.c_str(), Pos);
		if (Result.IsMatched())
		{	
			if (!(Result.GetGroupStart(Regexps[Type]->GroupNumber["Single"])< 0))
			{
				int ArraySize = 1;
				int GroupNumberSize = Regexps[Type]->GroupNumber["ArraySizePlural"]; // To Get Array Size
				int PosStart = Result.GetGroupStart(GroupNumberSize);
				if (!(PosStart < 0)) // If Its Array 
					ArraySize = StringHelper::StringTo<int>(Text.substr(PosStart, Result.GetGroupEnd(GroupNumberSize) - PosStart));
			
				if (Type == "MXPointType")
				{
					MXPointType Point;
					Point.Pos.x = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(1), Result.GetGroupEnd(1) - Result.GetGroupStart(1)));
					Point.Pos.y = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(2), Result.GetGroupEnd(2) - Result.GetGroupStart(2)));
					Point.Pos.z = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(3), Result.GetGroupEnd(3) - Result.GetGroupStart(3)));
												
					Point.Orient.Angle[0] = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(4), Result.GetGroupEnd(4) - Result.GetGroupStart(4)));
					Point.Orient.Angle[1] = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(5), Result.GetGroupEnd(5) - Result.GetGroupStart(5)));
					Point.Orient.Angle[2] = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(6), Result.GetGroupEnd(6) - Result.GetGroupStart(6)));
					Point.Orient.Angle[3] = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(7), Result.GetGroupEnd(7) - Result.GetGroupStart(7)));
					Point.Orient.Type = StringHelper::StringTo<UDINT>(Text.substr(Result.GetGroupStart(8), Result.GetGroupEnd(8) - Result.GetGroupStart(8)));
		
					Add(VarList, Name, ArraySize, IsConstant, Point);
					
				} else if (Type == "MXFrameType")
				{
					MXFrameType Frame;
					Frame.Pos.x = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(1),Result.GetGroupEnd(1) - Result.GetGroupStart(1)));
					Frame.Pos.y = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(2), Result.GetGroupEnd(2) - Result.GetGroupStart(2)));
					Frame.Pos.z = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(3), Result.GetGroupEnd(3) - Result.GetGroupStart(3)));
												
					Frame.Orient.Angle[0] = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(4), Result.GetGroupEnd(4) - Result.GetGroupStart(4)));
					Frame.Orient.Angle[1] = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(5), Result.GetGroupEnd(5) - Result.GetGroupStart(5)));
					Frame.Orient.Angle[2] = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(6), Result.GetGroupEnd(6) - Result.GetGroupStart(6)));
					Frame.Orient.Angle[3] = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(7), Result.GetGroupEnd(7) - Result.GetGroupStart(7)));
					Frame.Orient.Type = StringHelper::StringTo<UDINT>(Text.substr(Result.GetGroupStart(8), Result.GetGroupEnd(8) - Result.GetGroupStart(8)));
					
					Add(VarList, Name, ArraySize, IsConstant, Frame);
					
				} else if (Type == "MXToolType")
				{
					MXToolType Tool;
					Tool.Frame.Pos.x = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(1),Result.GetGroupEnd(1) - Result.GetGroupStart(1)));
					Tool.Frame.Pos.y = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(2), Result.GetGroupEnd(2) - Result.GetGroupStart(2)));
					Tool.Frame.Pos.z = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(3), Result.GetGroupEnd(3) - Result.GetGroupStart(3)));
												
					Tool.Frame.Orient.Angle[0] = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(4), Result.GetGroupEnd(4) - Result.GetGroupStart(4)));
					Tool.Frame.Orient.Angle[1] = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(5), Result.GetGroupEnd(5) - Result.GetGroupStart(5)));
					Tool.Frame.Orient.Angle[2] = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(6), Result.GetGroupEnd(6) - Result.GetGroupStart(6)));
					Tool.Frame.Orient.Angle[3] = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(7), Result.GetGroupEnd(7) - Result.GetGroupStart(7)));
					Tool.Frame.Orient.Type = StringHelper::StringTo<UDINT>(Text.substr(Result.GetGroupStart(8), Result.GetGroupEnd(8) - Result.GetGroupStart(8)));	
												
					Tool.Radius = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(9), Result.GetGroupEnd(9) - Result.GetGroupStart(9)));	
					
					Add(VarList, Name, ArraySize, IsConstant, Tool);
					
				} else if (Type == "MXVelocityType")
				{
					MXVelocityType Vel;
					Vel.v = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(1),Result.GetGroupEnd(1) - Result.GetGroupStart(1)));
					Vel.Mode = StringHelper::StringTo<UDINT>(Text.substr(Result.GetGroupStart(2), Result.GetGroupEnd(2) - Result.GetGroupStart(2)));
					
					Add(VarList, Name, ArraySize, IsConstant, Vel);
					
				} else if (Type == "MXPathDescType")
				{
					MXPathDescType Path;
					Path.Trans.Radius = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(1),Result.GetGroupEnd(1) - Result.GetGroupStart(1)));
					Path.Trans.Type = StringHelper::StringTo<UDINT>(Text.substr(Result.GetGroupStart(2), Result.GetGroupEnd(2) - Result.GetGroupStart(2)));
					
					Add(VarList, Name, ArraySize, IsConstant, Path);
					
				} else if (Type == "MXAxisTargetType")
				{
					MXAxisTargetType Axis;
					for (int i = 0; i < 6; ++i)
						Axis.JointAxis[i] = StringHelper::StringTo<LREAL>(Text.substr(Result.GetGroupStart(1+i),Result.GetGroupEnd(1+i) - Result.GetGroupStart(1+i)));	
					
					Add(VarList, Name, ArraySize, IsConstant, Axis);
				} else if (Type == "INT")
				{
					INT Int = StringHelper::StringTo<INT>(Text.substr(Result.GetGroupStart(1),Result.GetGroupEnd(1) - Result.GetGroupStart(1)));
					Add(VarList, Name, ArraySize, IsConstant, Int);
				} else if (Type == "BOOL")
				{
					BOOL Bool = StringHelper::StringTo<BOOL>(Text.substr(Result.GetGroupStart(1),Result.GetGroupEnd(1) - Result.GetGroupStart(1)));
					Add(VarList, Name, ArraySize, IsConstant, Bool);
				} else if (Type == "REAL")
				{
					REAL Real = StringHelper::StringTo<REAL>(Text.substr(Result.GetGroupStart(1),Result.GetGroupEnd(1) - Result.GetGroupStart(1)));
					Add(VarList, Name, ArraySize, IsConstant, Real);
				}

				
			} else if (!(Result.GetGroupStart(Regexps[Type]->GroupNumber["Zero"])< 0))
			{
				int ArraySize = 1;
				int GroupNumberSize = Regexps[Type]->GroupNumber["ArraySizeZero"]; // To Get Array Size
				int PosStart = Result.GetGroupStart(GroupNumberSize);
				if (!(PosStart < 0)) // If Its Array 
					ArraySize = StringHelper::StringTo<int>(Text.substr(PosStart, Result.GetGroupEnd(GroupNumberSize) - PosStart));
				
				Add(VarList, Name, ArraySize, Type, IsConstant);
			
			}
		
			return Result.GetEnd();
		
		} else
			return -1;
		
	}
};





