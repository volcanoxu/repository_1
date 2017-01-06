/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _TRF_LIB_NONOBJECT_
#define _TRF_LIB_NONOBJECT_
#ifdef __cplusplus
extern "C"
{
#endif

#include <bur/plctypes.h>

/* Constants */
#ifdef _REPLACE_CONST
#define TRFo_getDirectionType 1341U
#define TRFo_isDualUseCompliant 1340U
#define TRFo_setTcpQuaternion 1329U
#define TRFo_setTcpPosition 1328U
#define TRFo_getTcpQuaternion 1327U
#define TRFo_getTcpPosition 1326U
#define TRFo_getAnglesType 1325U
#define TRFo_clone 1320U
#define TRFo_getCplPathRefCoords 1311U
#define TRFo_getCplJointRefCoords 1310U
#define TRFo_getPathRefCoords 1301U
#define TRFo_getJointRefCoords 1300U
#define TRFo_setCplPathRefCoords 1291U
#define TRFo_setCplJointRefCoords 1290U
#define TRFo_setPathRefCoords 1281U
#define TRFo_setJointRefCoords 1280U
#define TRFo_getCplCtrlCoords 1273U
#define TRFo_getCplAddCoords 1272U
#define TRFo_getCplPathCoords 1271U
#define TRFo_getCplJointCoords 1270U
#define TRFo_getCtrlCoords 1263U
#define TRFo_getAddCoords 1262U
#define TRFo_getPathCoords 1261U
#define TRFo_getJointCoords 1260U
#define TRFo_setCplCtrlCoords 1253U
#define TRFo_setCplAddCoords 1252U
#define TRFo_setCplPathCoords 1251U
#define TRFo_setCplJointCoords 1250U
#define TRFo_setCtrlCoords 1243U
#define TRFo_setAddCoords 1242U
#define TRFo_setPathCoords 1241U
#define TRFo_setJointCoords 1240U
#define TRFo_getMeasure 1231U
#define TRFo_setMeasure 1230U
#define TRFo_isCplCtrlNegDir 1183U
#define TRFo_isCplAddNegDir 1182U
#define TRFo_isCplPathNegDir 1181U
#define TRFo_isCplJointNegDir 1180U
#define TRFo_isCtrlNegDir 1173U
#define TRFo_isAddNegDir 1172U
#define TRFo_isPathNegDir 1171U
#define TRFo_isJointNegDir 1170U
#define TRFo_isCplCtrlPosDir 1163U
#define TRFo_isCplAddPosDir 1162U
#define TRFo_isCplPathPosDir 1161U
#define TRFo_isCplJointPosDir 1160U
#define TRFo_isCtrlPosDir 1153U
#define TRFo_isAddPosDir 1152U
#define TRFo_isPathPosDir 1151U
#define TRFo_isJointPosDir 1150U
#define TRFo_isCplCtrlInSwEndLim 1143U
#define TRFo_isCplAddInSwEndLim 1142U
#define TRFo_isCplPathInSwEndLim 1141U
#define TRFo_isCplJointInSwEndLim 1140U
#define TRFo_isCtrlInSwEndLim 1133U
#define TRFo_isAddInSwEndLim 1132U
#define TRFo_isPathInSwEndLim 1131U
#define TRFo_isJointInSwEndLim 1130U
#define TRFo_isCplCtrlNeg 1123U
#define TRFo_isCplAddNeg 1122U
#define TRFo_isCplPathNeg 1121U
#define TRFo_isCplJointNeg 1120U
#define TRFo_isCtrlNeg 1113U
#define TRFo_isAddNeg 1112U
#define TRFo_isPathNeg 1111U
#define TRFo_isJointNeg 1110U
#define TRFo_getCplCtrlMaxChange 1023U
#define TRFo_getCplAddMaxChange 1022U
#define TRFo_getCplPathMaxChange 1021U
#define TRFo_getCplJointMaxChange 1020U
#define TRFo_getCtrlMaxChange 1013U
#define TRFo_getAddMaxChange 1012U
#define TRFo_getPathMaxChange 1011U
#define TRFo_getJointMaxChange 1010U
#define TRFo_getCplCtrlOffset 1003U
#define TRFo_getCplAddOffset 1002U
#define TRFo_getCplPathOffset 1001U
#define TRFo_getCplJointOffset 1000U
#define TRFo_getCtrlOffset 993U
#define TRFo_getAddOffset 992U
#define TRFo_getPathOffset 991U
#define TRFo_getJointOffset 990U
#define TRFo_getCplCtrlFactor 983U
#define TRFo_getCplAddFactor 982U
#define TRFo_getCplPathFactor 981U
#define TRFo_getCplJointFactor 980U
#define TRFo_getCtrlFactor 973U
#define TRFo_getAddFactor 972U
#define TRFo_getPathFactor 971U
#define TRFo_getJointFactor 970U
#define TRFo_getCplCtrlSwEndLim2 963U
#define TRFo_getCplAddSwEndLim2 962U
#define TRFo_getCplPathSwEndLim2 961U
#define TRFo_getCplJointSwEndLim2 960U
#define TRFo_getCtrlSwEndLim2 953U
#define TRFo_getAddSwEndLim2 952U
#define TRFo_getPathSwEndLim2 951U
#define TRFo_getJointSwEndLim2 950U
#define TRFo_getCplCtrlSwEndLim1 943U
#define TRFo_getCplAddSwEndLim1 942U
#define TRFo_getCplPathSwEndLim1 941U
#define TRFo_getCplJointSwEndLim1 940U
#define TRFo_getCtrlSwEndLim1 933U
#define TRFo_getAddSwEndLim1 932U
#define TRFo_getPathSwEndLim1 931U
#define TRFo_getJointSwEndLim1 930U
#define TRFo_setCplCtrlNegDir 903U
#define TRFo_setCplAddNegDir 902U
#define TRFo_setCplPathNegDir 901U
#define TRFo_setCplJointNegDir 900U
#define TRFo_setCtrlNegDir 893U
#define TRFo_setAddNegDir 892U
#define TRFo_setPathNegDir 891U
#define TRFo_setJointNegDir 890U
#define TRFo_setCplCtrlPosDir 863U
#define TRFo_setCplAddPosDir 862U
#define TRFo_setCplPathPosDir 861U
#define TRFo_setCplJointPosDir 860U
#define TRFo_setCtrlPosDir 853U
#define TRFo_setAddPosDir 852U
#define TRFo_setPathPosDir 851U
#define TRFo_setJointPosDir 850U
#define TRFo_setCplCtrlInSwEndLim 823U
#define TRFo_setCplAddInSwEndLim 822U
#define TRFo_setCplPathInSwEndLim 821U
#define TRFo_setCplJointInSwEndLim 820U
#define TRFo_setCtrlInSwEndLim 813U
#define TRFo_setAddInSwEndLim 812U
#define TRFo_setPathInSwEndLim 811U
#define TRFo_setJointInSwEndLim 810U
#define TRFo_setCplCtrlNeg 783U
#define TRFo_setCplAddNeg 782U
#define TRFo_setCplPathNeg 781U
#define TRFo_setCplJointNeg 780U
#define TRFo_setCtrlNeg 773U
#define TRFo_setAddNeg 772U
#define TRFo_setPathNeg 771U
#define TRFo_setJointNeg 770U
#define TRFo_disCplCtrlMaxChange 763U
#define TRFo_disCplAddMaxChange 762U
#define TRFo_disCplPathMaxChange 761U
#define TRFo_disCplJointMaxChange 760U
#define TRFo_disCtrlMaxChange 753U
#define TRFo_disAddMaxChange 752U
#define TRFo_disPathMaxChange 751U
#define TRFo_disJointMaxChange 750U
#define TRFo_disCplCtrlOffset 743U
#define TRFo_disCplAddOffset 742U
#define TRFo_disCplPathOffset 741U
#define TRFo_disCplJointOffset 740U
#define TRFo_disCtrlOffset 733U
#define TRFo_disAddOffset 732U
#define TRFo_disPathOffset 731U
#define TRFo_disJointOffset 730U
#define TRFo_disCplCtrlFactor 723U
#define TRFo_disCplAddFactor 722U
#define TRFo_disCplPathFactor 721U
#define TRFo_disCplJointFactor 720U
#define TRFo_disCtrlFactor 713U
#define TRFo_disAddFactor 712U
#define TRFo_disPathFactor 711U
#define TRFo_disJointFactor 710U
#define TRFo_disCplCtrlSwEndLim 703U
#define TRFo_disCplAddSwEndLim 702U
#define TRFo_disCplPathSwEndLim 701U
#define TRFo_disCplJointSwEndLim 700U
#define TRFo_disCtrlSwEndLim 693U
#define TRFo_disAddSwEndLim 692U
#define TRFo_disPathSwEndLim 691U
#define TRFo_disJointSwEndLim 690U
#define TRFo_setCplCtrlMaxChange 677U
#define TRFo_setCplAddMaxChange 676U
#define TRFo_setCplPathMaxChange 675U
#define TRFo_setCplJointMaxChange 674U
#define TRFo_setCtrlMaxChange 663U
#define TRFo_setAddMaxChange 662U
#define TRFo_setPathMaxChange 661U
#define TRFo_setJointMaxChange 660U
#define TRFo_setCplCtrlOffset 653U
#define TRFo_setCplAddOffset 652U
#define TRFo_setCplPathOffset 651U
#define TRFo_setCplJointOffset 650U
#define TRFo_setCtrlOffset 643U
#define TRFo_setAddOffset 642U
#define TRFo_setPathOffset 641U
#define TRFo_setJointOffset 640U
#define TRFo_setCplCtrlFactor 633U
#define TRFo_setCplAddFactor 632U
#define TRFo_setCplPathFactor 631U
#define TRFo_setCplJointFactor 630U
#define TRFo_setCtrlFactor 623U
#define TRFo_setAddFactor 622U
#define TRFo_setPathFactor 621U
#define TRFo_setJointFactor 620U
#define TRFo_setCplCtrlSwEndLim 613U
#define TRFo_setCplAddSwEndLim 612U
#define TRFo_setCplPathSwEndLim 611U
#define TRFo_setCplJointSwEndLim 610U
#define TRFo_setCtrlSwEndLim 603U
#define TRFo_setAddSwEndLim 602U
#define TRFo_setPathSwEndLim 601U
#define TRFo_setJointSwEndLim 600U
#define TRFo_getVariant 471U
#define TRFo_switchVariant 470U
#define TRFo_getCDCProperty 452U
#define TRFo_getCDCRadius 451U
#define TRFo_disCDC 443U
#define TRFo_setCDCProperty 442U
#define TRFo_setCDCRadius 441U
#define TRFo_getForcedMode 436U
#define TRFo_setForcedMode 432U
#define TRFo_getToolAnglesType 418U
#define TRFo_getToolPsi 417U
#define TRFo_getToolTheta 416U
#define TRFo_getToolPhi 415U
#define TRFo_getToolDz 414U
#define TRFo_getToolDy 413U
#define TRFo_getToolDx 412U
#define TRFo_disTool 399U
#define TRFo_setToolAnglesType 398U
#define TRFo_setToolPsi 397U
#define TRFo_setToolTheta 396U
#define TRFo_setToolPhi 395U
#define TRFo_setToolDz 394U
#define TRFo_setToolDy 393U
#define TRFo_setToolDx 392U
#define TRFo_setTool 391U
#define TRFo_getBaseFrameAnglesType 378U
#define TRFo_getBaseFramePsi 377U
#define TRFo_getBaseFrameTheta 376U
#define TRFo_getBaseFramePhi 375U
#define TRFo_getBaseFrameDz 374U
#define TRFo_getBaseFrameDy 373U
#define TRFo_getBaseFrameDx 372U
#define TRFo_disBaseFrame 359U
#define TRFo_setBaseFrameAnglesType 358U
#define TRFo_setBaseFramePsi 357U
#define TRFo_setBaseFrameTheta 356U
#define TRFo_setBaseFramePhi 355U
#define TRFo_setBaseFrameDz 354U
#define TRFo_setBaseFrameDy 353U
#define TRFo_setBaseFrameDx 352U
#define TRFo_setBaseFrame 351U
#define TRFo_getEpsilon 341U
#define TRFo_setEpsilon 340U
#define TRFo_isLicensed 332U
#define TRFo_checkLicense 331U
#define TRFo_getRobotID 320U
#define TRFo_getJointPositionCount 310U
#define TRFo_disCtrlCoupling 283U
#define TRFo_disAddCoupling 282U
#define TRFo_disPathCoupling 281U
#define TRFo_disJointCoupling 280U
#define TRFo_getCtrlCplToIdealCoeff 273U
#define TRFo_getAddCplToIdealCoeff 272U
#define TRFo_getPathCplToIdealCoeff 271U
#define TRFo_getJointCplToIdealCoeff 270U
#define TRFo_getCtrlIdealToCplCoeff 263U
#define TRFo_getAddIdealToCplCoeff 262U
#define TRFo_getPathIdealToCplCoeff 261U
#define TRFo_getJointIdealToCplCoeff 260U
#define TRFo_setCtrlCplToIdealCoeff 253U
#define TRFo_setAddCplToIdealCoeff 252U
#define TRFo_setPathCplToIdealCoeff 251U
#define TRFo_setJointCplToIdealCoeff 250U
#define TRFo_setCtrlIdealToCplCoeff 243U
#define TRFo_setAddIdealToCplCoeff 242U
#define TRFo_setPathIdealToCplCoeff 241U
#define TRFo_setJointIdealToCplCoeff 240U
#define TRFo_getCplPathRefCoord 231U
#define TRFo_getCplJointRefCoord 230U
#define TRFo_getPathRefCoord 221U
#define TRFo_getJointRefCoord 220U
#define TRFo_setCplPathRefCoord 211U
#define TRFo_setCplJointRefCoord 210U
#define TRFo_setPathRefCoord 201U
#define TRFo_setJointRefCoord 200U
#define TRFo_getCplCtrlCoord 193U
#define TRFo_getCplAddCoord 192U
#define TRFo_getCplPathCoord 191U
#define TRFo_getCplJointCoord 190U
#define TRFo_getCtrlCoord 183U
#define TRFo_getAddCoord 182U
#define TRFo_getPathCoord 181U
#define TRFo_getJointCoord 180U
#define TRFo_setCplCtrlCoord 173U
#define TRFo_setCplAddCoord 172U
#define TRFo_setCplPathCoord 171U
#define TRFo_setCplJointCoord 170U
#define TRFo_setCtrlCoord 163U
#define TRFo_setAddCoord 162U
#define TRFo_setPathCoord 161U
#define TRFo_setJointCoord 160U
#define TRFo_getCtrlName 123U
#define TRFo_getAddName 122U
#define TRFo_getPathName 121U
#define TRFo_getJointName 120U
#define TRFo_getCtrlType 113U
#define TRFo_getAddType 112U
#define TRFo_getPathType 111U
#define TRFo_getJointType 110U
#define TRFo_getCtrlCount 103U
#define TRFo_getAddCount 102U
#define TRFo_getPathCount 101U
#define TRFo_getJointCount 100U
#define TRFo_getGeneralJacobianCoeff 41U
#define TRFo_getJacobianCoeff 40U
#define TRFo_getSizeZ 37U
#define TRFo_getSizeY 36U
#define TRFo_getSizeX 35U
#define TRFo_getJointPosZ 32U
#define TRFo_getJointPosY 31U
#define TRFo_getJointPosX 30U
#define TRFo_getGeneralJacobian 26U
#define TRFo_getJacobian 25U
#define TRFo_getMode 24U
#define TRFo_getSize 23U
#define TRFo_getJointsPos 22U
#define TRFo_inverse 21U
#define TRFo_direct 20U
#define TRF_idealCtrl 32U
#define TRF_idealAdd 16U
#define TRF_idealRefPath 8U
#define TRF_idealPath 4U
#define TRF_idealRefJoint 2U
#define TRF_idealJoint 1U
#define TRF_delete 4U
#define TRF_clone 3U
#define TRF_update 2U
#define TRF_call 1U
#define TRF_updateAll 255U
#define TRF_updateExt 128U
#define TRF_updateMech 64U
#define TRF_updateCDC 16U
#define TRF_updateMode 8U
#define TRF_updateTool 4U
#define TRF_updateLocalFrame 2U
#define TRF_updateUnits 1U
#define TRF_CDC_STILL_PERP 4U
#define TRF_CDC_INNER 2U
#define TRF_CDC_OUTER 1U
#define TRF_MODE_IN_SW_ENDS 1073741824U
#define TRF_MODE_POS_DIR 536870912U
#define TRF_MODE_NEG_DIR 268435456U
#define TRF_MODE_DOWN 524288U
#define TRF_MODE_UP 262144U
#define TRF_MODE_RIGHT2 131072U
#define TRF_MODE_LEFT2 65536U
#define TRF_MODE_HOMOGENEOUS 32768U
#define TRF_MODE_HETEROGENEOUS 16384U
#define TRF_MODE_CONCAVE3 8192U
#define TRF_MODE_CONVEX3 4096U
#define TRF_MODE_CONCAVE2 2048U
#define TRF_MODE_CONVEX2 1024U
#define TRF_MODE_INDIRECT 512U
#define TRF_MODE_DIRECT 256U
#define TRF_MODE_RIGHT 128U
#define TRF_MODE_LEFT 64U
#define TRF_MODE_NEGATIVE 32U
#define TRF_MODE_POSITIVE 16U
#define TRF_MODE_CONCAVE 8U
#define TRF_MODE_CONVEX 4U
#define TRF_MODE_BACK 2U
#define TRF_MODE_FRONT 1U
#define TRF_MULT_FACTOR_DISABLE 32U
#define TRF_MULT_FACTOR_ENABLE 16U
#define TRF_SW_ENDS_DISABLE 8U
#define TRF_SW_ENDS_ENABLE 4U
#define TRF_MATH_NEGATIVE 2U
#define TRF_MATH_POSITIVE 1U
#define TRF_INFO 3U
#define TRF_WARNING 2U
#define TRF_ERROR 1U
#define TRF_SUCCESS 0U
#define TRF_DIRECTION_Z_MINUS 12U
#define TRF_DIRECTION_Z_PLUS 4U
#define TRF_DIRECTION_Y_MINUS 10U
#define TRF_DIRECTION_Y_PLUS 2U
#define TRF_DIRECTION_X_MINUS 9U
#define TRF_DIRECTION_X_PLUS 1U
#define TRF_DIRECTION_DEFAULT 0U
#define TRF_TAIT_BRYAN_ANGLES 1U
#define TRF_NAUTICAL_ANGLES 1U
#define TRF_CARDAN_ANGLES 1U
#define TRF_EULER_ANGLES 1024U
#define TRF_EXTRINSIC_ANGLES 131072U
#define TRF_INTRINSIC_ANGLES 65536U
#define TRF_INDIRECT_ANGLES 32768U
#define TRF_DIRECT_ANGLES 16384U
#define TRF_NEGATIVE_ANGLES 8192U
#define TRF_POSITIVE_ANGLES 4096U
#define TRF_EULER_ZYZ_ANGLES 2048U
#define TRF_EULER_ZXZ_ANGLES 1024U
#define TRF_EULER_YZY_ANGLES 512U
#define TRF_EULER_YXY_ANGLES 256U
#define TRF_EULER_XZX_ANGLES 128U
#define TRF_EULER_XYX_ANGLES 64U
#define TRF_EULER_ZYX_ANGLES 32U
#define TRF_CARDAN_ZYX_ANGLES 32U
#define TRF_EULER_ZXY_ANGLES 16U
#define TRF_CARDAN_ZXY_ANGLES 16U
#define TRF_EULER_YZX_ANGLES 8U
#define TRF_CARDAN_YZX_ANGLES 8U
#define TRF_EULER_YXZ_ANGLES 4U
#define TRF_CARDAN_YXZ_ANGLES 4U
#define TRF_EULER_XZY_ANGLES 2U
#define TRF_CARDAN_XZY_ANGLES 2U
#define TRF_EULER_XYZ_ANGLES 1U
#define TRF_CARDAN_XYZ_ANGLES 1U
#define TRF_INCHES 64U
#define TRF_METERS 32U
#define TRF_MILLIMETERS 16U
#define TRF_GRADIANS 4U
#define TRF_RADIANS 2U
#define TRF_DEGREES 1U
#define TRF_INFO_LENGTH 9U
#define TRF_LIB_VERSION_NUMBER 2020U
#else
#ifndef _GLOBAL_CONST
#define _GLOBAL_CONST _WEAK const
#endif
_GLOBAL_CONST unsigned long TRFo_getDirectionType;
_GLOBAL_CONST unsigned long TRFo_isDualUseCompliant;
_GLOBAL_CONST unsigned long TRFo_setTcpQuaternion;
_GLOBAL_CONST unsigned long TRFo_setTcpPosition;
_GLOBAL_CONST unsigned long TRFo_getTcpQuaternion;
_GLOBAL_CONST unsigned long TRFo_getTcpPosition;
_GLOBAL_CONST unsigned long TRFo_getAnglesType;
_GLOBAL_CONST unsigned long TRFo_clone;
_GLOBAL_CONST unsigned long TRFo_getCplPathRefCoords;
_GLOBAL_CONST unsigned long TRFo_getCplJointRefCoords;
_GLOBAL_CONST unsigned long TRFo_getPathRefCoords;
_GLOBAL_CONST unsigned long TRFo_getJointRefCoords;
_GLOBAL_CONST unsigned long TRFo_setCplPathRefCoords;
_GLOBAL_CONST unsigned long TRFo_setCplJointRefCoords;
_GLOBAL_CONST unsigned long TRFo_setPathRefCoords;
_GLOBAL_CONST unsigned long TRFo_setJointRefCoords;
_GLOBAL_CONST unsigned long TRFo_getCplCtrlCoords;
_GLOBAL_CONST unsigned long TRFo_getCplAddCoords;
_GLOBAL_CONST unsigned long TRFo_getCplPathCoords;
_GLOBAL_CONST unsigned long TRFo_getCplJointCoords;
_GLOBAL_CONST unsigned long TRFo_getCtrlCoords;
_GLOBAL_CONST unsigned long TRFo_getAddCoords;
_GLOBAL_CONST unsigned long TRFo_getPathCoords;
_GLOBAL_CONST unsigned long TRFo_getJointCoords;
_GLOBAL_CONST unsigned long TRFo_setCplCtrlCoords;
_GLOBAL_CONST unsigned long TRFo_setCplAddCoords;
_GLOBAL_CONST unsigned long TRFo_setCplPathCoords;
_GLOBAL_CONST unsigned long TRFo_setCplJointCoords;
_GLOBAL_CONST unsigned long TRFo_setCtrlCoords;
_GLOBAL_CONST unsigned long TRFo_setAddCoords;
_GLOBAL_CONST unsigned long TRFo_setPathCoords;
_GLOBAL_CONST unsigned long TRFo_setJointCoords;
_GLOBAL_CONST unsigned long TRFo_getMeasure;
_GLOBAL_CONST unsigned long TRFo_setMeasure;
_GLOBAL_CONST unsigned long TRFo_isCplCtrlNegDir;
_GLOBAL_CONST unsigned long TRFo_isCplAddNegDir;
_GLOBAL_CONST unsigned long TRFo_isCplPathNegDir;
_GLOBAL_CONST unsigned long TRFo_isCplJointNegDir;
_GLOBAL_CONST unsigned long TRFo_isCtrlNegDir;
_GLOBAL_CONST unsigned long TRFo_isAddNegDir;
_GLOBAL_CONST unsigned long TRFo_isPathNegDir;
_GLOBAL_CONST unsigned long TRFo_isJointNegDir;
_GLOBAL_CONST unsigned long TRFo_isCplCtrlPosDir;
_GLOBAL_CONST unsigned long TRFo_isCplAddPosDir;
_GLOBAL_CONST unsigned long TRFo_isCplPathPosDir;
_GLOBAL_CONST unsigned long TRFo_isCplJointPosDir;
_GLOBAL_CONST unsigned long TRFo_isCtrlPosDir;
_GLOBAL_CONST unsigned long TRFo_isAddPosDir;
_GLOBAL_CONST unsigned long TRFo_isPathPosDir;
_GLOBAL_CONST unsigned long TRFo_isJointPosDir;
_GLOBAL_CONST unsigned long TRFo_isCplCtrlInSwEndLim;
_GLOBAL_CONST unsigned long TRFo_isCplAddInSwEndLim;
_GLOBAL_CONST unsigned long TRFo_isCplPathInSwEndLim;
_GLOBAL_CONST unsigned long TRFo_isCplJointInSwEndLim;
_GLOBAL_CONST unsigned long TRFo_isCtrlInSwEndLim;
_GLOBAL_CONST unsigned long TRFo_isAddInSwEndLim;
_GLOBAL_CONST unsigned long TRFo_isPathInSwEndLim;
_GLOBAL_CONST unsigned long TRFo_isJointInSwEndLim;
_GLOBAL_CONST unsigned long TRFo_isCplCtrlNeg;
_GLOBAL_CONST unsigned long TRFo_isCplAddNeg;
_GLOBAL_CONST unsigned long TRFo_isCplPathNeg;
_GLOBAL_CONST unsigned long TRFo_isCplJointNeg;
_GLOBAL_CONST unsigned long TRFo_isCtrlNeg;
_GLOBAL_CONST unsigned long TRFo_isAddNeg;
_GLOBAL_CONST unsigned long TRFo_isPathNeg;
_GLOBAL_CONST unsigned long TRFo_isJointNeg;
_GLOBAL_CONST unsigned long TRFo_getCplCtrlMaxChange;
_GLOBAL_CONST unsigned long TRFo_getCplAddMaxChange;
_GLOBAL_CONST unsigned long TRFo_getCplPathMaxChange;
_GLOBAL_CONST unsigned long TRFo_getCplJointMaxChange;
_GLOBAL_CONST unsigned long TRFo_getCtrlMaxChange;
_GLOBAL_CONST unsigned long TRFo_getAddMaxChange;
_GLOBAL_CONST unsigned long TRFo_getPathMaxChange;
_GLOBAL_CONST unsigned long TRFo_getJointMaxChange;
_GLOBAL_CONST unsigned long TRFo_getCplCtrlOffset;
_GLOBAL_CONST unsigned long TRFo_getCplAddOffset;
_GLOBAL_CONST unsigned long TRFo_getCplPathOffset;
_GLOBAL_CONST unsigned long TRFo_getCplJointOffset;
_GLOBAL_CONST unsigned long TRFo_getCtrlOffset;
_GLOBAL_CONST unsigned long TRFo_getAddOffset;
_GLOBAL_CONST unsigned long TRFo_getPathOffset;
_GLOBAL_CONST unsigned long TRFo_getJointOffset;
_GLOBAL_CONST unsigned long TRFo_getCplCtrlFactor;
_GLOBAL_CONST unsigned long TRFo_getCplAddFactor;
_GLOBAL_CONST unsigned long TRFo_getCplPathFactor;
_GLOBAL_CONST unsigned long TRFo_getCplJointFactor;
_GLOBAL_CONST unsigned long TRFo_getCtrlFactor;
_GLOBAL_CONST unsigned long TRFo_getAddFactor;
_GLOBAL_CONST unsigned long TRFo_getPathFactor;
_GLOBAL_CONST unsigned long TRFo_getJointFactor;
_GLOBAL_CONST unsigned long TRFo_getCplCtrlSwEndLim2;
_GLOBAL_CONST unsigned long TRFo_getCplAddSwEndLim2;
_GLOBAL_CONST unsigned long TRFo_getCplPathSwEndLim2;
_GLOBAL_CONST unsigned long TRFo_getCplJointSwEndLim2;
_GLOBAL_CONST unsigned long TRFo_getCtrlSwEndLim2;
_GLOBAL_CONST unsigned long TRFo_getAddSwEndLim2;
_GLOBAL_CONST unsigned long TRFo_getPathSwEndLim2;
_GLOBAL_CONST unsigned long TRFo_getJointSwEndLim2;
_GLOBAL_CONST unsigned long TRFo_getCplCtrlSwEndLim1;
_GLOBAL_CONST unsigned long TRFo_getCplAddSwEndLim1;
_GLOBAL_CONST unsigned long TRFo_getCplPathSwEndLim1;
_GLOBAL_CONST unsigned long TRFo_getCplJointSwEndLim1;
_GLOBAL_CONST unsigned long TRFo_getCtrlSwEndLim1;
_GLOBAL_CONST unsigned long TRFo_getAddSwEndLim1;
_GLOBAL_CONST unsigned long TRFo_getPathSwEndLim1;
_GLOBAL_CONST unsigned long TRFo_getJointSwEndLim1;
_GLOBAL_CONST unsigned long TRFo_setCplCtrlNegDir;
_GLOBAL_CONST unsigned long TRFo_setCplAddNegDir;
_GLOBAL_CONST unsigned long TRFo_setCplPathNegDir;
_GLOBAL_CONST unsigned long TRFo_setCplJointNegDir;
_GLOBAL_CONST unsigned long TRFo_setCtrlNegDir;
_GLOBAL_CONST unsigned long TRFo_setAddNegDir;
_GLOBAL_CONST unsigned long TRFo_setPathNegDir;
_GLOBAL_CONST unsigned long TRFo_setJointNegDir;
_GLOBAL_CONST unsigned long TRFo_setCplCtrlPosDir;
_GLOBAL_CONST unsigned long TRFo_setCplAddPosDir;
_GLOBAL_CONST unsigned long TRFo_setCplPathPosDir;
_GLOBAL_CONST unsigned long TRFo_setCplJointPosDir;
_GLOBAL_CONST unsigned long TRFo_setCtrlPosDir;
_GLOBAL_CONST unsigned long TRFo_setAddPosDir;
_GLOBAL_CONST unsigned long TRFo_setPathPosDir;
_GLOBAL_CONST unsigned long TRFo_setJointPosDir;
_GLOBAL_CONST unsigned long TRFo_setCplCtrlInSwEndLim;
_GLOBAL_CONST unsigned long TRFo_setCplAddInSwEndLim;
_GLOBAL_CONST unsigned long TRFo_setCplPathInSwEndLim;
_GLOBAL_CONST unsigned long TRFo_setCplJointInSwEndLim;
_GLOBAL_CONST unsigned long TRFo_setCtrlInSwEndLim;
_GLOBAL_CONST unsigned long TRFo_setAddInSwEndLim;
_GLOBAL_CONST unsigned long TRFo_setPathInSwEndLim;
_GLOBAL_CONST unsigned long TRFo_setJointInSwEndLim;
_GLOBAL_CONST unsigned long TRFo_setCplCtrlNeg;
_GLOBAL_CONST unsigned long TRFo_setCplAddNeg;
_GLOBAL_CONST unsigned long TRFo_setCplPathNeg;
_GLOBAL_CONST unsigned long TRFo_setCplJointNeg;
_GLOBAL_CONST unsigned long TRFo_setCtrlNeg;
_GLOBAL_CONST unsigned long TRFo_setAddNeg;
_GLOBAL_CONST unsigned long TRFo_setPathNeg;
_GLOBAL_CONST unsigned long TRFo_setJointNeg;
_GLOBAL_CONST unsigned long TRFo_disCplCtrlMaxChange;
_GLOBAL_CONST unsigned long TRFo_disCplAddMaxChange;
_GLOBAL_CONST unsigned long TRFo_disCplPathMaxChange;
_GLOBAL_CONST unsigned long TRFo_disCplJointMaxChange;
_GLOBAL_CONST unsigned long TRFo_disCtrlMaxChange;
_GLOBAL_CONST unsigned long TRFo_disAddMaxChange;
_GLOBAL_CONST unsigned long TRFo_disPathMaxChange;
_GLOBAL_CONST unsigned long TRFo_disJointMaxChange;
_GLOBAL_CONST unsigned long TRFo_disCplCtrlOffset;
_GLOBAL_CONST unsigned long TRFo_disCplAddOffset;
_GLOBAL_CONST unsigned long TRFo_disCplPathOffset;
_GLOBAL_CONST unsigned long TRFo_disCplJointOffset;
_GLOBAL_CONST unsigned long TRFo_disCtrlOffset;
_GLOBAL_CONST unsigned long TRFo_disAddOffset;
_GLOBAL_CONST unsigned long TRFo_disPathOffset;
_GLOBAL_CONST unsigned long TRFo_disJointOffset;
_GLOBAL_CONST unsigned long TRFo_disCplCtrlFactor;
_GLOBAL_CONST unsigned long TRFo_disCplAddFactor;
_GLOBAL_CONST unsigned long TRFo_disCplPathFactor;
_GLOBAL_CONST unsigned long TRFo_disCplJointFactor;
_GLOBAL_CONST unsigned long TRFo_disCtrlFactor;
_GLOBAL_CONST unsigned long TRFo_disAddFactor;
_GLOBAL_CONST unsigned long TRFo_disPathFactor;
_GLOBAL_CONST unsigned long TRFo_disJointFactor;
_GLOBAL_CONST unsigned long TRFo_disCplCtrlSwEndLim;
_GLOBAL_CONST unsigned long TRFo_disCplAddSwEndLim;
_GLOBAL_CONST unsigned long TRFo_disCplPathSwEndLim;
_GLOBAL_CONST unsigned long TRFo_disCplJointSwEndLim;
_GLOBAL_CONST unsigned long TRFo_disCtrlSwEndLim;
_GLOBAL_CONST unsigned long TRFo_disAddSwEndLim;
_GLOBAL_CONST unsigned long TRFo_disPathSwEndLim;
_GLOBAL_CONST unsigned long TRFo_disJointSwEndLim;
_GLOBAL_CONST unsigned long TRFo_setCplCtrlMaxChange;
_GLOBAL_CONST unsigned long TRFo_setCplAddMaxChange;
_GLOBAL_CONST unsigned long TRFo_setCplPathMaxChange;
_GLOBAL_CONST unsigned long TRFo_setCplJointMaxChange;
_GLOBAL_CONST unsigned long TRFo_setCtrlMaxChange;
_GLOBAL_CONST unsigned long TRFo_setAddMaxChange;
_GLOBAL_CONST unsigned long TRFo_setPathMaxChange;
_GLOBAL_CONST unsigned long TRFo_setJointMaxChange;
_GLOBAL_CONST unsigned long TRFo_setCplCtrlOffset;
_GLOBAL_CONST unsigned long TRFo_setCplAddOffset;
_GLOBAL_CONST unsigned long TRFo_setCplPathOffset;
_GLOBAL_CONST unsigned long TRFo_setCplJointOffset;
_GLOBAL_CONST unsigned long TRFo_setCtrlOffset;
_GLOBAL_CONST unsigned long TRFo_setAddOffset;
_GLOBAL_CONST unsigned long TRFo_setPathOffset;
_GLOBAL_CONST unsigned long TRFo_setJointOffset;
_GLOBAL_CONST unsigned long TRFo_setCplCtrlFactor;
_GLOBAL_CONST unsigned long TRFo_setCplAddFactor;
_GLOBAL_CONST unsigned long TRFo_setCplPathFactor;
_GLOBAL_CONST unsigned long TRFo_setCplJointFactor;
_GLOBAL_CONST unsigned long TRFo_setCtrlFactor;
_GLOBAL_CONST unsigned long TRFo_setAddFactor;
_GLOBAL_CONST unsigned long TRFo_setPathFactor;
_GLOBAL_CONST unsigned long TRFo_setJointFactor;
_GLOBAL_CONST unsigned long TRFo_setCplCtrlSwEndLim;
_GLOBAL_CONST unsigned long TRFo_setCplAddSwEndLim;
_GLOBAL_CONST unsigned long TRFo_setCplPathSwEndLim;
_GLOBAL_CONST unsigned long TRFo_setCplJointSwEndLim;
_GLOBAL_CONST unsigned long TRFo_setCtrlSwEndLim;
_GLOBAL_CONST unsigned long TRFo_setAddSwEndLim;
_GLOBAL_CONST unsigned long TRFo_setPathSwEndLim;
_GLOBAL_CONST unsigned long TRFo_setJointSwEndLim;
_GLOBAL_CONST unsigned long TRFo_getVariant;
_GLOBAL_CONST unsigned long TRFo_switchVariant;
_GLOBAL_CONST unsigned long TRFo_getCDCProperty;
_GLOBAL_CONST unsigned long TRFo_getCDCRadius;
_GLOBAL_CONST unsigned long TRFo_disCDC;
_GLOBAL_CONST unsigned long TRFo_setCDCProperty;
_GLOBAL_CONST unsigned long TRFo_setCDCRadius;
_GLOBAL_CONST unsigned long TRFo_getForcedMode;
_GLOBAL_CONST unsigned long TRFo_setForcedMode;
_GLOBAL_CONST unsigned long TRFo_getToolAnglesType;
_GLOBAL_CONST unsigned long TRFo_getToolPsi;
_GLOBAL_CONST unsigned long TRFo_getToolTheta;
_GLOBAL_CONST unsigned long TRFo_getToolPhi;
_GLOBAL_CONST unsigned long TRFo_getToolDz;
_GLOBAL_CONST unsigned long TRFo_getToolDy;
_GLOBAL_CONST unsigned long TRFo_getToolDx;
_GLOBAL_CONST unsigned long TRFo_disTool;
_GLOBAL_CONST unsigned long TRFo_setToolAnglesType;
_GLOBAL_CONST unsigned long TRFo_setToolPsi;
_GLOBAL_CONST unsigned long TRFo_setToolTheta;
_GLOBAL_CONST unsigned long TRFo_setToolPhi;
_GLOBAL_CONST unsigned long TRFo_setToolDz;
_GLOBAL_CONST unsigned long TRFo_setToolDy;
_GLOBAL_CONST unsigned long TRFo_setToolDx;
_GLOBAL_CONST unsigned long TRFo_setTool;
_GLOBAL_CONST unsigned long TRFo_getBaseFrameAnglesType;
_GLOBAL_CONST unsigned long TRFo_getBaseFramePsi;
_GLOBAL_CONST unsigned long TRFo_getBaseFrameTheta;
_GLOBAL_CONST unsigned long TRFo_getBaseFramePhi;
_GLOBAL_CONST unsigned long TRFo_getBaseFrameDz;
_GLOBAL_CONST unsigned long TRFo_getBaseFrameDy;
_GLOBAL_CONST unsigned long TRFo_getBaseFrameDx;
_GLOBAL_CONST unsigned long TRFo_disBaseFrame;
_GLOBAL_CONST unsigned long TRFo_setBaseFrameAnglesType;
_GLOBAL_CONST unsigned long TRFo_setBaseFramePsi;
_GLOBAL_CONST unsigned long TRFo_setBaseFrameTheta;
_GLOBAL_CONST unsigned long TRFo_setBaseFramePhi;
_GLOBAL_CONST unsigned long TRFo_setBaseFrameDz;
_GLOBAL_CONST unsigned long TRFo_setBaseFrameDy;
_GLOBAL_CONST unsigned long TRFo_setBaseFrameDx;
_GLOBAL_CONST unsigned long TRFo_setBaseFrame;
_GLOBAL_CONST unsigned long TRFo_getEpsilon;
_GLOBAL_CONST unsigned long TRFo_setEpsilon;
_GLOBAL_CONST unsigned long TRFo_isLicensed;
_GLOBAL_CONST unsigned long TRFo_checkLicense;
_GLOBAL_CONST unsigned long TRFo_getRobotID;
_GLOBAL_CONST unsigned long TRFo_getJointPositionCount;
_GLOBAL_CONST unsigned long TRFo_disCtrlCoupling;
_GLOBAL_CONST unsigned long TRFo_disAddCoupling;
_GLOBAL_CONST unsigned long TRFo_disPathCoupling;
_GLOBAL_CONST unsigned long TRFo_disJointCoupling;
_GLOBAL_CONST unsigned long TRFo_getCtrlCplToIdealCoeff;
_GLOBAL_CONST unsigned long TRFo_getAddCplToIdealCoeff;
_GLOBAL_CONST unsigned long TRFo_getPathCplToIdealCoeff;
_GLOBAL_CONST unsigned long TRFo_getJointCplToIdealCoeff;
_GLOBAL_CONST unsigned long TRFo_getCtrlIdealToCplCoeff;
_GLOBAL_CONST unsigned long TRFo_getAddIdealToCplCoeff;
_GLOBAL_CONST unsigned long TRFo_getPathIdealToCplCoeff;
_GLOBAL_CONST unsigned long TRFo_getJointIdealToCplCoeff;
_GLOBAL_CONST unsigned long TRFo_setCtrlCplToIdealCoeff;
_GLOBAL_CONST unsigned long TRFo_setAddCplToIdealCoeff;
_GLOBAL_CONST unsigned long TRFo_setPathCplToIdealCoeff;
_GLOBAL_CONST unsigned long TRFo_setJointCplToIdealCoeff;
_GLOBAL_CONST unsigned long TRFo_setCtrlIdealToCplCoeff;
_GLOBAL_CONST unsigned long TRFo_setAddIdealToCplCoeff;
_GLOBAL_CONST unsigned long TRFo_setPathIdealToCplCoeff;
_GLOBAL_CONST unsigned long TRFo_setJointIdealToCplCoeff;
_GLOBAL_CONST unsigned long TRFo_getCplPathRefCoord;
_GLOBAL_CONST unsigned long TRFo_getCplJointRefCoord;
_GLOBAL_CONST unsigned long TRFo_getPathRefCoord;
_GLOBAL_CONST unsigned long TRFo_getJointRefCoord;
_GLOBAL_CONST unsigned long TRFo_setCplPathRefCoord;
_GLOBAL_CONST unsigned long TRFo_setCplJointRefCoord;
_GLOBAL_CONST unsigned long TRFo_setPathRefCoord;
_GLOBAL_CONST unsigned long TRFo_setJointRefCoord;
_GLOBAL_CONST unsigned long TRFo_getCplCtrlCoord;
_GLOBAL_CONST unsigned long TRFo_getCplAddCoord;
_GLOBAL_CONST unsigned long TRFo_getCplPathCoord;
_GLOBAL_CONST unsigned long TRFo_getCplJointCoord;
_GLOBAL_CONST unsigned long TRFo_getCtrlCoord;
_GLOBAL_CONST unsigned long TRFo_getAddCoord;
_GLOBAL_CONST unsigned long TRFo_getPathCoord;
_GLOBAL_CONST unsigned long TRFo_getJointCoord;
_GLOBAL_CONST unsigned long TRFo_setCplCtrlCoord;
_GLOBAL_CONST unsigned long TRFo_setCplAddCoord;
_GLOBAL_CONST unsigned long TRFo_setCplPathCoord;
_GLOBAL_CONST unsigned long TRFo_setCplJointCoord;
_GLOBAL_CONST unsigned long TRFo_setCtrlCoord;
_GLOBAL_CONST unsigned long TRFo_setAddCoord;
_GLOBAL_CONST unsigned long TRFo_setPathCoord;
_GLOBAL_CONST unsigned long TRFo_setJointCoord;
_GLOBAL_CONST unsigned long TRFo_getCtrlName;
_GLOBAL_CONST unsigned long TRFo_getAddName;
_GLOBAL_CONST unsigned long TRFo_getPathName;
_GLOBAL_CONST unsigned long TRFo_getJointName;
_GLOBAL_CONST unsigned long TRFo_getCtrlType;
_GLOBAL_CONST unsigned long TRFo_getAddType;
_GLOBAL_CONST unsigned long TRFo_getPathType;
_GLOBAL_CONST unsigned long TRFo_getJointType;
_GLOBAL_CONST unsigned long TRFo_getCtrlCount;
_GLOBAL_CONST unsigned long TRFo_getAddCount;
_GLOBAL_CONST unsigned long TRFo_getPathCount;
_GLOBAL_CONST unsigned long TRFo_getJointCount;
_GLOBAL_CONST unsigned long TRFo_getGeneralJacobianCoeff;
_GLOBAL_CONST unsigned long TRFo_getJacobianCoeff;
_GLOBAL_CONST unsigned long TRFo_getSizeZ;
_GLOBAL_CONST unsigned long TRFo_getSizeY;
_GLOBAL_CONST unsigned long TRFo_getSizeX;
_GLOBAL_CONST unsigned long TRFo_getJointPosZ;
_GLOBAL_CONST unsigned long TRFo_getJointPosY;
_GLOBAL_CONST unsigned long TRFo_getJointPosX;
_GLOBAL_CONST unsigned long TRFo_getGeneralJacobian;
_GLOBAL_CONST unsigned long TRFo_getJacobian;
_GLOBAL_CONST unsigned long TRFo_getMode;
_GLOBAL_CONST unsigned long TRFo_getSize;
_GLOBAL_CONST unsigned long TRFo_getJointsPos;
_GLOBAL_CONST unsigned long TRFo_inverse;
_GLOBAL_CONST unsigned long TRFo_direct;
_GLOBAL_CONST unsigned long TRF_idealCtrl;
_GLOBAL_CONST unsigned long TRF_idealAdd;
_GLOBAL_CONST unsigned long TRF_idealRefPath;
_GLOBAL_CONST unsigned long TRF_idealPath;
_GLOBAL_CONST unsigned long TRF_idealRefJoint;
_GLOBAL_CONST unsigned long TRF_idealJoint;
_GLOBAL_CONST unsigned long TRF_delete;
_GLOBAL_CONST unsigned long TRF_clone;
_GLOBAL_CONST unsigned long TRF_update;
_GLOBAL_CONST unsigned long TRF_call;
_GLOBAL_CONST unsigned long TRF_updateAll;
_GLOBAL_CONST unsigned long TRF_updateExt;
_GLOBAL_CONST unsigned long TRF_updateMech;
_GLOBAL_CONST unsigned long TRF_updateCDC;
_GLOBAL_CONST unsigned long TRF_updateMode;
_GLOBAL_CONST unsigned long TRF_updateTool;
_GLOBAL_CONST unsigned long TRF_updateLocalFrame;
_GLOBAL_CONST unsigned long TRF_updateUnits;
_GLOBAL_CONST unsigned long TRF_CDC_STILL_PERP;
_GLOBAL_CONST unsigned long TRF_CDC_INNER;
_GLOBAL_CONST unsigned long TRF_CDC_OUTER;
_GLOBAL_CONST unsigned long TRF_MODE_IN_SW_ENDS;
_GLOBAL_CONST unsigned long TRF_MODE_POS_DIR;
_GLOBAL_CONST unsigned long TRF_MODE_NEG_DIR;
_GLOBAL_CONST unsigned long TRF_MODE_DOWN;
_GLOBAL_CONST unsigned long TRF_MODE_UP;
_GLOBAL_CONST unsigned long TRF_MODE_RIGHT2;
_GLOBAL_CONST unsigned long TRF_MODE_LEFT2;
_GLOBAL_CONST unsigned long TRF_MODE_HOMOGENEOUS;
_GLOBAL_CONST unsigned long TRF_MODE_HETEROGENEOUS;
_GLOBAL_CONST unsigned long TRF_MODE_CONCAVE3;
_GLOBAL_CONST unsigned long TRF_MODE_CONVEX3;
_GLOBAL_CONST unsigned long TRF_MODE_CONCAVE2;
_GLOBAL_CONST unsigned long TRF_MODE_CONVEX2;
_GLOBAL_CONST unsigned long TRF_MODE_INDIRECT;
_GLOBAL_CONST unsigned long TRF_MODE_DIRECT;
_GLOBAL_CONST unsigned long TRF_MODE_RIGHT;
_GLOBAL_CONST unsigned long TRF_MODE_LEFT;
_GLOBAL_CONST unsigned long TRF_MODE_NEGATIVE;
_GLOBAL_CONST unsigned long TRF_MODE_POSITIVE;
_GLOBAL_CONST unsigned long TRF_MODE_CONCAVE;
_GLOBAL_CONST unsigned long TRF_MODE_CONVEX;
_GLOBAL_CONST unsigned long TRF_MODE_BACK;
_GLOBAL_CONST unsigned long TRF_MODE_FRONT;
_GLOBAL_CONST unsigned long TRF_MULT_FACTOR_DISABLE;
_GLOBAL_CONST unsigned long TRF_MULT_FACTOR_ENABLE;
_GLOBAL_CONST unsigned long TRF_SW_ENDS_DISABLE;
_GLOBAL_CONST unsigned long TRF_SW_ENDS_ENABLE;
_GLOBAL_CONST unsigned long TRF_MATH_NEGATIVE;
_GLOBAL_CONST unsigned long TRF_MATH_POSITIVE;
_GLOBAL_CONST unsigned long TRF_INFO;
_GLOBAL_CONST unsigned long TRF_WARNING;
_GLOBAL_CONST unsigned long TRF_ERROR;
_GLOBAL_CONST unsigned long TRF_SUCCESS;
_GLOBAL_CONST unsigned long TRF_DIRECTION_Z_MINUS;
_GLOBAL_CONST unsigned long TRF_DIRECTION_Z_PLUS;
_GLOBAL_CONST unsigned long TRF_DIRECTION_Y_MINUS;
_GLOBAL_CONST unsigned long TRF_DIRECTION_Y_PLUS;
_GLOBAL_CONST unsigned long TRF_DIRECTION_X_MINUS;
_GLOBAL_CONST unsigned long TRF_DIRECTION_X_PLUS;
_GLOBAL_CONST unsigned long TRF_DIRECTION_DEFAULT;
_GLOBAL_CONST unsigned long TRF_TAIT_BRYAN_ANGLES;
_GLOBAL_CONST unsigned long TRF_NAUTICAL_ANGLES;
_GLOBAL_CONST unsigned long TRF_CARDAN_ANGLES;
_GLOBAL_CONST unsigned long TRF_EULER_ANGLES;
_GLOBAL_CONST unsigned long TRF_EXTRINSIC_ANGLES;
_GLOBAL_CONST unsigned long TRF_INTRINSIC_ANGLES;
_GLOBAL_CONST unsigned long TRF_INDIRECT_ANGLES;
_GLOBAL_CONST unsigned long TRF_DIRECT_ANGLES;
_GLOBAL_CONST unsigned long TRF_NEGATIVE_ANGLES;
_GLOBAL_CONST unsigned long TRF_POSITIVE_ANGLES;
_GLOBAL_CONST unsigned long TRF_EULER_ZYZ_ANGLES;
_GLOBAL_CONST unsigned long TRF_EULER_ZXZ_ANGLES;
_GLOBAL_CONST unsigned long TRF_EULER_YZY_ANGLES;
_GLOBAL_CONST unsigned long TRF_EULER_YXY_ANGLES;
_GLOBAL_CONST unsigned long TRF_EULER_XZX_ANGLES;
_GLOBAL_CONST unsigned long TRF_EULER_XYX_ANGLES;
_GLOBAL_CONST unsigned long TRF_EULER_ZYX_ANGLES;
_GLOBAL_CONST unsigned long TRF_CARDAN_ZYX_ANGLES;
_GLOBAL_CONST unsigned long TRF_EULER_ZXY_ANGLES;
_GLOBAL_CONST unsigned long TRF_CARDAN_ZXY_ANGLES;
_GLOBAL_CONST unsigned long TRF_EULER_YZX_ANGLES;
_GLOBAL_CONST unsigned long TRF_CARDAN_YZX_ANGLES;
_GLOBAL_CONST unsigned long TRF_EULER_YXZ_ANGLES;
_GLOBAL_CONST unsigned long TRF_CARDAN_YXZ_ANGLES;
_GLOBAL_CONST unsigned long TRF_EULER_XZY_ANGLES;
_GLOBAL_CONST unsigned long TRF_CARDAN_XZY_ANGLES;
_GLOBAL_CONST unsigned long TRF_EULER_XYZ_ANGLES;
_GLOBAL_CONST unsigned long TRF_CARDAN_XYZ_ANGLES;
_GLOBAL_CONST unsigned long TRF_INCHES;
_GLOBAL_CONST unsigned long TRF_METERS;
_GLOBAL_CONST unsigned long TRF_MILLIMETERS;
_GLOBAL_CONST unsigned long TRF_GRADIANS;
_GLOBAL_CONST unsigned long TRF_RADIANS;
_GLOBAL_CONST unsigned long TRF_DEGREES;
_GLOBAL_CONST unsigned long TRF_INFO_LENGTH;
_GLOBAL_CONST unsigned long TRF_LIB_VERSION_NUMBER;
#endif




/* Datatypes and datatypes of function blocks */
typedef struct TRF_IDENT_typ
{
    unsigned long size;
    unsigned long type;
    unsigned long dyn_model;
    unsigned long obj_addr;
} TRF_IDENT_typ;

typedef struct TRF_FCTADDR_typ
{
    unsigned long fct_info;
    unsigned long generic;
    unsigned long direct;
    unsigned long direct2;
    unsigned long inverse;
    unsigned long inverse_init;
    unsigned long inverse2;
    unsigned long inverse2_init;
    unsigned long get_joints_pos;
    unsigned long get_size;
    unsigned long get_mode;
    unsigned long direct3;
    unsigned long inverse3;
    unsigned long reserve[3];
} TRF_FCTADDR_typ;

typedef struct TRF_UNITS_typ
{
    unsigned long measure;
    unsigned long reserve_align0;
    double epsilon;
    unsigned long reserve[2];
} TRF_UNITS_typ;

typedef struct TRF_MODE_typ
{
    unsigned long preferred;
    unsigned long forced;
    unsigned long useIdealCoord;
    unsigned long reserve_align0;
    unsigned long reserve[2];
} TRF_MODE_typ;

typedef struct TRF_CDC_typ
{
    unsigned long enable;
    unsigned long reserve_align0;
    double radius;
    unsigned long property;
    unsigned long reserve_align1;
    unsigned long reserve[2];
} TRF_CDC_typ;

typedef struct TRF_FRAMEPOS_typ
{
    unsigned long enable;
    unsigned long reserve_align0;
    double dx;
    double dy;
    double dz;
    double phi;
    double theta;
    double psi;
    unsigned long angles_type;
    unsigned long reserve_align1;
    unsigned long reserve[2];
} TRF_FRAMEPOS_typ;

typedef struct TRF_INTERNDATA_typ
{
    unsigned long data[16];
} TRF_INTERNDATA_typ;

typedef struct TRF_JOINTPROP_typ
{
    unsigned long property;
    unsigned long reserve_align0;
    double maximal_change;
    double min_sw_end;
    double max_sw_end;
    double mult_factor;
    unsigned long reserve[2];
} TRF_JOINTPROP_typ;

typedef struct TRF_DATA00_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    unsigned long _mech_[128];
    unsigned long type_00;
} TRF_DATA00_typ;

typedef struct TRF_MECH01_typ
{
    double rod1;
    double rod2;
    double slider1x;
    double slider1z;
    double slider2x;
    double slider2z;
    unsigned long concave;
    unsigned long reserve_align0;
    struct TRF_JOINTPROP_typ axis_T1;
    struct TRF_JOINTPROP_typ axis_T2;
    unsigned long reserve[90];
} TRF_MECH01_typ;

typedef struct TRF_DATA01_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH01_typ mech;
    unsigned long type_01;
} TRF_DATA01_typ;

typedef struct TRF_MECH02_typ
{
    double a0x;
    double a0y;
    double a1xy;
    double a2xy;
    struct TRF_JOINTPROP_typ axis_Q1;
    struct TRF_JOINTPROP_typ axis_Q2;
    unsigned long reserve[96];
} TRF_MECH02_typ;

typedef struct TRF_DATA02_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH02_typ mech;
    unsigned long type_02;
} TRF_DATA02_typ;

typedef struct TRF_MECH03_typ
{
    double l1_l;
    double l2_l;
    double l1_r;
    double l2_r;
    double x0_l;
    double y0_l;
    double x0_r;
    double y0_r;
    unsigned long negative;
    unsigned long reserve_align0;
    struct TRF_JOINTPROP_typ axis_Q1;
    struct TRF_JOINTPROP_typ axis_Q2;
    unsigned long reserve[86];
} TRF_MECH03_typ;

typedef struct TRF_DATA03_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH03_typ mech;
    unsigned long type_03;
} TRF_DATA03_typ;

typedef struct TRF_MECH04_typ
{
    double a0x;
    double a0y;
    double a0z;
    double a1x;
    double a1y;
    double a1z;
    double a2x;
    double a2y;
    double a2z;
    double a3x;
    double a3y;
    double a3z;
    double a4x;
    double a5x;
    unsigned long angles_type;
    unsigned long reserve_align0;
    struct TRF_JOINTPROP_typ axis_Q1;
    struct TRF_JOINTPROP_typ axis_Q2;
    struct TRF_JOINTPROP_typ axis_Q3;
    struct TRF_JOINTPROP_typ axis_Q4;
    struct TRF_JOINTPROP_typ axis_Q5;
    struct TRF_JOINTPROP_typ axis_Q6;
    unsigned long reserve[26];
} TRF_MECH04_typ;

typedef struct TRF_DATA04_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH04_typ mech;
    unsigned long type_04;
} TRF_DATA04_typ;

typedef struct TRF_MECH05_typ
{
    double a0x;
    double a0y;
    double a0z;
    double a1x;
    double a1y;
    double a1z;
    double a2x;
    double a2y;
    double a2z;
    double a3x;
    double a3y;
    double a3z;
    double angle_BC;
    double CB_link;
    struct TRF_FRAMEPOS_typ frame_BC;
    struct TRF_JOINTPROP_typ axis_X;
    struct TRF_JOINTPROP_typ axis_Y;
    struct TRF_JOINTPROP_typ axis_Z;
    struct TRF_JOINTPROP_typ axis_C;
    struct TRF_JOINTPROP_typ axis_B;
    unsigned long reserve[22];
} TRF_MECH05_typ;

typedef struct TRF_DATA05_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH05_typ mech;
    unsigned long type_05;
} TRF_DATA05_typ;

typedef struct TRF_MECH06_typ
{
    double a0x;
    double a0y;
    double a0z;
    double a1x;
    double a1y;
    double a1z;
    double a2x;
    double a2y;
    double a2z;
    double a3x;
    double a3y;
    double a3z;
    double CB_link;
    struct TRF_FRAMEPOS_typ frame_CB;
    unsigned long direction_type;
    unsigned long reserve_align0;
    struct TRF_JOINTPROP_typ axis_X;
    struct TRF_JOINTPROP_typ axis_Y;
    struct TRF_JOINTPROP_typ axis_Z;
    struct TRF_JOINTPROP_typ axis_C;
    struct TRF_JOINTPROP_typ axis_B;
    unsigned long reserve[22];
} TRF_MECH06_typ;

typedef struct TRF_DATA06_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH06_typ mech;
    unsigned long type_06;
} TRF_DATA06_typ;

typedef struct TRF_MECH07_typ
{
    double radius;
    double pipe1;
    double pipe2;
    double rod1;
    double rod2;
    double tool_holder_len;
    double tool_holder_frac;
    double pipes_distance;
    double chord_distance;
    struct TRF_JOINTPROP_typ axis_Q1;
    struct TRF_JOINTPROP_typ axis_Q2;
    struct TRF_JOINTPROP_typ axis_Z1;
    struct TRF_JOINTPROP_typ axis_Z2;
    unsigned long reserve[62];
} TRF_MECH07_typ;

typedef struct TRF_DATA07_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH07_typ mech;
    unsigned long type_07;
} TRF_DATA07_typ;

typedef struct TRF_MECH08_typ
{
    double a0x;
    double a0y;
    double a0z;
    double a1z;
    struct TRF_JOINTPROP_typ axis_X;
    struct TRF_JOINTPROP_typ axis_Y;
    struct TRF_JOINTPROP_typ axis_Z;
    struct TRF_JOINTPROP_typ axis_B;
    unsigned long reserve[72];
} TRF_MECH08_typ;

typedef struct TRF_DATA08_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH08_typ mech;
    unsigned long type_08;
} TRF_DATA08_typ;

typedef struct TRF_MECH09_typ
{
    double a0x;
    double a0y;
    double a0z;
    double a1angle;
    double a1radius;
    double a2angle;
    double a2radius;
    double a3angle;
    double a3radius;
    double pipe1;
    double pipe2;
    double pipe3;
    double joints_height;
    double b1angle;
    double b1radius;
    double b2angle;
    double b2radius;
    double b3angle;
    double b3radius;
    double tool_holder_len;
    struct TRF_JOINTPROP_typ axis_X;
    struct TRF_JOINTPROP_typ axis_Y;
    struct TRF_JOINTPROP_typ axis_T1;
    struct TRF_JOINTPROP_typ axis_T2;
    struct TRF_JOINTPROP_typ axis_T3;
    unsigned long reserve[28];
} TRF_MECH09_typ;

typedef struct TRF_DATA09_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH09_typ mech;
    unsigned long type_09;
} TRF_DATA09_typ;

typedef struct TRF_MECH10_typ
{
    double a1x;
    double a1y;
    double a1z;
    double a3x;
    double a3y;
    double a3z;
    double tube1;
    double tube2;
    double tube3;
    struct TRF_JOINTPROP_typ axis_Q1;
    struct TRF_JOINTPROP_typ axis_Q2;
    struct TRF_JOINTPROP_typ axis_Z;
    struct TRF_JOINTPROP_typ axis_C;
    unsigned long reserve[62];
} TRF_MECH10_typ;

typedef struct TRF_DATA10_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH10_typ mech;
    unsigned long type_10;
} TRF_DATA10_typ;

typedef struct TRF_MECH11_typ
{
    double a0x;
    double a0y;
    double a0z;
    double a1x;
    double a1y;
    double a1z;
    double a2x;
    double a2y;
    double a2z;
    double a3x;
    double a3y;
    double a3z;
    double a4z;
    double a5z;
    unsigned long angles_type;
    unsigned long reserve_align0;
    struct TRF_JOINTPROP_typ axis_Q1;
    struct TRF_JOINTPROP_typ axis_Q2;
    struct TRF_JOINTPROP_typ axis_Q3;
    struct TRF_JOINTPROP_typ axis_Q4;
    struct TRF_JOINTPROP_typ axis_Q5;
    struct TRF_JOINTPROP_typ axis_Q6;
    unsigned long reserve[26];
} TRF_MECH11_typ;

typedef struct TRF_DATA11_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH11_typ mech;
    unsigned long type_11;
} TRF_DATA11_typ;

typedef struct TRF_MECH12_typ
{
    double x0;
    double y0;
    double radius_diff;
    double arm_len;
    signed long Q1Q2_link;
    unsigned long reserve_align0;
    struct TRF_JOINTPROP_typ axis_Q1;
    struct TRF_JOINTPROP_typ axis_Q2;
    unsigned long reserve[94];
} TRF_MECH12_typ;

typedef struct TRF_DATA12_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH12_typ mech;
    unsigned long type_12;
} TRF_DATA12_typ;

typedef struct TRF_MECH13_typ
{
    double a0x;
    double a0y;
    double a0z;
    double a1angle;
    double a1radius;
    double a1dz;
    double a2angle;
    double a2radius;
    double a2dz;
    double a3angle;
    double a3radius;
    double a3dz;
    double arm1;
    double arm2;
    double arm3;
    double pipe1;
    double pipe2;
    double pipe3;
    double b1radius;
    double b1dz;
    double b2radius;
    double b2dz;
    double b3radius;
    double b3dz;
    double tool_holder_len;
    unsigned long upper;
    unsigned long reserve_align0;
    struct TRF_JOINTPROP_typ axis_T1;
    struct TRF_JOINTPROP_typ axis_T2;
    struct TRF_JOINTPROP_typ axis_T3;
    unsigned long reserve[40];
} TRF_MECH13_typ;

typedef struct TRF_DATA13_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH13_typ mech;
    unsigned long type_13;
} TRF_DATA13_typ;

typedef struct TRF_MECH14_typ
{
    double a0x;
    double a0y;
    double a0z;
    double a1xy;
    double a1z;
    double a2xy;
    double a2z;
    double a3z;
    double spindle_dz;
    struct TRF_JOINTPROP_typ axis_Q1;
    struct TRF_JOINTPROP_typ axis_Q2;
    struct TRF_JOINTPROP_typ axis_Z;
    struct TRF_JOINTPROP_typ axis_C;
    struct TRF_JOINTPROP_typ axis_Ctrl1;
    unsigned long reserve[50];
} TRF_MECH14_typ;

typedef struct TRF_DATA14_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH14_typ mech;
    unsigned long type_14;
} TRF_DATA14_typ;

typedef struct TRF_MECH15_typ
{
    double a0x;
    double a0y;
    double a0z;
    double a1x;
    double a1y;
    double a1z;
    double a2x;
    double a2y;
    double a2z;
    double a3x;
    double a3y;
    double a3z;
    double AB_link;
    struct TRF_FRAMEPOS_typ frame_AB;
    unsigned long direction_type;
    unsigned long reserve_align0;
    struct TRF_JOINTPROP_typ axis_X;
    struct TRF_JOINTPROP_typ axis_Y;
    struct TRF_JOINTPROP_typ axis_Z;
    struct TRF_JOINTPROP_typ axis_A;
    struct TRF_JOINTPROP_typ axis_B;
    unsigned long reserve[22];
} TRF_MECH15_typ;

typedef struct TRF_DATA15_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH15_typ mech;
    unsigned long type_15;
} TRF_DATA15_typ;

typedef struct TRF_MECH16_typ
{
    double a0x;
    double a0y;
    double a0z;
    double a1x;
    double a1y;
    double a1z;
    double a2x;
    double a2y;
    double a2z;
    double a3x;
    double a3y;
    double a3z;
    double BA_link;
    struct TRF_FRAMEPOS_typ frame_BA;
    unsigned long direction_type;
    unsigned long reserve_align0;
    struct TRF_JOINTPROP_typ axis_X;
    struct TRF_JOINTPROP_typ axis_Y;
    struct TRF_JOINTPROP_typ axis_Z;
    struct TRF_JOINTPROP_typ axis_B;
    struct TRF_JOINTPROP_typ axis_A;
    unsigned long reserve[22];
} TRF_MECH16_typ;

typedef struct TRF_DATA16_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH16_typ mech;
    unsigned long type_16;
} TRF_DATA16_typ;

typedef struct TRF_MECH17_typ
{
    double a0x;
    double a0y;
    double a0z;
    double a1x;
    double a1y;
    double a1z;
    double a2x;
    double a2y;
    double a2z;
    double a3x;
    double a3y;
    double a3z;
    double CA_link;
    struct TRF_FRAMEPOS_typ frame_CA;
    unsigned long direction_type;
    unsigned long reserve_align0;
    struct TRF_JOINTPROP_typ axis_X;
    struct TRF_JOINTPROP_typ axis_Y;
    struct TRF_JOINTPROP_typ axis_Z;
    struct TRF_JOINTPROP_typ axis_C;
    struct TRF_JOINTPROP_typ axis_A;
    unsigned long reserve[22];
} TRF_MECH17_typ;

typedef struct TRF_DATA17_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH17_typ mech;
    unsigned long type_17;
} TRF_DATA17_typ;

typedef struct TRF_MECH18_typ
{
    double a0x;
    double a0y;
    double a0z;
    double a1x;
    double a1y;
    double a1z;
    double a2x;
    double a2y;
    double a2z;
    double a3x;
    double a3y;
    double a3z;
    double AC_link;
    struct TRF_FRAMEPOS_typ frame_AC;
    unsigned long direction_type;
    unsigned long reserve_align0;
    struct TRF_JOINTPROP_typ axis_X;
    struct TRF_JOINTPROP_typ axis_Y;
    struct TRF_JOINTPROP_typ axis_Z;
    struct TRF_JOINTPROP_typ axis_A;
    struct TRF_JOINTPROP_typ axis_C;
    unsigned long reserve[22];
} TRF_MECH18_typ;

typedef struct TRF_DATA18_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH18_typ mech;
    unsigned long type_18;
} TRF_DATA18_typ;

typedef struct TRF_MECH19_typ
{
    double a0x;
    double a0y;
    double a0z;
    double a1x;
    double a1y;
    double a1z;
    double a2x;
    double a2y;
    double a2z;
    double a3x;
    double a3y;
    double a3z;
    double BC_link;
    struct TRF_FRAMEPOS_typ frame_BC;
    unsigned long direction_type;
    unsigned long reserve_align0;
    struct TRF_JOINTPROP_typ axis_X;
    struct TRF_JOINTPROP_typ axis_Y;
    struct TRF_JOINTPROP_typ axis_Z;
    struct TRF_JOINTPROP_typ axis_B;
    struct TRF_JOINTPROP_typ axis_C;
    unsigned long reserve[22];
} TRF_MECH19_typ;

typedef struct TRF_DATA19_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH19_typ mech;
    unsigned long type_19;
} TRF_DATA19_typ;

typedef struct TRF_MECH20_typ
{
    double a0x;
    double a0y;
    double a0z;
    double a1x;
    double a1y;
    double a1z;
    double a2x;
    double a2y;
    double a2z;
    double b0x;
    double b0y;
    double b0z;
    double b1x;
    double b1y;
    double b1z;
    unsigned long RTCP_angles_type;
    unsigned long T_angles_type;
    double RTCP_phi;
    double RTCP_theta;
    double RTCP_psi;
    double T_phi;
    double T_theta;
    double T_psi;
    struct TRF_FRAMEPOS_typ frame_RTCP;
    struct TRF_JOINTPROP_typ axis_X;
    struct TRF_JOINTPROP_typ axis_Y;
    struct TRF_JOINTPROP_typ axis_Z;
    struct TRF_JOINTPROP_typ axis_RTCP;
    struct TRF_JOINTPROP_typ axis_T;
    unsigned long reserve[6];
} TRF_MECH20_typ;

typedef struct TRF_DATA20_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH20_typ mech;
    unsigned long type_20;
} TRF_DATA20_typ;

typedef struct TRF_MECH21_typ
{
    struct TRF_FRAMEPOS_typ a0;
    double a1y;
    double a1z;
    double a2x;
    double a2z;
    double a3y;
    double a3z;
    double a4;
    double a4a;
    double a5y;
    unsigned long angles_type;
    unsigned long position_type;
    double accuracy_angle;
    double accuracy_pos;
    unsigned long smooth_path;
    unsigned long reserve_align0;
    struct TRF_JOINTPROP_typ axis_Q1;
    struct TRF_JOINTPROP_typ axis_Q2;
    struct TRF_JOINTPROP_typ axis_Q3;
    struct TRF_JOINTPROP_typ axis_Q4;
    struct TRF_JOINTPROP_typ axis_Q5;
    struct TRF_JOINTPROP_typ axis_Q6;
    unsigned long reserve[12];
} TRF_MECH21_typ;

typedef struct TRF_DATA21_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH21_typ mech;
    unsigned long type_21;
} TRF_DATA21_typ;

typedef struct TRF_MECH22_typ
{
    double a0x;
    double a0z;
    double a1x;
    double a1z;
    double a2x;
    double a2z;
    double z0;
    double b0;
    double arm;
    unsigned long negative_dir;
    unsigned long reserve_align0;
    struct TRF_JOINTPROP_typ axis_X;
    struct TRF_JOINTPROP_typ axis_Z;
    struct TRF_JOINTPROP_typ axis_B;
    unsigned long reserve[72];
} TRF_MECH22_typ;

typedef struct TRF_DATA22_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH22_typ mech;
    unsigned long type_22;
} TRF_DATA22_typ;

typedef struct TRF_MECH23_typ
{
    double a0x;
    double a0y;
    double a0z;
    double a1angle;
    double a1radius;
    double a2angle;
    double a2radius;
    double a3angle;
    double a3radius;
    double pipe1;
    double pipe2;
    double pipe3;
    double b1angle;
    double b1radius;
    double b2angle;
    double b2radius;
    double b3angle;
    double b3radius;
    double tool_holder_len;
    struct TRF_JOINTPROP_typ axis_T1;
    struct TRF_JOINTPROP_typ axis_T2;
    struct TRF_JOINTPROP_typ axis_T3;
    unsigned long reserve[54];
} TRF_MECH23_typ;

typedef struct TRF_DATA23_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH23_typ mech;
    unsigned long type_23;
} TRF_DATA23_typ;

typedef struct TRF_MECH24_typ
{
    double a0x;
    double a0y;
    double a0z;
    double a1angle;
    double a1radius;
    double a1dz;
    double a2angle;
    double a2radius;
    double a2dz;
    double a3angle;
    double a3radius;
    double a3dz;
    double m1dxy;
    double m1dz;
    double m2dxy;
    double m2dz;
    double m3dxy;
    double m3dz;
    double arm1;
    double arm2;
    double arm3;
    double arm_holder1;
    double arm_holder2;
    double arm_holder3;
    double pipe1;
    double pipe2;
    double pipe3;
    double b1radius;
    double b1dz;
    double b2radius;
    double b2dz;
    double b3radius;
    double b3dz;
    double tool_holder_len;
    unsigned long upper;
    unsigned long reserve_align0;
    struct TRF_JOINTPROP_typ axis_T1;
    struct TRF_JOINTPROP_typ axis_T2;
    struct TRF_JOINTPROP_typ axis_T3;
    unsigned long reserve[22];
} TRF_MECH24_typ;

typedef struct TRF_DATA24_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH24_typ mech;
    unsigned long type_24;
} TRF_DATA24_typ;

typedef struct TRF_MECH25_typ
{
    double a0x;
    double a0y;
    double a0z;
    double a1angle;
    double a1radius;
    double a1dz;
    double a2angle;
    double a2radius;
    double a2dz;
    double a3angle;
    double a3radius;
    double a3dz;
    double arm1;
    double arm2;
    double arm3;
    double pipe1;
    double pipe2;
    double pipe3;
    double b1radius;
    double b1dz;
    double b2radius;
    double b2dz;
    double b3radius;
    double b3dz;
    double tool_holder_len;
    unsigned long upper;
    unsigned long reserve_align0;
    struct TRF_JOINTPROP_typ axis_T1;
    struct TRF_JOINTPROP_typ axis_T2;
    struct TRF_JOINTPROP_typ axis_T3;
    struct TRF_JOINTPROP_typ axis_C;
    unsigned long reserve[28];
} TRF_MECH25_typ;

typedef struct TRF_DATA25_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH25_typ mech;
    unsigned long type_25;
} TRF_DATA25_typ;

typedef struct TRF_MECH26_typ
{
    double a0x;
    double a0y;
    double a0z;
    double a1x;
    double a1y;
    double a1z;
    double a2x;
    double a2y;
    double a2z;
    double a3x;
    double a3y;
    double a3z;
    double a4x;
    double a4y;
    double a4z;
    struct TRF_JOINTPROP_typ axis_Y;
    struct TRF_JOINTPROP_typ axis_C;
    struct TRF_JOINTPROP_typ axis_Q1;
    struct TRF_JOINTPROP_typ axis_Q2;
    unsigned long reserve[50];
} TRF_MECH26_typ;

typedef struct TRF_DATA26_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH26_typ mech;
    unsigned long type_26;
} TRF_DATA26_typ;

typedef struct TRF_MECH27_typ
{
    double a0x;
    double a0y;
    double a0z;
    double a1angle;
    double a1radius;
    double a1dz;
    double a2angle;
    double a2radius;
    double a2dz;
    double a3angle;
    double a3radius;
    double a3dz;
    double pipe1;
    double pipe2;
    double pipe3;
    double arm1;
    double arm2;
    double arm3;
    double b1radius;
    double b1dz;
    double b2radius;
    double b2dz;
    double b3radius;
    double b3dz;
    double tool_holder_len;
    unsigned long upper;
    unsigned long reserve_align0;
    struct TRF_JOINTPROP_typ axis_T1;
    struct TRF_JOINTPROP_typ axis_T2;
    struct TRF_JOINTPROP_typ axis_T3;
    struct TRF_JOINTPROP_typ axis_C;
    unsigned long reserve[28];
} TRF_MECH27_typ;

typedef struct TRF_DATA27_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH27_typ mech;
    unsigned long type_27;
} TRF_DATA27_typ;

typedef struct TRF_MECH28_typ
{
    double a0x;
    double a0y;
    double a0z;
    double a1x;
    double a1z;
    double a2x;
    double a2z;
    double bx;
    double by;
    double bz;
    double cx;
    double cz;
    double dx;
    double dy;
    double dz;
    double ex;
    double ez;
    double fx;
    double fy;
    double fz;
    double mpx;
    double mpy;
    double mpz;
    double a1a;
    double a2a;
    double ca;
    double ae;
    unsigned long left;
    unsigned long upper;
    unsigned long negative;
    unsigned long reserve_align0;
    struct TRF_JOINTPROP_typ axis_T;
    struct TRF_JOINTPROP_typ axis_Q1;
    struct TRF_JOINTPROP_typ axis_Q2;
    unsigned long reserve[34];
} TRF_MECH28_typ;

typedef struct TRF_DATA28_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH28_typ mech;
    unsigned long type_28;
} TRF_DATA28_typ;

typedef struct TRF_MECH29_typ
{
    double a0x;
    double a0y;
    double a0z;
    double a1x;
    double a1y;
    double a1z;
    double a2x;
    double a2y;
    double a2z;
    double a3x;
    double a3y;
    double a3z;
    double a4x;
    double a4y;
    double a4z;
    struct TRF_JOINTPROP_typ axis_Q1;
    struct TRF_JOINTPROP_typ axis_Q2;
    struct TRF_JOINTPROP_typ axis_Q3;
    struct TRF_JOINTPROP_typ axis_Q6;
    unsigned long reserve[50];
} TRF_MECH29_typ;

typedef struct TRF_DATA29_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH29_typ mech;
    unsigned long type_29;
} TRF_DATA29_typ;

typedef struct TRF_MECH30_typ
{
    double a0x;
    double a0y;
    double a0z;
    double a1x;
    double a1y;
    double a1z;
    double a2x;
    double a2y;
    double a2z;
    double a3x;
    double a3y;
    double a3z;
    struct TRF_JOINTPROP_typ axis_C;
    struct TRF_JOINTPROP_typ axis_Z;
    struct TRF_JOINTPROP_typ axis_X;
    unsigned long reserve[68];
} TRF_MECH30_typ;

typedef struct TRF_DATA30_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH30_typ mech;
    unsigned long type_30;
} TRF_DATA30_typ;

typedef struct TRF_MECH31_typ
{
    double a0x;
    double a0y;
    double a0z;
    double a1x;
    double a1y;
    double a1z;
    double a2x;
    double a2y;
    double a2z;
    double a3x;
    double a3y;
    double a3z;
    double a4x;
    double a4y;
    double a4z;
    struct TRF_JOINTPROP_typ axis_C;
    struct TRF_JOINTPROP_typ axis_Z;
    struct TRF_JOINTPROP_typ axis_X;
    struct TRF_JOINTPROP_typ axis_D;
    unsigned long reserve[50];
} TRF_MECH31_typ;

typedef struct TRF_DATA31_typ
{
    struct TRF_IDENT_typ ident;
    struct TRF_FCTADDR_typ fctaddr;
    struct TRF_UNITS_typ units;
    struct TRF_FRAMEPOS_typ local_frame;
    struct TRF_FRAMEPOS_typ tool;
    struct TRF_MODE_typ mode;
    struct TRF_CDC_typ CDC;
    struct TRF_INTERNDATA_typ _intern_;
    struct TRF_MECH31_typ mech;
    unsigned long type_31;
} TRF_DATA31_typ;

typedef struct TRF_DYN_INTERN_typ
{
    unsigned long robot_par_addr;
    unsigned long robot_par_size;
    unsigned long ident;
} TRF_DYN_INTERN_typ;

typedef struct TRF_DYN_typ
{
    unsigned long addr_var_name;
    struct TRF_DYN_INTERN_typ intern;
    unsigned long status;
} TRF_DYN_typ;

typedef struct TRF_DYN04A_H_typ
{
    unsigned long type_04;
    unsigned long variant_A;
} TRF_DYN04A_H_typ;

typedef struct TRF_DYN04A_typ
{
    struct TRF_DYN04A_H_typ header;
    double base_param1;
    double base_param2;
    double base_param3;
    double base_param4;
    double base_param5;
    double base_param6;
    double base_param7;
    double base_param8;
    double base_param9;
    double base_param10;
    double base_param11;
    double base_param12;
    double base_param13;
    double base_param14;
    double base_param15;
    double base_param16;
    double base_param17;
    double base_param18;
    double base_param19;
    double base_param20;
    double base_param21;
    double base_param22;
    double base_param23;
    double base_param24;
    double base_param25;
    double base_param26;
    double base_param27;
    double base_param28;
    double base_param29;
    double base_param30;
    double base_param31;
    double base_param32;
    double base_param33;
    double base_param34;
    double base_param35;
    double base_param36;
    double base_param37;
    double base_param38;
    double base_param39;
    double base_param40;
    double base_param41;
    double base_param42;
    double base_param43;
    double base_param44;
    double base_param45;
    double base_param46;
    double base_param47;
    double base_param48;
    double a0x;
    double a0y;
    double a0z;
    double a1x;
    double a1y;
    double a1z;
    double a2x;
    double a2y;
    double a2z;
    double a3x;
    double a3y;
    double a3z;
    double a4x;
    double a5x;
    double iG1;
    double iG2;
    double iG3;
    double iG4;
    double iG5;
    double iG6;
    double g;
} TRF_DYN04A_typ;

typedef struct TRF_DYN04B_H_typ
{
    unsigned long type_04;
    unsigned long variant_B;
} TRF_DYN04B_H_typ;

typedef struct TRF_DYN04B_typ
{
    struct TRF_DYN04B_H_typ header;
    double base_param1;
    double base_param2;
    double base_param3;
    double base_param4;
    double base_param5;
    double base_param6;
    double base_param7;
    double base_param8;
    double base_param9;
    double base_param10;
    double base_param11;
    double base_param12;
    double base_param13;
    double base_param14;
    double base_param15;
    double base_param16;
    double base_param17;
    double base_param18;
    double base_param19;
    double base_param20;
    double base_param21;
    double base_param22;
    double base_param23;
    double base_param24;
    double base_param25;
    double base_param26;
    double base_param27;
    double base_param28;
    double base_param29;
    double base_param30;
    double base_param31;
    double base_param32;
    double base_param33;
    double base_param34;
    double base_param35;
    double base_param36;
    double base_param37;
    double base_param38;
    double base_param39;
    double base_param40;
    double base_param41;
    double base_param42;
    double base_param43;
    double base_param44;
    double base_param45;
    double base_param46;
    double base_param47;
    double base_param48;
    double base_param49;
    double base_param50;
    double base_param51;
    double base_param52;
    double base_param53;
    double base_param54;
    double base_param55;
    double base_param56;
    double base_param57;
    double base_param58;
    double base_param59;
    double base_param60;
    double base_param61;
    double base_param62;
    double base_param63;
    double base_param64;
    double base_param65;
    double base_param66;
    double base_param67;
    double base_param68;
    double base_param69;
    double base_param70;
    double base_param71;
    double base_param72;
    double base_param73;
    double base_param74;
    double base_param75;
    double base_param76;
    double base_param77;
    double base_param78;
    double base_param79;
    double base_param80;
    double base_param81;
    double base_param82;
    double base_param83;
    double base_param84;
    double base_param85;
    double base_param86;
    double base_param87;
    double base_param88;
    double base_param89;
    double base_param90;
    double base_param91;
    double base_param92;
    double base_param93;
    double base_param94;
    double base_param95;
    double base_param96;
    double base_param97;
    double base_param98;
    double base_param99;
    double base_param100;
    double base_param101;
    double base_param102;
    double base_param103;
    double base_param104;
    double base_param105;
    double base_param106;
    double base_param107;
    double base_param108;
    double base_param109;
    double a0x;
    double a0y;
    double a0z;
    double a1x;
    double a1y;
    double a1z;
    double a2x;
    double a2y;
    double a2z;
    double a3x;
    double a3y;
    double a3z;
    double a4x;
    double a5x;
    double iG1;
    double iG2;
    double iG3;
    double iG4;
    double iG5;
    double iG6;
    double g;
} TRF_DYN04B_typ;

typedef struct TRF_DYN11A_H_typ
{
    unsigned long type_11;
    unsigned long variant_A;
} TRF_DYN11A_H_typ;

typedef struct TRF_DYN11A_typ
{
    struct TRF_DYN11A_H_typ header;
    double base_param1;
    double base_param2;
    double base_param3;
    double base_param4;
    double base_param5;
    double base_param6;
    double base_param7;
    double base_param8;
    double base_param9;
    double base_param10;
    double base_param11;
    double base_param12;
    double base_param13;
    double base_param14;
    double base_param15;
    double base_param16;
    double base_param17;
    double base_param18;
    double base_param19;
    double base_param20;
    double base_param21;
    double base_param22;
    double base_param23;
    double base_param24;
    double base_param25;
    double base_param26;
    double base_param27;
    double base_param28;
    double base_param29;
    double base_param30;
    double base_param31;
    double base_param32;
    double base_param33;
    double base_param34;
    double base_param35;
    double base_param36;
    double base_param37;
    double base_param38;
    double base_param39;
    double base_param40;
    double base_param41;
    double base_param42;
    double base_param43;
    double base_param44;
    double base_param45;
    double base_param46;
    double base_param47;
    double base_param48;
    double base_param49;
    double base_param50;
    double base_param51;
    double base_param52;
    double base_param53;
    double base_param54;
    double base_param55;
    double a1x;
    double a1y;
    double a1z;
    double a2z;
    double a3y;
    double a3z;
    double a4z;
    double a5z;
    double iG1;
    double iG2;
    double iG3;
    double iG4;
    double iG5;
    double iG6;
    double iGL;
    double g;
} TRF_DYN11A_typ;

typedef struct TRF_DYN11B_H_typ
{
    unsigned long type_11;
    unsigned long variant_B;
} TRF_DYN11B_H_typ;

typedef struct TRF_DYN11B_typ
{
    struct TRF_DYN11B_H_typ header;
    double m1;
    double CM1;
    double mA1;
    double CA1;
    double BM2;
    double mA2;
    double AA2;
    double BA2;
    double CA2;
    double BM3;
    double mA3;
    double AA3;
    double BA3;
    double CA3;
    double AM4;
    double mA4;
    double AA4;
    double BA4;
    double CA4;
    double BM5;
    double mA5;
    double AA5;
    double BA5;
    double CA5;
    double BM6;
    double mA6;
    double AA6;
    double BA6;
    double CA6;
    double rsA2x;
    double rsA4x;
    double rsA5x;
    double d1;
    double d2;
    double d3;
    double d4;
    double d5;
    double d6;
    double dC1;
    double dC2;
    double dC3;
    double dC4;
    double dC5;
    double dC6;
    double r_I1_z;
    double r_12_x;
    double r_12_y;
    double r_23_x;
    double r_23_y;
    double r_34_x;
    double r_45_x;
    double r_56_x;
    double iG1;
    double iG2;
    double iG3;
    double iG4;
    double iG5;
    double iG6;
    double g;
    double mAddM;
    double AAddM;
    double BAddM;
    double CAddM;
    double rsAddMx;
    double iGL;
    double dL;
    double dCL;
    double AML;
    double mAL;
} TRF_DYN11B_typ;

typedef struct TRF_DYN13A_H_typ
{
    unsigned long type_13;
    unsigned long variant_A;
} TRF_DYN13A_H_typ;

typedef struct TRF_DYN13A_typ
{
    struct TRF_DYN13A_H_typ header;
    double base_param1;
    double base_param2;
    double base_param3;
    double base_param4;
    double base_param5;
    double base_param6;
    double base_param7;
    double base_param8;
    double base_param9;
    double base_param10;
    double base_param11;
    double base_param12;
    double base_param13;
    double a123radius;
    double b123radius;
    double arm123;
    double pipe123;
    double iG;
    double g;
} TRF_DYN13A_typ;

typedef struct TRF_DYN14A_H_typ
{
    unsigned long type_14;
    unsigned long variant_A;
} TRF_DYN14A_H_typ;

typedef struct TRF_DYN14A_typ
{
    struct TRF_DYN14A_H_typ header;
    double base_param1;
    double base_param2;
    double base_param3;
    double base_param4;
    double base_param5;
    double base_param6;
    double base_param7;
    double base_param8;
    double base_param9;
    double base_param10;
    double base_param11;
    double base_param12;
    double base_param13;
    double base_param14;
    double base_param15;
    double base_param16;
    double base_param17;
    double base_param18;
    double base_param19;
    double base_param20;
    double base_param21;
    double base_param22;
    double base_param23;
    double base_param24;
    double base_param25;
    double base_param26;
    double base_param27;
    double base_param28;
    double base_param29;
    double base_param30;
    double base_param31;
    double base_param32;
    double base_param33;
    double base_param34;
    double a1xy;
    double a2xy;
    double iG1;
    double iG2;
    double iG3;
    double iG4;
    double k;
    double g;
} TRF_DYN14A_typ;

typedef struct TRF_DYN14B_H_typ
{
    unsigned long type_14;
    unsigned long variant_B;
} TRF_DYN14B_H_typ;

typedef struct TRF_DYN14B_typ
{
    struct TRF_DYN14B_H_typ header;
    double mA1;
    double mA2;
    double mA3;
    double mAddM;
    double CA1;
    double CA2;
    double CA3;
    double CAddM;
    double CM1;
    double CM2;
    double CM3;
    double CM4;
    double rsA1x;
    double rsA2x;
    double rsAddMx;
    double rsAddMy;
    double d1;
    double d2;
    double d3;
    double d4;
    double dC1;
    double dC2;
    double dC3;
    double dC4;
    double r_12_xy;
    double r_23_xy;
    double iG1;
    double iG2;
    double iG3;
    double iG4;
    double iGL;
    double g;
} TRF_DYN14B_typ;

typedef struct TRF_DYN21A_H_typ
{
    unsigned long type_21;
    unsigned long variant_A;
} TRF_DYN21A_H_typ;

typedef struct TRF_DYN21A_typ
{
    struct TRF_DYN21A_H_typ header;
    double base_param1;
    double base_param2;
    double base_param3;
    double base_param4;
    double base_param5;
    double base_param6;
    double base_param7;
    double base_param8;
    double base_param9;
    double base_param10;
    double base_param11;
    double base_param12;
    double base_param13;
    double base_param14;
    double base_param15;
    double base_param16;
    double base_param17;
    double base_param18;
    double base_param19;
    double base_param20;
    double base_param21;
    double base_param22;
    double base_param23;
    double base_param24;
    double base_param25;
    double base_param26;
    double base_param27;
    double base_param28;
    double base_param29;
    double base_param30;
    double base_param31;
    double base_param32;
    double base_param33;
    double base_param34;
    double base_param35;
    double base_param36;
    double base_param37;
    double base_param38;
    double base_param39;
    double base_param40;
    double base_param41;
    double base_param42;
    double base_param43;
    double base_param44;
    double base_param45;
    double base_param46;
    double base_param47;
    double base_param48;
    double base_param49;
    double base_param50;
    double base_param51;
    double base_param52;
    double base_param53;
    double base_param54;
    double base_param55;
    double base_param56;
    double base_param57;
    double base_param58;
    double base_param59;
    double base_param60;
    double base_param61;
    double base_param62;
    double base_param63;
    double base_param64;
    double base_param65;
    double base_param66;
    double base_param67;
    double base_param68;
    double base_param69;
    double base_param70;
    double base_param71;
    double base_param72;
    double base_param73;
    double base_param74;
    double base_param75;
    double base_param76;
    double base_param77;
    double base_param78;
    double base_param79;
    double base_param80;
    double base_param81;
    double base_param82;
    double base_param83;
    double base_param84;
    double base_param85;
    double base_param86;
    double base_param87;
    double base_param88;
    double base_param89;
    double base_param90;
    double base_param91;
    double base_param92;
    double base_param93;
    double base_param94;
    double base_param95;
    double base_param96;
    double base_param97;
    double base_param98;
    double base_param99;
    double base_param100;
    double base_param101;
    double base_param102;
    double base_param103;
    double base_param104;
    double base_param105;
    double base_param106;
    double base_param107;
    double base_param108;
    double base_param109;
    double a1y;
    double a1z;
    double a2x;
    double a2z;
    double a3y;
    double a3z;
    double a4;
    double a4a;
    double a5y;
    double iG1;
    double iG2;
    double iG3;
    double iG4;
    double iG5;
    double iG6;
    double g;
} TRF_DYN21A_typ;

typedef struct TRF_DYN29A_H_typ
{
    unsigned long type_29;
    unsigned long variant_A;
} TRF_DYN29A_H_typ;

typedef struct TRF_DYN29A_typ
{
    struct TRF_DYN29A_H_typ header;
    double base_param1;
    double base_param2;
    double base_param3;
    double base_param4;
    double base_param5;
    double base_param6;
    double base_param7;
    double base_param8;
    double base_param9;
    double base_param10;
    double base_param11;
    double base_param12;
    double base_param13;
    double base_param14;
    double base_param15;
    double base_param16;
    double base_param17;
    double base_param18;
    double base_param19;
    double base_param20;
    double base_param21;
    double base_param22;
    double base_param23;
    double base_param24;
    double base_param25;
    double base_param26;
    double base_param27;
    double base_param28;
    double base_param29;
    double base_param30;
    double base_param31;
    double base_param32;
    double base_param33;
    double base_param34;
    double base_param35;
    double base_param36;
    double base_param37;
    double base_param38;
    double base_param39;
    double base_param40;
    double base_param41;
    double base_param42;
    double base_param43;
    double base_param44;
    double base_param45;
    double base_param46;
    double base_param47;
    double base_param48;
    double base_param49;
    double base_param50;
    double base_param51;
    double base_param52;
    double base_param53;
    double base_param54;
    double base_param55;
    double base_param56;
    double base_param57;
    double base_param58;
    double base_param59;
    double base_param60;
    double base_param61;
    double base_param62;
    double base_param63;
    double base_param64;
    double base_param65;
    double base_param66;
    double base_param67;
    double base_param68;
    double base_param69;
    double base_param70;
    double base_param71;
    double base_param72;
    double base_param73;
    double base_param74;
    double base_param75;
    double base_param76;
    double base_param77;
    double base_param78;
    double a0x;
    double a0y;
    double a0z;
    double a1x;
    double a1y;
    double a1z;
    double a2x;
    double a2y;
    double a2z;
    double a3x;
    double a3y;
    double a3z;
    double a4x;
    double a4y;
    double a4z;
    double iG1;
    double iG2;
    double iG3;
    double iG6;
    double g;
} TRF_DYN29A_typ;

typedef struct TRF_extProp_t
{
    unsigned long swEndLimUsed;
    unsigned long factorUsed;
    unsigned long offsetUsed;
    unsigned long maxChangeUsed;
    unsigned long neg;
    unsigned long posDir;
    unsigned long negDir;
    unsigned long inSwEndLim;
    double swEndLim1;
    double swEndLim2;
    double factor;
    double offset;
    double maxChange;
} TRF_extProp_t;

typedef struct TRF_extLinkCoeff_t
{
    unsigned long enabled;
    unsigned long idealToCpl;
    unsigned long i;
    unsigned long j;
    double coeff;
} TRF_extLinkCoeff_t;

typedef struct TRF_extEntity_t
{
    struct TRF_extProp_t prop[12];
    struct TRF_extProp_t propCpl[12];
    struct TRF_extLinkCoeff_t link[144];
} TRF_extEntity_t;

typedef struct TRF_EXT_typ
{
    unsigned long arnc0ppUseCplJoint;
    unsigned long arnc0ppUseCplRefJoint;
    unsigned long arnc0ppUseCplPath;
    unsigned long arnc0ppUseCplRefPath;
    unsigned long arnc0ppUseCplAdd;
    unsigned long arnc0ppUseCplCtrl;
    unsigned long arnc0optmUseCplJoint;
    unsigned long arnc0optmUseCplRefJoint;
    unsigned long arnc0optmUseCplPath;
    unsigned long arnc0optmUseCplRefPath;
    unsigned long arnc0optmUseCplAdd;
    unsigned long arnc0optmUseCplCtrl;
    unsigned long arnc0bgenUseCplJoint;
    unsigned long arnc0bgenUseCplRefJoint;
    unsigned long arnc0bgenUseCplPath;
    unsigned long arnc0bgenUseCplRefPath;
    unsigned long arnc0bgenUseCplAdd;
    unsigned long arnc0bgenUseCplCtrl;
    unsigned long arnc0sgenUseIdealJoint;
    unsigned long arnc0sgenUseIdealRefJoint;
    unsigned long arnc0sgenUseIdealPath;
    unsigned long arnc0sgenUseIdealRefPath;
    unsigned long arnc0sgenUseIdealAdd;
    unsigned long arnc0sgenUseIdealCtrl;
    unsigned long oldErrorFormat;
    unsigned long reserve_align0;
    unsigned long reserve[38];
    struct TRF_extEntity_t* joint;
    struct TRF_extEntity_t* pathA;
    struct TRF_extEntity_t* addA;
    struct TRF_extEntity_t* ctrlA;
    struct TRF_extEntity_t* pathB;
    struct TRF_extEntity_t* addB;
    struct TRF_extEntity_t* ctrlB;
    struct TRF_extEntity_t* pathC;
    struct TRF_extEntity_t* addC;
    struct TRF_extEntity_t* ctrlC;
    struct TRF_extEntity_t* pathD;
    struct TRF_extEntity_t* addD;
    struct TRF_extEntity_t* ctrlD;
    unsigned long reserve_align1;
    unsigned long reserve1[18];
} TRF_EXT_typ;

typedef struct TRF_DEBUG_DATA_ELEM_typ
{
    unsigned long udint;
    double lreal;
    plcstring string[81];
} TRF_DEBUG_DATA_ELEM_typ;

typedef struct TRF_DEBUG_DATA_typ
{
    unsigned long maxCount;
    unsigned long writeIndex;
    struct TRF_DEBUG_DATA_ELEM_typ* data;
    unsigned long reserve_align0;
    unsigned long reserve[30];
} TRF_DEBUG_DATA_typ;



/* Prototyping of functions and function blocks */
unsigned long TRF_init_instance(unsigned long addr_var_name);
unsigned long TRF_generic(unsigned long addr_trf_data, unsigned long cmd_code, unsigned long in_data, unsigned long out_data, unsigned long info);
unsigned long TRF_direct(unsigned long addr_trf_data, unsigned long in_pos, unsigned long in_pos_ext, unsigned long out_pos, unsigned long info);
unsigned long TRF_direct2(unsigned long addr_trf_data, unsigned long in_pos, unsigned long in_pos_ext, unsigned long out_pos, unsigned long info);
unsigned long TRF_inverse(unsigned long addr_trf_data, unsigned long in_pos, unsigned long in_pos_ext, unsigned long out_pos, unsigned long info);
unsigned long TRF_inverse2(unsigned long addr_trf_data, unsigned long in_pos, unsigned long in_pos_ext, unsigned long out_pos, unsigned long info);
unsigned long TRF_get_joints_pos(unsigned long addr_trf_data, unsigned long in_pos, unsigned long in_pos_ext, unsigned long out_pos, unsigned long info);
unsigned long TRF_get_size(unsigned long addr_trf_data, unsigned long in_pos, unsigned long in_pos_ext, unsigned long out_pos, unsigned long info);
unsigned long TRF_get_mode(unsigned long addr_trf_data, unsigned long in_pos, unsigned long in_pos_ext, unsigned long out_pos, unsigned long info);
unsigned long TRF_direct3(unsigned long addr_trf_data, unsigned long in_pos, unsigned long in_pos_ext, unsigned long out_pos, unsigned long info);
unsigned long TRF_inverse3(unsigned long addr_trf_data, unsigned long in_pos, unsigned long in_pos_ext, unsigned long out_pos, unsigned long info);


__asm__(".section \".plc\"");

__asm__(".previous");

#ifdef __cplusplus
};
#endif
#endif /* _TRF_LIB_NONOBJECT_ */


#ifndef _TRF_LIB_OBJECT_H_INCLUDED_
#define _TRF_LIB_OBJECT_H_INCLUDED_

#ifdef __cplusplus
extern "C++" {

namespace TrfLib
{

    typedef UDINT udint_t;
    typedef LREAL lreal_t;
    typedef lreal_t* p_lreal_t;
    typedef LREAL pos_t;
    typedef LREAL coeff_t;
    typedef LREAL angle_t;
    typedef LREAL length_t;
    typedef LREAL number_t;
    typedef UDINT type_t;
    typedef UDINT name_t;
    typedef UDINT code_t;
    typedef UDINT id_t;
    typedef UDINT info_t;
    typedef UDINT status_t;
    typedef UDINT index_t;
    typedef UDINT measure_t;
    typedef UDINT anglesType_t;
    typedef UDINT directionType_t;
    typedef UDINT variant_t;
    typedef UDINT mode_t;
    typedef UDINT license_t;
    typedef UDINT property_t;
    typedef long unsigned int size_t;
    typedef struct error_t
    {
        id_t robotID;
        id_t methodID;
        status_t type;
        code_t code;
        info_t integer[4];
    } error_t;

    namespace Units
    {
        enum Enum_t
        {
            degrees = 1,
            radians = 2,
            gradians = 4,
            millimeters = 16,
            meters = 32,
            inches = 64
        };
    }
    namespace AnglesType
    {
        enum Enum_t
        {
            xyz = 1,
            xzy = 2,
            yxz = 4,
            yzx = 8,
            zxy = 16,
            zyx = 32,
            xyx = 64,
            xzx = 128,
            yxy = 256,
            yzy = 512,
            zxz = 1024,
            zyz = 2048,
            positive = 4096,
            negative = 8192,
            direct = 16384,
            indirect = 32768,
            intrinsic = 65536,
            extrinsic = 131072,

            euler = 1024,
            cardan = 1,
            nautical = 1,
            taitBryan = 1
        };
    }

    namespace DirectionType
    {
        enum Enum_t
        {
            plusX = 1,
            minusX = 9,
            plusY = 2,
            minusY = 10,
            plusZ = 4,
            minusZ = 12
        };
    }

    namespace Status
    {
        enum Enum_t
        {
            ok = 0,
            error = 1,
            warning = 2,
            info = 3
        };
    }

    namespace Mode
    {
        enum Enum_t
        {
            front = 1,
            back = 2,
            convex = 4,
            concave = 8,
            positive = 16,
            negative = 32,
            left = 64,
            right = 128,
            direct = 256,
            indirect = 512,
            convex2 = 1024,
            concave2 = 2048,
            convex3 = 4096,
            concave3 = 8192,
            heterogeneous = 16384,
            homogeneous = 32768,
            left2 = 65536,
            right2 = 131072,
            up = 262144,
            down = 524288
        };
    }
    namespace Cdc
    {
        enum Enum_t
        {
            outer = 1,
            inner = 2,
            stillPerp = 4
        };
    }
    namespace Variant
    {
        enum Enum_t
        {
            A = 0,
            B = 1,
            C = 2,
            D = 3
        };
    }
    namespace CoordType
    {
        enum Enum_t
        {
            prismatic = 1,
            revolute = 2,
            cartesianX = 3,
            cartesianY = 4,
            cartesianZ = 5,
            orientationPhi = 6,
            orientationTheta = 7,
            orientationPsi = 8,
            directionX = 9,
            directionY = 10,
            directionZ = 11,
            quaternionW = 12,
            quaternionX = 13,
            quaternionY = 14,
            quaternionZ = 15,
            angle = 16,
            rotationX = 17,
            rotationY = 18,
            rotationZ = 19
        };
    }
    namespace CoordName
    {
        enum Enum_t
        {
            A = 1,
            A1 = 2,
            A2 = 3,
            A3 = 4,
            A4 = 5,
            A5 = 6,
            A6 = 7,
            B = 8,
            B1 = 9,
            B2 = 10,
            B3 = 11,
            B4 = 12,
            B5 = 13,
            B6 = 14,
            C = 15,
            C1 = 16,
            C2 = 17,
            C3 = 18,
            C4 = 19,
            C5 = 20,
            C6 = 21,
            D = 22,
            D1 = 23,
            D2 = 24,
            D3 = 25,
            D4 = 26,
            D5 = 27,
            D6 = 28,
            E = 29,
            E1 = 30,
            E2 = 31,
            E3 = 32,
            E4 = 33,
            E5 = 34,
            E6 = 35,
            F = 36,
            F1 = 37,
            F2 = 38,
            F3 = 39,
            F4 = 40,
            F5 = 41,
            F6 = 42,
            G = 43,
            G1 = 44,
            G2 = 45,
            G3 = 46,
            G4 = 47,
            G5 = 48,
            G6 = 49,
            H = 50,
            H1 = 51,
            H2 = 52,
            H3 = 53,
            H4 = 54,
            H5 = 55,
            H6 = 56,
            I = 57,
            I1 = 58,
            I2 = 59,
            I3 = 60,
            I4 = 61,
            I5 = 62,
            I6 = 63,
            J = 64,
            J1 = 65,
            J2 = 66,
            J3 = 67,
            J4 = 68,
            J5 = 69,
            J6 = 70,
            K = 71,
            K1 = 72,
            K2 = 73,
            K3 = 74,
            K4 = 75,
            K5 = 76,
            K6 = 77,
            L = 78,
            L1 = 79,
            L2 = 80,
            L3 = 81,
            L4 = 82,
            L5 = 83,
            L6 = 84,
            M = 85,
            M1 = 86,
            M2 = 87,
            M3 = 88,
            M4 = 89,
            M5 = 90,
            M6 = 91,
            N = 92,
            N1 = 93,
            N2 = 94,
            N3 = 95,
            N4 = 96,
            N5 = 97,
            N6 = 98,
            O = 99,
            O1 = 100,
            O2 = 101,
            O3 = 102,
            O4 = 103,
            O5 = 104,
            O6 = 105,
            P = 106,
            P1 = 107,
            P2 = 108,
            P3 = 109,
            P4 = 110,
            P5 = 111,
            P6 = 112,
            Q = 113,
            Q1 = 114,
            Q2 = 115,
            Q3 = 116,
            Q4 = 117,
            Q5 = 118,
            Q6 = 119,
            R = 120,
            R1 = 121,
            R2 = 123,
            R3 = 124,
            R4 = 125,
            R5 = 126,
            R6 = 127,
            S = 128,
            S1 = 129,
            S2 = 130,
            S3 = 131,
            S4 = 132,
            S5 = 133,
            S6 = 134,
            T = 135,
            T1 = 136,
            T2 = 137,
            T3 = 138,
            T4 = 139,
            T5 = 140,
            T6 = 141,
            U = 142,
            U1 = 143,
            U2 = 144,
            U3 = 145,
            U4 = 146,
            U5 = 147,
            U6 = 148,
            V = 149,
            V1 = 150,
            V2 = 151,
            V3 = 152,
            V4 = 153,
            V5 = 154,
            V6 = 155,
            W = 156,
            W1 = 157,
            W2 = 158,
            W3 = 159,
            W4 = 160,
            W5 = 161,
            W6 = 162,
            X = 163,
            X1 = 164,
            X2 = 165,
            X3 = 166,
            X4 = 167,
            X5 = 168,
            X6 = 169,
            Y = 170,
            Y1 = 171,
            Y2 = 172,
            Y3 = 173,
            Y4 = 174,
            Y5 = 175,
            Y6 = 176,
            Z = 177,
            Z1 = 178,
            Z2 = 179,
            Z3 = 180,
            Z4 = 181,
            Z5 = 182,
            Z6 = 183,
            RTCP = 184,
            RTCP1 = 185,
            RTCP2 = 186,
            TCP_A = 201,
            TCP_A1 = 202,
            TCP_A2 = 203,
            TCP_A3 = 204,
            TCP_A4 = 205,
            TCP_A5 = 206,
            TCP_A6 = 207,
            TCP_B = 208,
            TCP_B1 = 209,
            TCP_B2 = 210,
            TCP_B3 = 211,
            TCP_B4 = 212,
            TCP_B5 = 213,
            TCP_B6 = 214,
            TCP_C = 215,
            TCP_C1 = 216,
            TCP_C2 = 217,
            TCP_C3 = 218,
            TCP_C4 = 219,
            TCP_C5 = 220,
            TCP_C6 = 221,
            TCP_D = 222,
            TCP_D1 = 223,
            TCP_D2 = 224,
            TCP_D3 = 225,
            TCP_D4 = 226,
            TCP_D5 = 227,
            TCP_D6 = 228,
            TCP_E = 229,
            TCP_E1 = 230,
            TCP_E2 = 231,
            TCP_E3 = 232,
            TCP_E4 = 233,
            TCP_E5 = 234,
            TCP_E6 = 235,
            TCP_F = 236,
            TCP_F1 = 237,
            TCP_F2 = 238,
            TCP_F3 = 239,
            TCP_F4 = 240,
            TCP_F5 = 241,
            TCP_F6 = 242,
            TCP_G = 243,
            TCP_G1 = 244,
            TCP_G2 = 245,
            TCP_G3 = 246,
            TCP_G4 = 247,
            TCP_G5 = 248,
            TCP_G6 = 249,
            TCP_H = 250,
            TCP_H1 = 251,
            TCP_H2 = 252,
            TCP_H3 = 253,
            TCP_H4 = 254,
            TCP_H5 = 255,
            TCP_H6 = 256,
            TCP_I = 257,
            TCP_I1 = 258,
            TCP_I2 = 259,
            TCP_I3 = 260,
            TCP_I4 = 261,
            TCP_I5 = 262,
            TCP_I6 = 263,
            TCP_J = 264,
            TCP_J1 = 265,
            TCP_J2 = 266,
            TCP_J3 = 267,
            TCP_J4 = 268,
            TCP_J5 = 269,
            TCP_J6 = 270,
            TCP_K = 271,
            TCP_K1 = 272,
            TCP_K2 = 273,
            TCP_K3 = 274,
            TCP_K4 = 275,
            TCP_K5 = 276,
            TCP_K6 = 277,
            TCP_L = 278,
            TCP_L1 = 279,
            TCP_L2 = 280,
            TCP_L3 = 281,
            TCP_L4 = 282,
            TCP_L5 = 283,
            TCP_L6 = 284,
            TCP_M = 285,
            TCP_M1 = 286,
            TCP_M2 = 287,
            TCP_M3 = 288,
            TCP_M4 = 289,
            TCP_M5 = 290,
            TCP_M6 = 291,
            TCP_N = 292,
            TCP_N1 = 293,
            TCP_N2 = 294,
            TCP_N3 = 295,
            TCP_N4 = 296,
            TCP_N5 = 297,
            TCP_N6 = 298,
            TCP_O = 299,
            TCP_O1 = 300,
            TCP_O2 = 301,
            TCP_O3 = 302,
            TCP_O4 = 303,
            TCP_O5 = 304,
            TCP_O6 = 305,
            TCP_P = 306,
            TCP_P1 = 307,
            TCP_P2 = 308,
            TCP_P3 = 309,
            TCP_P4 = 310,
            TCP_P5 = 311,
            TCP_P6 = 312,
            TCP_Q = 313,
            TCP_Q1 = 314,
            TCP_Q2 = 315,
            TCP_Q3 = 316,
            TCP_Q4 = 317,
            TCP_Q5 = 318,
            TCP_Q6 = 319,
            TCP_R = 320,
            TCP_R1 = 321,
            TCP_R2 = 323,
            TCP_R3 = 324,
            TCP_R4 = 325,
            TCP_R5 = 326,
            TCP_R6 = 327,
            TCP_S = 328,
            TCP_S1 = 329,
            TCP_S2 = 330,
            TCP_S3 = 331,
            TCP_S4 = 332,
            TCP_S5 = 333,
            TCP_S6 = 334,
            TCP_T = 335,
            TCP_T1 = 336,
            TCP_T2 = 337,
            TCP_T3 = 338,
            TCP_T4 = 339,
            TCP_T5 = 340,
            TCP_T6 = 341,
            TCP_U = 342,
            TCP_U1 = 343,
            TCP_U2 = 344,
            TCP_U3 = 345,
            TCP_U4 = 346,
            TCP_U5 = 347,
            TCP_U6 = 348,
            TCP_V = 349,
            TCP_V1 = 350,
            TCP_V2 = 351,
            TCP_V3 = 352,
            TCP_V4 = 353,
            TCP_V5 = 354,
            TCP_V6 = 355,
            TCP_W = 356,
            TCP_W1 = 357,
            TCP_W2 = 358,
            TCP_W3 = 359,
            TCP_W4 = 360,
            TCP_W5 = 361,
            TCP_W6 = 362,
            TCP_X = 363,
            TCP_X1 = 364,
            TCP_X2 = 365,
            TCP_X3 = 366,
            TCP_X4 = 367,
            TCP_X5 = 368,
            TCP_X6 = 369,
            TCP_Y = 370,
            TCP_Y1 = 371,
            TCP_Y2 = 372,
            TCP_Y3 = 373,
            TCP_Y4 = 374,
            TCP_Y5 = 375,
            TCP_Y6 = 376,
            TCP_Z = 377,
            TCP_Z1 = 378,
            TCP_Z2 = 379,
            TCP_Z3 = 380,
            TCP_Z4 = 381,
            TCP_Z5 = 382,
            TCP_Z6 = 383,
            TCP_PHI = 384,
            TCP_THETA = 385,
            TCP_PSI = 386,
            DIRECTION_X = 387,
            DIRECTION_Y = 388,
            DIRECTION_Z = 389,
            LEAD = 390,
            TAPER = 391,
            TCP_RX = 392,
            TCP_RZ = 393,
            TCP_ALPHA = 394,
            CDC_ANGLE = 395,
            TANG_AXIS = 396,
            TCP_QW = 400,
            TCP_QX = 401,
            TCP_QY = 402,
            TCP_QZ = 403
        };
    }
    namespace EntityID
    {
        enum Enum_t
        {
            joint = 1,
            pathA = 10,
            addA = 11,
            ctrlA = 12,
            pathB = 20,
            addB = 21,
            ctrlB = 22,
            pathC = 30,
            addC = 31,
            ctrlC = 32,
            pathD = 40,
            addD = 41,
            ctrlD = 42
        };
    }
    namespace MethodID
    {
        enum Enum_t
        {
            direct = 20,
            inverse = 21,
            getJointsPos = 22,
            getSize = 23,
            getMode = 24,
            getJacobian = 25,
            getGeneralJacobian = 26,
            getJointPosX = 30,
            getJointPosY = 31,
            getJointPosZ = 32,
            getSizeX = 35,
            getSizeY = 36,
            getSizeZ = 37,
            getJacobianCoeff = 40,
            getGeneralJacobianCoeff = 41,
            setMech = 50,
            getMech = 55,
            setMechFrame = 60,
            getMechFrame = 61,
            disMechFrame = 62,
            getJointCount = 100,
            getPathCount = 101,
            getAddCount = 102,
            getCtrlCount = 103,
            getJointType = 110,
            getPathType = 111,
            getAddType = 112,
            getCtrlType = 113,
            getJointName = 120,
            getPathName = 121,
            getAddName = 122,
            getCtrlName = 123,
            setJointCoord = 160,
            setPathCoord = 161,
            setAddCoord = 162,
            setCtrlCoord = 163,
            setCplJointCoord = 170,
            setCplPathCoord = 171,
            setCplAddCoord = 172,
            setCplCtrlCoord = 173,
            getJointCoord = 180,
            getPathCoord = 181,
            getAddCoord = 182,
            getCtrlCoord = 183,
            getCplJointCoord = 190,
            getCplPathCoord = 191,
            getCplAddCoord = 192,
            getCplCtrlCoord = 193,
            setJointRefCoord = 200,
            setPathRefCoord = 201,
            setCplJointRefCoord = 210,
            setCplPathRefCoord = 211,
            getJointRefCoord = 220,
            getPathRefCoord = 221,
            getCplJointRefCoord = 230,
            getCplPathRefCoord = 231,
            setJointIdealToCplCoeff = 240,
            setPathIdealToCplCoeff = 241,
            setAddIdealToCplCoeff = 242,
            setCtrlIdealToCplCoeff = 243,
            setJointCplToIdealCoeff = 250,
            setPathCplToIdealCoeff = 251,
            setAddCplToIdealCoeff = 252,
            setCtrlCplToIdealCoeff = 253,
            getJointIdealToCplCoeff = 260,
            getPathIdealToCplCoeff = 261,
            getAddIdealToCplCoeff = 262,
            getCtrlIdealToCplCoeff = 263,
            getJointCplToIdealCoeff = 270,
            getPathCplToIdealCoeff = 271,
            getAddCplToIdealCoeff = 272,
            getCtrlCplToIdealCoeff = 273,
            disJointCoupling = 280,
            disPathCoupling = 281,
            disAddCoupling = 282,
            disCtrlCoupling = 283,
            getJointPositionCount = 310,
            getRobotID = 320,
            checkLicense = 331,
            isLicensed = 332,
            setEpsilon = 340,
            getEpsilon = 341,
            setBaseFrame = 351,
            setBaseFrameDx = 352,
            setBaseFrameDy = 353,
            setBaseFrameDz = 354,
            setBaseFramePhi = 355,
            setBaseFrameTheta = 356,
            setBaseFramePsi = 357,
            setBaseFrameAnglesType = 358,
            disBaseFrame = 359,
            getBaseFrameDx = 372,
            getBaseFrameDy = 373,
            getBaseFrameDz = 374,
            getBaseFramePhi = 375,
            getBaseFrameTheta = 376,
            getBaseFramePsi = 377,
            getBaseFrameAnglesType = 378,
            setTool = 391,
            setToolDx = 392,
            setToolDy = 393,
            setToolDz = 394,
            setToolPhi = 395,
            setToolTheta = 396,
            setToolPsi = 397,
            setToolAnglesType = 398,
            disTool = 399,
            getToolDx = 412,
            getToolDy = 413,
            getToolDz = 414,
            getToolPhi = 415,
            getToolTheta = 416,
            getToolPsi = 417,
            getToolAnglesType = 418,
            setForcedMode = 432,
            getForcedMode = 436,
            setCDCRadius = 441,
            setCDCProperty = 442,
            disCDC = 443,
            getCDCRadius = 451,
            getCDCProperty = 452,
            switchVariant = 470,
            getVariant = 471,
            angle2Angle = 500,
            anglesType2AnglesType = 501,
            directionVectorX = 502,
            directionVectorY = 503,
            directionVectorZ = 504,
            frameSum = 505,
            frameDifference = 506,
            createRotationMatrix = 507,
            decomposeRotationMatrix = 508,
            cuboidCalibration2D = 509,
            cuboidCalibration3D_A = 510,
            cuboidCalibration3D_B = 511,
            getVersion = 512,
            rotationMatrixToQuaternion = 514,
            quaternionToRotationMatrix = 515,
            quaternionNLERP = 516,
            quaternionSLERP = 517,
            quaternionDeCasteljauCubic = 518,
            quaternionRoundEdgeCubic = 519,
            quaternionRoundEdgeQuartic = 520,
            eulerToQuaternion = 521,
            quaternionToEuler = 522,
            setJointSwEndLim = 600,
            setPathSwEndLim = 601,
            setAddSwEndLim = 602,
            setCtrlSwEndLim = 603,
            setCplJointSwEndLim = 610,
            setCplPathSwEndLim = 611,
            setCplAddSwEndLim = 612,
            setCplCtrlSwEndLim = 613,
            setJointFactor = 620,
            setPathFactor = 621,
            setAddFactor = 622,
            setCtrlFactor = 623,
            setCplJointFactor = 630,
            setCplPathFactor = 631,
            setCplAddFactor = 632,
            setCplCtrlFactor = 633,
            setJointOffset = 640,
            setPathOffset = 641,
            setAddOffset = 642,
            setCtrlOffset = 643,
            setCplJointOffset = 650,
            setCplPathOffset = 651,
            setCplAddOffset = 652,
            setCplCtrlOffset = 653,
            setJointMaxChange = 660,
            setPathMaxChange = 661,
            setAddMaxChange = 662,
            setCtrlMaxChange = 663,
            setCplJointMaxChange = 674,
            setCplPathMaxChange = 675,
            setCplAddMaxChange = 676,
            setCplCtrlMaxChange = 677,
            disJointSwEndLim = 690,
            disPathSwEndLim = 691,
            disAddSwEndLim = 692,
            disCtrlSwEndLim = 693,
            disCplJointSwEndLim = 700,
            disCplPathSwEndLim = 701,
            disCplAddSwEndLim = 702,
            disCplCtrlSwEndLim = 703,
            disJointFactor = 710,
            disPathFactor = 711,
            disAddFactor = 712,
            disCtrlFactor = 713,
            disCplJointFactor = 720,
            disCplPathFactor = 721,
            disCplAddFactor = 722,
            disCplCtrlFactor = 723,
            disJointOffset = 730,
            disPathOffset = 731,
            disAddOffset = 732,
            disCtrlOffset = 733,
            disCplJointOffset = 740,
            disCplPathOffset = 741,
            disCplAddOffset = 742,
            disCplCtrlOffset = 743,
            disJointMaxChange = 750,
            disPathMaxChange = 751,
            disAddMaxChange = 752,
            disCtrlMaxChange = 753,
            disCplJointMaxChange = 760,
            disCplPathMaxChange = 761,
            disCplAddMaxChange = 762,
            disCplCtrlMaxChange = 763,
            setJointNeg = 770,
            setPathNeg = 771,
            setAddNeg = 772,
            setCtrlNeg = 773,
            setCplJointNeg = 780,
            setCplPathNeg = 781,
            setCplAddNeg = 782,
            setCplCtrlNeg = 783,
            setJointInSwEndLim = 810,
            setPathInSwEndLim = 811,
            setAddInSwEndLim = 812,
            setCtrlInSwEndLim = 813,
            setCplJointInSwEndLim = 820,
            setCplPathInSwEndLim = 821,
            setCplAddInSwEndLim = 822,
            setCplCtrlInSwEndLim = 823,
            setJointPosDir = 850,
            setPathPosDir = 851,
            setAddPosDir = 852,
            setCtrlPosDir = 853,
            setCplJointPosDir = 860,
            setCplPathPosDir = 861,
            setCplAddPosDir = 862,
            setCplCtrlPosDir = 863,
            setJointNegDir = 890,
            setPathNegDir = 891,
            setAddNegDir = 892,
            setCtrlNegDir = 893,
            setCplJointNegDir = 900,
            setCplPathNegDir = 901,
            setCplAddNegDir = 902,
            setCplCtrlNegDir = 903,
            getJointSwEndLim1 = 930,
            getPathSwEndLim1 = 931,
            getAddSwEndLim1 = 932,
            getCtrlSwEndLim1 = 933,
            getCplJointSwEndLim1 = 940,
            getCplPathSwEndLim1 = 941,
            getCplAddSwEndLim1 = 942,
            getCplCtrlSwEndLim1 = 943,
            getJointSwEndLim2 = 950,
            getPathSwEndLim2 = 951,
            getAddSwEndLim2 = 952,
            getCtrlSwEndLim2 = 953,
            getCplJointSwEndLim2 = 960,
            getCplPathSwEndLim2 = 961,
            getCplAddSwEndLim2 = 962,
            getCplCtrlSwEndLim2 = 963,
            getJointFactor = 970,
            getPathFactor = 971,
            getAddFactor = 972,
            getCtrlFactor = 973,
            getCplJointFactor = 980,
            getCplPathFactor = 981,
            getCplAddFactor = 982,
            getCplCtrlFactor = 983,
            getJointOffset = 990,
            getPathOffset = 991,
            getAddOffset = 992,
            getCtrlOffset = 993,
            getCplJointOffset = 1000,
            getCplPathOffset = 1001,
            getCplAddOffset = 1002,
            getCplCtrlOffset = 1003,
            getJointMaxChange = 1010,
            getPathMaxChange = 1011,
            getAddMaxChange = 1012,
            getCtrlMaxChange = 1013,
            getCplJointMaxChange = 1020,
            getCplPathMaxChange = 1021,
            getCplAddMaxChange = 1022,
            getCplCtrlMaxChange = 1023,
            isJointNeg = 1110,
            isPathNeg = 1111,
            isAddNeg = 1112,
            isCtrlNeg = 1113,
            isCplJointNeg = 1120,
            isCplPathNeg = 1121,
            isCplAddNeg = 1122,
            isCplCtrlNeg = 1123,
            isJointInSwEndLim = 1130,
            isPathInSwEndLim = 1131,
            isAddInSwEndLim = 1132,
            isCtrlInSwEndLim = 1133,
            isCplJointInSwEndLim = 1140,
            isCplPathInSwEndLim = 1141,
            isCplAddInSwEndLim = 1142,
            isCplCtrlInSwEndLim = 1143,
            isJointPosDir = 1150,
            isPathPosDir = 1151,
            isAddPosDir = 1152,
            isCtrlPosDir = 1153,
            isCplJointPosDir = 1160,
            isCplPathPosDir = 1161,
            isCplAddPosDir = 1162,
            isCplCtrlPosDir = 1163,
            isJointNegDir = 1170,
            isPathNegDir = 1171,
            isAddNegDir = 1172,
            isCtrlNegDir = 1173,
            isCplJointNegDir = 1180,
            isCplPathNegDir = 1181,
            isCplAddNegDir = 1182,
            isCplCtrlNegDir = 1183,
            setMeasure = 1230,
            getMeasure = 1231,
            setJointCoords = 1240,
            setPathCoords = 1241,
            setAddCoords = 1242,
            setCtrlCoords = 1243,
            setCplJointCoords = 1250,
            setCplPathCoords = 1251,
            setCplAddCoords = 1252,
            setCplCtrlCoords = 1253,
            getJointCoords = 1260,
            getPathCoords = 1261,
            getAddCoords = 1262,
            getCtrlCoords = 1263,
            getCplJointCoords = 1270,
            getCplPathCoords = 1271,
            getCplAddCoords = 1272,
            getCplCtrlCoords = 1273,
            setJointRefCoords = 1280,
            setPathRefCoords = 1281,
            setCplJointRefCoords = 1290,
            setCplPathRefCoords = 1291,
            getJointRefCoords = 1300,
            getPathRefCoords = 1301,
            getCplJointRefCoords = 1310,
            getCplPathRefCoords = 1311,
            clone = 1320,
            getAnglesType = 1325,
            getTcpPosition = 1326,
            getTcpQuaternion = 1327,
            setTcpPosition = 1328,
            setTcpQuaternion = 1329,
            isDualUseCompliant = 1340,
            getDirectionType = 1341,
            setMechAnglesType = 1345,
            getMechAnglesType = 1346,
            setMechDirectionType = 1347,
            getMechDirectionType = 1348,
            setMechFrameBCAnglesType = 1349,
            getMechFrameBCAnglesType = 1350,
            setMechFrameCBAnglesType = 1351,
            getMechFrameCBAnglesType = 1352,
            setMechFrameABAnglesType = 1353,
            getMechFrameABAnglesType = 1354,
            setMechFrameBAAnglesType = 1355,
            getMechFrameBAAnglesType = 1356,
            setMechFrameCAAnglesType = 1357,
            getMechFrameCAAnglesType = 1358,
            setMechFrameACAnglesType = 1359,
            getMechFrameACAnglesType = 1360,
            setMechRTCP_anglesType = 1361,
            getMechRTCP_anglesType = 1362,
            setMechT_anglesType = 1363,
            getMechT_anglesType = 1364,
            setMechFrameRTCPAnglesType = 1365,
            getMechFrameRTCPAnglesType = 1366,
            setMechFrameA0AnglesType = 1367,
            getMechFrameA0AnglesType = 1368
        };
    }

    static const status_t statusOk = 0;
    static const status_t statusWarning = 1;
    static const status_t statusError = 2;
    static const status_t statusInfo = 4;
    static const status_t statusErrorInvalidDirectionType = statusError | 1 << 4;
    static const status_t statusOkTheSameCoord = statusOk | 1 << 4;
    static const status_t statusWarningInvalidFactor = statusWarning | 1 << 4;
    static const status_t statusWarningInvalidMaxChange = statusWarning | 2 << 4;
    static const status_t statusErrorInvalidLinkMatrices = statusError | 1 << 4;
    static const status_t statusErrorCoordMaxChange = statusError | 2 << 4;
    static const status_t statusErrorCoordSwEndLim1 = statusError | 3 << 4;
    static const status_t statusErrorCoordSwEndLim2 = statusError | 4 << 4;
    static const status_t statusWarningInvalidEpsilon = statusWarning | 1 << 4;
    static const status_t statusOkTheSameValue = statusOk | 1 << 4;
    static const status_t statusErrorInvalidAnglesType = statusError | 1 << 4;
    static const status_t statusErrorInvalidMeasure = statusError | 1 << 4;
    static const status_t statusErrorInvalidVariant = statusError | 1 << 4;
    const unsigned long maximalDimension = 12;

    class CAnglesType
    {
    private:
        anglesType_t AnglesType;
    public:
        CAnglesType();
        status_t set(anglesType_t anglesType);
        anglesType_t get() const;
    };

    class CFrame
    {
    private:
        length_t dx;
        length_t dy;
        length_t dz;
        angle_t phi;
        angle_t theta;
        angle_t psi;
        CAnglesType anglesType;
        bool usedPosition;
        bool usedOrientation;
        status_t setDefaultFrame();
        status_t translateStatusFromCAnglesType(status_t status);
    public:
        CFrame();
        status_t set(p_lreal_t buffer);
        status_t setDx(length_t dx_);
        status_t setDy(length_t dy_);
        status_t setDz(length_t dz_);
        status_t setPhi(angle_t phi_);
        status_t setTheta(angle_t theta_);
        status_t setPsi(angle_t psi_);
        status_t setAnglesType(anglesType_t anglesType_);
        length_t getDx() const;
        length_t getDy() const;
        length_t getDz() const;
        angle_t getPhi() const;
        angle_t getTheta() const;
        angle_t getPsi() const;
        anglesType_t getAnglesType() const;
        status_t disable();
        status_t add(p_lreal_t position, p_lreal_t orientation) const;
        status_t subtract(p_lreal_t position, p_lreal_t orientation) const;
        status_t goTo(p_lreal_t position, p_lreal_t orientation, p_lreal_t vector) const;
        status_t goFrom(p_lreal_t position, p_lreal_t orientation, p_lreal_t vector) const;
        status_t add_Z(p_lreal_t position, p_lreal_t orientationComponent) const;
        status_t subtract_Z(p_lreal_t position, p_lreal_t orientationComponent) const;
        status_t goTo_Z(p_lreal_t position, p_lreal_t orientationComponent) const;
        status_t goFrom_Z(p_lreal_t position, p_lreal_t orientationComponent) const;
        status_t add_Z_onlyPosition(p_lreal_t position, lreal_t orientationComponent) const;
        status_t subtract_Z_onlyPosition(p_lreal_t position, lreal_t orientationComponent) const;
    };

    typedef struct inAngle2Angle_t
    {
        angle_t angle;
        measure_t measure1;
        measure_t measure2;
        lreal_t epsilon;
    } inAngle2Angle_t;
    typedef struct outAngle2Angle_t
    {
        angle_t angle;
    } outAngle2Angle_t;
    typedef struct inAnglesType2AnglesType_t
    {
        angle_t phi;
        angle_t theta;
        angle_t psi;
        measure_t measure;
        lreal_t epsilon;
        anglesType_t anglesType1;
        anglesType_t anglesType2;
        angle_t refPhi;
        angle_t refTheta;
        angle_t refPsi;
    } inAnglesType2AnglesType_t;
    typedef struct outAnglesType2AnglesType_t
    {
        angle_t phi;
        angle_t theta;
        angle_t psi;
    } outAnglesType2AnglesType_t;
    typedef struct inDirectionVector_t
    {
        angle_t phi;
        angle_t theta;
        angle_t psi;
        anglesType_t anglesType;
        measure_t measure;
        lreal_t epsilon;
        lreal_t length;
    } inDirectionVector_t;
    typedef struct outDirectionVector_t
    {
        lreal_t dx;
        lreal_t dy;
        lreal_t dz;
    } outDirectionVector_t;
    typedef struct inFrameSum_t
    {
        CFrame P1;
        CFrame dP;
        measure_t measure;
        lreal_t epsilon;
        angle_t refPhi;
        angle_t refTheta;
        angle_t refPsi;
        anglesType_t anglesType;
    } inFrameSum_t;
    typedef struct outFrameSum_t
    {
        CFrame P2;
    } outFrameSum_t;
    typedef struct inFrameDiff_t
    {
        CFrame P1;
        CFrame P2;
        measure_t measure;
        lreal_t epsilon;
        angle_t refPhi;
        angle_t refTheta;
        angle_t refPsi;
        anglesType_t anglesType;
    } inFrameDiff_t;
    typedef struct outFrameDiff_t
    {
        CFrame dP;
    } outFrameDiff_t;
    typedef struct inCreateRotMatrix_t
    {
        angle_t phi;
        angle_t theta;
        angle_t psi;
        anglesType_t anglesType;
        measure_t measure;
        lreal_t epsilon;
    } inCreateRotMatrix_t;
    typedef struct outCreateRotMatrix_t
    {
        lreal_t m11;
        lreal_t m12;
        lreal_t m13;
        lreal_t m21;
        lreal_t m22;
        lreal_t m23;
        lreal_t m31;
        lreal_t m32;
        lreal_t m33;
    } outCreateRotMatrix_t;
    typedef struct inDecomposeRotMatrix_t
    {
        lreal_t m11;
        lreal_t m12;
        lreal_t m13;
        lreal_t m21;
        lreal_t m22;
        lreal_t m23;
        lreal_t m31;
        lreal_t m32;
        lreal_t m33;
        measure_t measure;
        lreal_t epsilon;
        angle_t refPhi;
        angle_t refTheta;
        angle_t refPsi;
        anglesType_t anglesType;
    } inDecomposeRotMatrix_t;
    typedef struct outDecomposeRotMatrix_t
    {
        angle_t phi;
        angle_t theta;
        angle_t psi;
    } outDecomposeRotMatrix_t;
    typedef struct inCubCalibration2D_t
    {
        lreal_t P1x;
        lreal_t P1y;
        lreal_t P1z;
        lreal_t P2x;
        lreal_t P2y;
        lreal_t P2z;
        lreal_t P3x;
        lreal_t P3y;
        lreal_t P3z;
        lreal_t P4x;
        lreal_t P4y;
        lreal_t P4z;
        lreal_t xOffset;
        lreal_t yOffset;
        lreal_t zOffset;
        measure_t measure;
        lreal_t epsilon;
    } inCubCalibration2D_t;
    typedef struct outCubCalibration2D_t
    {
        lreal_t Ox;
        lreal_t Oy;
        lreal_t Oz;
        lreal_t alpha;
        lreal_t xDim;
        lreal_t yDim;
        lreal_t zDim;
    } outCubCalibration2D_t;
    typedef struct inCubCalibration3DA_t
    {
        lreal_t P1x;
        lreal_t P1y;
        lreal_t P1z;
        lreal_t P2x;
        lreal_t P2y;
        lreal_t P2z;
        lreal_t P3x;
        lreal_t P3y;
        lreal_t P3z;
        lreal_t P4x;
        lreal_t P4y;
        lreal_t P4z;
        lreal_t P5x;
        lreal_t P5y;
        lreal_t P5z;
        lreal_t P6x;
        lreal_t P6y;
        lreal_t P6z;
        lreal_t xOffset;
        lreal_t yOffset;
        lreal_t zOffset;
        measure_t measure;
        lreal_t epsilon;
        angle_t refPhi;
        angle_t refTheta;
        angle_t refPsi;
        anglesType_t anglesType;
    } inCubCalibration3DA_t;
    typedef struct outCubCalibration3DA_t
    {
        lreal_t Ox;
        lreal_t Oy;
        lreal_t Oz;
        angle_t phi;
        angle_t theta;
        angle_t psi;
        lreal_t xDim;
        lreal_t yDim;
        lreal_t zDim;
    } outCubCalibration3DA_t;
    typedef struct inCubCalibration3DB_t
    {
        lreal_t P1x;
        lreal_t P1y;
        lreal_t P1z;
        lreal_t P2x;
        lreal_t P2y;
        lreal_t P2z;
        lreal_t P3x;
        lreal_t P3y;
        lreal_t P3z;
        lreal_t P4x;
        lreal_t P4y;
        lreal_t P4z;
        lreal_t P5x;
        lreal_t P5y;
        lreal_t P5z;
        lreal_t P6x;
        lreal_t P6y;
        lreal_t P6z;
        lreal_t xOffset;
        lreal_t yOffset;
        lreal_t zOffset;
        measure_t measure;
        lreal_t epsilon;
        udint_t secondSolution;
        angle_t refPhi;
        angle_t refTheta;
        angle_t refPsi;
        anglesType_t anglesType;
    } inCubCalibration3DB_t;
    typedef struct outCubCalibration3DB_t
    {
        lreal_t Ox;
        lreal_t Oy;
        lreal_t Oz;
        angle_t phi;
        angle_t theta;
        angle_t psi;
        lreal_t xDim;
        lreal_t yDim;
        lreal_t zDim;
    } outCubCalibration3DB_t;
    typedef struct outGetVersion_t
    {
        udint_t version;
    } outGetVersion_t;
    typedef struct inMatrixToQuaternion_t
    {
        lreal_t m11;
        lreal_t m12;
        lreal_t m13;
        lreal_t m21;
        lreal_t m22;
        lreal_t m23;
        lreal_t m31;
        lreal_t m32;
        lreal_t m33;
        lreal_t epsilon;
    } inMatrixToQuaternion_t;
    typedef struct outMatrixToQuaternion_t
    {
        lreal_t qw;
        lreal_t qx;
        lreal_t qy;
        lreal_t qz;
    } outMatrixToQuaternion_t;
    typedef struct inQuaternionToMatrix_t
    {
        lreal_t qw;
        lreal_t qx;
        lreal_t qy;
        lreal_t qz;
        lreal_t epsilon;
    } inQuaternionToMatrix_t;
    typedef struct outQuaternionToMatrix_t
    {
        lreal_t m11;
        lreal_t m12;
        lreal_t m13;
        lreal_t m21;
        lreal_t m22;
        lreal_t m23;
        lreal_t m31;
        lreal_t m32;
        lreal_t m33;
    } outQuaternionToMatrix_t;
    typedef struct inQuaternionInterpolation_t
    {
        lreal_t qaw;
        lreal_t qax;
        lreal_t qay;
        lreal_t qaz;
        lreal_t qbw;
        lreal_t qbx;
        lreal_t qby;
        lreal_t qbz;
        lreal_t epsilon;
        lreal_t sigma;
        udint_t longerArc;
    } inQuaternionInterpolation_t;
    typedef struct outQuaternionInterpolation_t
    {
        lreal_t qw;
        lreal_t qx;
        lreal_t qy;
        lreal_t qz;
    } outQuaternionInterpolation_t;
    typedef struct inDeCasteljauCubic_t
    {
        lreal_t qaw;
        lreal_t qax;
        lreal_t qay;
        lreal_t qaz;
        lreal_t qbw;
        lreal_t qbx;
        lreal_t qby;
        lreal_t qbz;
        lreal_t qcw;
        lreal_t qcx;
        lreal_t qcy;
        lreal_t qcz;
        lreal_t qdw;
        lreal_t qdx;
        lreal_t qdy;
        lreal_t qdz;
        lreal_t epsilon;
        lreal_t sigma;
        udint_t longerArc;
    } inDeCasteljauCubic_t;
    typedef struct outDeCasteljauCubic_t
    {
        lreal_t qw;
        lreal_t qx;
        lreal_t qy;
        lreal_t qz;
    } outDeCasteljauCubic_t;
    typedef struct inRoundEdge_t
    {
        lreal_t qaw;
        lreal_t qax;
        lreal_t qay;
        lreal_t qaz;
        lreal_t qbw;
        lreal_t qbx;
        lreal_t qby;
        lreal_t qbz;
        lreal_t qiw;
        lreal_t qix;
        lreal_t qiy;
        lreal_t qiz;
        lreal_t epsilon;
        lreal_t sigma;
        udint_t longerArc;
    } inRoundEdge_t;
    typedef struct outRoundEdge_t
    {
        lreal_t qw;
        lreal_t qx;
        lreal_t qy;
        lreal_t qz;
    } outRoundEdge_t;
    typedef struct inEulerToQuaternion_t
    {
        angle_t phi;
        angle_t theta;
        angle_t psi;
        anglesType_t anglesType;
        measure_t measure;
        lreal_t epsilon;
    } inEulerToQuaternion_t;
    typedef struct outEulerToQuaternion_t
    {
        lreal_t qw;
        lreal_t qx;
        lreal_t qy;
        lreal_t qz;
    } outEulerToQuaternion_t;
    typedef struct inQuaternionToEuler_t
    {
        lreal_t qw;
        lreal_t qx;
        lreal_t qy;
        lreal_t qz;
        measure_t measure;
        lreal_t epsilon;
        angle_t refPhi;
        angle_t refTheta;
        angle_t refPsi;
        anglesType_t anglesType;
    } inQuaternionToEuler_t;
    typedef struct outQuaternionToEuler_t
    {
        angle_t phi;
        angle_t theta;
        angle_t psi;
    } outQuaternionToEuler_t;

    class CRobot
    {
    protected:
        CRobot();
    public:
        virtual ~CRobot();
    public:
        const error_t& lastCall();
    protected:
        virtual const error_t& lastCallImpl() = 0;
    public:
        CRobot* clone();
    protected:
        virtual CRobot* cloneImpl();
    public:
        anglesType_t getAnglesType();
    protected:
        virtual anglesType_t getAnglesTypeImpl();
    public:
        directionType_t getDirectionType();
    protected:
        virtual directionType_t getDirectionTypeImpl();
    public:
        bool isLicensed();
    protected:
        virtual bool isLicensedImpl();
    public:
        bool isDualUseCompliant();
        void* operator new(size_t size);
        void operator delete(void* ptr, size_t size);
    protected:
        udint_t pDebugData;
    public:
        void installDebugData(udint_t pDebugData_);
    public:
        index_t checkLicense ();
    protected:
        virtual index_t checkLicenseImpl ();
    public:
        void angle2Angle (inAngle2Angle_t* in, outAngle2Angle_t* out);
    protected:
        virtual void angle2AngleImpl (inAngle2Angle_t* in, outAngle2Angle_t* out);
    public:
        void anglesType2AnglesType (inAnglesType2AnglesType_t* in, outAnglesType2AnglesType_t* out);
    protected:
        virtual void anglesType2AnglesTypeImpl (inAnglesType2AnglesType_t* in, outAnglesType2AnglesType_t* out);
    public:
        void directionVectorX (inDirectionVector_t* in, outDirectionVector_t* out);
    protected:
        virtual void directionVectorXImpl (inDirectionVector_t* in, outDirectionVector_t* out);
    public:
        void directionVectorY (inDirectionVector_t* in, outDirectionVector_t* out);
    protected:
        virtual void directionVectorYImpl (inDirectionVector_t* in, outDirectionVector_t* out);
    public:
        void directionVectorZ (inDirectionVector_t* in, outDirectionVector_t* out);
    protected:
        virtual void directionVectorZImpl (inDirectionVector_t* in, outDirectionVector_t* out);
    public:
        void frameSum (inFrameSum_t* in, outFrameSum_t* out);
    protected:
        virtual void frameSumImpl (inFrameSum_t* in, outFrameSum_t* out);
    public:
        void frameDifference (inFrameDiff_t* in, outFrameDiff_t* out);
    protected:
        virtual void frameDifferenceImpl (inFrameDiff_t* in, outFrameDiff_t* out);
    public:
        void createRotationMatrix (inCreateRotMatrix_t* in, outCreateRotMatrix_t* out);
    protected:
        virtual void createRotationMatrixImpl (inCreateRotMatrix_t* in, outCreateRotMatrix_t* out);
    public:
        void decomposeRotationMatrix (inDecomposeRotMatrix_t* in, outDecomposeRotMatrix_t* out);
    protected:
        virtual void decomposeRotationMatrixImpl (inDecomposeRotMatrix_t* in, outDecomposeRotMatrix_t* out);
    public:
        void cuboidCalibration2D (inCubCalibration2D_t* in, outCubCalibration2D_t* out);
    protected:
        virtual void cuboidCalibration2DImpl (inCubCalibration2D_t* in, outCubCalibration2D_t* out);
    public:
        void cuboidCalibration3D_A (inCubCalibration3DA_t* in, outCubCalibration3DA_t* out);
    protected:
        virtual void cuboidCalibration3D_AImpl (inCubCalibration3DA_t* in, outCubCalibration3DA_t* out);
    public:
        void cuboidCalibration3D_B (inCubCalibration3DB_t* in, outCubCalibration3DB_t* out);
    protected:
        virtual void cuboidCalibration3D_BImpl (inCubCalibration3DB_t* in, outCubCalibration3DB_t* out);
    public:
        void getVersion (outGetVersion_t* out);
    protected:
        virtual void getVersionImpl (outGetVersion_t* out);
    public:
        void rotationMatrixToQuaternion (inMatrixToQuaternion_t* in, outMatrixToQuaternion_t* out);
    protected:
        virtual void rotationMatrixToQuaternionImpl (inMatrixToQuaternion_t* in, outMatrixToQuaternion_t* out);
    public:
        void quaternionToRotationMatrix (inQuaternionToMatrix_t* in, outQuaternionToMatrix_t* out);
    protected:
        virtual void quaternionToRotationMatrixImpl (inQuaternionToMatrix_t* in, outQuaternionToMatrix_t* out);
    public:
        void quaternionNLERP (inQuaternionInterpolation_t* in, outQuaternionInterpolation_t* out);
    protected:
        virtual void quaternionNLERPImpl (inQuaternionInterpolation_t* in, outQuaternionInterpolation_t* out);
    public:
        void quaternionSLERP (inQuaternionInterpolation_t* in, outQuaternionInterpolation_t* out);
    protected:
        virtual void quaternionSLERPImpl (inQuaternionInterpolation_t* in, outQuaternionInterpolation_t* out);
    public:
        void quaternionDeCasteljauCubic (inDeCasteljauCubic_t* in, outDeCasteljauCubic_t* out);
    protected:
        virtual void quaternionDeCasteljauCubicImpl (inDeCasteljauCubic_t* in, outDeCasteljauCubic_t* out);
    public:
        void quaternionRoundEdgeCubic (inRoundEdge_t* in, outRoundEdge_t* out);
    protected:
        virtual void quaternionRoundEdgeCubicImpl (inRoundEdge_t* in, outRoundEdge_t* out);
    public:
        void quaternionRoundEdgeQuartic (inRoundEdge_t* in, outRoundEdge_t* out);
    protected:
        virtual void quaternionRoundEdgeQuarticImpl (inRoundEdge_t* in, outRoundEdge_t* out);
    public:
        void eulerToQuaternion (inEulerToQuaternion_t* in, outEulerToQuaternion_t* out);
    protected:
        virtual void eulerToQuaternionImpl (inEulerToQuaternion_t* in, outEulerToQuaternion_t* out);
    public:
        void quaternionToEuler (inQuaternionToEuler_t* in, outQuaternionToEuler_t* out);
    protected:
        virtual void quaternionToEulerImpl (inQuaternionToEuler_t* in, outQuaternionToEuler_t* out);
    public:
        static bool Angle2Angle (inAngle2Angle_t* in, outAngle2Angle_t* out, status_t* status = 0, code_t* errorCode = 0);
    public:
        static bool AnglesType2AnglesType (inAnglesType2AnglesType_t* in, outAnglesType2AnglesType_t* out, status_t* status = 0, code_t* errorCode = 0);
    public:
        static bool DirectionVectorX (inDirectionVector_t* in, outDirectionVector_t* out, status_t* status = 0, code_t* errorCode = 0);
    public:
        static bool DirectionVectorY (inDirectionVector_t* in, outDirectionVector_t* out, status_t* status = 0, code_t* errorCode = 0);
    public:
        static bool DirectionVectorZ (inDirectionVector_t* in, outDirectionVector_t* out, status_t* status = 0, code_t* errorCode = 0);
    public:
        static bool FrameSum (inFrameSum_t* in, outFrameSum_t* out, status_t* status = 0, code_t* errorCode = 0);
    public:
        static bool FrameDifference (inFrameDiff_t* in, outFrameDiff_t* out, status_t* status = 0, code_t* errorCode = 0);
    public:
        static bool CreateRotationMatrix (inCreateRotMatrix_t* in, outCreateRotMatrix_t* out, status_t* status = 0, code_t* errorCode = 0);
    public:
        static bool DecomposeRotationMatrix (inDecomposeRotMatrix_t* in, outDecomposeRotMatrix_t* out, status_t* status = 0, code_t* errorCode = 0);
    public:
        static bool CuboidCalibration2D (inCubCalibration2D_t* in, outCubCalibration2D_t* out, status_t* status = 0, code_t* errorCode = 0);
    public:
        static bool CuboidCalibration3D_A (inCubCalibration3DA_t* in, outCubCalibration3DA_t* out, status_t* status = 0, code_t* errorCode = 0);
    public:
        static bool CuboidCalibration3D_B (inCubCalibration3DB_t* in, outCubCalibration3DB_t* out, status_t* status = 0, code_t* errorCode = 0);
    public:
        static bool GetVersion (outGetVersion_t* out, status_t* status = 0, code_t* errorCode = 0);
    public:
        static bool RotationMatrixToQuaternion (inMatrixToQuaternion_t* in, outMatrixToQuaternion_t* out, status_t* status = 0, code_t* errorCode = 0);
    public:
        static bool QuaternionToRotationMatrix (inQuaternionToMatrix_t* in, outQuaternionToMatrix_t* out, status_t* status = 0, code_t* errorCode = 0);
    public:
        static bool QuaternionNLERP (inQuaternionInterpolation_t* in, outQuaternionInterpolation_t* out, status_t* status = 0, code_t* errorCode = 0);
    public:
        static bool QuaternionSLERP (inQuaternionInterpolation_t* in, outQuaternionInterpolation_t* out, status_t* status = 0, code_t* errorCode = 0);
    public:
        static bool QuaternionDeCasteljauCubic (inDeCasteljauCubic_t* in, outDeCasteljauCubic_t* out, status_t* status = 0, code_t* errorCode = 0);
    public:
        static bool QuaternionRoundEdgeCubic (inRoundEdge_t* in, outRoundEdge_t* out, status_t* status = 0, code_t* errorCode = 0);
    public:
        static bool QuaternionRoundEdgeQuartic (inRoundEdge_t* in, outRoundEdge_t* out, status_t* status = 0, code_t* errorCode = 0);
    public:
        static bool EulerToQuaternion (inEulerToQuaternion_t* in, outEulerToQuaternion_t* out, status_t* status = 0, code_t* errorCode = 0);
    public:
        static bool QuaternionToEuler (inQuaternionToEuler_t* in, outQuaternionToEuler_t* out, status_t* status = 0, code_t* errorCode = 0);
    public:
        void setEpsilon (lreal_t epsilon);
    protected:
        virtual void setEpsilonImpl (lreal_t epsilon);
    public:
        lreal_t getEpsilon ();
    protected:
        virtual lreal_t getEpsilonImpl ();
    public:
        void setMeasure (measure_t measure);
    protected:
        virtual void setMeasureImpl (measure_t measure);
    public:
        measure_t getMeasure ();
    protected:
        virtual measure_t getMeasureImpl ();
    public:
        void setBaseFrame (p_lreal_t buffer);
    protected:
        virtual void setBaseFrameImpl (p_lreal_t buffer);
    public:
        void setBaseFrameDx (length_t dx);
    protected:
        virtual void setBaseFrameDxImpl (length_t dx);
    public:
        void setBaseFrameDy (length_t dy);
    protected:
        virtual void setBaseFrameDyImpl (length_t dy);
    public:
        void setBaseFrameDz (length_t dz);
    protected:
        virtual void setBaseFrameDzImpl (length_t dz);
    public:
        void setBaseFramePhi (angle_t phi);
    protected:
        virtual void setBaseFramePhiImpl (angle_t phi);
    public:
        void setBaseFrameTheta (angle_t theta);
    protected:
        virtual void setBaseFrameThetaImpl (angle_t theta);
    public:
        void setBaseFramePsi (angle_t psi);
    protected:
        virtual void setBaseFramePsiImpl (angle_t psi);
    public:
        void setBaseFrameAnglesType (anglesType_t anglesType);
    protected:
        virtual void setBaseFrameAnglesTypeImpl (anglesType_t anglesType);
    public:
        void disBaseFrame ();
    protected:
        virtual void disBaseFrameImpl ();
    public:
        length_t getBaseFrameDx ();
    protected:
        virtual length_t getBaseFrameDxImpl ();
    public:
        length_t getBaseFrameDy ();
    protected:
        virtual length_t getBaseFrameDyImpl ();
    public:
        length_t getBaseFrameDz ();
    protected:
        virtual length_t getBaseFrameDzImpl ();
    public:
        angle_t getBaseFramePhi ();
    protected:
        virtual angle_t getBaseFramePhiImpl ();
    public:
        angle_t getBaseFrameTheta ();
    protected:
        virtual angle_t getBaseFrameThetaImpl ();
    public:
        angle_t getBaseFramePsi ();
    protected:
        virtual angle_t getBaseFramePsiImpl ();
    public:
        anglesType_t getBaseFrameAnglesType ();
    protected:
        virtual anglesType_t getBaseFrameAnglesTypeImpl ();
    public:
        void setTool (p_lreal_t buffer);
    protected:
        virtual void setToolImpl (p_lreal_t buffer);
    public:
        void setToolDx (length_t dx);
    protected:
        virtual void setToolDxImpl (length_t dx);
    public:
        void setToolDy (length_t dy);
    protected:
        virtual void setToolDyImpl (length_t dy);
    public:
        void setToolDz (length_t dz);
    protected:
        virtual void setToolDzImpl (length_t dz);
    public:
        void setToolPhi (angle_t phi);
    protected:
        virtual void setToolPhiImpl (angle_t phi);
    public:
        void setToolTheta (angle_t theta);
    protected:
        virtual void setToolThetaImpl (angle_t theta);
    public:
        void setToolPsi (angle_t psi);
    protected:
        virtual void setToolPsiImpl (angle_t psi);
    public:
        void setToolAnglesType (anglesType_t anglesType);
    protected:
        virtual void setToolAnglesTypeImpl (anglesType_t anglesType);
    public:
        void disTool ();
    protected:
        virtual void disToolImpl ();
    public:
        length_t getToolDx ();
    protected:
        virtual length_t getToolDxImpl ();
    public:
        length_t getToolDy ();
    protected:
        virtual length_t getToolDyImpl ();
    public:
        length_t getToolDz ();
    protected:
        virtual length_t getToolDzImpl ();
    public:
        angle_t getToolPhi ();
    protected:
        virtual angle_t getToolPhiImpl ();
    public:
        angle_t getToolTheta ();
    protected:
        virtual angle_t getToolThetaImpl ();
    public:
        angle_t getToolPsi ();
    protected:
        virtual angle_t getToolPsiImpl ();
    public:
        anglesType_t getToolAnglesType ();
    protected:
        virtual anglesType_t getToolAnglesTypeImpl ();
    public:
        void setForcedMode (mode_t mode);
    protected:
        virtual void setForcedModeImpl (mode_t mode);
    public:
        mode_t getForcedMode ();
    protected:
        virtual mode_t getForcedModeImpl ();
    public:
        void setCDCRadius (length_t radius);
    protected:
        virtual void setCDCRadiusImpl (length_t radius);
    public:
        void setCDCProperty (property_t property);
    protected:
        virtual void setCDCPropertyImpl (property_t property);
    public:
        void disCDC ();
    protected:
        virtual void disCDCImpl ();
    public:
        length_t getCDCRadius ();
    protected:
        virtual length_t getCDCRadiusImpl ();
    public:
        property_t getCDCProperty ();
    protected:
        virtual property_t getCDCPropertyImpl ();
    public:
        void switchVariant (variant_t variant);
    protected:
        virtual void switchVariantImpl (variant_t variant);
    public:
        variant_t getVariant ();
    protected:
        virtual variant_t getVariantImpl ();
    public:
        void setJointRefCoord (index_t index, pos_t coord);
    protected:
        virtual void setIdealJointRefCoordImpl (index_t index, pos_t coord);
    public:
        pos_t getJointRefCoord (index_t index);
    protected:
        virtual pos_t getIdealJointRefCoordImpl (index_t index);
    public:
        void setCplJointRefCoord (index_t index, pos_t coord);
    protected:
        virtual void setCplJointRefCoordImpl (index_t index, pos_t coord);
    public:
        pos_t getCplJointRefCoord (index_t index);
    protected:
        virtual pos_t getCplJointRefCoordImpl (index_t index);
    public:
        void setJointRefCoords (p_lreal_t buffer);
    protected:
        virtual void setIdealJointRefCoordsImpl (p_lreal_t buffer);
    public:
        void getJointRefCoords (p_lreal_t buffer);
    protected:
        virtual void getIdealJointRefCoordsImpl (p_lreal_t buffer);
    public:
        void setCplJointRefCoords (p_lreal_t buffer);
    protected:
        virtual void setCplJointRefCoordsImpl (p_lreal_t buffer);
    public:
        void getCplJointRefCoords (p_lreal_t buffer);
    protected:
        virtual void getCplJointRefCoordsImpl (p_lreal_t buffer);
    public:
        index_t getJointCount ();
    protected:
        virtual index_t getJointCountImpl ();
    public:
        type_t getJointType (index_t index);
    protected:
        virtual type_t getJointTypeImpl (index_t index);
    public:
        name_t getJointName (index_t index);
    protected:
        virtual name_t getJointNameImpl (index_t index);
    public:
        void setJointSwEndLim (index_t index, pos_t swEndLim1, pos_t swEndLim2);
    protected:
        virtual void setIdealJointSwEndLimImpl (index_t index, pos_t swEndLim1, pos_t swEndLim2);
    public:
        void setJointFactor (index_t index, number_t factor);
    protected:
        virtual void setIdealJointFactorImpl (index_t index, number_t factor);
    public:
        void setJointOffset (index_t index, pos_t offset);
    protected:
        virtual void setIdealJointOffsetImpl (index_t index, pos_t offset);
    public:
        void setJointMaxChange (index_t index, pos_t maxChange);
    protected:
        virtual void setIdealJointMaxChangeImpl (index_t index, pos_t maxChange);
    public:
        void disJointSwEndLim (index_t index);
    protected:
        virtual void disIdealJointSwEndLimImpl (index_t index);
    public:
        void disJointFactor (index_t index);
    protected:
        virtual void disIdealJointFactorImpl (index_t index);
    public:
        void disJointOffset (index_t index);
    protected:
        virtual void disIdealJointOffsetImpl (index_t index);
    public:
        void disJointMaxChange (index_t index);
    protected:
        virtual void disIdealJointMaxChangeImpl (index_t index);
    public:
        void setJointNeg (index_t index, bool state);
    protected:
        virtual void setIdealJointNegImpl (index_t index, bool state);
    public:
        void setJointInSwEndLim (index_t index, bool state);
    protected:
        virtual void setIdealJointInSwEndLimImpl (index_t index, bool state);
    public:
        void setJointPosDir (index_t index, bool state);
    protected:
        virtual void setIdealJointPosDirImpl (index_t index, bool state);
    public:
        void setJointNegDir (index_t index, bool state);
    protected:
        virtual void setIdealJointNegDirImpl (index_t index, bool state);
    public:
        pos_t getJointSwEndLim1 (index_t index);
    protected:
        virtual pos_t getIdealJointSwEndLim1Impl (index_t index);
    public:
        pos_t getJointSwEndLim2 (index_t index);
    protected:
        virtual pos_t getIdealJointSwEndLim2Impl (index_t index);
    public:
        number_t getJointFactor (index_t index);
    protected:
        virtual number_t getIdealJointFactorImpl (index_t index);
    public:
        pos_t getJointOffset (index_t index);
    protected:
        virtual pos_t getIdealJointOffsetImpl (index_t index);
    public:
        pos_t getJointMaxChange (index_t index);
    protected:
        virtual pos_t getIdealJointMaxChangeImpl (index_t index);
    public:
        bool isJointNeg (index_t index);
    protected:
        virtual bool isIdealJointNegImpl (index_t index);
    public:
        bool isJointInSwEndLim (index_t index);
    protected:
        virtual bool isIdealJointInSwEndLimImpl (index_t index);
    public:
        bool isJointPosDir (index_t index);
    protected:
        virtual bool isIdealJointPosDirImpl (index_t index);
    public:
        bool isJointNegDir (index_t index);
    protected:
        virtual bool isIdealJointNegDirImpl (index_t index);
    public:
        void setCplJointSwEndLim (index_t index, pos_t swEndLim1, pos_t swEndLim2);
    protected:
        virtual void setCplJointSwEndLimImpl (index_t index, pos_t swEndLim1, pos_t swEndLim2);
    public:
        void setCplJointFactor (index_t index, number_t factor);
    protected:
        virtual void setCplJointFactorImpl (index_t index, number_t factor);
    public:
        void setCplJointOffset (index_t index, pos_t offset);
    protected:
        virtual void setCplJointOffsetImpl (index_t index, pos_t offset);
    public:
        void setCplJointMaxChange (index_t index, pos_t maxChange);
    protected:
        virtual void setCplJointMaxChangeImpl (index_t index, pos_t maxChange);
    public:
        void disCplJointSwEndLim (index_t index);
    protected:
        virtual void disCplJointSwEndLimImpl (index_t index);
    public:
        void disCplJointFactor (index_t index);
    protected:
        virtual void disCplJointFactorImpl (index_t index);
    public:
        void disCplJointOffset (index_t index);
    protected:
        virtual void disCplJointOffsetImpl (index_t index);
    public:
        void disCplJointMaxChange (index_t index);
    protected:
        virtual void disCplJointMaxChangeImpl (index_t index);
    public:
        void setCplJointNeg (index_t index, bool state);
    protected:
        virtual void setCplJointNegImpl (index_t index, bool state);
    public:
        void setCplJointInSwEndLim (index_t index, bool state);
    protected:
        virtual void setCplJointInSwEndLimImpl (index_t index, bool state);
    public:
        void setCplJointPosDir (index_t index, bool state);
    protected:
        virtual void setCplJointPosDirImpl (index_t index, bool state);
    public:
        void setCplJointNegDir (index_t index, bool state);
    protected:
        virtual void setCplJointNegDirImpl (index_t index, bool state);
    public:
        pos_t getCplJointSwEndLim1 (index_t index);
    protected:
        virtual pos_t getCplJointSwEndLim1Impl (index_t index);
    public:
        pos_t getCplJointSwEndLim2 (index_t index);
    protected:
        virtual pos_t getCplJointSwEndLim2Impl (index_t index);
    public:
        number_t getCplJointFactor (index_t index);
    protected:
        virtual number_t getCplJointFactorImpl (index_t index);
    public:
        pos_t getCplJointOffset (index_t index);
    protected:
        virtual pos_t getCplJointOffsetImpl (index_t index);
    public:
        pos_t getCplJointMaxChange (index_t index);
    protected:
        virtual pos_t getCplJointMaxChangeImpl (index_t index);
    public:
        bool isCplJointNeg (index_t index);
    protected:
        virtual bool isCplJointNegImpl (index_t index);
    public:
        bool isCplJointInSwEndLim (index_t index);
    protected:
        virtual bool isCplJointInSwEndLimImpl (index_t index);
    public:
        bool isCplJointPosDir (index_t index);
    protected:
        virtual bool isCplJointPosDirImpl (index_t index);
    public:
        bool isCplJointNegDir (index_t index);
    protected:
        virtual bool isCplJointNegDirImpl (index_t index);
    public:
        void setJointCoord (index_t index, pos_t coord);
    protected:
        virtual void setIdealJointCoordImpl (index_t index, pos_t coord);
    public:
        pos_t getJointCoord (index_t index);
    protected:
        virtual pos_t getIdealJointCoordImpl (index_t index);
    public:
        void setCplJointCoord (index_t index, pos_t coord);
    protected:
        virtual void setCplJointCoordImpl (index_t index, pos_t coord);
    public:
        pos_t getCplJointCoord (index_t index);
    protected:
        virtual pos_t getCplJointCoordImpl (index_t index);
    public:
        void setJointCoords (p_lreal_t buffer);
    protected:
        virtual void setIdealJointCoordsImpl (p_lreal_t buffer);
    public:
        void getJointCoords (p_lreal_t buffer);
    protected:
        virtual void getIdealJointCoordsImpl (p_lreal_t buffer);
    public:
        void setCplJointCoords (p_lreal_t buffer);
    protected:
        virtual void setCplJointCoordsImpl (p_lreal_t buffer);
    public:
        void getCplJointCoords (p_lreal_t buffer);
    protected:
        virtual void getCplJointCoordsImpl (p_lreal_t buffer);
    public:
        void setJointIdealToCplCoeff (index_t i, index_t j, coeff_t coeff_ij);
    protected:
        virtual void setJointIdealToCplCoeffImpl (index_t i, index_t j, coeff_t coeff_ij);
    public:
        void setJointCplToIdealCoeff (index_t i, index_t j, coeff_t coeff_ij);
    protected:
        virtual void setJointCplToIdealCoeffImpl (index_t i, index_t j, coeff_t coeff_ij);
    public:
        coeff_t getJointIdealToCplCoeff (index_t i, index_t j);
    protected:
        virtual coeff_t getJointIdealToCplCoeffImpl (index_t i, index_t j);
    public:
        coeff_t getJointCplToIdealCoeff (index_t i, index_t j);
    protected:
        virtual coeff_t getJointCplToIdealCoeffImpl (index_t i, index_t j);
    public:
        void disJointCoupling ();
    protected:
        virtual void disJointCouplingImpl ();
    public:
        void setPathRefCoord (index_t index, pos_t coord);
    protected:
        virtual void setIdealPathRefCoordImpl (index_t index, pos_t coord);
    public:
        pos_t getPathRefCoord (index_t index);
    protected:
        virtual pos_t getIdealPathRefCoordImpl (index_t index);
    public:
        void setCplPathRefCoord (index_t index, pos_t coord);
    protected:
        virtual void setCplPathRefCoordImpl (index_t index, pos_t coord);
    public:
        pos_t getCplPathRefCoord (index_t index);
    protected:
        virtual pos_t getCplPathRefCoordImpl (index_t index);
    public:
        void setPathRefCoords (p_lreal_t buffer);
    protected:
        virtual void setIdealPathRefCoordsImpl (p_lreal_t buffer);
    public:
        void getPathRefCoords (p_lreal_t buffer);
    protected:
        virtual void getIdealPathRefCoordsImpl (p_lreal_t buffer);
    public:
        void setCplPathRefCoords (p_lreal_t buffer);
    protected:
        virtual void setCplPathRefCoordsImpl (p_lreal_t buffer);
    public:
        void getCplPathRefCoords (p_lreal_t buffer);
    protected:
        virtual void getCplPathRefCoordsImpl (p_lreal_t buffer);
    public:
        index_t getPathCount ();
    protected:
        virtual index_t getPathCountImpl ();
    public:
        type_t getPathType (index_t index);
    protected:
        virtual type_t getPathTypeImpl (index_t index);
    public:
        name_t getPathName (index_t index);
    protected:
        virtual name_t getPathNameImpl (index_t index);
    public:
        void setPathSwEndLim (index_t index, pos_t swEndLim1, pos_t swEndLim2);
    protected:
        virtual void setIdealPathSwEndLimImpl (index_t index, pos_t swEndLim1, pos_t swEndLim2);
    public:
        void setPathFactor (index_t index, number_t factor);
    protected:
        virtual void setIdealPathFactorImpl (index_t index, number_t factor);
    public:
        void setPathOffset (index_t index, pos_t offset);
    protected:
        virtual void setIdealPathOffsetImpl (index_t index, pos_t offset);
    public:
        void setPathMaxChange (index_t index, pos_t maxChange);
    protected:
        virtual void setIdealPathMaxChangeImpl (index_t index, pos_t maxChange);
    public:
        void disPathSwEndLim (index_t index);
    protected:
        virtual void disIdealPathSwEndLimImpl (index_t index);
    public:
        void disPathFactor (index_t index);
    protected:
        virtual void disIdealPathFactorImpl (index_t index);
    public:
        void disPathOffset (index_t index);
    protected:
        virtual void disIdealPathOffsetImpl (index_t index);
    public:
        void disPathMaxChange (index_t index);
    protected:
        virtual void disIdealPathMaxChangeImpl (index_t index);
    public:
        void setPathNeg (index_t index, bool state);
    protected:
        virtual void setIdealPathNegImpl (index_t index, bool state);
    public:
        void setPathInSwEndLim (index_t index, bool state);
    protected:
        virtual void setIdealPathInSwEndLimImpl (index_t index, bool state);
    public:
        void setPathPosDir (index_t index, bool state);
    protected:
        virtual void setIdealPathPosDirImpl (index_t index, bool state);
    public:
        void setPathNegDir (index_t index, bool state);
    protected:
        virtual void setIdealPathNegDirImpl (index_t index, bool state);
    public:
        pos_t getPathSwEndLim1 (index_t index);
    protected:
        virtual pos_t getIdealPathSwEndLim1Impl (index_t index);
    public:
        pos_t getPathSwEndLim2 (index_t index);
    protected:
        virtual pos_t getIdealPathSwEndLim2Impl (index_t index);
    public:
        number_t getPathFactor (index_t index);
    protected:
        virtual number_t getIdealPathFactorImpl (index_t index);
    public:
        pos_t getPathOffset (index_t index);
    protected:
        virtual pos_t getIdealPathOffsetImpl (index_t index);
    public:
        pos_t getPathMaxChange (index_t index);
    protected:
        virtual pos_t getIdealPathMaxChangeImpl (index_t index);
    public:
        bool isPathNeg (index_t index);
    protected:
        virtual bool isIdealPathNegImpl (index_t index);
    public:
        bool isPathInSwEndLim (index_t index);
    protected:
        virtual bool isIdealPathInSwEndLimImpl (index_t index);
    public:
        bool isPathPosDir (index_t index);
    protected:
        virtual bool isIdealPathPosDirImpl (index_t index);
    public:
        bool isPathNegDir (index_t index);
    protected:
        virtual bool isIdealPathNegDirImpl (index_t index);
    public:
        void setCplPathSwEndLim (index_t index, pos_t swEndLim1, pos_t swEndLim2);
    protected:
        virtual void setCplPathSwEndLimImpl (index_t index, pos_t swEndLim1, pos_t swEndLim2);
    public:
        void setCplPathFactor (index_t index, number_t factor);
    protected:
        virtual void setCplPathFactorImpl (index_t index, number_t factor);
    public:
        void setCplPathOffset (index_t index, pos_t offset);
    protected:
        virtual void setCplPathOffsetImpl (index_t index, pos_t offset);
    public:
        void setCplPathMaxChange (index_t index, pos_t maxChange);
    protected:
        virtual void setCplPathMaxChangeImpl (index_t index, pos_t maxChange);
    public:
        void disCplPathSwEndLim (index_t index);
    protected:
        virtual void disCplPathSwEndLimImpl (index_t index);
    public:
        void disCplPathFactor (index_t index);
    protected:
        virtual void disCplPathFactorImpl (index_t index);
    public:
        void disCplPathOffset (index_t index);
    protected:
        virtual void disCplPathOffsetImpl (index_t index);
    public:
        void disCplPathMaxChange (index_t index);
    protected:
        virtual void disCplPathMaxChangeImpl (index_t index);
    public:
        void setCplPathNeg (index_t index, bool state);
    protected:
        virtual void setCplPathNegImpl (index_t index, bool state);
    public:
        void setCplPathInSwEndLim (index_t index, bool state);
    protected:
        virtual void setCplPathInSwEndLimImpl (index_t index, bool state);
    public:
        void setCplPathPosDir (index_t index, bool state);
    protected:
        virtual void setCplPathPosDirImpl (index_t index, bool state);
    public:
        void setCplPathNegDir (index_t index, bool state);
    protected:
        virtual void setCplPathNegDirImpl (index_t index, bool state);
    public:
        pos_t getCplPathSwEndLim1 (index_t index);
    protected:
        virtual pos_t getCplPathSwEndLim1Impl (index_t index);
    public:
        pos_t getCplPathSwEndLim2 (index_t index);
    protected:
        virtual pos_t getCplPathSwEndLim2Impl (index_t index);
    public:
        number_t getCplPathFactor (index_t index);
    protected:
        virtual number_t getCplPathFactorImpl (index_t index);
    public:
        pos_t getCplPathOffset (index_t index);
    protected:
        virtual pos_t getCplPathOffsetImpl (index_t index);
    public:
        pos_t getCplPathMaxChange (index_t index);
    protected:
        virtual pos_t getCplPathMaxChangeImpl (index_t index);
    public:
        bool isCplPathNeg (index_t index);
    protected:
        virtual bool isCplPathNegImpl (index_t index);
    public:
        bool isCplPathInSwEndLim (index_t index);
    protected:
        virtual bool isCplPathInSwEndLimImpl (index_t index);
    public:
        bool isCplPathPosDir (index_t index);
    protected:
        virtual bool isCplPathPosDirImpl (index_t index);
    public:
        bool isCplPathNegDir (index_t index);
    protected:
        virtual bool isCplPathNegDirImpl (index_t index);
    public:
        void setPathCoord (index_t index, pos_t coord);
    protected:
        virtual void setIdealPathCoordImpl (index_t index, pos_t coord);
    public:
        pos_t getPathCoord (index_t index);
    protected:
        virtual pos_t getIdealPathCoordImpl (index_t index);
    public:
        void setCplPathCoord (index_t index, pos_t coord);
    protected:
        virtual void setCplPathCoordImpl (index_t index, pos_t coord);
    public:
        pos_t getCplPathCoord (index_t index);
    protected:
        virtual pos_t getCplPathCoordImpl (index_t index);
    public:
        void setPathCoords (p_lreal_t buffer);
    protected:
        virtual void setIdealPathCoordsImpl (p_lreal_t buffer);
    public:
        void getPathCoords (p_lreal_t buffer);
    protected:
        virtual void getIdealPathCoordsImpl (p_lreal_t buffer);
    public:
        void setCplPathCoords (p_lreal_t buffer);
    protected:
        virtual void setCplPathCoordsImpl (p_lreal_t buffer);
    public:
        void getCplPathCoords (p_lreal_t buffer);
    protected:
        virtual void getCplPathCoordsImpl (p_lreal_t buffer);
    public:
        void setPathIdealToCplCoeff (index_t i, index_t j, coeff_t coeff_ij);
    protected:
        virtual void setPathIdealToCplCoeffImpl (index_t i, index_t j, coeff_t coeff_ij);
    public:
        void setPathCplToIdealCoeff (index_t i, index_t j, coeff_t coeff_ij);
    protected:
        virtual void setPathCplToIdealCoeffImpl (index_t i, index_t j, coeff_t coeff_ij);
    public:
        coeff_t getPathIdealToCplCoeff (index_t i, index_t j);
    protected:
        virtual coeff_t getPathIdealToCplCoeffImpl (index_t i, index_t j);
    public:
        coeff_t getPathCplToIdealCoeff (index_t i, index_t j);
    protected:
        virtual coeff_t getPathCplToIdealCoeffImpl (index_t i, index_t j);
    public:
        void disPathCoupling ();
    protected:
        virtual void disPathCouplingImpl ();
    public:
        index_t getAddCount ();
    protected:
        virtual index_t getAddCountImpl ();
    public:
        type_t getAddType (index_t index);
    protected:
        virtual type_t getAddTypeImpl (index_t index);
    public:
        name_t getAddName (index_t index);
    protected:
        virtual name_t getAddNameImpl (index_t index);
    public:
        void setAddSwEndLim (index_t index, pos_t swEndLim1, pos_t swEndLim2);
    protected:
        virtual void setIdealAddSwEndLimImpl (index_t index, pos_t swEndLim1, pos_t swEndLim2);
    public:
        void setAddFactor (index_t index, number_t factor);
    protected:
        virtual void setIdealAddFactorImpl (index_t index, number_t factor);
    public:
        void setAddOffset (index_t index, pos_t offset);
    protected:
        virtual void setIdealAddOffsetImpl (index_t index, pos_t offset);
    public:
        void setAddMaxChange (index_t index, pos_t maxChange);
    protected:
        virtual void setIdealAddMaxChangeImpl (index_t index, pos_t maxChange);
    public:
        void disAddSwEndLim (index_t index);
    protected:
        virtual void disIdealAddSwEndLimImpl (index_t index);
    public:
        void disAddFactor (index_t index);
    protected:
        virtual void disIdealAddFactorImpl (index_t index);
    public:
        void disAddOffset (index_t index);
    protected:
        virtual void disIdealAddOffsetImpl (index_t index);
    public:
        void disAddMaxChange (index_t index);
    protected:
        virtual void disIdealAddMaxChangeImpl (index_t index);
    public:
        void setAddNeg (index_t index, bool state);
    protected:
        virtual void setIdealAddNegImpl (index_t index, bool state);
    public:
        void setAddInSwEndLim (index_t index, bool state);
    protected:
        virtual void setIdealAddInSwEndLimImpl (index_t index, bool state);
    public:
        void setAddPosDir (index_t index, bool state);
    protected:
        virtual void setIdealAddPosDirImpl (index_t index, bool state);
    public:
        void setAddNegDir (index_t index, bool state);
    protected:
        virtual void setIdealAddNegDirImpl (index_t index, bool state);
    public:
        pos_t getAddSwEndLim1 (index_t index);
    protected:
        virtual pos_t getIdealAddSwEndLim1Impl (index_t index);
    public:
        pos_t getAddSwEndLim2 (index_t index);
    protected:
        virtual pos_t getIdealAddSwEndLim2Impl (index_t index);
    public:
        number_t getAddFactor (index_t index);
    protected:
        virtual number_t getIdealAddFactorImpl (index_t index);
    public:
        pos_t getAddOffset (index_t index);
    protected:
        virtual pos_t getIdealAddOffsetImpl (index_t index);
    public:
        pos_t getAddMaxChange (index_t index);
    protected:
        virtual pos_t getIdealAddMaxChangeImpl (index_t index);
    public:
        bool isAddNeg (index_t index);
    protected:
        virtual bool isIdealAddNegImpl (index_t index);
    public:
        bool isAddInSwEndLim (index_t index);
    protected:
        virtual bool isIdealAddInSwEndLimImpl (index_t index);
    public:
        bool isAddPosDir (index_t index);
    protected:
        virtual bool isIdealAddPosDirImpl (index_t index);
    public:
        bool isAddNegDir (index_t index);
    protected:
        virtual bool isIdealAddNegDirImpl (index_t index);
    public:
        void setCplAddSwEndLim (index_t index, pos_t swEndLim1, pos_t swEndLim2);
    protected:
        virtual void setCplAddSwEndLimImpl (index_t index, pos_t swEndLim1, pos_t swEndLim2);
    public:
        void setCplAddFactor (index_t index, number_t factor);
    protected:
        virtual void setCplAddFactorImpl (index_t index, number_t factor);
    public:
        void setCplAddOffset (index_t index, pos_t offset);
    protected:
        virtual void setCplAddOffsetImpl (index_t index, pos_t offset);
    public:
        void setCplAddMaxChange (index_t index, pos_t maxChange);
    protected:
        virtual void setCplAddMaxChangeImpl (index_t index, pos_t maxChange);
    public:
        void disCplAddSwEndLim (index_t index);
    protected:
        virtual void disCplAddSwEndLimImpl (index_t index);
    public:
        void disCplAddFactor (index_t index);
    protected:
        virtual void disCplAddFactorImpl (index_t index);
    public:
        void disCplAddOffset (index_t index);
    protected:
        virtual void disCplAddOffsetImpl (index_t index);
    public:
        void disCplAddMaxChange (index_t index);
    protected:
        virtual void disCplAddMaxChangeImpl (index_t index);
    public:
        void setCplAddNeg (index_t index, bool state);
    protected:
        virtual void setCplAddNegImpl (index_t index, bool state);
    public:
        void setCplAddInSwEndLim (index_t index, bool state);
    protected:
        virtual void setCplAddInSwEndLimImpl (index_t index, bool state);
    public:
        void setCplAddPosDir (index_t index, bool state);
    protected:
        virtual void setCplAddPosDirImpl (index_t index, bool state);
    public:
        void setCplAddNegDir (index_t index, bool state);
    protected:
        virtual void setCplAddNegDirImpl (index_t index, bool state);
    public:
        pos_t getCplAddSwEndLim1 (index_t index);
    protected:
        virtual pos_t getCplAddSwEndLim1Impl (index_t index);
    public:
        pos_t getCplAddSwEndLim2 (index_t index);
    protected:
        virtual pos_t getCplAddSwEndLim2Impl (index_t index);
    public:
        number_t getCplAddFactor (index_t index);
    protected:
        virtual number_t getCplAddFactorImpl (index_t index);
    public:
        pos_t getCplAddOffset (index_t index);
    protected:
        virtual pos_t getCplAddOffsetImpl (index_t index);
    public:
        pos_t getCplAddMaxChange (index_t index);
    protected:
        virtual pos_t getCplAddMaxChangeImpl (index_t index);
    public:
        bool isCplAddNeg (index_t index);
    protected:
        virtual bool isCplAddNegImpl (index_t index);
    public:
        bool isCplAddInSwEndLim (index_t index);
    protected:
        virtual bool isCplAddInSwEndLimImpl (index_t index);
    public:
        bool isCplAddPosDir (index_t index);
    protected:
        virtual bool isCplAddPosDirImpl (index_t index);
    public:
        bool isCplAddNegDir (index_t index);
    protected:
        virtual bool isCplAddNegDirImpl (index_t index);
    public:
        void setAddCoord (index_t index, pos_t coord);
    protected:
        virtual void setIdealAddCoordImpl (index_t index, pos_t coord);
    public:
        pos_t getAddCoord (index_t index);
    protected:
        virtual pos_t getIdealAddCoordImpl (index_t index);
    public:
        void setCplAddCoord (index_t index, pos_t coord);
    protected:
        virtual void setCplAddCoordImpl (index_t index, pos_t coord);
    public:
        pos_t getCplAddCoord (index_t index);
    protected:
        virtual pos_t getCplAddCoordImpl (index_t index);
    public:
        void setAddCoords (p_lreal_t buffer);
    protected:
        virtual void setIdealAddCoordsImpl (p_lreal_t buffer);
    public:
        void getAddCoords (p_lreal_t buffer);
    protected:
        virtual void getIdealAddCoordsImpl (p_lreal_t buffer);
    public:
        void setCplAddCoords (p_lreal_t buffer);
    protected:
        virtual void setCplAddCoordsImpl (p_lreal_t buffer);
    public:
        void getCplAddCoords (p_lreal_t buffer);
    protected:
        virtual void getCplAddCoordsImpl (p_lreal_t buffer);
    public:
        void setAddIdealToCplCoeff (index_t i, index_t j, coeff_t coeff_ij);
    protected:
        virtual void setAddIdealToCplCoeffImpl (index_t i, index_t j, coeff_t coeff_ij);
    public:
        void setAddCplToIdealCoeff (index_t i, index_t j, coeff_t coeff_ij);
    protected:
        virtual void setAddCplToIdealCoeffImpl (index_t i, index_t j, coeff_t coeff_ij);
    public:
        coeff_t getAddIdealToCplCoeff (index_t i, index_t j);
    protected:
        virtual coeff_t getAddIdealToCplCoeffImpl (index_t i, index_t j);
    public:
        coeff_t getAddCplToIdealCoeff (index_t i, index_t j);
    protected:
        virtual coeff_t getAddCplToIdealCoeffImpl (index_t i, index_t j);
    public:
        void disAddCoupling ();
    protected:
        virtual void disAddCouplingImpl ();
    public:
        index_t getCtrlCount ();
    protected:
        virtual index_t getCtrlCountImpl ();
    public:
        type_t getCtrlType (index_t index);
    protected:
        virtual type_t getCtrlTypeImpl (index_t index);
    public:
        name_t getCtrlName (index_t index);
    protected:
        virtual name_t getCtrlNameImpl (index_t index);
    public:
        void setCtrlSwEndLim (index_t index, pos_t swEndLim1, pos_t swEndLim2);
    protected:
        virtual void setIdealCtrlSwEndLimImpl (index_t index, pos_t swEndLim1, pos_t swEndLim2);
    public:
        void setCtrlFactor (index_t index, number_t factor);
    protected:
        virtual void setIdealCtrlFactorImpl (index_t index, number_t factor);
    public:
        void setCtrlOffset (index_t index, pos_t offset);
    protected:
        virtual void setIdealCtrlOffsetImpl (index_t index, pos_t offset);
    public:
        void setCtrlMaxChange (index_t index, pos_t maxChange);
    protected:
        virtual void setIdealCtrlMaxChangeImpl (index_t index, pos_t maxChange);
    public:
        void disCtrlSwEndLim (index_t index);
    protected:
        virtual void disIdealCtrlSwEndLimImpl (index_t index);
    public:
        void disCtrlFactor (index_t index);
    protected:
        virtual void disIdealCtrlFactorImpl (index_t index);
    public:
        void disCtrlOffset (index_t index);
    protected:
        virtual void disIdealCtrlOffsetImpl (index_t index);
    public:
        void disCtrlMaxChange (index_t index);
    protected:
        virtual void disIdealCtrlMaxChangeImpl (index_t index);
    public:
        void setCtrlNeg (index_t index, bool state);
    protected:
        virtual void setIdealCtrlNegImpl (index_t index, bool state);
    public:
        void setCtrlInSwEndLim (index_t index, bool state);
    protected:
        virtual void setIdealCtrlInSwEndLimImpl (index_t index, bool state);
    public:
        void setCtrlPosDir (index_t index, bool state);
    protected:
        virtual void setIdealCtrlPosDirImpl (index_t index, bool state);
    public:
        void setCtrlNegDir (index_t index, bool state);
    protected:
        virtual void setIdealCtrlNegDirImpl (index_t index, bool state);
    public:
        pos_t getCtrlSwEndLim1 (index_t index);
    protected:
        virtual pos_t getIdealCtrlSwEndLim1Impl (index_t index);
    public:
        pos_t getCtrlSwEndLim2 (index_t index);
    protected:
        virtual pos_t getIdealCtrlSwEndLim2Impl (index_t index);
    public:
        number_t getCtrlFactor (index_t index);
    protected:
        virtual number_t getIdealCtrlFactorImpl (index_t index);
    public:
        pos_t getCtrlOffset (index_t index);
    protected:
        virtual pos_t getIdealCtrlOffsetImpl (index_t index);
    public:
        pos_t getCtrlMaxChange (index_t index);
    protected:
        virtual pos_t getIdealCtrlMaxChangeImpl (index_t index);
    public:
        bool isCtrlNeg (index_t index);
    protected:
        virtual bool isIdealCtrlNegImpl (index_t index);
    public:
        bool isCtrlInSwEndLim (index_t index);
    protected:
        virtual bool isIdealCtrlInSwEndLimImpl (index_t index);
    public:
        bool isCtrlPosDir (index_t index);
    protected:
        virtual bool isIdealCtrlPosDirImpl (index_t index);
    public:
        bool isCtrlNegDir (index_t index);
    protected:
        virtual bool isIdealCtrlNegDirImpl (index_t index);
    public:
        void setCplCtrlSwEndLim (index_t index, pos_t swEndLim1, pos_t swEndLim2);
    protected:
        virtual void setCplCtrlSwEndLimImpl (index_t index, pos_t swEndLim1, pos_t swEndLim2);
    public:
        void setCplCtrlFactor (index_t index, number_t factor);
    protected:
        virtual void setCplCtrlFactorImpl (index_t index, number_t factor);
    public:
        void setCplCtrlOffset (index_t index, pos_t offset);
    protected:
        virtual void setCplCtrlOffsetImpl (index_t index, pos_t offset);
    public:
        void setCplCtrlMaxChange (index_t index, pos_t maxChange);
    protected:
        virtual void setCplCtrlMaxChangeImpl (index_t index, pos_t maxChange);
    public:
        void disCplCtrlSwEndLim (index_t index);
    protected:
        virtual void disCplCtrlSwEndLimImpl (index_t index);
    public:
        void disCplCtrlFactor (index_t index);
    protected:
        virtual void disCplCtrlFactorImpl (index_t index);
    public:
        void disCplCtrlOffset (index_t index);
    protected:
        virtual void disCplCtrlOffsetImpl (index_t index);
    public:
        void disCplCtrlMaxChange (index_t index);
    protected:
        virtual void disCplCtrlMaxChangeImpl (index_t index);
    public:
        void setCplCtrlNeg (index_t index, bool state);
    protected:
        virtual void setCplCtrlNegImpl (index_t index, bool state);
    public:
        void setCplCtrlInSwEndLim (index_t index, bool state);
    protected:
        virtual void setCplCtrlInSwEndLimImpl (index_t index, bool state);
    public:
        void setCplCtrlPosDir (index_t index, bool state);
    protected:
        virtual void setCplCtrlPosDirImpl (index_t index, bool state);
    public:
        void setCplCtrlNegDir (index_t index, bool state);
    protected:
        virtual void setCplCtrlNegDirImpl (index_t index, bool state);
    public:
        pos_t getCplCtrlSwEndLim1 (index_t index);
    protected:
        virtual pos_t getCplCtrlSwEndLim1Impl (index_t index);
    public:
        pos_t getCplCtrlSwEndLim2 (index_t index);
    protected:
        virtual pos_t getCplCtrlSwEndLim2Impl (index_t index);
    public:
        number_t getCplCtrlFactor (index_t index);
    protected:
        virtual number_t getCplCtrlFactorImpl (index_t index);
    public:
        pos_t getCplCtrlOffset (index_t index);
    protected:
        virtual pos_t getCplCtrlOffsetImpl (index_t index);
    public:
        pos_t getCplCtrlMaxChange (index_t index);
    protected:
        virtual pos_t getCplCtrlMaxChangeImpl (index_t index);
    public:
        bool isCplCtrlNeg (index_t index);
    protected:
        virtual bool isCplCtrlNegImpl (index_t index);
    public:
        bool isCplCtrlInSwEndLim (index_t index);
    protected:
        virtual bool isCplCtrlInSwEndLimImpl (index_t index);
    public:
        bool isCplCtrlPosDir (index_t index);
    protected:
        virtual bool isCplCtrlPosDirImpl (index_t index);
    public:
        bool isCplCtrlNegDir (index_t index);
    protected:
        virtual bool isCplCtrlNegDirImpl (index_t index);
    public:
        void setCtrlCoord (index_t index, pos_t coord);
    protected:
        virtual void setIdealCtrlCoordImpl (index_t index, pos_t coord);
    public:
        pos_t getCtrlCoord (index_t index);
    protected:
        virtual pos_t getIdealCtrlCoordImpl (index_t index);
    public:
        void setCplCtrlCoord (index_t index, pos_t coord);
    protected:
        virtual void setCplCtrlCoordImpl (index_t index, pos_t coord);
    public:
        pos_t getCplCtrlCoord (index_t index);
    protected:
        virtual pos_t getCplCtrlCoordImpl (index_t index);
    public:
        void setCtrlCoords (p_lreal_t buffer);
    protected:
        virtual void setIdealCtrlCoordsImpl (p_lreal_t buffer);
    public:
        void getCtrlCoords (p_lreal_t buffer);
    protected:
        virtual void getIdealCtrlCoordsImpl (p_lreal_t buffer);
    public:
        void setCplCtrlCoords (p_lreal_t buffer);
    protected:
        virtual void setCplCtrlCoordsImpl (p_lreal_t buffer);
    public:
        void getCplCtrlCoords (p_lreal_t buffer);
    protected:
        virtual void getCplCtrlCoordsImpl (p_lreal_t buffer);
    public:
        void setCtrlIdealToCplCoeff (index_t i, index_t j, coeff_t coeff_ij);
    protected:
        virtual void setCtrlIdealToCplCoeffImpl (index_t i, index_t j, coeff_t coeff_ij);
    public:
        void setCtrlCplToIdealCoeff (index_t i, index_t j, coeff_t coeff_ij);
    protected:
        virtual void setCtrlCplToIdealCoeffImpl (index_t i, index_t j, coeff_t coeff_ij);
    public:
        coeff_t getCtrlIdealToCplCoeff (index_t i, index_t j);
    protected:
        virtual coeff_t getCtrlIdealToCplCoeffImpl (index_t i, index_t j);
    public:
        coeff_t getCtrlCplToIdealCoeff (index_t i, index_t j);
    protected:
        virtual coeff_t getCtrlCplToIdealCoeffImpl (index_t i, index_t j);
    public:
        void disCtrlCoupling ();
    protected:
        virtual void disCtrlCouplingImpl ();
    public:
        index_t getJointPositionCount ();
    protected:
        virtual index_t getJointPositionCountImpl ();
    public:
        id_t getRobotID ();
    protected:
        virtual id_t getRobotIDImpl ();
    public:
        void direct ();
    protected:
        virtual void directImpl ();
    public:
        void inverse ();
    protected:
        virtual void inverseImpl ();
    public:
        lreal_t getJointPosX (index_t index);
    protected:
        virtual lreal_t getJointPosXImpl (index_t index);
    public:
        lreal_t getJointPosY (index_t index);
    protected:
        virtual lreal_t getJointPosYImpl (index_t index);
    public:
        lreal_t getJointPosZ (index_t index);
    protected:
        virtual lreal_t getJointPosZImpl (index_t index);
    public:
        void getJointsPos (p_lreal_t buffer);
    protected:
        virtual void getJointsPosImpl (p_lreal_t buffer);
    public:
        lreal_t getSizeX ();
    protected:
        virtual lreal_t getSizeXImpl ();
    public:
        lreal_t getSizeY ();
    protected:
        virtual lreal_t getSizeYImpl ();
    public:
        lreal_t getSizeZ ();
    protected:
        virtual lreal_t getSizeZImpl ();
    public:
        void getSize (p_lreal_t buffer);
    protected:
        virtual void getSizeImpl (p_lreal_t buffer);
    public:
        mode_t getMode ();
    protected:
        virtual mode_t getModeImpl ();
    public:
        void getJacobian (p_lreal_t buffer);
    protected:
        virtual void getJacobianImpl (p_lreal_t buffer);
    public:
        lreal_t getJacobianCoeff (index_t i, index_t j);
    protected:
        virtual lreal_t getJacobianCoeffImpl (index_t i, index_t j);
    public:
        p_lreal_t getGeneralJacobian ();
    protected:
        virtual p_lreal_t getGeneralJacobianImpl ();
    public:
        lreal_t getGeneralJacobianCoeff (index_t i, index_t j);
    protected:
        virtual lreal_t getGeneralJacobianCoeffImpl (index_t i, index_t j);
    public:
        void getTcpPosition (p_lreal_t buffer);
    protected:
        virtual void getTcpPositionImpl (p_lreal_t buffer);
    public:
        void getTcpQuaternion (p_lreal_t buffer);
    protected:
        virtual void getTcpQuaternionImpl (p_lreal_t buffer);
    public:
        void setTcpPosition (p_lreal_t buffer);
    protected:
        virtual void setTcpPositionImpl (p_lreal_t buffer);
    public:
        void setTcpQuaternion (p_lreal_t buffer);
    protected:
        virtual void setTcpQuaternionImpl (p_lreal_t buffer);
    protected:
        virtual void initializeErrors(id_t methodID);
        virtual void cleanUpToDateFlags(id_t methodID, bool cleanAll);
        void entranceToPublicMethod(id_t methodID, bool cleanAll);
        virtual void issueError(code_t code);
        virtual void issueError(code_t code, info_t integer1);
        virtual void issueError(code_t code, info_t integer1, info_t integer2);
        virtual void issueError(code_t code, info_t integer1, info_t integer2, info_t integer3);
        virtual void issueError(code_t code, info_t integer1, info_t integer2, info_t integer3, info_t integer4);
    };

    class CRobotLiteErr: public CRobot
    {
    protected:
        CRobotLiteErr();
    protected:
        error_t lastError;
    protected:
        void initializeErrors(id_t methodID);
        void issueError(code_t code);
        virtual void prepareLastError();
        const error_t& lastCallImpl();
    };

    typedef struct errorItem_t
    {
        id_t methodID;
        code_t code;
        udint_t category;
        info_t integer[4];
    } errorItem_t;
    class CError
    {
    public:
        static const index_t addInfoDimension = 4;
        static const index_t numberOfPossibleErrors = 8;
        static const udint_t priorityLevel = 10;
    private:
        id_t robotID;
        id_t methodID;
        errorItem_t errorItem[numberOfPossibleErrors];
        index_t writePointer;
        bool freezed;
    public:
        CError();
        void freeze();
        void unfreeze();
        void initialize(id_t robotID, id_t methodID);
        bool add(status_t type, code_t code, bool prior);
        bool add(status_t type, code_t code, info_t* integer, index_t integerCount, bool prior);
        void getLast(error_t& error) const;
    };

    class CMeasure
    {
    private:
        measure_t measure;
    public:
        CMeasure();
        status_t set(measure_t measure_);
        measure_t get() const;
        void lengthToPublic(lreal_t& length) const;
        void angleToPublic(lreal_t& angle) const;
        void lengthToInternal(lreal_t& length) const;
        void angleToInternal(lreal_t& angle) const;
    };

    class CMode
    {
    private:
        mode_t forced;
        bool forcedComplete;
        mode_t defaultModes;
        mode_t modes;
    public:
        CMode();
        status_t setForced(mode_t mode);
        mode_t getForced() const;
        status_t init(mode_t defaultModes_);
        bool isForcedComplete() const;
        bool hasModes() const;
        mode_t getDefaultFromPair(mode_t modePair) const;
    };

    class CCdc
    {
    private:
        length_t radius;
        property_t property;
        bool used;
    public:
        CCdc();
        status_t setRadius(length_t radius_);
        status_t setProperty(property_t property_);
        length_t getRadius() const;
        property_t getProperty() const;
        bool isUsed() const;
        status_t disable();
    };

    class CEpsilon
    {
    private:
        lreal_t epsilon;
    public:
        CEpsilon();
        status_t set(lreal_t epsilon_);
        lreal_t get() const;
        bool isZero(lreal_t value) const;
        bool isZero2(p_lreal_t buffer) const;
        bool isZero3(p_lreal_t buffer) const;
        bool isPositive(lreal_t value) const;
        bool isNegative(lreal_t value) const;
        bool isEqual(lreal_t value1, lreal_t value2) const;
        bool isEqual2(p_lreal_t buffer1, p_lreal_t buffer2) const;
        bool isEqual3(p_lreal_t buffer1, p_lreal_t buffer2) const;
        bool isGreater(lreal_t value1, lreal_t value2) const;
        bool isSmaller(lreal_t value1, lreal_t value2) const;
        bool isInside(lreal_t x, lreal_t value1, lreal_t value2) const;
        void roundTo(lreal_t &value) const;
        void roundTo(p_lreal_t buffer, index_t count) const;
    };

    class CStdRobot: public CRobotLiteErr
    {
    protected:
        CStdRobot();
    protected:
        CMeasure measure;
        void setMeasureImpl(measure_t measure);
        measure_t getMeasureImpl();
        void coordToInternal(pos_t& coord, type_t type);
        void coordToInternal(p_lreal_t buffer, type_t* type, index_t count);
        void coordToPublic(pos_t& coord, type_t type);
        void coordToPublic(p_lreal_t buffer, type_t* type, index_t count);
        void coeffToInternal(coeff_t& coeff, type_t type_i, type_t type_j);
        void coeffToPublic(coeff_t& coeff, type_t type_i, type_t type_j);
        CEpsilon epsilon;
        void setEpsilonImpl(lreal_t epsilon);
        lreal_t getEpsilonImpl();
        CFrame baseFrame;
        void setBaseFrameImpl(p_lreal_t buffer);
        void setBaseFrameDxImpl(length_t dx);
        void setBaseFrameDyImpl(length_t dy);
        void setBaseFrameDzImpl(length_t dz);
        void setBaseFramePhiImpl(angle_t phi);
        void setBaseFrameThetaImpl(angle_t theta);
        void setBaseFramePsiImpl(angle_t psi);
        void setBaseFrameAnglesTypeImpl(anglesType_t anglesType);
        void disBaseFrameImpl();
        length_t getBaseFrameDxImpl();
        length_t getBaseFrameDyImpl();
        length_t getBaseFrameDzImpl();
        angle_t getBaseFramePhiImpl();
        angle_t getBaseFrameThetaImpl();
        angle_t getBaseFramePsiImpl();
        anglesType_t getBaseFrameAnglesTypeImpl();
        CFrame tool;
        void setToolImpl(p_lreal_t buffer);
        void setToolDxImpl(length_t dx);
        void setToolDyImpl(length_t dy);
        void setToolDzImpl(length_t dz);
        void setToolPhiImpl(angle_t phi);
        void setToolThetaImpl(angle_t theta);
        void setToolPsiImpl(angle_t psi);
        void setToolAnglesTypeImpl(anglesType_t anglesType);
        void disToolImpl();
        length_t getToolDxImpl();
        length_t getToolDyImpl();
        length_t getToolDzImpl();
        angle_t getToolPhiImpl();
        angle_t getToolThetaImpl();
        angle_t getToolPsiImpl();
        anglesType_t getToolAnglesTypeImpl();
        CMode mode;
        mode_t refMode;
        void selectSolutionInIntendedMode(p_lreal_t solutionInDefaultMode, p_lreal_t solutionInOtherMode, index_t count, mode_t modePair, p_lreal_t out) const;
        void setForcedModeImpl(mode_t mode);
        mode_t getForcedModeImpl();
        CCdc cdc;
        void setCDCRadiusImpl(length_t radius);
        void setCDCPropertyImpl(property_t property);
        void disCDCImpl();
        length_t getCDCRadiusImpl();
        property_t getCDCPropertyImpl();
    protected:
        void translateStatusFromCMeasure(status_t status);
        void translateStatusFromCEpsilon(status_t status);
        void translateStatusFromCFrame(status_t status);
        void translateStatusFromCMode(status_t status);
    private:
        license_t licenseStatus;
    protected:
        bool isLicensedImpl();
        index_t checkLicenseImpl();
    private:
        bool isValidMech;
    protected:
        bool isValidRobot();
        void validateMechanicalSystem();
        virtual void validateMech();
    private:
        CError errorObject;
    protected:
        void initializeErrors(id_t methodID);
        void issueError(code_t code);
        void issueError(code_t code, info_t integer1);
        void issueError(code_t code, info_t integer1, info_t integer2);
        void issueError(code_t code, info_t integer1, info_t integer2, info_t integer3);
        void issueError(code_t code, info_t integer1, info_t integer2, info_t integer3, info_t integer4);
        void issuePriorError(code_t code);
        void issuePriorError(code_t code, info_t integer1);
        void issuePriorError(code_t code, info_t integer1, info_t integer2);
        void issuePriorError(code_t code, info_t integer1, info_t integer2, info_t integer3);
        void issuePriorError(code_t code, info_t integer1, info_t integer2, info_t integer3, info_t integer4);
        void issueWarning(code_t code);
        void issueWarning(code_t code, info_t integer1);
        void issueWarning(code_t code, info_t integer1, info_t integer2);
        void issueWarning(code_t code, info_t integer1, info_t integer2, info_t integer3);
        void issueWarning(code_t code, info_t integer1, info_t integer2, info_t integer3, info_t integer4);
        void issueInfo(code_t code);
        void issueInfo(code_t code, info_t integer1);
        void issueInfo(code_t code, info_t integer1, info_t integer2);
        void issueInfo(code_t code, info_t integer1, info_t integer2, info_t integer3);
        void issueInfo(code_t code, info_t integer1, info_t integer2, info_t integer3, info_t integer4);
        void prepareLastError();
        void freezeErrorObject();
        void unfreezeErrorObject();
    protected:
        void angle2AngleImpl(inAngle2Angle_t* in, outAngle2Angle_t* out);
        void anglesType2AnglesTypeImpl(inAnglesType2AnglesType_t* in, outAnglesType2AnglesType_t* out);
        void directionVectorXImpl(inDirectionVector_t* in, outDirectionVector_t* out);
        void directionVectorYImpl(inDirectionVector_t* in, outDirectionVector_t* out);
        void directionVectorZImpl(inDirectionVector_t* in, outDirectionVector_t* out);
        void frameSumImpl(inFrameSum_t* in, outFrameSum_t* out);
        void frameDifferenceImpl(inFrameDiff_t* in, outFrameDiff_t* out);
        void createRotationMatrixImpl(inCreateRotMatrix_t* in, outCreateRotMatrix_t* out);
        void decomposeRotationMatrixImpl(inDecomposeRotMatrix_t* in, outDecomposeRotMatrix_t* out);
        void cuboidCalibration2DImpl(inCubCalibration2D_t* in, outCubCalibration2D_t* out);
        void cuboidCalibration3D_AImpl(inCubCalibration3DA_t* in, outCubCalibration3DA_t* out);
        void cuboidCalibration3D_BImpl(inCubCalibration3DB_t* in, outCubCalibration3DB_t* out);
        void getVersionImpl(outGetVersion_t* out);
        void rotationMatrixToQuaternionImpl(inMatrixToQuaternion_t* in, outMatrixToQuaternion_t* out);
        void quaternionToRotationMatrixImpl(inQuaternionToMatrix_t* in, outQuaternionToMatrix_t* out);
        void quaternionNLERPImpl(inQuaternionInterpolation_t* in, outQuaternionInterpolation_t* out);
        void quaternionSLERPImpl(inQuaternionInterpolation_t* in, outQuaternionInterpolation_t* out);
        void quaternionDeCasteljauCubicImpl(inDeCasteljauCubic_t* in, outDeCasteljauCubic_t* out);
        void quaternionRoundEdgeCubicImpl(inRoundEdge_t* in, outRoundEdge_t* out);
        void quaternionRoundEdgeQuarticImpl(inRoundEdge_t* in, outRoundEdge_t* out);
        void eulerToQuaternionImpl(inEulerToQuaternion_t* in, outEulerToQuaternion_t* out);
        void quaternionToEulerImpl(inQuaternionToEuler_t* in, outQuaternionToEuler_t* out);
    };

    class CCoord
    {
    private:
        pos_t coord;
        pos_t refCoord;
        pos_t swEndLim1;
        pos_t swEndLim2;
        number_t factor;
        pos_t offset;
        bool neg;
        pos_t maxChange;
        bool inSwEndLim;
        bool posDir;
        bool negDir;
        status_t applyProp(pos_t& coord) const;
        status_t removeProp(pos_t& coord) const;
    public:
        CCoord();
        status_t setCoordUser(pos_t coord_);
        status_t setCoordInternal(pos_t coord_);
        status_t setRefCoordUser(pos_t coord_);
        status_t setRefCoordInternal(pos_t coord_);
        status_t getCoordUser(pos_t& coord_) const;
        status_t getCoordInternal(pos_t& coord_) const;
        status_t getRefCoordUser(pos_t& coord_) const;
        status_t getRefCoordInternal(pos_t& coord_) const;
        status_t setSwEndLim(pos_t swEndLim1_, pos_t swEndLim2_);
        status_t setFactor(number_t factor_);
        status_t setOffset(pos_t offset_);
        status_t setMaxChange(pos_t maxChange_);
        status_t setNeg(bool state);
        status_t setInSwEndLim(bool state);
        status_t setPosDir(bool state);
        status_t setNegDir(bool state);
        status_t getSwEndLim1(pos_t& swEndLim1_) const;
        status_t getSwEndLim2(pos_t& swEndLim2_) const;
        status_t getFactor(number_t& factor_) const;
        status_t getOffset(pos_t& offset_) const;
        status_t getMaxChange(pos_t& maxChange_) const;
        bool isSwEndLim() const;
        bool isMaxChange() const;
        bool isNeg() const;
        bool isInSwEndLim() const;
        bool isNegDir() const;
        bool isPosDir() const;
        status_t checkMaxChange() const;
        status_t checkSwEndLim() const;
        status_t goToRefWithModulo();
        status_t handleSpecialProperties();
    };

    class CEntity
    {
    public:
        static const udint_t ideal = 0;
        static const udint_t cpl = 1;
    private:
        id_t id;
        bool isValidIdealCoord;
        bool isValidCplCoord;
        bool isValidIdealRefCoord;
        bool isValidCplRefCoord;
        bool isUsedAtLeastOneIdealSpecialProp;
        bool isUsedAtLeastOneCplSpecialProp;
        bool isUsedAtLeastOneIdealSwEndLim;
        bool isUsedAtLeastOneCplSwEndLim;
        bool isUsedAtLeastOneIdealMaxChange;
        bool isUsedAtLeastOneCplMaxChange;
        virtual name_t* accessName() = 0;
        virtual type_t* accessType() = 0;
        virtual CCoord* accessIdealCoord() = 0;
        virtual CCoord* accessCplCoord() = 0;
        virtual coeff_t* accessIdealToCpl() = 0;
        virtual coeff_t* accessCplToIdeal() = 0;
        virtual coeff_t* accessHelpStorage() = 0;
        virtual void setDefaultLinkMatrices() = 0;
    protected:
        index_t count;
        struct link_t
        {
            bool isUsed;
            bool isValidIdealToCpl;
            bool isValidCplToIdeal;
        } link;
        void setDefaultLinkFlags();
        status_t computeBothLinkMatrices();
        status_t invertLinkMatrix(coeff_t* A, coeff_t* B);
        void invalidateOppositeToIdealCoord();
        void invalidateOppositeToCplCoord();
        void invalidateOppositeToIdealRefCoord();
        void invalidateOppositeToCplRefCoord();
        status_t checkIdealSwEndLimCoordUser(index_t index);
        status_t checkIdealSwEndLimRefCoordUser(index_t index);
        status_t checkCplSwEndLimCoordUser(index_t index);
        status_t checkCplSwEndLimRefCoordUser(index_t index);
        status_t checkIdealSwEndLimCoordsUser();
        status_t checkIdealSwEndLimRefCoordsUser();
        status_t checkIdealSwEndLimCoordsInternal();
        status_t checkIdealSwEndLimRefCoordsInternal();
        status_t checkCplSwEndLimCoordsUser();
        status_t checkCplSwEndLimRefCoordsUser();
        status_t checkCplSwEndLimCoordsInternal();
        status_t checkCplSwEndLimRefCoordsInternal();
        CCoord* oppositeToIdealCoord();
        CCoord* oppositeToCplCoord();
        coeff_t* oppositeToIdealMatrix();
        coeff_t* oppositeToCplMatrix();
        status_t computeIdealToCpl();
        status_t computeCplToIdeal();
        status_t _computeIdealCoord(coeff_t *matrix, CCoord* coord1, CCoord* coord2);
        status_t _computeIdealRefCoord(coeff_t *matrix, CCoord* coord1, CCoord* coord2);
        status_t _computeCplCoord(coeff_t *matrix, CCoord* coord1, CCoord* coord2);
        status_t _computeCplRefCoord(coeff_t *matrix, CCoord* coord1, CCoord* coord2);
        status_t computeIdealCoord();
        status_t computeIdealRefCoord();
        status_t computeCplCoord();
        status_t computeCplRefCoord();
        status_t checkIdealMaxChange();
        status_t checkCplMaxChange();
        status_t checkIdealSwEndLim();
        status_t checkCplSwEndLim();
        void checkIfAtLeastOneIdealMaxChange();
        void checkIfAtLeastOneCplMaxChange();
        void checkIfAtLeastOneIdealSwEndLim();
        void checkIfAtLeastOneCplSwEndLim();
        void checkIfAtLeastOneIdealSpecialProp();
        void checkIfAtLeastOneCplSpecialProp();
        status_t translateStatusFromCCoord(status_t status, index_t index, udint_t idealCplState);
    public:
        CEntity();
        virtual ~CEntity();
        index_t getCount() const;
        id_t getId() const;
        status_t setId(id_t id_);
        type_t getType(index_t index);
        name_t getName(index_t index);
        type_t* getTypes();
        name_t* getNames();
        status_t setType(index_t index, type_t type_);
        status_t setName(index_t index, name_t name_);
        status_t setTypes(type_t* buffer);
        status_t setNames(name_t* buffer);
        status_t setIdealCoordUser(index_t index, pos_t coord);
        status_t setCplCoordUser(index_t index, pos_t coord);
        status_t setIdealRefCoordUser(index_t index, pos_t coord);
        status_t setCplRefCoordUser(index_t index, pos_t coord);
        status_t getIdealCoordUser(index_t index, pos_t& coord);
        status_t getCplCoordUser(index_t index, pos_t& coord);
        status_t getIdealRefCoordUser(index_t index, pos_t& coord);
        status_t getCplRefCoordUser(index_t index, pos_t& coord);
        status_t setIdealCoordsUser(p_lreal_t buffer);
        status_t setCplCoordsUser(p_lreal_t buffer);
        status_t setIdealCoordsInternal(p_lreal_t buffer);
        status_t setCplCoordsInternal(p_lreal_t buffer);
        status_t setIdealRefCoordsUser(p_lreal_t buffer);
        status_t setCplRefCoordsUser(p_lreal_t buffer);
        status_t setIdealRefCoordsInternal(p_lreal_t buffer);
        status_t setCplRefCoordsInternal(p_lreal_t buffer);
        status_t getIdealCoordsUser(p_lreal_t buffer);
        status_t getCplCoordsUser(p_lreal_t buffer);
        status_t getIdealCoordsInternal(p_lreal_t buffer);
        status_t getCplCoordsInternal(p_lreal_t buffer);
        status_t getIdealRefCoordsUser(p_lreal_t buffer);
        status_t getCplRefCoordsUser(p_lreal_t buffer);
        status_t getIdealRefCoordsInternal(p_lreal_t buffer);
        status_t getCplRefCoordsInternal(p_lreal_t buffer);
        status_t setIdealSwEndLim(index_t index, pos_t swEndLim1, pos_t swEndLim2);
        status_t setCplSwEndLim(index_t index, pos_t swEndLim1, pos_t swEndLim2);
        status_t setIdealFactor(index_t index, number_t factor);
        status_t setCplFactor(index_t index, number_t factor);
        status_t setIdealOffset(index_t index, pos_t offset);
        status_t setCplOffset(index_t index, pos_t offset);
        status_t setIdealMaxChange(index_t index, pos_t maxChange);
        status_t setCplMaxChange(index_t index, pos_t maxChange);
        status_t disIdealSwEndLim(index_t index);
        status_t disCplSwEndLim(index_t index);
        status_t disIdealFactor(index_t index);
        status_t disCplFactor(index_t index);
        status_t disIdealMaxChange(index_t index);
        status_t disCplMaxChange(index_t index);
        status_t disIdealOffset(index_t index);
        status_t disCplOffset(index_t index);
        status_t setIdealNeg(index_t index, bool state);
        status_t setCplNeg(index_t index, bool state);
        status_t setIdealInSwEndLim(index_t index, bool state);
        status_t setCplInSwEndLim(index_t index, bool state);
        status_t setIdealPosDir(index_t index, bool state);
        status_t setCplPosDir(index_t index, bool state);
        status_t setIdealNegDir(index_t index, bool state);
        status_t setCplNegDir(index_t index, bool state);
        status_t getIdealSwEndLim1(index_t index, pos_t& swEndLim1);
        status_t getCplSwEndLim1(index_t index, pos_t& swEndLim1);
        status_t getIdealSwEndLim2(index_t index, pos_t& swEndLim2);
        status_t getCplSwEndLim2(index_t index, pos_t& swEndLim2);
        status_t getIdealFactor(index_t index, number_t& factor);
        status_t getCplFactor(index_t index, number_t& factor);
        status_t getIdealOffset(index_t index, pos_t& offset);
        status_t getCplOffset(index_t index, pos_t& offset);
        status_t getIdealMaxChange(index_t index, pos_t& offset);
        status_t getCplMaxChange(index_t index, pos_t& offset);
        bool isIdealNeg(index_t index);
        bool isCplNeg(index_t index);
        bool isIdealInSwEndLim(index_t index);
        bool isCplInSwEndLim(index_t index);
        bool isIdealNegDir(index_t index);
        bool isCplNegDir(index_t index);
        bool isIdealPosDir(index_t index);
        bool isCplPosDir(index_t index);
        status_t setIdealToCplCoeff(index_t i, index_t j, coeff_t coeff_ij);
        status_t setCplToIdealCoeff(index_t i, index_t j, coeff_t coeff_ij);
        status_t getIdealToCplCoeff(index_t i, index_t j, coeff_t& coeff);
        status_t getCplToIdealCoeff(index_t i, index_t j, coeff_t& coeff);
        status_t disCoupling();
        status_t checkSwEndLim();
        status_t checkMaxChange();
        status_t goToRefWithModulo();
        status_t handleSpecialProperties();
    };

    class CVariant
    {
    private:
        variant_t variant;
    public:
        CVariant();
        variant_t get() const;
        status_t set(variant_t variant_);
    };

    struct ZPosition_t
    {
        type_t type;
        index_t index[3];
    };
    struct ZOrientation_t
    {
        type_t type;
        index_t index[4];
    };
    struct ZInterpretation_t
    {
        ZPosition_t position;
        ZOrientation_t orientation;
    };
    class CAdvancedRobot : public CStdRobot
    {
    public:
        static const index_t variantCount = 4;
        static const index_t entityCount = 4 * variantCount + 1;
        static const udint_t oriUndefined = 0;
        static const udint_t oriQuaternion = 1;
        static const udint_t oriEulerAngles = 2;
        static const udint_t oriDirectionVector = 3;
        static const udint_t oriRotXY = 4;
        static const udint_t oriRotXZ = 5;
        static const udint_t oriRotYZ = 6;
        static const udint_t oriRotX = 7;
        static const udint_t oriRotY = 8;
        static const udint_t oriRotZ = 9;
        static const udint_t posUndefined = 0;
        static const udint_t posXYZ = 1;
        static const udint_t posXY = 4;
        static const udint_t posXZ = 5;
        static const udint_t posYZ = 6;
        static const udint_t posX = 7;
        static const udint_t posY = 8;
        static const udint_t posZ = 9;
    protected:
        CAdvancedRobot();
    public:
        CAdvancedRobot(const CAdvancedRobot &robot);
    private:
        id_t robotID;
        static const index_t getJointsPosFlagIdx = 0;
        static const index_t getModeFlagIdx = 1;
        static const index_t getSizeFlagIdx = 2;
        static const index_t getJacobianFlagIdx = 3;
        static const index_t numberOfUpToDateFlags = 4;
        bool upToDate[numberOfUpToDateFlags];
        bool allUpToDateFlagsCleaned;
        void cleanAllUpToDateFlags();
        void cleanAllUpToDateFlagsBut(index_t index);
        virtual void cleanUpToDateFlags(id_t methodID, bool cleanAll);
        virtual CEntity& accessJoint() = 0;
        virtual CEntity& accessPath() = 0;
        virtual CEntity& accessAdd() = 0;
        virtual CEntity& accessCtrl() = 0;
        virtual CEntity& accessPath(variant_t variant) = 0;
        virtual CEntity& accessAdd(variant_t variant) = 0;
        virtual CEntity& accessCtrl(variant_t variant) = 0;
        virtual p_lreal_t accessJointCoord() = 0;
        virtual p_lreal_t accessJointRefCoord() = 0;
        virtual p_lreal_t accessPathCoord() = 0;
        virtual p_lreal_t accessPathRefCoord() = 0;
        virtual p_lreal_t accessAddCoord() = 0;
        virtual p_lreal_t accessCtrlCoord() = 0;
        virtual p_lreal_t accessJointPosition() = 0;
        virtual p_lreal_t accessRobotSize() = 0;
        virtual p_lreal_t accessJacobian() = 0;
        virtual index_t jointPositionCount() = 0;
    protected:
        CVariant variant;
        void switchVariantImpl(variant_t variant_);
        variant_t getVariantImpl();
    protected:
        void (CAdvancedRobot::*pCompDirect[variantCount])();
        void (CAdvancedRobot::*pCompInverse[variantCount])();
        void (CAdvancedRobot::*pCompJacobian[variantCount])(p_lreal_t buffer);
        lreal_t (CAdvancedRobot::*pCompJacobianCoeff[variantCount])(index_t index_i, index_t index_j);
        void (CAdvancedRobot::*pCompTcpPositionFromPath[variantCount])(p_lreal_t buffer);
        void (CAdvancedRobot::*pCompTcpQuaternionFromPath[variantCount])(p_lreal_t buffer);
        void (CAdvancedRobot::*pCompPathFromTcpPosition[variantCount])(p_lreal_t buffer);
        void (CAdvancedRobot::*pCompPathFromTcpQuaternion[variantCount])(p_lreal_t buffer);
        mode_t currentMode;
        ZInterpretation_t ZInterpretation[variantCount];
    protected:
        void directImpl();
        void inverseImpl();
        pos_t getJointPosXImpl(index_t index);
        pos_t getJointPosYImpl(index_t index);
        pos_t getJointPosZImpl(index_t index);
        void getJointsPosImpl(p_lreal_t buffer);
        pos_t getSizeXImpl();
        pos_t getSizeYImpl();
        pos_t getSizeZImpl();
        void getSizeImpl(p_lreal_t buffer);
        mode_t getModeImpl();
        void getJacobianImpl(p_lreal_t buffer);
        lreal_t getJacobianCoeffImpl(index_t i, index_t j);
        p_lreal_t getGeneralJacobianImpl();
        lreal_t getGeneralJacobianCoeffImpl(index_t i, index_t j);
        void getTcpPositionImpl(p_lreal_t buffer);
        void getTcpQuaternionImpl(p_lreal_t buffer);
        void setTcpPositionImpl(p_lreal_t buffer);
        void setTcpQuaternionImpl(p_lreal_t buffer);
    protected:
        void setIdealJointRefCoordImpl(index_t index, pos_t coord);
        void setIdealJointRefCoordsImpl(p_lreal_t buffer);
        pos_t getIdealJointRefCoordImpl(index_t index);
        void getIdealJointRefCoordsImpl(p_lreal_t buffer);
    protected:
        void setCplJointRefCoordImpl(index_t index, pos_t coord);
        void setCplJointRefCoordsImpl(p_lreal_t buffer);
        pos_t getCplJointRefCoordImpl(index_t index);
        void getCplJointRefCoordsImpl(p_lreal_t buffer);
    protected:
        index_t getJointCountImpl();
    protected:
        type_t getJointTypeImpl(index_t index);
    protected:
        type_t getJointNameImpl(index_t index);
    protected:
        void disJointCouplingImpl();
    protected:
        void setJointIdealToCplCoeffImpl(index_t i, index_t j, coeff_t coeff_ij);
        coeff_t getJointIdealToCplCoeffImpl(index_t i, index_t j);
    protected:
        void setJointCplToIdealCoeffImpl(index_t i, index_t j, coeff_t coeff_ij);
        coeff_t getJointCplToIdealCoeffImpl(index_t i, index_t j);
    protected:
        void setIdealJointSwEndLimImpl(index_t index, pos_t swEndLim , pos_t swEndLim2);
        void setIdealJointFactorImpl(index_t index, number_t factor);
        void setIdealJointOffsetImpl(index_t index, pos_t offset);
        void setIdealJointMaxChangeImpl(index_t index, pos_t maxChange);
        void disIdealJointSwEndLimImpl(index_t index);
        void disIdealJointFactorImpl(index_t index);
        void disIdealJointOffsetImpl(index_t index);
        void disIdealJointMaxChangeImpl(index_t index);
        void setIdealJointNegImpl(index_t index, bool state);
        void setIdealJointInSwEndLimImpl(index_t index, bool state);
        void setIdealJointPosDirImpl(index_t index, bool state);
        void setIdealJointNegDirImpl(index_t index, bool state);
        pos_t getIdealJointSwEndLim1Impl(index_t index);
        pos_t getIdealJointSwEndLim2Impl(index_t index);
        number_t getIdealJointFactorImpl(index_t index);
        pos_t getIdealJointOffsetImpl(index_t index);
        pos_t getIdealJointMaxChangeImpl(index_t index);
        bool isIdealJointNegImpl(index_t index);
        bool isIdealJointInSwEndLimImpl(index_t index);
        bool isIdealJointPosDirImpl(index_t index);
        bool isIdealJointNegDirImpl(index_t index);
    protected:
        void setCplJointSwEndLimImpl(index_t index, pos_t swEndLim , pos_t swEndLim2);
        void setCplJointFactorImpl(index_t index, number_t factor);
        void setCplJointOffsetImpl(index_t index, pos_t offset);
        void setCplJointMaxChangeImpl(index_t index, pos_t maxChange);
        void disCplJointSwEndLimImpl(index_t index);
        void disCplJointFactorImpl(index_t index);
        void disCplJointOffsetImpl(index_t index);
        void disCplJointMaxChangeImpl(index_t index);
        void setCplJointNegImpl(index_t index, bool state);
        void setCplJointInSwEndLimImpl(index_t index, bool state);
        void setCplJointPosDirImpl(index_t index, bool state);
        void setCplJointNegDirImpl(index_t index, bool state);
        pos_t getCplJointSwEndLim1Impl(index_t index);
        pos_t getCplJointSwEndLim2Impl(index_t index);
        number_t getCplJointFactorImpl(index_t index);
        pos_t getCplJointOffsetImpl(index_t index);
        pos_t getCplJointMaxChangeImpl(index_t index);
        bool isCplJointNegImpl(index_t index);
        bool isCplJointInSwEndLimImpl(index_t index);
        bool isCplJointPosDirImpl(index_t index);
        bool isCplJointNegDirImpl(index_t index);
    protected:
        void setIdealJointCoordImpl(index_t index, pos_t coord);
        void setIdealJointCoordsImpl(p_lreal_t buffer);
        pos_t getIdealJointCoordImpl(index_t index);
        void getIdealJointCoordsImpl(p_lreal_t buffer);
    protected:
        void setCplJointCoordImpl(index_t index, pos_t coord);
        void setCplJointCoordsImpl(p_lreal_t buffer);
        pos_t getCplJointCoordImpl(index_t index);
        void getCplJointCoordsImpl(p_lreal_t buffer);
    protected:
        void setIdealPathRefCoordImpl(index_t index, pos_t coord);
        void setIdealPathRefCoordsImpl(p_lreal_t buffer);
        pos_t getIdealPathRefCoordImpl(index_t index);
        void getIdealPathRefCoordsImpl(p_lreal_t buffer);
    protected:
        void setCplPathRefCoordImpl(index_t index, pos_t coord);
        void setCplPathRefCoordsImpl(p_lreal_t buffer);
        pos_t getCplPathRefCoordImpl(index_t index);
        void getCplPathRefCoordsImpl(p_lreal_t buffer);
    protected:
        index_t getPathCountImpl();
    protected:
        type_t getPathTypeImpl(index_t index);
    protected:
        type_t getPathNameImpl(index_t index);
    protected:
        void disPathCouplingImpl();
    protected:
        void setPathIdealToCplCoeffImpl(index_t i, index_t j, coeff_t coeff_ij);
        coeff_t getPathIdealToCplCoeffImpl(index_t i, index_t j);
    protected:
        void setPathCplToIdealCoeffImpl(index_t i, index_t j, coeff_t coeff_ij);
        coeff_t getPathCplToIdealCoeffImpl(index_t i, index_t j);
    protected:
        void setIdealPathSwEndLimImpl(index_t index, pos_t swEndLim , pos_t swEndLim2);
        void setIdealPathFactorImpl(index_t index, number_t factor);
        void setIdealPathOffsetImpl(index_t index, pos_t offset);
        void setIdealPathMaxChangeImpl(index_t index, pos_t maxChange);
        void disIdealPathSwEndLimImpl(index_t index);
        void disIdealPathFactorImpl(index_t index);
        void disIdealPathOffsetImpl(index_t index);
        void disIdealPathMaxChangeImpl(index_t index);
        void setIdealPathNegImpl(index_t index, bool state);
        void setIdealPathInSwEndLimImpl(index_t index, bool state);
        void setIdealPathPosDirImpl(index_t index, bool state);
        void setIdealPathNegDirImpl(index_t index, bool state);
        pos_t getIdealPathSwEndLim1Impl(index_t index);
        pos_t getIdealPathSwEndLim2Impl(index_t index);
        number_t getIdealPathFactorImpl(index_t index);
        pos_t getIdealPathOffsetImpl(index_t index);
        pos_t getIdealPathMaxChangeImpl(index_t index);
        bool isIdealPathNegImpl(index_t index);
        bool isIdealPathInSwEndLimImpl(index_t index);
        bool isIdealPathPosDirImpl(index_t index);
        bool isIdealPathNegDirImpl(index_t index);
    protected:
        void setCplPathSwEndLimImpl(index_t index, pos_t swEndLim , pos_t swEndLim2);
        void setCplPathFactorImpl(index_t index, number_t factor);
        void setCplPathOffsetImpl(index_t index, pos_t offset);
        void setCplPathMaxChangeImpl(index_t index, pos_t maxChange);
        void disCplPathSwEndLimImpl(index_t index);
        void disCplPathFactorImpl(index_t index);
        void disCplPathOffsetImpl(index_t index);
        void disCplPathMaxChangeImpl(index_t index);
        void setCplPathNegImpl(index_t index, bool state);
        void setCplPathInSwEndLimImpl(index_t index, bool state);
        void setCplPathPosDirImpl(index_t index, bool state);
        void setCplPathNegDirImpl(index_t index, bool state);
        pos_t getCplPathSwEndLim1Impl(index_t index);
        pos_t getCplPathSwEndLim2Impl(index_t index);
        number_t getCplPathFactorImpl(index_t index);
        pos_t getCplPathOffsetImpl(index_t index);
        pos_t getCplPathMaxChangeImpl(index_t index);
        bool isCplPathNegImpl(index_t index);
        bool isCplPathInSwEndLimImpl(index_t index);
        bool isCplPathPosDirImpl(index_t index);
        bool isCplPathNegDirImpl(index_t index);
    protected:
        void setIdealPathCoordImpl(index_t index, pos_t coord);
        void setIdealPathCoordsImpl(p_lreal_t buffer);
        pos_t getIdealPathCoordImpl(index_t index);
        void getIdealPathCoordsImpl(p_lreal_t buffer);
    protected:
        void setCplPathCoordImpl(index_t index, pos_t coord);
        void setCplPathCoordsImpl(p_lreal_t buffer);
        pos_t getCplPathCoordImpl(index_t index);
        void getCplPathCoordsImpl(p_lreal_t buffer);
    protected:
        index_t getAddCountImpl();
    protected:
        type_t getAddTypeImpl(index_t index);
    protected:
        type_t getAddNameImpl(index_t index);
    protected:
        void disAddCouplingImpl();
    protected:
        void setAddIdealToCplCoeffImpl(index_t i, index_t j, coeff_t coeff_ij);
        coeff_t getAddIdealToCplCoeffImpl(index_t i, index_t j);
    protected:
        void setAddCplToIdealCoeffImpl(index_t i, index_t j, coeff_t coeff_ij);
        coeff_t getAddCplToIdealCoeffImpl(index_t i, index_t j);
    protected:
        void setIdealAddSwEndLimImpl(index_t index, pos_t swEndLim , pos_t swEndLim2);
        void setIdealAddFactorImpl(index_t index, number_t factor);
        void setIdealAddOffsetImpl(index_t index, pos_t offset);
        void setIdealAddMaxChangeImpl(index_t index, pos_t maxChange);
        void disIdealAddSwEndLimImpl(index_t index);
        void disIdealAddFactorImpl(index_t index);
        void disIdealAddOffsetImpl(index_t index);
        void disIdealAddMaxChangeImpl(index_t index);
        void setIdealAddNegImpl(index_t index, bool state);
        void setIdealAddInSwEndLimImpl(index_t index, bool state);
        void setIdealAddPosDirImpl(index_t index, bool state);
        void setIdealAddNegDirImpl(index_t index, bool state);
        pos_t getIdealAddSwEndLim1Impl(index_t index);
        pos_t getIdealAddSwEndLim2Impl(index_t index);
        number_t getIdealAddFactorImpl(index_t index);
        pos_t getIdealAddOffsetImpl(index_t index);
        pos_t getIdealAddMaxChangeImpl(index_t index);
        bool isIdealAddNegImpl(index_t index);
        bool isIdealAddInSwEndLimImpl(index_t index);
        bool isIdealAddPosDirImpl(index_t index);
        bool isIdealAddNegDirImpl(index_t index);
    protected:
        void setCplAddSwEndLimImpl(index_t index, pos_t swEndLim , pos_t swEndLim2);
        void setCplAddFactorImpl(index_t index, number_t factor);
        void setCplAddOffsetImpl(index_t index, pos_t offset);
        void setCplAddMaxChangeImpl(index_t index, pos_t maxChange);
        void disCplAddSwEndLimImpl(index_t index);
        void disCplAddFactorImpl(index_t index);
        void disCplAddOffsetImpl(index_t index);
        void disCplAddMaxChangeImpl(index_t index);
        void setCplAddNegImpl(index_t index, bool state);
        void setCplAddInSwEndLimImpl(index_t index, bool state);
        void setCplAddPosDirImpl(index_t index, bool state);
        void setCplAddNegDirImpl(index_t index, bool state);
        pos_t getCplAddSwEndLim1Impl(index_t index);
        pos_t getCplAddSwEndLim2Impl(index_t index);
        number_t getCplAddFactorImpl(index_t index);
        pos_t getCplAddOffsetImpl(index_t index);
        pos_t getCplAddMaxChangeImpl(index_t index);
        bool isCplAddNegImpl(index_t index);
        bool isCplAddInSwEndLimImpl(index_t index);
        bool isCplAddPosDirImpl(index_t index);
        bool isCplAddNegDirImpl(index_t index);
    protected:
        void setIdealAddCoordImpl(index_t index, pos_t coord);
        void setIdealAddCoordsImpl(p_lreal_t buffer);
        pos_t getIdealAddCoordImpl(index_t index);
        void getIdealAddCoordsImpl(p_lreal_t buffer);
    protected:
        void setCplAddCoordImpl(index_t index, pos_t coord);
        void setCplAddCoordsImpl(p_lreal_t buffer);
        pos_t getCplAddCoordImpl(index_t index);
        void getCplAddCoordsImpl(p_lreal_t buffer);
    protected:
        index_t getCtrlCountImpl();
    protected:
        type_t getCtrlTypeImpl(index_t index);
    protected:
        type_t getCtrlNameImpl(index_t index);
    protected:
        void disCtrlCouplingImpl();
    protected:
        void setCtrlIdealToCplCoeffImpl(index_t i, index_t j, coeff_t coeff_ij);
        coeff_t getCtrlIdealToCplCoeffImpl(index_t i, index_t j);
    protected:
        void setCtrlCplToIdealCoeffImpl(index_t i, index_t j, coeff_t coeff_ij);
        coeff_t getCtrlCplToIdealCoeffImpl(index_t i, index_t j);
    protected:
        void setIdealCtrlSwEndLimImpl(index_t index, pos_t swEndLim , pos_t swEndLim2);
        void setIdealCtrlFactorImpl(index_t index, number_t factor);
        void setIdealCtrlOffsetImpl(index_t index, pos_t offset);
        void setIdealCtrlMaxChangeImpl(index_t index, pos_t maxChange);
        void disIdealCtrlSwEndLimImpl(index_t index);
        void disIdealCtrlFactorImpl(index_t index);
        void disIdealCtrlOffsetImpl(index_t index);
        void disIdealCtrlMaxChangeImpl(index_t index);
        void setIdealCtrlNegImpl(index_t index, bool state);
        void setIdealCtrlInSwEndLimImpl(index_t index, bool state);
        void setIdealCtrlPosDirImpl(index_t index, bool state);
        void setIdealCtrlNegDirImpl(index_t index, bool state);
        pos_t getIdealCtrlSwEndLim1Impl(index_t index);
        pos_t getIdealCtrlSwEndLim2Impl(index_t index);
        number_t getIdealCtrlFactorImpl(index_t index);
        pos_t getIdealCtrlOffsetImpl(index_t index);
        pos_t getIdealCtrlMaxChangeImpl(index_t index);
        bool isIdealCtrlNegImpl(index_t index);
        bool isIdealCtrlInSwEndLimImpl(index_t index);
        bool isIdealCtrlPosDirImpl(index_t index);
        bool isIdealCtrlNegDirImpl(index_t index);
    protected:
        void setCplCtrlSwEndLimImpl(index_t index, pos_t swEndLim , pos_t swEndLim2);
        void setCplCtrlFactorImpl(index_t index, number_t factor);
        void setCplCtrlOffsetImpl(index_t index, pos_t offset);
        void setCplCtrlMaxChangeImpl(index_t index, pos_t maxChange);
        void disCplCtrlSwEndLimImpl(index_t index);
        void disCplCtrlFactorImpl(index_t index);
        void disCplCtrlOffsetImpl(index_t index);
        void disCplCtrlMaxChangeImpl(index_t index);
        void setCplCtrlNegImpl(index_t index, bool state);
        void setCplCtrlInSwEndLimImpl(index_t index, bool state);
        void setCplCtrlPosDirImpl(index_t index, bool state);
        void setCplCtrlNegDirImpl(index_t index, bool state);
        pos_t getCplCtrlSwEndLim1Impl(index_t index);
        pos_t getCplCtrlSwEndLim2Impl(index_t index);
        number_t getCplCtrlFactorImpl(index_t index);
        pos_t getCplCtrlOffsetImpl(index_t index);
        pos_t getCplCtrlMaxChangeImpl(index_t index);
        bool isCplCtrlNegImpl(index_t index);
        bool isCplCtrlInSwEndLimImpl(index_t index);
        bool isCplCtrlPosDirImpl(index_t index);
        bool isCplCtrlNegDirImpl(index_t index);
    protected:
        void setIdealCtrlCoordImpl(index_t index, pos_t coord);
        void setIdealCtrlCoordsImpl(p_lreal_t buffer);
        pos_t getIdealCtrlCoordImpl(index_t index);
        void getIdealCtrlCoordsImpl(p_lreal_t buffer);
    protected:
        void setCplCtrlCoordImpl(index_t index, pos_t coord);
        void setCplCtrlCoordsImpl(p_lreal_t buffer);
        pos_t getCplCtrlCoordImpl(index_t index);
        void getCplCtrlCoordsImpl(p_lreal_t buffer);
    protected:
        index_t getJointPositionCountImpl();
        id_t getRobotIDImpl();
        void setRobotIDImpl(id_t robotID_);
    protected:
        virtual mode_t compMode();
        virtual void compJointsPos();
        virtual void compSize();
        virtual void compGeneralJacobian();
        virtual void compJacobianA(p_lreal_t buffer);
        virtual void compJacobianB(p_lreal_t buffer);
        virtual void compJacobianC(p_lreal_t buffer);
        virtual void compJacobianD(p_lreal_t buffer);
        virtual lreal_t compJacobianACoeff(index_t i, index_t j);
        virtual lreal_t compJacobianBCoeff(index_t i, index_t j);
        virtual lreal_t compJacobianCCoeff(index_t i, index_t j);
        virtual lreal_t compJacobianDCoeff(index_t i, index_t j);
        virtual void compDirectA();
        virtual void compInverseA();
        virtual void compDirectB();
        virtual void compInverseB();
        virtual void compDirectC();
        virtual void compInverseC();
        virtual void compDirectD();
        virtual void compInverseD();
        virtual void compTcpPositionFromPathA(p_lreal_t buffer);
        virtual void compTcpPositionFromPathB(p_lreal_t buffer);
        virtual void compTcpPositionFromPathC(p_lreal_t buffer);
        virtual void compTcpPositionFromPathD(p_lreal_t buffer);
        virtual void compTcpQuaternionFromPathA(p_lreal_t buffer);
        virtual void compTcpQuaternionFromPathB(p_lreal_t buffer);
        virtual void compTcpQuaternionFromPathC(p_lreal_t buffer);
        virtual void compTcpQuaternionFromPathD(p_lreal_t buffer);
        virtual void compPathFromTcpPositionA(p_lreal_t buffer);
        virtual void compPathFromTcpPositionB(p_lreal_t buffer);
        virtual void compPathFromTcpPositionC(p_lreal_t buffer);
        virtual void compPathFromTcpPositionD(p_lreal_t buffer);
        virtual void compPathFromTcpQuaternionA(p_lreal_t buffer);
        virtual void compPathFromTcpQuaternionB(p_lreal_t buffer);
        virtual void compPathFromTcpQuaternionC(p_lreal_t buffer);
        virtual void compPathFromTcpQuaternionD(p_lreal_t buffer);
    protected:
        void readInput(CEntity& entity, p_lreal_t coord);
        void readInputRef(CEntity& entity, p_lreal_t coord);
        void writeOutput(CEntity& entity, p_lreal_t coord);
        void writeOutputSpecially(CEntity& entity, p_lreal_t coord);
        void computeRefMode();
    private:
        void dirVectorToQuaternion(p_lreal_t dirVector, p_lreal_t quaternion);
        void eulerAnglesToQuaternion(p_lreal_t eulerAngle, anglesType_t, p_lreal_t quaternion);
        void rotXToQuaternion(lreal_t angle, p_lreal_t quaternion);
        void rotYToQuaternion(lreal_t angle, p_lreal_t quaternion);
        void rotZToQuaternion(lreal_t angle, p_lreal_t quaternion);
        void rotXYToDirVector(p_lreal_t rotation, p_lreal_t dirVector);
        void rotXZToDirVector(p_lreal_t rotation, p_lreal_t dirVector);
        void rotYZToDirVector(p_lreal_t rotation, p_lreal_t dirVector);
        void quaternionToDirVector(p_lreal_t quaternion, p_lreal_t dirVector);
        void quaternionToEulerAngles(p_lreal_t quaternion, anglesType_t anglesType, p_lreal_t eulerAngle);
        void quaternionToRotX(p_lreal_t quaternion, p_lreal_t angle);
        void quaternionToRotY(p_lreal_t quaternion, p_lreal_t angle);
        void quaternionToRotZ(p_lreal_t quaternion, p_lreal_t angle);
        void dirVectorToRotXY(p_lreal_t dirVector, p_lreal_t refRotation, p_lreal_t rotation);
        void dirVectorToRotXZ(p_lreal_t dirVector, p_lreal_t refRotation, p_lreal_t rotation);
        void dirVectorToRotYZ(p_lreal_t dirVector, p_lreal_t refRotation, p_lreal_t rotation);
    protected:
        void translateStatusFromCEntity(CEntity& entity, status_t status);
        void translateStatusFromCVariant(status_t status);
        void setJointTypes(type_t* buffer);
        void setPathATypes(type_t* buffer);
        void setPathBTypes(type_t* buffer);
        void setPathCTypes(type_t* buffer);
        void setPathDTypes(type_t* buffer);
        void setAddATypes(type_t* buffer);
        void setAddBTypes(type_t* buffer);
        void setAddCTypes(type_t* buffer);
        void setAddDTypes(type_t* buffer);
        void setCtrlATypes(type_t* buffer);
        void setCtrlBTypes(type_t* buffer);
        void setCtrlCTypes(type_t* buffer);
        void setCtrlDTypes(type_t* buffer);
        void setJointNames(name_t* buffer);
        void setPathANames(name_t* buffer);
        void setPathBNames(name_t* buffer);
        void setPathCNames(name_t* buffer);
        void setPathDNames(name_t* buffer);
        void setAddANames(name_t* buffer);
        void setAddBNames(name_t* buffer);
        void setAddCNames(name_t* buffer);
        void setAddDNames(name_t* buffer);
        void setCtrlANames(name_t* buffer);
        void setCtrlBNames(name_t* buffer);
        void setCtrlCNames(name_t* buffer);
        void setCtrlDNames(name_t* buffer);
    };

    template <index_t Count>
    class TEntity: public CEntity
    {
    private:
        type_t type[((Count) > (1) ? (Count) : (1))];
        name_t name[((Count) > (1) ? (Count) : (1))];
        CCoord idealCoord[((Count) > (1) ? (Count) : (1))];
        CCoord cplCoord[((Count) > (1) ? (Count) : (1))];
        struct linkData_t
        {
            coeff_t idealToCpl[((Count) > (1) ? (Count) : (1)) * ((Count) > (1) ? (Count) : (1))];
            coeff_t cplToIdeal[((Count) > (1) ? (Count) : (1)) * ((Count) > (1) ? (Count) : (1))];
            coeff_t helpStorage[((Count) > (1) ? (Count) : (1)) * ((Count) > (1) ? (Count) : (1))];
        } linkData;
        name_t* accessName();
        type_t* accessType();
        CCoord* accessIdealCoord();
        CCoord* accessCplCoord();
        coeff_t* accessIdealToCpl();
        coeff_t* accessCplToIdeal();
        coeff_t* accessHelpStorage();
        void setDefaultLinkMatrices();
    public:
        TEntity();
        TEntity(const TEntity &entity);
        virtual ~TEntity();
    };

    template <
    index_t JointPositionCount = 0,
            index_t GeneralJacobianRowCount = 0,
            index_t JointCount = 0,
            index_t PathACount = 0,
            index_t AddACount = 0,
            index_t CtrlACount = 0,
            index_t PathBCount = 0,
            index_t AddBCount = 0,
            index_t CtrlBCount = 0,
            index_t PathCCount = 0,
            index_t CtrlCCount = 0,
            index_t AddCCount = 0,
            index_t PathDCount = 0,
            index_t AddDCount = 0,
            index_t CtrlDCount = 0
            >
    class TRobot: public CAdvancedRobot
    {
    protected:
        TRobot();
    public:
        TRobot(const TRobot &robot);
        virtual ~TRobot();
    private:
        TEntity <JointCount> Joint;
        TEntity <PathACount> PathA;
        TEntity <AddACount> AddA;
        TEntity <CtrlACount> CtrlA;
        TEntity <PathBCount> PathB;
        TEntity <AddBCount> AddB;
        TEntity <CtrlBCount> CtrlB;
        TEntity <PathCCount> PathC;
        TEntity <AddCCount> AddC;
        TEntity <CtrlCCount> CtrlC;
        TEntity <PathDCount> PathD;
        TEntity <AddDCount> AddD;
        TEntity <CtrlDCount> CtrlD;
        const CEntity* pPath[CAdvancedRobot::variantCount];
        const CEntity* pAdd[CAdvancedRobot::variantCount];
        const CEntity* pCtrl[CAdvancedRobot::variantCount];
        CEntity& accessJoint();
        CEntity& accessPath();
        CEntity& accessAdd();
        CEntity& accessCtrl();
        CEntity& accessPath(variant_t variant_);
        CEntity& accessAdd(variant_t variant_);
        CEntity& accessCtrl(variant_t variant_);
        p_lreal_t accessJointCoord();
        p_lreal_t accessJointRefCoord();
        p_lreal_t accessPathCoord();
        p_lreal_t accessPathRefCoord();
        p_lreal_t accessAddCoord();
        p_lreal_t accessCtrlCoord();
        p_lreal_t accessJointPosition();
        p_lreal_t accessRobotSize();
        p_lreal_t accessJacobian();
        index_t jointPositionCount();
    protected:
        pos_t jointCoord[((1) > (JointCount) ? (1) : (JointCount))];
        pos_t jointRefCoord[((1) > (JointCount) ? (1) : (JointCount))];
        pos_t pathCoord[((1) > (((PathACount) > (PathBCount) ? ((PathACount) > (PathCCount) ? ((PathACount) > (PathDCount) ? (PathACount) : (PathDCount)) : ((PathCCount) > (PathDCount) ? (PathCCount) : (PathDCount))) : ((PathBCount) > (PathCCount) ? ((PathBCount) > (PathDCount) ? (PathBCount) : (PathDCount)) : ((PathCCount) > (PathDCount) ? (PathCCount) : (PathDCount))))) ? (1) : (((PathACount) > (PathBCount) ? ((PathACount) > (PathCCount) ? ((PathACount) > (PathDCount) ? (PathACount) : (PathDCount)) : ((PathCCount) > (PathDCount) ? (PathCCount) : (PathDCount))) : ((PathBCount) > (PathCCount) ? ((PathBCount) > (PathDCount) ? (PathBCount) : (PathDCount)) : ((PathCCount) > (PathDCount) ? (PathCCount) : (PathDCount))))))];
        pos_t pathRefCoord[((1) > (((PathACount) > (PathBCount) ? ((PathACount) > (PathCCount) ? ((PathACount) > (PathDCount) ? (PathACount) : (PathDCount)) : ((PathCCount) > (PathDCount) ? (PathCCount) : (PathDCount))) : ((PathBCount) > (PathCCount) ? ((PathBCount) > (PathDCount) ? (PathBCount) : (PathDCount)) : ((PathCCount) > (PathDCount) ? (PathCCount) : (PathDCount))))) ? (1) : (((PathACount) > (PathBCount) ? ((PathACount) > (PathCCount) ? ((PathACount) > (PathDCount) ? (PathACount) : (PathDCount)) : ((PathCCount) > (PathDCount) ? (PathCCount) : (PathDCount))) : ((PathBCount) > (PathCCount) ? ((PathBCount) > (PathDCount) ? (PathBCount) : (PathDCount)) : ((PathCCount) > (PathDCount) ? (PathCCount) : (PathDCount))))))];
        pos_t addCoord[((1) > (((AddACount) > (AddBCount) ? ((AddACount) > (AddCCount) ? ((AddACount) > (AddDCount) ? (AddACount) : (AddDCount)) : ((AddCCount) > (AddDCount) ? (AddCCount) : (AddDCount))) : ((AddBCount) > (AddCCount) ? ((AddBCount) > (AddDCount) ? (AddBCount) : (AddDCount)) : ((AddCCount) > (AddDCount) ? (AddCCount) : (AddDCount))))) ? (1) : (((AddACount) > (AddBCount) ? ((AddACount) > (AddCCount) ? ((AddACount) > (AddDCount) ? (AddACount) : (AddDCount)) : ((AddCCount) > (AddDCount) ? (AddCCount) : (AddDCount))) : ((AddBCount) > (AddCCount) ? ((AddBCount) > (AddDCount) ? (AddBCount) : (AddDCount)) : ((AddCCount) > (AddDCount) ? (AddCCount) : (AddDCount))))))];
        pos_t ctrlCoord[((1) > (((CtrlACount) > (CtrlBCount) ? ((CtrlACount) > (CtrlCCount) ? ((CtrlACount) > (CtrlDCount) ? (CtrlACount) : (CtrlDCount)) : ((CtrlCCount) > (CtrlDCount) ? (CtrlCCount) : (CtrlDCount))) : ((CtrlBCount) > (CtrlCCount) ? ((CtrlBCount) > (CtrlDCount) ? (CtrlBCount) : (CtrlDCount)) : ((CtrlCCount) > (CtrlDCount) ? (CtrlCCount) : (CtrlDCount))))) ? (1) : (((CtrlACount) > (CtrlBCount) ? ((CtrlACount) > (CtrlCCount) ? ((CtrlACount) > (CtrlDCount) ? (CtrlACount) : (CtrlDCount)) : ((CtrlCCount) > (CtrlDCount) ? (CtrlCCount) : (CtrlDCount))) : ((CtrlBCount) > (CtrlCCount) ? ((CtrlBCount) > (CtrlDCount) ? (CtrlBCount) : (CtrlDCount)) : ((CtrlCCount) > (CtrlDCount) ? (CtrlCCount) : (CtrlDCount))))))];
        lreal_t jointPosition[((1) > (JointPositionCount) ? (1) : (JointPositionCount))][3];
        lreal_t robotSize[3];
        lreal_t jacobian[((1) > (GeneralJacobianRowCount * JointCount) ? (1) : (GeneralJacobianRowCount * JointCount))];
    };

    class CMech01
    {
    public:
        length_t rod1;
        length_t rod2;
        length_t slider1x;
        length_t slider1z;
        length_t slider2x;
        length_t slider2z;
        bool concave;
        CMech01();
    };
    class CRobot01: public TRobot<
        0,
        0,
        2,
        2,
        0,
        0
        >
    {
    public:
        CRobot01();

    public:
        void setMechRod1(length_t rod1);
        length_t getMechRod1();
    protected:
        void setMechRod1Impl(length_t rod1);
        length_t getMechRod1Impl();
    public:
        void setMechRod2(length_t rod2);
        length_t getMechRod2();
    protected:
        void setMechRod2Impl(length_t rod2);
        length_t getMechRod2Impl();
    public:
        void setMechSlider1x(length_t slider1x);
        length_t getMechSlider1x();
    protected:
        void setMechSlider1xImpl(length_t slider1x);
        length_t getMechSlider1xImpl();
    public:
        void setMechSlider1z(length_t slider1z);
        length_t getMechSlider1z();
    protected:
        void setMechSlider1zImpl(length_t slider1z);
        length_t getMechSlider1zImpl();
    public:
        void setMechSlider2x(length_t slider2x);
        length_t getMechSlider2x();
    protected:
        void setMechSlider2xImpl(length_t slider2x);
        length_t getMechSlider2xImpl();
    public:
        void setMechSlider2z(length_t slider2z);
        length_t getMechSlider2z();
    protected:
        void setMechSlider2zImpl(length_t slider2z);
        length_t getMechSlider2zImpl();
    public:
        void setMechConcave(bool concave);
        bool isMechConcave();
    protected:
        void setMechConcaveImpl(bool concave);
        bool isMechConcaveImpl();
        CRobot* cloneImpl();
    private:
        CMech01 mech;
        virtual void validateMech();
        virtual void compDirectA();
        virtual void compInverseA();
        virtual mode_t compMode();
        void compDirect(p_lreal_t TCP);
    };

    class CMech02
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a1xy;
        length_t a2xy;
        CMech02();
    };
    class CRobot02: public TRobot<
        4,
        0,
        2,
        2,
        0,
        0
        >
    {
    public:
        CRobot02();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA1xy(length_t a1xy);
        length_t getMechA1xy();
    protected:
        void setMechA1xyImpl(length_t a1xy);
        length_t getMechA1xyImpl();
    public:
        void setMechA2xy(length_t a2xy);
        length_t getMechA2xy();
    protected:
        void setMechA2xyImpl(length_t a2xy);
        length_t getMechA2xyImpl();
        CRobot* cloneImpl();
    private:
        CMech02 mech;
        virtual void validateMech();
        virtual void compDirectA();
        virtual void compInverseA();
        virtual void compJointsPos();
        virtual mode_t compMode();
    };

    class CMech03
    {
    public:
        length_t l1Left;
        length_t l2Left;
        length_t l1Right;
        length_t l2Right;
        length_t x0Left;
        length_t y0Left;
        length_t x0Right;
        length_t y0Right;
        bool negative;
        CMech03();
    };
    typedef struct CRobot03Nodes_t
    {
        lreal_t A0Left[2];
        lreal_t A0Right[2];
        lreal_t ElbowLeft[2];
        lreal_t ElbowRight[2];
        lreal_t MP[2];
    } CRobot03Nodes_t;
    class CRobot03: public TRobot<
        0,
        0,
        2,
        2,
        0,
        0
        >
    {
    public:
        CRobot03();

    public:
        void setMechL1Left(length_t l1Left);
        length_t getMechL1Left();
    protected:
        void setMechL1LeftImpl(length_t l1Left);
        length_t getMechL1LeftImpl();
    public:
        void setMechL2Left(length_t l2Left);
        length_t getMechL2Left();
    protected:
        void setMechL2LeftImpl(length_t l2Left);
        length_t getMechL2LeftImpl();
    public:
        void setMechL1Right(length_t l1Right);
        length_t getMechL1Right();
    protected:
        void setMechL1RightImpl(length_t l1Right);
        length_t getMechL1RightImpl();
    public:
        void setMechL2Right(length_t l2Right);
        length_t getMechL2Right();
    protected:
        void setMechL2RightImpl(length_t l2Right);
        length_t getMechL2RightImpl();
    public:
        void setMechX0Left(length_t x0Left);
        length_t getMechX0Left();
    protected:
        void setMechX0LeftImpl(length_t x0Left);
        length_t getMechX0LeftImpl();
    public:
        void setMechY0Left(length_t y0Left);
        length_t getMechY0Left();
    protected:
        void setMechY0LeftImpl(length_t y0Left);
        length_t getMechY0LeftImpl();
    public:
        void setMechX0Right(length_t x0Right);
        length_t getMechX0Right();
    protected:
        void setMechX0RightImpl(length_t x0Right);
        length_t getMechX0RightImpl();
    public:
        void setMechY0Right(length_t y0Right);
        length_t getMechY0Right();
    protected:
        void setMechY0RightImpl(length_t y0Right);
        length_t getMechY0RightImpl();
    public:
        void setMechNegative(bool negative);
        bool isMechNegative();
    protected:
        void setMechNegativeImpl(bool negative);
        bool isMechNegativeImpl();
        CRobot* cloneImpl();
    private:
        CMech03 mech;
        virtual void validateMech();
        virtual void compDirectA();
        virtual void compInverseA();
        virtual mode_t compMode();
        void compNodes(CRobot03Nodes_t& nodes);
    };

    class CMech04
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a0z;
        length_t a1x;
        length_t a1y;
        length_t a1z;
        length_t a2x;
        length_t a2y;
        length_t a2z;
        length_t a3x;
        length_t a3y;
        length_t a3z;
        length_t a4x;
        length_t a5x;
        CAnglesType anglesType;
        CMech04();
    };
    class CRobot04: public TRobot<
        7,
        0,
        6,
        6,
        0,
        0,
        7,
        0,
        0
        >
    {
    public:
        CRobot04();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1x(length_t a1x);
        length_t getMechA1x();
    protected:
        void setMechA1xImpl(length_t a1x);
        length_t getMechA1xImpl();
    public:
        void setMechA1y(length_t a1y);
        length_t getMechA1y();
    protected:
        void setMechA1yImpl(length_t a1y);
        length_t getMechA1yImpl();
    public:
        void setMechA1z(length_t a1z);
        length_t getMechA1z();
    protected:
        void setMechA1zImpl(length_t a1z);
        length_t getMechA1zImpl();
    public:
        void setMechA2x(length_t a2x);
        length_t getMechA2x();
    protected:
        void setMechA2xImpl(length_t a2x);
        length_t getMechA2xImpl();
    public:
        void setMechA2y(length_t a2y);
        length_t getMechA2y();
    protected:
        void setMechA2yImpl(length_t a2y);
        length_t getMechA2yImpl();
    public:
        void setMechA2z(length_t a2z);
        length_t getMechA2z();
    protected:
        void setMechA2zImpl(length_t a2z);
        length_t getMechA2zImpl();
    public:
        void setMechA3x(length_t a3x);
        length_t getMechA3x();
    protected:
        void setMechA3xImpl(length_t a3x);
        length_t getMechA3xImpl();
    public:
        void setMechA3y(length_t a3y);
        length_t getMechA3y();
    protected:
        void setMechA3yImpl(length_t a3y);
        length_t getMechA3yImpl();
    public:
        void setMechA3z(length_t a3z);
        length_t getMechA3z();
    protected:
        void setMechA3zImpl(length_t a3z);
        length_t getMechA3zImpl();
    public:
        void setMechA4x(length_t a4x);
        length_t getMechA4x();
    protected:
        void setMechA4xImpl(length_t a4x);
        length_t getMechA4xImpl();
    public:
        void setMechA5x(length_t a5x);
        length_t getMechA5x();
    protected:
        void setMechA5xImpl(length_t a5x);
        length_t getMechA5xImpl();
    public:
        void setMechAnglesType(anglesType_t anglesType);
        anglesType_t getMechAnglesType();
    protected:
        void setMechAnglesTypeImpl(anglesType_t anglesType);
        anglesType_t getMechAnglesTypeImpl();
    protected:
        anglesType_t getAnglesTypeImpl()
        {
            return mech.anglesType.get();
        }
        CRobot* cloneImpl();
    private:
        CMech04 mech;
        virtual void compDirectA();
        virtual void compDirectB();
        virtual void compInverseA();
        virtual void compInverseB();
        virtual void compJointsPos();
        virtual mode_t compMode();
        void compInverse(lreal_t *TCP_position, lreal_t *TCP_orientation);
        void compDirect(lreal_t *TCP_position, lreal_t *TCP_orientation);
    };

    class CMech05
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a0z;
        length_t a1x;
        length_t a1y;
        length_t a1z;
        length_t a2x;
        length_t a2y;
        length_t a2z;
        length_t a3x;
        length_t a3y;
        length_t a3z;
        angle_t angleBC;
        CFrame frameBC;
        CMech05();
    };
    class CRobot05: public TRobot<
        0,
        0,
        5,
        5,
        0,
        0,
        6,
        0,
        0,
        0,
        0,
        0,
        5,
        1,
        0
        >
    {
    public:
        CRobot05();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1x(length_t a1x);
        length_t getMechA1x();
    protected:
        void setMechA1xImpl(length_t a1x);
        length_t getMechA1xImpl();
    public:
        void setMechA1y(length_t a1y);
        length_t getMechA1y();
    protected:
        void setMechA1yImpl(length_t a1y);
        length_t getMechA1yImpl();
    public:
        void setMechA1z(length_t a1z);
        length_t getMechA1z();
    protected:
        void setMechA1zImpl(length_t a1z);
        length_t getMechA1zImpl();
    public:
        void setMechA2x(length_t a2x);
        length_t getMechA2x();
    protected:
        void setMechA2xImpl(length_t a2x);
        length_t getMechA2xImpl();
    public:
        void setMechA2y(length_t a2y);
        length_t getMechA2y();
    protected:
        void setMechA2yImpl(length_t a2y);
        length_t getMechA2yImpl();
    public:
        void setMechA2z(length_t a2z);
        length_t getMechA2z();
    protected:
        void setMechA2zImpl(length_t a2z);
        length_t getMechA2zImpl();
    public:
        void setMechA3x(length_t a3x);
        length_t getMechA3x();
    protected:
        void setMechA3xImpl(length_t a3x);
        length_t getMechA3xImpl();
    public:
        void setMechA3y(length_t a3y);
        length_t getMechA3y();
    protected:
        void setMechA3yImpl(length_t a3y);
        length_t getMechA3yImpl();
    public:
        void setMechA3z(length_t a3z);
        length_t getMechA3z();
    protected:
        void setMechA3zImpl(length_t a3z);
        length_t getMechA3zImpl();
    public:
        void setMechAngleBC(angle_t angleBC);
        angle_t getMechAngleBC();
    protected:
        void setMechAngleBCImpl(angle_t angleBC);
        angle_t getMechAngleBCImpl();
    public:
        void setMechFrameBCDx(length_t dx);
        length_t getMechFrameBCDx();
    protected:
        void setMechFrameBCDxImpl(length_t dx);
        length_t getMechFrameBCDxImpl();
    public:
        void setMechFrameBCDy(length_t dy);
        length_t getMechFrameBCDy();
    protected:
        void setMechFrameBCDyImpl(length_t dy);
        length_t getMechFrameBCDyImpl();
    public:
        void setMechFrameBCDz(length_t dz);
        length_t getMechFrameBCDz();
    protected:
        void setMechFrameBCDzImpl(length_t dz);
        length_t getMechFrameBCDzImpl();
    public:
        void setMechFrameBCPhi(angle_t phi);
        angle_t getMechFrameBCPhi();
    protected:
        void setMechFrameBCPhiImpl(angle_t phi);
        angle_t getMechFrameBCPhiImpl();
    public:
        void setMechFrameBCTheta(angle_t theta);
        angle_t getMechFrameBCTheta();
    protected:
        void setMechFrameBCThetaImpl(angle_t theta);
        angle_t getMechFrameBCThetaImpl();
    public:
        void setMechFrameBCPsi(angle_t psi);
        angle_t getMechFrameBCPsi();
    protected:
        void setMechFrameBCPsiImpl(angle_t psi);
        angle_t getMechFrameBCPsiImpl();
    public:
        void setMechFrameBCAnglesType(anglesType_t item);
        anglesType_t getMechFrameBCAnglesType();
    protected:
        void setMechFrameBCAnglesTypeImpl(anglesType_t item);
        anglesType_t getMechFrameBCAnglesTypeImpl();
    public:
        void disMechFrameBC();
    protected:
        void disMechFrameBCImpl();
        CRobot* cloneImpl();
    private:
        CMech05 mech;
        virtual void validateMech();
        virtual void compDirectA();
        virtual void compDirectB();
        virtual void compDirectD();
        virtual void compInverseA();
        virtual void compInverseB();
        virtual void compInverseD();
        virtual void compSize();
        void justBCdirect(pos_t *inPos, pos_t *outPos);
    };

    class CDirectionType
    {
    private:
        directionType_t DirectionType;
    public:
        CDirectionType();
        status_t set(directionType_t directionType);
        directionType_t get() const;
    };

    class CMech06
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a0z;
        length_t a1x;
        length_t a1y;
        length_t a1z;
        length_t a2x;
        length_t a2y;
        length_t a2z;
        length_t a3x;
        length_t a3y;
        length_t a3z;
        CDirectionType directionType;
        CFrame frameCB;
        CMech06();
    };
    class CRobot06: public TRobot<
        0,
        0,
        5,
        5,
        0,
        0,
        6,
        0,
        0,
        5,
        0,
        0
        >
    {
    public:
        CRobot06();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1x(length_t a1x);
        length_t getMechA1x();
    protected:
        void setMechA1xImpl(length_t a1x);
        length_t getMechA1xImpl();
    public:
        void setMechA1y(length_t a1y);
        length_t getMechA1y();
    protected:
        void setMechA1yImpl(length_t a1y);
        length_t getMechA1yImpl();
    public:
        void setMechA1z(length_t a1z);
        length_t getMechA1z();
    protected:
        void setMechA1zImpl(length_t a1z);
        length_t getMechA1zImpl();
    public:
        void setMechA2x(length_t a2x);
        length_t getMechA2x();
    protected:
        void setMechA2xImpl(length_t a2x);
        length_t getMechA2xImpl();
    public:
        void setMechA2y(length_t a2y);
        length_t getMechA2y();
    protected:
        void setMechA2yImpl(length_t a2y);
        length_t getMechA2yImpl();
    public:
        void setMechA2z(length_t a2z);
        length_t getMechA2z();
    protected:
        void setMechA2zImpl(length_t a2z);
        length_t getMechA2zImpl();
    public:
        void setMechA3x(length_t a3x);
        length_t getMechA3x();
    protected:
        void setMechA3xImpl(length_t a3x);
        length_t getMechA3xImpl();
    public:
        void setMechA3y(length_t a3y);
        length_t getMechA3y();
    protected:
        void setMechA3yImpl(length_t a3y);
        length_t getMechA3yImpl();
    public:
        void setMechA3z(length_t a3z);
        length_t getMechA3z();
    protected:
        void setMechA3zImpl(length_t a3z);
        length_t getMechA3zImpl();
    public:
        void setMechDirectionType(directionType_t directionType);
        directionType_t getMechDirectionType();
    protected:
        void setMechDirectionTypeImpl(directionType_t directionType);
        directionType_t getMechDirectionTypeImpl();
    protected:
        directionType_t getDirectionTypeImpl()
        {
            return mech.directionType.get();
        }
    public:
        void setMechFrameCBDx(length_t dx);
        length_t getMechFrameCBDx();
    protected:
        void setMechFrameCBDxImpl(length_t dx);
        length_t getMechFrameCBDxImpl();
    public:
        void setMechFrameCBDy(length_t dy);
        length_t getMechFrameCBDy();
    protected:
        void setMechFrameCBDyImpl(length_t dy);
        length_t getMechFrameCBDyImpl();
    public:
        void setMechFrameCBDz(length_t dz);
        length_t getMechFrameCBDz();
    protected:
        void setMechFrameCBDzImpl(length_t dz);
        length_t getMechFrameCBDzImpl();
    public:
        void setMechFrameCBPhi(angle_t phi);
        angle_t getMechFrameCBPhi();
    protected:
        void setMechFrameCBPhiImpl(angle_t phi);
        angle_t getMechFrameCBPhiImpl();
    public:
        void setMechFrameCBTheta(angle_t theta);
        angle_t getMechFrameCBTheta();
    protected:
        void setMechFrameCBThetaImpl(angle_t theta);
        angle_t getMechFrameCBThetaImpl();
    public:
        void setMechFrameCBPsi(angle_t psi);
        angle_t getMechFrameCBPsi();
    protected:
        void setMechFrameCBPsiImpl(angle_t psi);
        angle_t getMechFrameCBPsiImpl();
    public:
        void setMechFrameCBAnglesType(anglesType_t item);
        anglesType_t getMechFrameCBAnglesType();
    protected:
        void setMechFrameCBAnglesTypeImpl(anglesType_t item);
        anglesType_t getMechFrameCBAnglesTypeImpl();
    public:
        void disMechFrameCB();
    protected:
        void disMechFrameCBImpl();
        CRobot* cloneImpl();
    private:
        CMech06 mech;
        virtual void validateMech();
        virtual void compDirectA();
        virtual void compDirectB();
        virtual void compDirectC();
        virtual void compInverseA();
        virtual void compInverseB();
        virtual void compInverseC();
        virtual mode_t compMode();
        virtual void compSize();
        void justRTCPdirect(pos_t *inPos, pos_t *outPos);
    };

    class CMech07
    {
    public:
        length_t radius;
        length_t pipe1;
        length_t pipe2;
        length_t rod1;
        length_t rod2;
        length_t toolHolderLen;
        number_t toolHolderFrac;
        length_t pipesDistance;
        length_t chordDistance;
        CMech07();
    };
    typedef struct CRobot07Nodes_t
    {
        lreal_t P1Rod[2];
        lreal_t P2Rod[2];
        lreal_t TRod[2];
        lreal_t P1Sigma[2];
        lreal_t P2Sigma[2];
        lreal_t TSigma[2];
        lreal_t XSigma[2];
        lreal_t TCPSigma[2];
        lreal_t X[2];
        lreal_t TCP[3];
    } CRobot07Nodes_t;
    class CRobot07: public TRobot<
        0,
        0,
        4,
        4,
        0,
        0
        >
    {
    public:
        CRobot07();

    public:
        void setMechRadius(length_t radius);
        length_t getMechRadius();
    protected:
        void setMechRadiusImpl(length_t radius);
        length_t getMechRadiusImpl();
    public:
        void setMechPipe1(length_t pipe1);
        length_t getMechPipe1();
    protected:
        void setMechPipe1Impl(length_t pipe1);
        length_t getMechPipe1Impl();
    public:
        void setMechPipe2(length_t pipe2);
        length_t getMechPipe2();
    protected:
        void setMechPipe2Impl(length_t pipe2);
        length_t getMechPipe2Impl();
    public:
        void setMechRod1(length_t rod1);
        length_t getMechRod1();
    protected:
        void setMechRod1Impl(length_t rod1);
        length_t getMechRod1Impl();
    public:
        void setMechRod2(length_t rod2);
        length_t getMechRod2();
    protected:
        void setMechRod2Impl(length_t rod2);
        length_t getMechRod2Impl();
    public:
        void setMechToolHolderLen(length_t toolHolderLen);
        length_t getMechToolHolderLen();
    protected:
        void setMechToolHolderLenImpl(length_t toolHolderLen);
        length_t getMechToolHolderLenImpl();
    public:
        void setMechToolHolderFrac(number_t toolHolderFrac);
        number_t getMechToolHolderFrac();
    protected:
        void setMechToolHolderFracImpl(number_t toolHolderFrac);
        number_t getMechToolHolderFracImpl();
    public:
        void setMechPipesDistance(length_t pipesDistance);
        length_t getMechPipesDistance();
    protected:
        void setMechPipesDistanceImpl(length_t pipesDistance);
        length_t getMechPipesDistanceImpl();
    public:
        void setMechChordDistance(length_t chordDistance);
        length_t getMechChordDistance();
    protected:
        void setMechChordDistanceImpl(length_t chordDistance);
        length_t getMechChordDistanceImpl();
        CRobot* cloneImpl();
    private:
        CMech07 mech;
        virtual void compDirectA();
        virtual void compInverseA();
        virtual mode_t compMode();
        void simpleRodKnownTheta1(length_t R, length_t L1, length_t L2, length_t l1, length_t l2,
                                  length_t pd, length_t cd, lreal_t T_sigma[2], pos_t alpha, pos_t *out);
        void compNodes(CRobot07Nodes_t& nodes);
    };

    class CMech08
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a0z;
        length_t a1z;
        CMech08();
    };
    class CRobot08: public TRobot<
        0,
        0,
        4,
        4,
        1,
        0
        >
    {
    public:
        CRobot08();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1z(length_t a1z);
        length_t getMechA1z();
    protected:
        void setMechA1zImpl(length_t a1z);
        length_t getMechA1zImpl();
        CRobot* cloneImpl();
    private:
        CMech08 mech;
        virtual void compInverseA();
    };

    class CMech09
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a0z;
        angle_t a1angle;
        length_t a1radius;
        angle_t a2angle;
        length_t a2radius;
        angle_t a3angle;
        length_t a3radius;
        length_t pipe1;
        length_t pipe2;
        length_t pipe3;
        length_t jointsHeight;
        angle_t b1angle;
        length_t b1radius;
        angle_t b2angle;
        length_t b2radius;
        angle_t b3angle;
        length_t b3radius;
        length_t toolHolderLen;
        CMech09();
    };
    class CRobot09: public TRobot<
        0,
        0,
        5,
        6,
        1,
        0
        >
    {
    public:
        CRobot09();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1angle(angle_t a1angle);
        angle_t getMechA1angle();
    protected:
        void setMechA1angleImpl(angle_t a1angle);
        angle_t getMechA1angleImpl();
    public:
        void setMechA1radius(length_t a1radius);
        length_t getMechA1radius();
    protected:
        void setMechA1radiusImpl(length_t a1radius);
        length_t getMechA1radiusImpl();
    public:
        void setMechA2angle(angle_t a2angle);
        angle_t getMechA2angle();
    protected:
        void setMechA2angleImpl(angle_t a2angle);
        angle_t getMechA2angleImpl();
    public:
        void setMechA2radius(length_t a2radius);
        length_t getMechA2radius();
    protected:
        void setMechA2radiusImpl(length_t a2radius);
        length_t getMechA2radiusImpl();
    public:
        void setMechA3angle(angle_t a3angle);
        angle_t getMechA3angle();
    protected:
        void setMechA3angleImpl(angle_t a3angle);
        angle_t getMechA3angleImpl();
    public:
        void setMechA3radius(length_t a3radius);
        length_t getMechA3radius();
    protected:
        void setMechA3radiusImpl(length_t a3radius);
        length_t getMechA3radiusImpl();
    public:
        void setMechPipe1(length_t pipe1);
        length_t getMechPipe1();
    protected:
        void setMechPipe1Impl(length_t pipe1);
        length_t getMechPipe1Impl();
    public:
        void setMechPipe2(length_t pipe2);
        length_t getMechPipe2();
    protected:
        void setMechPipe2Impl(length_t pipe2);
        length_t getMechPipe2Impl();
    public:
        void setMechPipe3(length_t pipe3);
        length_t getMechPipe3();
    protected:
        void setMechPipe3Impl(length_t pipe3);
        length_t getMechPipe3Impl();
    public:
        void setMechJointsHeight(length_t jointsHeight);
        length_t getMechJointsHeight();
    protected:
        void setMechJointsHeightImpl(length_t jointsHeight);
        length_t getMechJointsHeightImpl();
    public:
        void setMechB1angle(angle_t b1angle);
        angle_t getMechB1angle();
    protected:
        void setMechB1angleImpl(angle_t b1angle);
        angle_t getMechB1angleImpl();
    public:
        void setMechB1radius(length_t b1radius);
        length_t getMechB1radius();
    protected:
        void setMechB1radiusImpl(length_t b1radius);
        length_t getMechB1radiusImpl();
    public:
        void setMechB2angle(angle_t b2angle);
        angle_t getMechB2angle();
    protected:
        void setMechB2angleImpl(angle_t b2angle);
        angle_t getMechB2angleImpl();
    public:
        void setMechB2radius(length_t b2radius);
        length_t getMechB2radius();
    protected:
        void setMechB2radiusImpl(length_t b2radius);
        length_t getMechB2radiusImpl();
    public:
        void setMechB3angle(angle_t b3angle);
        angle_t getMechB3angle();
    protected:
        void setMechB3angleImpl(angle_t b3angle);
        angle_t getMechB3angleImpl();
    public:
        void setMechB3radius(length_t b3radius);
        length_t getMechB3radius();
    protected:
        void setMechB3radiusImpl(length_t b3radius);
        length_t getMechB3radiusImpl();
    public:
        void setMechToolHolderLen(length_t toolHolderLen);
        length_t getMechToolHolderLen();
    protected:
        void setMechToolHolderLenImpl(length_t toolHolderLen);
        length_t getMechToolHolderLenImpl();
        CRobot* cloneImpl();
    private:
        CMech09 mech;
        virtual void validateMech();
        virtual void compInverseA();
        void tripodA_IT(lreal_t *TCP, lreal_t *TCPdir, lreal_t *outPos);
    };

    class CMech10
    {
    public:
        length_t a1x;
        length_t a1y;
        length_t a1z;
        length_t a3x;
        length_t a3y;
        length_t a3z;
        length_t tube1;
        length_t tube2;
        length_t tube3;
        CMech10();
    };
    class CRobot10: public TRobot<
        5,
        0,
        4,
        4,
        0,
        0
        >
    {
    public:
        CRobot10();

    public:
        void setMechA1x(length_t a1x);
        length_t getMechA1x();
    protected:
        void setMechA1xImpl(length_t a1x);
        length_t getMechA1xImpl();
    public:
        void setMechA1y(length_t a1y);
        length_t getMechA1y();
    protected:
        void setMechA1yImpl(length_t a1y);
        length_t getMechA1yImpl();
    public:
        void setMechA1z(length_t a1z);
        length_t getMechA1z();
    protected:
        void setMechA1zImpl(length_t a1z);
        length_t getMechA1zImpl();
    public:
        void setMechA3x(length_t a3x);
        length_t getMechA3x();
    protected:
        void setMechA3xImpl(length_t a3x);
        length_t getMechA3xImpl();
    public:
        void setMechA3y(length_t a3y);
        length_t getMechA3y();
    protected:
        void setMechA3yImpl(length_t a3y);
        length_t getMechA3yImpl();
    public:
        void setMechA3z(length_t a3z);
        length_t getMechA3z();
    protected:
        void setMechA3zImpl(length_t a3z);
        length_t getMechA3zImpl();
    public:
        void setMechTube1(length_t tube1);
        length_t getMechTube1();
    protected:
        void setMechTube1Impl(length_t tube1);
        length_t getMechTube1Impl();
    public:
        void setMechTube2(length_t tube2);
        length_t getMechTube2();
    protected:
        void setMechTube2Impl(length_t tube2);
        length_t getMechTube2Impl();
    public:
        void setMechTube3(length_t tube3);
        length_t getMechTube3();
    protected:
        void setMechTube3Impl(length_t tube3);
        length_t getMechTube3Impl();
        CRobot* cloneImpl();
    private:
        CMech10 mech;
        virtual void compDirectA();
        virtual void compInverseA();
        virtual void compJointsPos();
    };

    class CMech11
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a0z;
        length_t a1x;
        length_t a1y;
        length_t a1z;
        length_t a2x;
        length_t a2y;
        length_t a2z;
        length_t a3x;
        length_t a3y;
        length_t a3z;
        length_t a4z;
        length_t a5z;
        CAnglesType anglesType;
        CMech11();
    };
    class CRobot11: public TRobot<
        7,
        6,
        6,
        6,
        0,
        0,
        7,
        0,
        0
        >
    {
    public:
        CRobot11();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1x(length_t a1x);
        length_t getMechA1x();
    protected:
        void setMechA1xImpl(length_t a1x);
        length_t getMechA1xImpl();
    public:
        void setMechA1y(length_t a1y);
        length_t getMechA1y();
    protected:
        void setMechA1yImpl(length_t a1y);
        length_t getMechA1yImpl();
    public:
        void setMechA1z(length_t a1z);
        length_t getMechA1z();
    protected:
        void setMechA1zImpl(length_t a1z);
        length_t getMechA1zImpl();
    public:
        void setMechA2x(length_t a2x);
        length_t getMechA2x();
    protected:
        void setMechA2xImpl(length_t a2x);
        length_t getMechA2xImpl();
    public:
        void setMechA2y(length_t a2y);
        length_t getMechA2y();
    protected:
        void setMechA2yImpl(length_t a2y);
        length_t getMechA2yImpl();
    public:
        void setMechA2z(length_t a2z);
        length_t getMechA2z();
    protected:
        void setMechA2zImpl(length_t a2z);
        length_t getMechA2zImpl();
    public:
        void setMechA3x(length_t a3x);
        length_t getMechA3x();
    protected:
        void setMechA3xImpl(length_t a3x);
        length_t getMechA3xImpl();
    public:
        void setMechA3y(length_t a3y);
        length_t getMechA3y();
    protected:
        void setMechA3yImpl(length_t a3y);
        length_t getMechA3yImpl();
    public:
        void setMechA3z(length_t a3z);
        length_t getMechA3z();
    protected:
        void setMechA3zImpl(length_t a3z);
        length_t getMechA3zImpl();
    public:
        void setMechA4z(length_t a4z);
        length_t getMechA4z();
    protected:
        void setMechA4zImpl(length_t a4z);
        length_t getMechA4zImpl();
    public:
        void setMechA5z(length_t a5z);
        length_t getMechA5z();
    protected:
        void setMechA5zImpl(length_t a5z);
        length_t getMechA5zImpl();
    public:
        void setMechAnglesType(anglesType_t anglesType);
        anglesType_t getMechAnglesType();
    protected:
        void setMechAnglesTypeImpl(anglesType_t anglesType);
        anglesType_t getMechAnglesTypeImpl();
    protected:
        anglesType_t getAnglesTypeImpl()
        {
            return mech.anglesType.get();
        }
        CRobot* cloneImpl();
    private:
        CMech11 mech;
        virtual void compDirectA();
        virtual void compDirectB();
        virtual void compInverseA();
        virtual void compInverseB();
        virtual void compJointsPos();
        virtual mode_t compMode();
        virtual void compGeneralJacobian();
        void compInverse(lreal_t *TCP_position, lreal_t *TCP_orientation);
        void compDirect(lreal_t *TCP_position, lreal_t *TCP_orientation);
    };

    class CMech12
    {
    public:
        length_t x0;
        length_t y0;
        length_t radiusDiff;
        length_t armLen;
        CMech12();
    };
    class CRobot12: public TRobot<
        0,
        0,
        2,
        2,
        0,
        0
        >
    {
    public:
        CRobot12();

    public:
        void setMechX0(length_t x0);
        length_t getMechX0();
    protected:
        void setMechX0Impl(length_t x0);
        length_t getMechX0Impl();
    public:
        void setMechY0(length_t y0);
        length_t getMechY0();
    protected:
        void setMechY0Impl(length_t y0);
        length_t getMechY0Impl();
    public:
        void setMechRadiusDiff(length_t radiusDiff);
        length_t getMechRadiusDiff();
    protected:
        void setMechRadiusDiffImpl(length_t radiusDiff);
        length_t getMechRadiusDiffImpl();
    public:
        void setMechArmLen(length_t armLen);
        length_t getMechArmLen();
    protected:
        void setMechArmLenImpl(length_t armLen);
        length_t getMechArmLenImpl();
        CRobot* cloneImpl();
    private:
        CMech12 mech;
        virtual void compDirectA();
        virtual void compInverseA();
        virtual mode_t compMode();
    };

    class CMech13
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a0z;
        angle_t a1angle;
        length_t a1radius;
        length_t a1dz;
        angle_t a2angle;
        length_t a2radius;
        length_t a2dz;
        angle_t a3angle;
        length_t a3radius;
        length_t a3dz;
        length_t arm1;
        length_t arm2;
        length_t arm3;
        length_t pipe1;
        length_t pipe2;
        length_t pipe3;
        length_t b1radius;
        length_t b1dz;
        length_t b2radius;
        length_t b2dz;
        length_t b3radius;
        length_t b3dz;
        length_t toolHolderLen;
        bool upper;
        CMech13();
    };
    typedef struct tripodBNodes_t
    {
        lreal_t A0[3];
        lreal_t A1[3];
        lreal_t A2[3];
        lreal_t A3[3];
        lreal_t B0[3];
        lreal_t B1[3];
        lreal_t B2[3];
        lreal_t B3[3];
        lreal_t C1[3];
        lreal_t C2[3];
        lreal_t C3[3];
    } tripodBNodes_t;
    class CRobot13: public TRobot<
        12,
        0,
        3,
        3,
        0,
        0
        >
    {
    public:
        CRobot13();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1angle(angle_t a1angle);
        angle_t getMechA1angle();
    protected:
        void setMechA1angleImpl(angle_t a1angle);
        angle_t getMechA1angleImpl();
    public:
        void setMechA1radius(length_t a1radius);
        length_t getMechA1radius();
    protected:
        void setMechA1radiusImpl(length_t a1radius);
        length_t getMechA1radiusImpl();
    public:
        void setMechA1dz(length_t a1dz);
        length_t getMechA1dz();
    protected:
        void setMechA1dzImpl(length_t a1dz);
        length_t getMechA1dzImpl();
    public:
        void setMechA2angle(angle_t a2angle);
        angle_t getMechA2angle();
    protected:
        void setMechA2angleImpl(angle_t a2angle);
        angle_t getMechA2angleImpl();
    public:
        void setMechA2radius(length_t a2radius);
        length_t getMechA2radius();
    protected:
        void setMechA2radiusImpl(length_t a2radius);
        length_t getMechA2radiusImpl();
    public:
        void setMechA2dz(length_t a2dz);
        length_t getMechA2dz();
    protected:
        void setMechA2dzImpl(length_t a2dz);
        length_t getMechA2dzImpl();
    public:
        void setMechA3angle(angle_t a3angle);
        angle_t getMechA3angle();
    protected:
        void setMechA3angleImpl(angle_t a3angle);
        angle_t getMechA3angleImpl();
    public:
        void setMechA3radius(length_t a3radius);
        length_t getMechA3radius();
    protected:
        void setMechA3radiusImpl(length_t a3radius);
        length_t getMechA3radiusImpl();
    public:
        void setMechA3dz(length_t a3dz);
        length_t getMechA3dz();
    protected:
        void setMechA3dzImpl(length_t a3dz);
        length_t getMechA3dzImpl();
    public:
        void setMechArm1(length_t arm1);
        length_t getMechArm1();
    protected:
        void setMechArm1Impl(length_t arm1);
        length_t getMechArm1Impl();
    public:
        void setMechArm2(length_t arm2);
        length_t getMechArm2();
    protected:
        void setMechArm2Impl(length_t arm2);
        length_t getMechArm2Impl();
    public:
        void setMechArm3(length_t arm3);
        length_t getMechArm3();
    protected:
        void setMechArm3Impl(length_t arm3);
        length_t getMechArm3Impl();
    public:
        void setMechPipe1(length_t pipe1);
        length_t getMechPipe1();
    protected:
        void setMechPipe1Impl(length_t pipe1);
        length_t getMechPipe1Impl();
    public:
        void setMechPipe2(length_t pipe2);
        length_t getMechPipe2();
    protected:
        void setMechPipe2Impl(length_t pipe2);
        length_t getMechPipe2Impl();
    public:
        void setMechPipe3(length_t pipe3);
        length_t getMechPipe3();
    protected:
        void setMechPipe3Impl(length_t pipe3);
        length_t getMechPipe3Impl();
    public:
        void setMechB1radius(length_t b1radius);
        length_t getMechB1radius();
    protected:
        void setMechB1radiusImpl(length_t b1radius);
        length_t getMechB1radiusImpl();
    public:
        void setMechB1dz(length_t b1dz);
        length_t getMechB1dz();
    protected:
        void setMechB1dzImpl(length_t b1dz);
        length_t getMechB1dzImpl();
    public:
        void setMechB2radius(length_t b2radius);
        length_t getMechB2radius();
    protected:
        void setMechB2radiusImpl(length_t b2radius);
        length_t getMechB2radiusImpl();
    public:
        void setMechB2dz(length_t b2dz);
        length_t getMechB2dz();
    protected:
        void setMechB2dzImpl(length_t b2dz);
        length_t getMechB2dzImpl();
    public:
        void setMechB3radius(length_t b3radius);
        length_t getMechB3radius();
    protected:
        void setMechB3radiusImpl(length_t b3radius);
        length_t getMechB3radiusImpl();
    public:
        void setMechB3dz(length_t b3dz);
        length_t getMechB3dz();
    protected:
        void setMechB3dzImpl(length_t b3dz);
        length_t getMechB3dzImpl();
    public:
        void setMechToolHolderLen(length_t toolHolderLen);
        length_t getMechToolHolderLen();
    protected:
        void setMechToolHolderLenImpl(length_t toolHolderLen);
        length_t getMechToolHolderLenImpl();
    public:
        void setMechUpper(bool upper);
        bool isMechUpper();
    protected:
        void setMechUpperImpl(bool upper);
        bool isMechUpperImpl();
        CRobot* cloneImpl();
    private:
        CMech13 mech;
        virtual void validateMech();
        virtual void compDirectA();
        virtual void compInverseA();
        virtual void compJointsPos();
        virtual mode_t compMode();
        void compNodes(tripodBNodes_t& tripodNodes);
    };

    class CMech14
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a0z;
        length_t a1xy;
        length_t a1z;
        length_t a2xy;
        length_t a2z;
        length_t a3z;
        CMech14();
    };
    class CRobot14: public TRobot<
        6,
        0,
        4,
        4,
        0,
        0
        >
    {
    public:
        CRobot14();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1xy(length_t a1xy);
        length_t getMechA1xy();
    protected:
        void setMechA1xyImpl(length_t a1xy);
        length_t getMechA1xyImpl();
    public:
        void setMechA1z(length_t a1z);
        length_t getMechA1z();
    protected:
        void setMechA1zImpl(length_t a1z);
        length_t getMechA1zImpl();
    public:
        void setMechA2xy(length_t a2xy);
        length_t getMechA2xy();
    protected:
        void setMechA2xyImpl(length_t a2xy);
        length_t getMechA2xyImpl();
    public:
        void setMechA2z(length_t a2z);
        length_t getMechA2z();
    protected:
        void setMechA2zImpl(length_t a2z);
        length_t getMechA2zImpl();
    public:
        void setMechA3z(length_t a3z);
        length_t getMechA3z();
    protected:
        void setMechA3zImpl(length_t a3z);
        length_t getMechA3zImpl();
        CRobot* cloneImpl();
    private:
        CMech14 mech;
        virtual void validateMech();
        virtual void compDirectA();
        virtual void compInverseA();
        virtual void compJointsPos();
        virtual mode_t compMode();
    };

    class CMech15
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a0z;
        length_t a1x;
        length_t a1y;
        length_t a1z;
        length_t a2x;
        length_t a2y;
        length_t a2z;
        length_t a3x;
        length_t a3y;
        length_t a3z;
        CFrame frameAB;
        CDirectionType directionType;
        CMech15();
    };
    class CRobot15: public TRobot<
        0,
        0,
        5,
        5,
        0,
        0,
        6,
        0,
        0,
        5,
        0,
        0
        >
    {
    public:
        CRobot15();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1x(length_t a1x);
        length_t getMechA1x();
    protected:
        void setMechA1xImpl(length_t a1x);
        length_t getMechA1xImpl();
    public:
        void setMechA1y(length_t a1y);
        length_t getMechA1y();
    protected:
        void setMechA1yImpl(length_t a1y);
        length_t getMechA1yImpl();
    public:
        void setMechA1z(length_t a1z);
        length_t getMechA1z();
    protected:
        void setMechA1zImpl(length_t a1z);
        length_t getMechA1zImpl();
    public:
        void setMechA2x(length_t a2x);
        length_t getMechA2x();
    protected:
        void setMechA2xImpl(length_t a2x);
        length_t getMechA2xImpl();
    public:
        void setMechA2y(length_t a2y);
        length_t getMechA2y();
    protected:
        void setMechA2yImpl(length_t a2y);
        length_t getMechA2yImpl();
    public:
        void setMechA2z(length_t a2z);
        length_t getMechA2z();
    protected:
        void setMechA2zImpl(length_t a2z);
        length_t getMechA2zImpl();
    public:
        void setMechA3x(length_t a3x);
        length_t getMechA3x();
    protected:
        void setMechA3xImpl(length_t a3x);
        length_t getMechA3xImpl();
    public:
        void setMechA3y(length_t a3y);
        length_t getMechA3y();
    protected:
        void setMechA3yImpl(length_t a3y);
        length_t getMechA3yImpl();
    public:
        void setMechA3z(length_t a3z);
        length_t getMechA3z();
    protected:
        void setMechA3zImpl(length_t a3z);
        length_t getMechA3zImpl();
    public:
        void setMechFrameABDx(length_t dx);
        length_t getMechFrameABDx();
    protected:
        void setMechFrameABDxImpl(length_t dx);
        length_t getMechFrameABDxImpl();
    public:
        void setMechFrameABDy(length_t dy);
        length_t getMechFrameABDy();
    protected:
        void setMechFrameABDyImpl(length_t dy);
        length_t getMechFrameABDyImpl();
    public:
        void setMechFrameABDz(length_t dz);
        length_t getMechFrameABDz();
    protected:
        void setMechFrameABDzImpl(length_t dz);
        length_t getMechFrameABDzImpl();
    public:
        void setMechFrameABPhi(angle_t phi);
        angle_t getMechFrameABPhi();
    protected:
        void setMechFrameABPhiImpl(angle_t phi);
        angle_t getMechFrameABPhiImpl();
    public:
        void setMechFrameABTheta(angle_t theta);
        angle_t getMechFrameABTheta();
    protected:
        void setMechFrameABThetaImpl(angle_t theta);
        angle_t getMechFrameABThetaImpl();
    public:
        void setMechFrameABPsi(angle_t psi);
        angle_t getMechFrameABPsi();
    protected:
        void setMechFrameABPsiImpl(angle_t psi);
        angle_t getMechFrameABPsiImpl();
    public:
        void setMechFrameABAnglesType(anglesType_t item);
        anglesType_t getMechFrameABAnglesType();
    protected:
        void setMechFrameABAnglesTypeImpl(anglesType_t item);
        anglesType_t getMechFrameABAnglesTypeImpl();
    public:
        void disMechFrameAB();
    protected:
        void disMechFrameABImpl();
    public:
        void setMechDirectionType(directionType_t directionType);
        directionType_t getMechDirectionType();
    protected:
        void setMechDirectionTypeImpl(directionType_t directionType);
        directionType_t getMechDirectionTypeImpl();
    protected:
        directionType_t getDirectionTypeImpl()
        {
            return mech.directionType.get();
        }
        CRobot* cloneImpl();
    private:
        CMech15 mech;
        virtual void validateMech();
        virtual void compDirectA();
        virtual void compDirectB();
        virtual void compDirectC();
        virtual void compInverseA();
        virtual void compInverseB();
        virtual void compInverseC();
        virtual mode_t compMode();
        virtual void compSize();
        void justRTCPdirect(pos_t *inPos, pos_t *outPos);
    };

    class CMech16
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a0z;
        length_t a1x;
        length_t a1y;
        length_t a1z;
        length_t a2x;
        length_t a2y;
        length_t a2z;
        length_t a3x;
        length_t a3y;
        length_t a3z;
        CFrame frameBA;
        CDirectionType directionType;
        CMech16();
    };
    class CRobot16: public TRobot<
        0,
        0,
        5,
        5,
        0,
        0,
        6,
        0,
        0,
        5,
        0,
        0
        >
    {
    public:
        CRobot16();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1x(length_t a1x);
        length_t getMechA1x();
    protected:
        void setMechA1xImpl(length_t a1x);
        length_t getMechA1xImpl();
    public:
        void setMechA1y(length_t a1y);
        length_t getMechA1y();
    protected:
        void setMechA1yImpl(length_t a1y);
        length_t getMechA1yImpl();
    public:
        void setMechA1z(length_t a1z);
        length_t getMechA1z();
    protected:
        void setMechA1zImpl(length_t a1z);
        length_t getMechA1zImpl();
    public:
        void setMechA2x(length_t a2x);
        length_t getMechA2x();
    protected:
        void setMechA2xImpl(length_t a2x);
        length_t getMechA2xImpl();
    public:
        void setMechA2y(length_t a2y);
        length_t getMechA2y();
    protected:
        void setMechA2yImpl(length_t a2y);
        length_t getMechA2yImpl();
    public:
        void setMechA2z(length_t a2z);
        length_t getMechA2z();
    protected:
        void setMechA2zImpl(length_t a2z);
        length_t getMechA2zImpl();
    public:
        void setMechA3x(length_t a3x);
        length_t getMechA3x();
    protected:
        void setMechA3xImpl(length_t a3x);
        length_t getMechA3xImpl();
    public:
        void setMechA3y(length_t a3y);
        length_t getMechA3y();
    protected:
        void setMechA3yImpl(length_t a3y);
        length_t getMechA3yImpl();
    public:
        void setMechA3z(length_t a3z);
        length_t getMechA3z();
    protected:
        void setMechA3zImpl(length_t a3z);
        length_t getMechA3zImpl();
    public:
        void setMechFrameBADx(length_t dx);
        length_t getMechFrameBADx();
    protected:
        void setMechFrameBADxImpl(length_t dx);
        length_t getMechFrameBADxImpl();
    public:
        void setMechFrameBADy(length_t dy);
        length_t getMechFrameBADy();
    protected:
        void setMechFrameBADyImpl(length_t dy);
        length_t getMechFrameBADyImpl();
    public:
        void setMechFrameBADz(length_t dz);
        length_t getMechFrameBADz();
    protected:
        void setMechFrameBADzImpl(length_t dz);
        length_t getMechFrameBADzImpl();
    public:
        void setMechFrameBAPhi(angle_t phi);
        angle_t getMechFrameBAPhi();
    protected:
        void setMechFrameBAPhiImpl(angle_t phi);
        angle_t getMechFrameBAPhiImpl();
    public:
        void setMechFrameBATheta(angle_t theta);
        angle_t getMechFrameBATheta();
    protected:
        void setMechFrameBAThetaImpl(angle_t theta);
        angle_t getMechFrameBAThetaImpl();
    public:
        void setMechFrameBAPsi(angle_t psi);
        angle_t getMechFrameBAPsi();
    protected:
        void setMechFrameBAPsiImpl(angle_t psi);
        angle_t getMechFrameBAPsiImpl();
    public:
        void setMechFrameBAAnglesType(anglesType_t item);
        anglesType_t getMechFrameBAAnglesType();
    protected:
        void setMechFrameBAAnglesTypeImpl(anglesType_t item);
        anglesType_t getMechFrameBAAnglesTypeImpl();
    public:
        void disMechFrameBA();
    protected:
        void disMechFrameBAImpl();
    public:
        void setMechDirectionType(directionType_t directionType);
        directionType_t getMechDirectionType();
    protected:
        void setMechDirectionTypeImpl(directionType_t directionType);
        directionType_t getMechDirectionTypeImpl();
    protected:
        directionType_t getDirectionTypeImpl()
        {
            return mech.directionType.get();
        }
        CRobot* cloneImpl();
    private:
        CMech16 mech;
        virtual void validateMech();
        virtual void compDirectA();
        virtual void compDirectB();
        virtual void compDirectC();
        virtual void compInverseA();
        virtual void compInverseB();
        virtual void compInverseC();
        virtual mode_t compMode();
        virtual void compSize();
        void justRTCPdirect(pos_t *inPos, pos_t *outPos);
    };

    class CMech17
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a0z;
        length_t a1x;
        length_t a1y;
        length_t a1z;
        length_t a2x;
        length_t a2y;
        length_t a2z;
        length_t a3x;
        length_t a3y;
        length_t a3z;
        CFrame frameCA;
        CDirectionType directionType;
        CMech17();
    };
    class CRobot17: public TRobot<
        0,
        0,
        5,
        5,
        0,
        0,
        6,
        0,
        0,
        5,
        0,
        0
        >
    {
    public:
        CRobot17();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1x(length_t a1x);
        length_t getMechA1x();
    protected:
        void setMechA1xImpl(length_t a1x);
        length_t getMechA1xImpl();
    public:
        void setMechA1y(length_t a1y);
        length_t getMechA1y();
    protected:
        void setMechA1yImpl(length_t a1y);
        length_t getMechA1yImpl();
    public:
        void setMechA1z(length_t a1z);
        length_t getMechA1z();
    protected:
        void setMechA1zImpl(length_t a1z);
        length_t getMechA1zImpl();
    public:
        void setMechA2x(length_t a2x);
        length_t getMechA2x();
    protected:
        void setMechA2xImpl(length_t a2x);
        length_t getMechA2xImpl();
    public:
        void setMechA2y(length_t a2y);
        length_t getMechA2y();
    protected:
        void setMechA2yImpl(length_t a2y);
        length_t getMechA2yImpl();
    public:
        void setMechA2z(length_t a2z);
        length_t getMechA2z();
    protected:
        void setMechA2zImpl(length_t a2z);
        length_t getMechA2zImpl();
    public:
        void setMechA3x(length_t a3x);
        length_t getMechA3x();
    protected:
        void setMechA3xImpl(length_t a3x);
        length_t getMechA3xImpl();
    public:
        void setMechA3y(length_t a3y);
        length_t getMechA3y();
    protected:
        void setMechA3yImpl(length_t a3y);
        length_t getMechA3yImpl();
    public:
        void setMechA3z(length_t a3z);
        length_t getMechA3z();
    protected:
        void setMechA3zImpl(length_t a3z);
        length_t getMechA3zImpl();
    public:
        void setMechFrameCADx(length_t dx);
        length_t getMechFrameCADx();
    protected:
        void setMechFrameCADxImpl(length_t dx);
        length_t getMechFrameCADxImpl();
    public:
        void setMechFrameCADy(length_t dy);
        length_t getMechFrameCADy();
    protected:
        void setMechFrameCADyImpl(length_t dy);
        length_t getMechFrameCADyImpl();
    public:
        void setMechFrameCADz(length_t dz);
        length_t getMechFrameCADz();
    protected:
        void setMechFrameCADzImpl(length_t dz);
        length_t getMechFrameCADzImpl();
    public:
        void setMechFrameCAPhi(angle_t phi);
        angle_t getMechFrameCAPhi();
    protected:
        void setMechFrameCAPhiImpl(angle_t phi);
        angle_t getMechFrameCAPhiImpl();
    public:
        void setMechFrameCATheta(angle_t theta);
        angle_t getMechFrameCATheta();
    protected:
        void setMechFrameCAThetaImpl(angle_t theta);
        angle_t getMechFrameCAThetaImpl();
    public:
        void setMechFrameCAPsi(angle_t psi);
        angle_t getMechFrameCAPsi();
    protected:
        void setMechFrameCAPsiImpl(angle_t psi);
        angle_t getMechFrameCAPsiImpl();
    public:
        void setMechFrameCAAnglesType(anglesType_t item);
        anglesType_t getMechFrameCAAnglesType();
    protected:
        void setMechFrameCAAnglesTypeImpl(anglesType_t item);
        anglesType_t getMechFrameCAAnglesTypeImpl();
    public:
        void disMechFrameCA();
    protected:
        void disMechFrameCAImpl();
    public:
        void setMechDirectionType(directionType_t directionType);
        directionType_t getMechDirectionType();
    protected:
        void setMechDirectionTypeImpl(directionType_t directionType);
        directionType_t getMechDirectionTypeImpl();
    protected:
        directionType_t getDirectionTypeImpl()
        {
            return mech.directionType.get();
        }
        CRobot* cloneImpl();
    private:
        CMech17 mech;
        virtual void validateMech();
        virtual void compDirectA();
        virtual void compDirectB();
        virtual void compDirectC();
        virtual void compInverseA();
        virtual void compInverseB();
        virtual void compInverseC();
        virtual mode_t compMode();
        virtual void compSize();
        void justRTCPdirect(pos_t *inPos, pos_t *outPos);
    };

    class CMech18
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a0z;
        length_t a1x;
        length_t a1y;
        length_t a1z;
        length_t a2x;
        length_t a2y;
        length_t a2z;
        length_t a3x;
        length_t a3y;
        length_t a3z;
        CFrame frameAC;
        CDirectionType directionType;
        CMech18();
    };
    class CRobot18: public TRobot<
        0,
        0,
        5,
        5,
        0,
        0,
        6,
        0,
        0,
        5,
        0,
        0
        >
    {
    public:
        CRobot18();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1x(length_t a1x);
        length_t getMechA1x();
    protected:
        void setMechA1xImpl(length_t a1x);
        length_t getMechA1xImpl();
    public:
        void setMechA1y(length_t a1y);
        length_t getMechA1y();
    protected:
        void setMechA1yImpl(length_t a1y);
        length_t getMechA1yImpl();
    public:
        void setMechA1z(length_t a1z);
        length_t getMechA1z();
    protected:
        void setMechA1zImpl(length_t a1z);
        length_t getMechA1zImpl();
    public:
        void setMechA2x(length_t a2x);
        length_t getMechA2x();
    protected:
        void setMechA2xImpl(length_t a2x);
        length_t getMechA2xImpl();
    public:
        void setMechA2y(length_t a2y);
        length_t getMechA2y();
    protected:
        void setMechA2yImpl(length_t a2y);
        length_t getMechA2yImpl();
    public:
        void setMechA2z(length_t a2z);
        length_t getMechA2z();
    protected:
        void setMechA2zImpl(length_t a2z);
        length_t getMechA2zImpl();
    public:
        void setMechA3x(length_t a3x);
        length_t getMechA3x();
    protected:
        void setMechA3xImpl(length_t a3x);
        length_t getMechA3xImpl();
    public:
        void setMechA3y(length_t a3y);
        length_t getMechA3y();
    protected:
        void setMechA3yImpl(length_t a3y);
        length_t getMechA3yImpl();
    public:
        void setMechA3z(length_t a3z);
        length_t getMechA3z();
    protected:
        void setMechA3zImpl(length_t a3z);
        length_t getMechA3zImpl();
    public:
        void setMechFrameACDx(length_t dx);
        length_t getMechFrameACDx();
    protected:
        void setMechFrameACDxImpl(length_t dx);
        length_t getMechFrameACDxImpl();
    public:
        void setMechFrameACDy(length_t dy);
        length_t getMechFrameACDy();
    protected:
        void setMechFrameACDyImpl(length_t dy);
        length_t getMechFrameACDyImpl();
    public:
        void setMechFrameACDz(length_t dz);
        length_t getMechFrameACDz();
    protected:
        void setMechFrameACDzImpl(length_t dz);
        length_t getMechFrameACDzImpl();
    public:
        void setMechFrameACPhi(angle_t phi);
        angle_t getMechFrameACPhi();
    protected:
        void setMechFrameACPhiImpl(angle_t phi);
        angle_t getMechFrameACPhiImpl();
    public:
        void setMechFrameACTheta(angle_t theta);
        angle_t getMechFrameACTheta();
    protected:
        void setMechFrameACThetaImpl(angle_t theta);
        angle_t getMechFrameACThetaImpl();
    public:
        void setMechFrameACPsi(angle_t psi);
        angle_t getMechFrameACPsi();
    protected:
        void setMechFrameACPsiImpl(angle_t psi);
        angle_t getMechFrameACPsiImpl();
    public:
        void setMechFrameACAnglesType(anglesType_t item);
        anglesType_t getMechFrameACAnglesType();
    protected:
        void setMechFrameACAnglesTypeImpl(anglesType_t item);
        anglesType_t getMechFrameACAnglesTypeImpl();
    public:
        void disMechFrameAC();
    protected:
        void disMechFrameACImpl();
    public:
        void setMechDirectionType(directionType_t directionType);
        directionType_t getMechDirectionType();
    protected:
        void setMechDirectionTypeImpl(directionType_t directionType);
        directionType_t getMechDirectionTypeImpl();
    protected:
        directionType_t getDirectionTypeImpl()
        {
            return mech.directionType.get();
        }
        CRobot* cloneImpl();
    private:
        CMech18 mech;
        virtual void validateMech();
        virtual void compDirectA();
        virtual void compDirectB();
        virtual void compDirectC();
        virtual void compInverseA();
        virtual void compInverseB();
        virtual void compInverseC();
        virtual mode_t compMode();
        virtual void compSize();
        void justRTCPdirect(pos_t *inPos, pos_t *outPos);
    };

    class CMech19
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a0z;
        length_t a1x;
        length_t a1y;
        length_t a1z;
        length_t a2x;
        length_t a2y;
        length_t a2z;
        length_t a3x;
        length_t a3y;
        length_t a3z;
        CFrame frameBC;
        CDirectionType directionType;
        CMech19();
    };
    class CRobot19: public TRobot<
        0,
        0,
        5,
        5,
        0,
        0,
        6,
        0,
        0,
        5,
        0,
        0
        >
    {
    public:
        CRobot19();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1x(length_t a1x);
        length_t getMechA1x();
    protected:
        void setMechA1xImpl(length_t a1x);
        length_t getMechA1xImpl();
    public:
        void setMechA1y(length_t a1y);
        length_t getMechA1y();
    protected:
        void setMechA1yImpl(length_t a1y);
        length_t getMechA1yImpl();
    public:
        void setMechA1z(length_t a1z);
        length_t getMechA1z();
    protected:
        void setMechA1zImpl(length_t a1z);
        length_t getMechA1zImpl();
    public:
        void setMechA2x(length_t a2x);
        length_t getMechA2x();
    protected:
        void setMechA2xImpl(length_t a2x);
        length_t getMechA2xImpl();
    public:
        void setMechA2y(length_t a2y);
        length_t getMechA2y();
    protected:
        void setMechA2yImpl(length_t a2y);
        length_t getMechA2yImpl();
    public:
        void setMechA2z(length_t a2z);
        length_t getMechA2z();
    protected:
        void setMechA2zImpl(length_t a2z);
        length_t getMechA2zImpl();
    public:
        void setMechA3x(length_t a3x);
        length_t getMechA3x();
    protected:
        void setMechA3xImpl(length_t a3x);
        length_t getMechA3xImpl();
    public:
        void setMechA3y(length_t a3y);
        length_t getMechA3y();
    protected:
        void setMechA3yImpl(length_t a3y);
        length_t getMechA3yImpl();
    public:
        void setMechA3z(length_t a3z);
        length_t getMechA3z();
    protected:
        void setMechA3zImpl(length_t a3z);
        length_t getMechA3zImpl();
    public:
        void setMechFrameBCDx(length_t dx);
        length_t getMechFrameBCDx();
    protected:
        void setMechFrameBCDxImpl(length_t dx);
        length_t getMechFrameBCDxImpl();
    public:
        void setMechFrameBCDy(length_t dy);
        length_t getMechFrameBCDy();
    protected:
        void setMechFrameBCDyImpl(length_t dy);
        length_t getMechFrameBCDyImpl();
    public:
        void setMechFrameBCDz(length_t dz);
        length_t getMechFrameBCDz();
    protected:
        void setMechFrameBCDzImpl(length_t dz);
        length_t getMechFrameBCDzImpl();
    public:
        void setMechFrameBCPhi(angle_t phi);
        angle_t getMechFrameBCPhi();
    protected:
        void setMechFrameBCPhiImpl(angle_t phi);
        angle_t getMechFrameBCPhiImpl();
    public:
        void setMechFrameBCTheta(angle_t theta);
        angle_t getMechFrameBCTheta();
    protected:
        void setMechFrameBCThetaImpl(angle_t theta);
        angle_t getMechFrameBCThetaImpl();
    public:
        void setMechFrameBCPsi(angle_t psi);
        angle_t getMechFrameBCPsi();
    protected:
        void setMechFrameBCPsiImpl(angle_t psi);
        angle_t getMechFrameBCPsiImpl();
    public:
        void setMechFrameBCAnglesType(anglesType_t item);
        anglesType_t getMechFrameBCAnglesType();
    protected:
        void setMechFrameBCAnglesTypeImpl(anglesType_t item);
        anglesType_t getMechFrameBCAnglesTypeImpl();
    public:
        void disMechFrameBC();
    protected:
        void disMechFrameBCImpl();
    public:
        void setMechDirectionType(directionType_t directionType);
        directionType_t getMechDirectionType();
    protected:
        void setMechDirectionTypeImpl(directionType_t directionType);
        directionType_t getMechDirectionTypeImpl();
    protected:
        directionType_t getDirectionTypeImpl()
        {
            return mech.directionType.get();
        }
        CRobot* cloneImpl();
    private:
        CMech19 mech;
        virtual void validateMech();
        virtual void compDirectA();
        virtual void compDirectB();
        virtual void compDirectC();
        virtual void compInverseA();
        virtual void compInverseB();
        virtual void compInverseC();
        virtual mode_t compMode();
        virtual void compSize();
        void justRTCPdirect(pos_t *inPos, pos_t *outPos);
    };

    class CMech20
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a0z;
        length_t a1x;
        length_t a1y;
        length_t a1z;
        length_t a2x;
        length_t a2y;
        length_t a2z;
        length_t b0x;
        length_t b0y;
        length_t b0z;
        length_t b1x;
        length_t b1y;
        length_t b1z;
        CAnglesType RTCP_anglesType;
        CAnglesType T_anglesType;
        angle_t RTCP_phi;
        angle_t RTCP_theta;
        angle_t RTCP_psi;
        angle_t T_phi;
        angle_t T_theta;
        angle_t T_psi;
        CFrame frameRTCP;
        CMech20();
    };
    class CRobot20: public TRobot<
        0,
        0,
        5,
        5,
        0,
        0
        >
    {
    public:
        CRobot20();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1x(length_t a1x);
        length_t getMechA1x();
    protected:
        void setMechA1xImpl(length_t a1x);
        length_t getMechA1xImpl();
    public:
        void setMechA1y(length_t a1y);
        length_t getMechA1y();
    protected:
        void setMechA1yImpl(length_t a1y);
        length_t getMechA1yImpl();
    public:
        void setMechA1z(length_t a1z);
        length_t getMechA1z();
    protected:
        void setMechA1zImpl(length_t a1z);
        length_t getMechA1zImpl();
    public:
        void setMechA2x(length_t a2x);
        length_t getMechA2x();
    protected:
        void setMechA2xImpl(length_t a2x);
        length_t getMechA2xImpl();
    public:
        void setMechA2y(length_t a2y);
        length_t getMechA2y();
    protected:
        void setMechA2yImpl(length_t a2y);
        length_t getMechA2yImpl();
    public:
        void setMechA2z(length_t a2z);
        length_t getMechA2z();
    protected:
        void setMechA2zImpl(length_t a2z);
        length_t getMechA2zImpl();
    public:
        void setMechB0x(length_t b0x);
        length_t getMechB0x();
    protected:
        void setMechB0xImpl(length_t b0x);
        length_t getMechB0xImpl();
    public:
        void setMechB0y(length_t b0y);
        length_t getMechB0y();
    protected:
        void setMechB0yImpl(length_t b0y);
        length_t getMechB0yImpl();
    public:
        void setMechB0z(length_t b0z);
        length_t getMechB0z();
    protected:
        void setMechB0zImpl(length_t b0z);
        length_t getMechB0zImpl();
    public:
        void setMechB1x(length_t b1x);
        length_t getMechB1x();
    protected:
        void setMechB1xImpl(length_t b1x);
        length_t getMechB1xImpl();
    public:
        void setMechB1y(length_t b1y);
        length_t getMechB1y();
    protected:
        void setMechB1yImpl(length_t b1y);
        length_t getMechB1yImpl();
    public:
        void setMechB1z(length_t b1z);
        length_t getMechB1z();
    protected:
        void setMechB1zImpl(length_t b1z);
        length_t getMechB1zImpl();
    public:
        void setMechRTCP_anglesType(anglesType_t RTCP_anglesType);
        anglesType_t getMechRTCP_anglesType();
    protected:
        void setMechRTCP_anglesTypeImpl(anglesType_t RTCP_anglesType);
        anglesType_t getMechRTCP_anglesTypeImpl();
    public:
        void setMechT_anglesType(anglesType_t T_anglesType);
        anglesType_t getMechT_anglesType();
    protected:
        void setMechT_anglesTypeImpl(anglesType_t T_anglesType);
        anglesType_t getMechT_anglesTypeImpl();
    public:
        void setMechRTCP_phi(angle_t RTCP_phi);
        angle_t getMechRTCP_phi();
    protected:
        void setMechRTCP_phiImpl(angle_t RTCP_phi);
        angle_t getMechRTCP_phiImpl();
    public:
        void setMechRTCP_theta(angle_t RTCP_theta);
        angle_t getMechRTCP_theta();
    protected:
        void setMechRTCP_thetaImpl(angle_t RTCP_theta);
        angle_t getMechRTCP_thetaImpl();
    public:
        void setMechRTCP_psi(angle_t RTCP_psi);
        angle_t getMechRTCP_psi();
    protected:
        void setMechRTCP_psiImpl(angle_t RTCP_psi);
        angle_t getMechRTCP_psiImpl();
    public:
        void setMechT_phi(angle_t T_phi);
        angle_t getMechT_phi();
    protected:
        void setMechT_phiImpl(angle_t T_phi);
        angle_t getMechT_phiImpl();
    public:
        void setMechT_theta(angle_t T_theta);
        angle_t getMechT_theta();
    protected:
        void setMechT_thetaImpl(angle_t T_theta);
        angle_t getMechT_thetaImpl();
    public:
        void setMechT_psi(angle_t T_psi);
        angle_t getMechT_psi();
    protected:
        void setMechT_psiImpl(angle_t T_psi);
        angle_t getMechT_psiImpl();
    public:
        void setMechFrameRTCPDx(length_t dx);
        length_t getMechFrameRTCPDx();
    protected:
        void setMechFrameRTCPDxImpl(length_t dx);
        length_t getMechFrameRTCPDxImpl();
    public:
        void setMechFrameRTCPDy(length_t dy);
        length_t getMechFrameRTCPDy();
    protected:
        void setMechFrameRTCPDyImpl(length_t dy);
        length_t getMechFrameRTCPDyImpl();
    public:
        void setMechFrameRTCPDz(length_t dz);
        length_t getMechFrameRTCPDz();
    protected:
        void setMechFrameRTCPDzImpl(length_t dz);
        length_t getMechFrameRTCPDzImpl();
    public:
        void setMechFrameRTCPPhi(angle_t phi);
        angle_t getMechFrameRTCPPhi();
    protected:
        void setMechFrameRTCPPhiImpl(angle_t phi);
        angle_t getMechFrameRTCPPhiImpl();
    public:
        void setMechFrameRTCPTheta(angle_t theta);
        angle_t getMechFrameRTCPTheta();
    protected:
        void setMechFrameRTCPThetaImpl(angle_t theta);
        angle_t getMechFrameRTCPThetaImpl();
    public:
        void setMechFrameRTCPPsi(angle_t psi);
        angle_t getMechFrameRTCPPsi();
    protected:
        void setMechFrameRTCPPsiImpl(angle_t psi);
        angle_t getMechFrameRTCPPsiImpl();
    public:
        void setMechFrameRTCPAnglesType(anglesType_t item);
        anglesType_t getMechFrameRTCPAnglesType();
    protected:
        void setMechFrameRTCPAnglesTypeImpl(anglesType_t item);
        anglesType_t getMechFrameRTCPAnglesTypeImpl();
    public:
        void disMechFrameRTCP();
    protected:
        void disMechFrameRTCPImpl();
        CRobot* cloneImpl();
    private:
        CMech20 mech;
        virtual void compDirectA();
        virtual void compInverseA();
        virtual void compSize();
        void justRTCPdirect(pos_t *inPos, pos_t *outPos);
    };

    class CMech21
    {
    public:
        CFrame frame_a0;
        length_t a1y;
        length_t a1z;
        length_t a2x;
        length_t a2z;
        length_t a3y;
        length_t a3z;
        length_t a4;
        angle_t a4a;
        length_t a5y;
        CAnglesType anglesType;
        angle_t accuracyAngle;
        length_t accuracyPos;
        bool smoothPath;
        CMech21();
    };
    class CRobot21: public TRobot<
        7,
        0,
        6,
        6,
        0,
        0
        >
    {
    public:
        CRobot21();

    public:
        void setMechFrameA0Dx(length_t dx);
        length_t getMechFrameA0Dx();
    protected:
        void setMechFrameA0DxImpl(length_t dx);
        length_t getMechFrameA0DxImpl();
    public:
        void setMechFrameA0Dy(length_t dy);
        length_t getMechFrameA0Dy();
    protected:
        void setMechFrameA0DyImpl(length_t dy);
        length_t getMechFrameA0DyImpl();
    public:
        void setMechFrameA0Dz(length_t dz);
        length_t getMechFrameA0Dz();
    protected:
        void setMechFrameA0DzImpl(length_t dz);
        length_t getMechFrameA0DzImpl();
    public:
        void setMechFrameA0Phi(angle_t phi);
        angle_t getMechFrameA0Phi();
    protected:
        void setMechFrameA0PhiImpl(angle_t phi);
        angle_t getMechFrameA0PhiImpl();
    public:
        void setMechFrameA0Theta(angle_t theta);
        angle_t getMechFrameA0Theta();
    protected:
        void setMechFrameA0ThetaImpl(angle_t theta);
        angle_t getMechFrameA0ThetaImpl();
    public:
        void setMechFrameA0Psi(angle_t psi);
        angle_t getMechFrameA0Psi();
    protected:
        void setMechFrameA0PsiImpl(angle_t psi);
        angle_t getMechFrameA0PsiImpl();
    public:
        void setMechFrameA0AnglesType(anglesType_t item);
        anglesType_t getMechFrameA0AnglesType();
    protected:
        void setMechFrameA0AnglesTypeImpl(anglesType_t item);
        anglesType_t getMechFrameA0AnglesTypeImpl();
    public:
        void disMechFrameA0();
    protected:
        void disMechFrameA0Impl();
    public:
        void setMechA1y(length_t a1y);
        length_t getMechA1y();
    protected:
        void setMechA1yImpl(length_t a1y);
        length_t getMechA1yImpl();
    public:
        void setMechA1z(length_t a1z);
        length_t getMechA1z();
    protected:
        void setMechA1zImpl(length_t a1z);
        length_t getMechA1zImpl();
    public:
        void setMechA2x(length_t a2x);
        length_t getMechA2x();
    protected:
        void setMechA2xImpl(length_t a2x);
        length_t getMechA2xImpl();
    public:
        void setMechA2z(length_t a2z);
        length_t getMechA2z();
    protected:
        void setMechA2zImpl(length_t a2z);
        length_t getMechA2zImpl();
    public:
        void setMechA3y(length_t a3y);
        length_t getMechA3y();
    protected:
        void setMechA3yImpl(length_t a3y);
        length_t getMechA3yImpl();
    public:
        void setMechA3z(length_t a3z);
        length_t getMechA3z();
    protected:
        void setMechA3zImpl(length_t a3z);
        length_t getMechA3zImpl();
    public:
        void setMechA4(length_t a4);
        length_t getMechA4();
    protected:
        void setMechA4Impl(length_t a4);
        length_t getMechA4Impl();
    public:
        void setMechA4a(angle_t a4a);
        angle_t getMechA4a();
    protected:
        void setMechA4aImpl(angle_t a4a);
        angle_t getMechA4aImpl();
    public:
        void setMechA5y(length_t a5y);
        length_t getMechA5y();
    protected:
        void setMechA5yImpl(length_t a5y);
        length_t getMechA5yImpl();
    public:
        void setMechAnglesType(anglesType_t anglesType);
        anglesType_t getMechAnglesType();
    protected:
        void setMechAnglesTypeImpl(anglesType_t anglesType);
        anglesType_t getMechAnglesTypeImpl();
    protected:
        anglesType_t getAnglesTypeImpl()
        {
            return mech.anglesType.get();
        }
    public:
        void setMechAccuracyAngle(angle_t accuracyAngle);
        angle_t getMechAccuracyAngle();
    protected:
        void setMechAccuracyAngleImpl(angle_t accuracyAngle);
        angle_t getMechAccuracyAngleImpl();
    public:
        void setMechAccuracyPos(length_t accuracyPos);
        length_t getMechAccuracyPos();
    protected:
        void setMechAccuracyPosImpl(length_t accuracyPos);
        length_t getMechAccuracyPosImpl();
    public:
        void setMechSmoothPath(bool smoothPath);
        bool isMechSmoothPath();
    protected:
        void setMechSmoothPathImpl(bool smoothPath);
        bool isMechSmoothPathImpl();
        CRobot* cloneImpl();
    private:
        CMech21 mech;
        virtual void compDirectA();
        virtual void compInverseA();
        virtual void compJointsPos();
        void comp_PR_direct(lreal_t *q, lreal_t *z);
        void comp_PR_inverse(lreal_t *z_set, lreal_t *q_in, info_t *generalInfo);
        void JacobiMatrixL1(lreal_t *JL1, lreal_t *q);
        void JacobiMatrixL2(lreal_t *JL2, lreal_t *q);
        void JacobiMatrixL3(lreal_t *JL3, lreal_t *q);
        void JacobiMatrixL4(lreal_t *JL4, lreal_t *q);
        void JacobiMatrixL5(lreal_t *JL5, lreal_t *q);
        void JacobiMatrixL6(lreal_t *JL6, lreal_t *q);
    };

    class CMech22
    {
    public:
        length_t a0x;
        length_t a0z;
        length_t a1x;
        length_t a1z;
        length_t a2x;
        length_t a2z;
        length_t z0;
        length_t b0;
        length_t arm;
        CMech22();
    };
    class CRobot22: public TRobot<
        0,
        0,
        3,
        3,
        0,
        0
        >
    {
    public:
        CRobot22();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1x(length_t a1x);
        length_t getMechA1x();
    protected:
        void setMechA1xImpl(length_t a1x);
        length_t getMechA1xImpl();
    public:
        void setMechA1z(length_t a1z);
        length_t getMechA1z();
    protected:
        void setMechA1zImpl(length_t a1z);
        length_t getMechA1zImpl();
    public:
        void setMechA2x(length_t a2x);
        length_t getMechA2x();
    protected:
        void setMechA2xImpl(length_t a2x);
        length_t getMechA2xImpl();
    public:
        void setMechA2z(length_t a2z);
        length_t getMechA2z();
    protected:
        void setMechA2zImpl(length_t a2z);
        length_t getMechA2zImpl();
    public:
        void setMechZ0(length_t z0);
        length_t getMechZ0();
    protected:
        void setMechZ0Impl(length_t z0);
        length_t getMechZ0Impl();
    public:
        void setMechB0(length_t b0);
        length_t getMechB0();
    protected:
        void setMechB0Impl(length_t b0);
        length_t getMechB0Impl();
    public:
        void setMechArm(length_t arm);
        length_t getMechArm();
    protected:
        void setMechArmImpl(length_t arm);
        length_t getMechArmImpl();
        CRobot* cloneImpl();
    private:
        CMech22 mech;
        virtual void validateMech();
        virtual void compDirectA();
        virtual void compInverseA();
    };

    class CMech23
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a0z;
        angle_t a1angle;
        length_t a1radius;
        angle_t a2angle;
        length_t a2radius;
        angle_t a3angle;
        length_t a3radius;
        length_t pipe1;
        length_t pipe2;
        length_t pipe3;
        angle_t b1angle;
        length_t b1radius;
        angle_t b2angle;
        length_t b2radius;
        angle_t b3angle;
        length_t b3radius;
        length_t toolHolderLen;
        CMech23();
    };
    class CRobot23: public TRobot<
        0,
        0,
        3,
        3,
        0,
        0
        >
    {
    public:
        CRobot23();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1angle(angle_t a1angle);
        angle_t getMechA1angle();
    protected:
        void setMechA1angleImpl(angle_t a1angle);
        angle_t getMechA1angleImpl();
    public:
        void setMechA1radius(length_t a1radius);
        length_t getMechA1radius();
    protected:
        void setMechA1radiusImpl(length_t a1radius);
        length_t getMechA1radiusImpl();
    public:
        void setMechA2angle(angle_t a2angle);
        angle_t getMechA2angle();
    protected:
        void setMechA2angleImpl(angle_t a2angle);
        angle_t getMechA2angleImpl();
    public:
        void setMechA2radius(length_t a2radius);
        length_t getMechA2radius();
    protected:
        void setMechA2radiusImpl(length_t a2radius);
        length_t getMechA2radiusImpl();
    public:
        void setMechA3angle(angle_t a3angle);
        angle_t getMechA3angle();
    protected:
        void setMechA3angleImpl(angle_t a3angle);
        angle_t getMechA3angleImpl();
    public:
        void setMechA3radius(length_t a3radius);
        length_t getMechA3radius();
    protected:
        void setMechA3radiusImpl(length_t a3radius);
        length_t getMechA3radiusImpl();
    public:
        void setMechPipe1(length_t pipe1);
        length_t getMechPipe1();
    protected:
        void setMechPipe1Impl(length_t pipe1);
        length_t getMechPipe1Impl();
    public:
        void setMechPipe2(length_t pipe2);
        length_t getMechPipe2();
    protected:
        void setMechPipe2Impl(length_t pipe2);
        length_t getMechPipe2Impl();
    public:
        void setMechPipe3(length_t pipe3);
        length_t getMechPipe3();
    protected:
        void setMechPipe3Impl(length_t pipe3);
        length_t getMechPipe3Impl();
    public:
        void setMechB1angle(angle_t b1angle);
        angle_t getMechB1angle();
    protected:
        void setMechB1angleImpl(angle_t b1angle);
        angle_t getMechB1angleImpl();
    public:
        void setMechB1radius(length_t b1radius);
        length_t getMechB1radius();
    protected:
        void setMechB1radiusImpl(length_t b1radius);
        length_t getMechB1radiusImpl();
    public:
        void setMechB2angle(angle_t b2angle);
        angle_t getMechB2angle();
    protected:
        void setMechB2angleImpl(angle_t b2angle);
        angle_t getMechB2angleImpl();
    public:
        void setMechB2radius(length_t b2radius);
        length_t getMechB2radius();
    protected:
        void setMechB2radiusImpl(length_t b2radius);
        length_t getMechB2radiusImpl();
    public:
        void setMechB3angle(angle_t b3angle);
        angle_t getMechB3angle();
    protected:
        void setMechB3angleImpl(angle_t b3angle);
        angle_t getMechB3angleImpl();
    public:
        void setMechB3radius(length_t b3radius);
        length_t getMechB3radius();
    protected:
        void setMechB3radiusImpl(length_t b3radius);
        length_t getMechB3radiusImpl();
    public:
        void setMechToolHolderLen(length_t toolHolderLen);
        length_t getMechToolHolderLen();
    protected:
        void setMechToolHolderLenImpl(length_t toolHolderLen);
        length_t getMechToolHolderLenImpl();
        CRobot* cloneImpl();
    private:
        CMech23 mech;
        virtual void validateMech();
        virtual void compDirectA();
        virtual void compInverseA();
    };

    class CMech24
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a0z;
        angle_t a1angle;
        length_t a1radius;
        length_t a1dz;
        angle_t a2angle;
        length_t a2radius;
        length_t a2dz;
        angle_t a3angle;
        length_t a3radius;
        length_t a3dz;
        length_t m1dxy;
        length_t m1dz;
        length_t m2dxy;
        length_t m2dz;
        length_t m3dxy;
        length_t m3dz;
        length_t arm1;
        length_t arm2;
        length_t arm3;
        length_t armHolder1;
        length_t armHolder2;
        length_t armHolder3;
        length_t pipe1;
        length_t pipe2;
        length_t pipe3;
        length_t b1radius;
        length_t b1dz;
        length_t b2radius;
        length_t b2dz;
        length_t b3radius;
        length_t b3dz;
        length_t toolHolderLen;
        bool upper;
        CMech24();
    };
    typedef struct tripodDNodes_t
    {
        lreal_t A0[3];
        lreal_t A1[3];
        lreal_t A2[3];
        lreal_t A3[3];
        lreal_t B0[3];
        lreal_t B1[3];
        lreal_t B2[3];
        lreal_t B3[3];
        lreal_t C1[3];
        lreal_t C2[3];
        lreal_t C3[3];
    } tripodDNodes_t;
    class CRobot24: public TRobot<
        0,
        0,
        3,
        3,
        0,
        0
        >
    {
    public:
        CRobot24();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1angle(angle_t a1angle);
        angle_t getMechA1angle();
    protected:
        void setMechA1angleImpl(angle_t a1angle);
        angle_t getMechA1angleImpl();
    public:
        void setMechA1radius(length_t a1radius);
        length_t getMechA1radius();
    protected:
        void setMechA1radiusImpl(length_t a1radius);
        length_t getMechA1radiusImpl();
    public:
        void setMechA1dz(length_t a1dz);
        length_t getMechA1dz();
    protected:
        void setMechA1dzImpl(length_t a1dz);
        length_t getMechA1dzImpl();
    public:
        void setMechA2angle(angle_t a2angle);
        angle_t getMechA2angle();
    protected:
        void setMechA2angleImpl(angle_t a2angle);
        angle_t getMechA2angleImpl();
    public:
        void setMechA2radius(length_t a2radius);
        length_t getMechA2radius();
    protected:
        void setMechA2radiusImpl(length_t a2radius);
        length_t getMechA2radiusImpl();
    public:
        void setMechA2dz(length_t a2dz);
        length_t getMechA2dz();
    protected:
        void setMechA2dzImpl(length_t a2dz);
        length_t getMechA2dzImpl();
    public:
        void setMechA3angle(angle_t a3angle);
        angle_t getMechA3angle();
    protected:
        void setMechA3angleImpl(angle_t a3angle);
        angle_t getMechA3angleImpl();
    public:
        void setMechA3radius(length_t a3radius);
        length_t getMechA3radius();
    protected:
        void setMechA3radiusImpl(length_t a3radius);
        length_t getMechA3radiusImpl();
    public:
        void setMechA3dz(length_t a3dz);
        length_t getMechA3dz();
    protected:
        void setMechA3dzImpl(length_t a3dz);
        length_t getMechA3dzImpl();
    public:
        void setMechM1dxy(length_t m1dxy);
        length_t getMechM1dxy();
    protected:
        void setMechM1dxyImpl(length_t m1dxy);
        length_t getMechM1dxyImpl();
    public:
        void setMechM1dz(length_t m1dz);
        length_t getMechM1dz();
    protected:
        void setMechM1dzImpl(length_t m1dz);
        length_t getMechM1dzImpl();
    public:
        void setMechM2dxy(length_t m2dxy);
        length_t getMechM2dxy();
    protected:
        void setMechM2dxyImpl(length_t m2dxy);
        length_t getMechM2dxyImpl();
    public:
        void setMechM2dz(length_t m2dz);
        length_t getMechM2dz();
    protected:
        void setMechM2dzImpl(length_t m2dz);
        length_t getMechM2dzImpl();
    public:
        void setMechM3dxy(length_t m3dxy);
        length_t getMechM3dxy();
    protected:
        void setMechM3dxyImpl(length_t m3dxy);
        length_t getMechM3dxyImpl();
    public:
        void setMechM3dz(length_t m3dz);
        length_t getMechM3dz();
    protected:
        void setMechM3dzImpl(length_t m3dz);
        length_t getMechM3dzImpl();
    public:
        void setMechArm1(length_t arm1);
        length_t getMechArm1();
    protected:
        void setMechArm1Impl(length_t arm1);
        length_t getMechArm1Impl();
    public:
        void setMechArm2(length_t arm2);
        length_t getMechArm2();
    protected:
        void setMechArm2Impl(length_t arm2);
        length_t getMechArm2Impl();
    public:
        void setMechArm3(length_t arm3);
        length_t getMechArm3();
    protected:
        void setMechArm3Impl(length_t arm3);
        length_t getMechArm3Impl();
    public:
        void setMechArmHolder1(length_t armHolder1);
        length_t getMechArmHolder1();
    protected:
        void setMechArmHolder1Impl(length_t armHolder1);
        length_t getMechArmHolder1Impl();
    public:
        void setMechArmHolder2(length_t armHolder2);
        length_t getMechArmHolder2();
    protected:
        void setMechArmHolder2Impl(length_t armHolder2);
        length_t getMechArmHolder2Impl();
    public:
        void setMechArmHolder3(length_t armHolder3);
        length_t getMechArmHolder3();
    protected:
        void setMechArmHolder3Impl(length_t armHolder3);
        length_t getMechArmHolder3Impl();
    public:
        void setMechPipe1(length_t pipe1);
        length_t getMechPipe1();
    protected:
        void setMechPipe1Impl(length_t pipe1);
        length_t getMechPipe1Impl();
    public:
        void setMechPipe2(length_t pipe2);
        length_t getMechPipe2();
    protected:
        void setMechPipe2Impl(length_t pipe2);
        length_t getMechPipe2Impl();
    public:
        void setMechPipe3(length_t pipe3);
        length_t getMechPipe3();
    protected:
        void setMechPipe3Impl(length_t pipe3);
        length_t getMechPipe3Impl();
    public:
        void setMechB1radius(length_t b1radius);
        length_t getMechB1radius();
    protected:
        void setMechB1radiusImpl(length_t b1radius);
        length_t getMechB1radiusImpl();
    public:
        void setMechB1dz(length_t b1dz);
        length_t getMechB1dz();
    protected:
        void setMechB1dzImpl(length_t b1dz);
        length_t getMechB1dzImpl();
    public:
        void setMechB2radius(length_t b2radius);
        length_t getMechB2radius();
    protected:
        void setMechB2radiusImpl(length_t b2radius);
        length_t getMechB2radiusImpl();
    public:
        void setMechB2dz(length_t b2dz);
        length_t getMechB2dz();
    protected:
        void setMechB2dzImpl(length_t b2dz);
        length_t getMechB2dzImpl();
    public:
        void setMechB3radius(length_t b3radius);
        length_t getMechB3radius();
    protected:
        void setMechB3radiusImpl(length_t b3radius);
        length_t getMechB3radiusImpl();
    public:
        void setMechB3dz(length_t b3dz);
        length_t getMechB3dz();
    protected:
        void setMechB3dzImpl(length_t b3dz);
        length_t getMechB3dzImpl();
    public:
        void setMechToolHolderLen(length_t toolHolderLen);
        length_t getMechToolHolderLen();
    protected:
        void setMechToolHolderLenImpl(length_t toolHolderLen);
        length_t getMechToolHolderLenImpl();
    public:
        void setMechUpper(bool upper);
        bool isMechUpper();
    protected:
        void setMechUpperImpl(bool upper);
        bool isMechUpperImpl();
        CRobot* cloneImpl();
    private:
        CMech24 mech;
        virtual void validateMech();
        virtual void compDirectA();
        virtual void compInverseA();
        virtual mode_t compMode();
        void compNodes(tripodDNodes_t& tripodNodes);
    };

    class CMech25
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a0z;
        angle_t a1angle;
        length_t a1radius;
        length_t a1dz;
        angle_t a2angle;
        length_t a2radius;
        length_t a2dz;
        angle_t a3angle;
        length_t a3radius;
        length_t a3dz;
        length_t arm1;
        length_t arm2;
        length_t arm3;
        length_t pipe1;
        length_t pipe2;
        length_t pipe3;
        length_t b1radius;
        length_t b1dz;
        length_t b2radius;
        length_t b2dz;
        length_t b3radius;
        length_t b3dz;
        length_t toolHolderLen;
        bool upper;
        CMech25();
    };
    typedef struct tripodENodes_t
    {
        lreal_t A0[3];
        lreal_t A1[3];
        lreal_t A2[3];
        lreal_t A3[3];
        lreal_t B0[3];
        lreal_t B1[3];
        lreal_t B2[3];
        lreal_t B3[3];
        lreal_t C1[3];
        lreal_t C2[3];
        lreal_t C3[3];
    } tripodENodes_t;
    class CRobot25: public TRobot<
        0,
        0,
        4,
        4,
        0,
        0
        >
    {
    public:
        CRobot25();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1angle(angle_t a1angle);
        angle_t getMechA1angle();
    protected:
        void setMechA1angleImpl(angle_t a1angle);
        angle_t getMechA1angleImpl();
    public:
        void setMechA1radius(length_t a1radius);
        length_t getMechA1radius();
    protected:
        void setMechA1radiusImpl(length_t a1radius);
        length_t getMechA1radiusImpl();
    public:
        void setMechA1dz(length_t a1dz);
        length_t getMechA1dz();
    protected:
        void setMechA1dzImpl(length_t a1dz);
        length_t getMechA1dzImpl();
    public:
        void setMechA2angle(angle_t a2angle);
        angle_t getMechA2angle();
    protected:
        void setMechA2angleImpl(angle_t a2angle);
        angle_t getMechA2angleImpl();
    public:
        void setMechA2radius(length_t a2radius);
        length_t getMechA2radius();
    protected:
        void setMechA2radiusImpl(length_t a2radius);
        length_t getMechA2radiusImpl();
    public:
        void setMechA2dz(length_t a2dz);
        length_t getMechA2dz();
    protected:
        void setMechA2dzImpl(length_t a2dz);
        length_t getMechA2dzImpl();
    public:
        void setMechA3angle(angle_t a3angle);
        angle_t getMechA3angle();
    protected:
        void setMechA3angleImpl(angle_t a3angle);
        angle_t getMechA3angleImpl();
    public:
        void setMechA3radius(length_t a3radius);
        length_t getMechA3radius();
    protected:
        void setMechA3radiusImpl(length_t a3radius);
        length_t getMechA3radiusImpl();
    public:
        void setMechA3dz(length_t a3dz);
        length_t getMechA3dz();
    protected:
        void setMechA3dzImpl(length_t a3dz);
        length_t getMechA3dzImpl();
    public:
        void setMechArm1(length_t arm1);
        length_t getMechArm1();
    protected:
        void setMechArm1Impl(length_t arm1);
        length_t getMechArm1Impl();
    public:
        void setMechArm2(length_t arm2);
        length_t getMechArm2();
    protected:
        void setMechArm2Impl(length_t arm2);
        length_t getMechArm2Impl();
    public:
        void setMechArm3(length_t arm3);
        length_t getMechArm3();
    protected:
        void setMechArm3Impl(length_t arm3);
        length_t getMechArm3Impl();
    public:
        void setMechPipe1(length_t pipe1);
        length_t getMechPipe1();
    protected:
        void setMechPipe1Impl(length_t pipe1);
        length_t getMechPipe1Impl();
    public:
        void setMechPipe2(length_t pipe2);
        length_t getMechPipe2();
    protected:
        void setMechPipe2Impl(length_t pipe2);
        length_t getMechPipe2Impl();
    public:
        void setMechPipe3(length_t pipe3);
        length_t getMechPipe3();
    protected:
        void setMechPipe3Impl(length_t pipe3);
        length_t getMechPipe3Impl();
    public:
        void setMechB1radius(length_t b1radius);
        length_t getMechB1radius();
    protected:
        void setMechB1radiusImpl(length_t b1radius);
        length_t getMechB1radiusImpl();
    public:
        void setMechB1dz(length_t b1dz);
        length_t getMechB1dz();
    protected:
        void setMechB1dzImpl(length_t b1dz);
        length_t getMechB1dzImpl();
    public:
        void setMechB2radius(length_t b2radius);
        length_t getMechB2radius();
    protected:
        void setMechB2radiusImpl(length_t b2radius);
        length_t getMechB2radiusImpl();
    public:
        void setMechB2dz(length_t b2dz);
        length_t getMechB2dz();
    protected:
        void setMechB2dzImpl(length_t b2dz);
        length_t getMechB2dzImpl();
    public:
        void setMechB3radius(length_t b3radius);
        length_t getMechB3radius();
    protected:
        void setMechB3radiusImpl(length_t b3radius);
        length_t getMechB3radiusImpl();
    public:
        void setMechB3dz(length_t b3dz);
        length_t getMechB3dz();
    protected:
        void setMechB3dzImpl(length_t b3dz);
        length_t getMechB3dzImpl();
    public:
        void setMechToolHolderLen(length_t toolHolderLen);
        length_t getMechToolHolderLen();
    protected:
        void setMechToolHolderLenImpl(length_t toolHolderLen);
        length_t getMechToolHolderLenImpl();
    public:
        void setMechUpper(bool upper);
        bool isMechUpper();
    protected:
        void setMechUpperImpl(bool upper);
        bool isMechUpperImpl();
        CRobot* cloneImpl();
    private:
        CMech25 mech;
        virtual void validateMech();
        virtual void compDirectA();
        virtual void compInverseA();
        virtual mode_t compMode();
        void compNodes(tripodENodes_t& tripodNodes);
    };

    class CMech26
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a0z;
        length_t a1x;
        length_t a1y;
        length_t a1z;
        length_t a2x;
        length_t a2y;
        length_t a2z;
        length_t a3x;
        length_t a3y;
        length_t a3z;
        length_t a4x;
        length_t a4y;
        length_t a4z;
        CMech26();
    };
    class CRobot26: public TRobot<
        0,
        0,
        4,
        4,
        0,
        0
        >
    {
    public:
        CRobot26();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1x(length_t a1x);
        length_t getMechA1x();
    protected:
        void setMechA1xImpl(length_t a1x);
        length_t getMechA1xImpl();
    public:
        void setMechA1y(length_t a1y);
        length_t getMechA1y();
    protected:
        void setMechA1yImpl(length_t a1y);
        length_t getMechA1yImpl();
    public:
        void setMechA1z(length_t a1z);
        length_t getMechA1z();
    protected:
        void setMechA1zImpl(length_t a1z);
        length_t getMechA1zImpl();
    public:
        void setMechA2x(length_t a2x);
        length_t getMechA2x();
    protected:
        void setMechA2xImpl(length_t a2x);
        length_t getMechA2xImpl();
    public:
        void setMechA2y(length_t a2y);
        length_t getMechA2y();
    protected:
        void setMechA2yImpl(length_t a2y);
        length_t getMechA2yImpl();
    public:
        void setMechA2z(length_t a2z);
        length_t getMechA2z();
    protected:
        void setMechA2zImpl(length_t a2z);
        length_t getMechA2zImpl();
    public:
        void setMechA3x(length_t a3x);
        length_t getMechA3x();
    protected:
        void setMechA3xImpl(length_t a3x);
        length_t getMechA3xImpl();
    public:
        void setMechA3y(length_t a3y);
        length_t getMechA3y();
    protected:
        void setMechA3yImpl(length_t a3y);
        length_t getMechA3yImpl();
    public:
        void setMechA3z(length_t a3z);
        length_t getMechA3z();
    protected:
        void setMechA3zImpl(length_t a3z);
        length_t getMechA3zImpl();
    public:
        void setMechA4x(length_t a4x);
        length_t getMechA4x();
    protected:
        void setMechA4xImpl(length_t a4x);
        length_t getMechA4xImpl();
    public:
        void setMechA4y(length_t a4y);
        length_t getMechA4y();
    protected:
        void setMechA4yImpl(length_t a4y);
        length_t getMechA4yImpl();
    public:
        void setMechA4z(length_t a4z);
        length_t getMechA4z();
    protected:
        void setMechA4zImpl(length_t a4z);
        length_t getMechA4zImpl();
        CRobot* cloneImpl();
    private:
        CMech26 mech;
        virtual void compDirectA();
        virtual void compInverseA();
        virtual mode_t compMode();
    };

    class CMech27
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a0z;
        angle_t a1angle;
        length_t a1radius;
        length_t a1dz;
        angle_t a2angle;
        length_t a2radius;
        length_t a2dz;
        angle_t a3angle;
        length_t a3radius;
        length_t a3dz;
        length_t arm1;
        length_t arm2;
        length_t arm3;
        length_t pipe1;
        length_t pipe2;
        length_t pipe3;
        length_t b1radius;
        length_t b1dz;
        length_t b2radius;
        length_t b2dz;
        length_t b3radius;
        length_t b3dz;
        length_t toolHolderLen;
        bool upper;
        CMech27();
    };
    typedef struct tripodFNodes_t
    {
        lreal_t A0[3];
        lreal_t A1[3];
        lreal_t A2[3];
        lreal_t A3[3];
        lreal_t B0[3];
        lreal_t B1[3];
        lreal_t B2[3];
        lreal_t B3[3];
        lreal_t C1[3];
        lreal_t C2[3];
        lreal_t C3[3];
    } tripodFNodes_t;
    class CRobot27: public TRobot<
        0,
        0,
        4,
        4,
        0,
        0
        >
    {
    public:
        CRobot27();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1angle(angle_t a1angle);
        angle_t getMechA1angle();
    protected:
        void setMechA1angleImpl(angle_t a1angle);
        angle_t getMechA1angleImpl();
    public:
        void setMechA1radius(length_t a1radius);
        length_t getMechA1radius();
    protected:
        void setMechA1radiusImpl(length_t a1radius);
        length_t getMechA1radiusImpl();
    public:
        void setMechA1dz(length_t a1dz);
        length_t getMechA1dz();
    protected:
        void setMechA1dzImpl(length_t a1dz);
        length_t getMechA1dzImpl();
    public:
        void setMechA2angle(angle_t a2angle);
        angle_t getMechA2angle();
    protected:
        void setMechA2angleImpl(angle_t a2angle);
        angle_t getMechA2angleImpl();
    public:
        void setMechA2radius(length_t a2radius);
        length_t getMechA2radius();
    protected:
        void setMechA2radiusImpl(length_t a2radius);
        length_t getMechA2radiusImpl();
    public:
        void setMechA2dz(length_t a2dz);
        length_t getMechA2dz();
    protected:
        void setMechA2dzImpl(length_t a2dz);
        length_t getMechA2dzImpl();
    public:
        void setMechA3angle(angle_t a3angle);
        angle_t getMechA3angle();
    protected:
        void setMechA3angleImpl(angle_t a3angle);
        angle_t getMechA3angleImpl();
    public:
        void setMechA3radius(length_t a3radius);
        length_t getMechA3radius();
    protected:
        void setMechA3radiusImpl(length_t a3radius);
        length_t getMechA3radiusImpl();
    public:
        void setMechA3dz(length_t a3dz);
        length_t getMechA3dz();
    protected:
        void setMechA3dzImpl(length_t a3dz);
        length_t getMechA3dzImpl();
    public:
        void setMechArm1(length_t arm1);
        length_t getMechArm1();
    protected:
        void setMechArm1Impl(length_t arm1);
        length_t getMechArm1Impl();
    public:
        void setMechArm2(length_t arm2);
        length_t getMechArm2();
    protected:
        void setMechArm2Impl(length_t arm2);
        length_t getMechArm2Impl();
    public:
        void setMechArm3(length_t arm3);
        length_t getMechArm3();
    protected:
        void setMechArm3Impl(length_t arm3);
        length_t getMechArm3Impl();
    public:
        void setMechPipe1(length_t pipe1);
        length_t getMechPipe1();
    protected:
        void setMechPipe1Impl(length_t pipe1);
        length_t getMechPipe1Impl();
    public:
        void setMechPipe2(length_t pipe2);
        length_t getMechPipe2();
    protected:
        void setMechPipe2Impl(length_t pipe2);
        length_t getMechPipe2Impl();
    public:
        void setMechPipe3(length_t pipe3);
        length_t getMechPipe3();
    protected:
        void setMechPipe3Impl(length_t pipe3);
        length_t getMechPipe3Impl();
    public:
        void setMechB1radius(length_t b1radius);
        length_t getMechB1radius();
    protected:
        void setMechB1radiusImpl(length_t b1radius);
        length_t getMechB1radiusImpl();
    public:
        void setMechB1dz(length_t b1dz);
        length_t getMechB1dz();
    protected:
        void setMechB1dzImpl(length_t b1dz);
        length_t getMechB1dzImpl();
    public:
        void setMechB2radius(length_t b2radius);
        length_t getMechB2radius();
    protected:
        void setMechB2radiusImpl(length_t b2radius);
        length_t getMechB2radiusImpl();
    public:
        void setMechB2dz(length_t b2dz);
        length_t getMechB2dz();
    protected:
        void setMechB2dzImpl(length_t b2dz);
        length_t getMechB2dzImpl();
    public:
        void setMechB3radius(length_t b3radius);
        length_t getMechB3radius();
    protected:
        void setMechB3radiusImpl(length_t b3radius);
        length_t getMechB3radiusImpl();
    public:
        void setMechB3dz(length_t b3dz);
        length_t getMechB3dz();
    protected:
        void setMechB3dzImpl(length_t b3dz);
        length_t getMechB3dzImpl();
    public:
        void setMechToolHolderLen(length_t toolHolderLen);
        length_t getMechToolHolderLen();
    protected:
        void setMechToolHolderLenImpl(length_t toolHolderLen);
        length_t getMechToolHolderLenImpl();
    public:
        void setMechUpper(bool upper);
        bool isMechUpper();
    protected:
        void setMechUpperImpl(bool upper);
        bool isMechUpperImpl();
        CRobot* cloneImpl();
    private:
        CMech27 mech;
        virtual void validateMech();
        virtual void compDirectA();
        virtual void compInverseA();
        virtual mode_t compMode();
        void compNodes(tripodFNodes_t& tripodNodes);
    };

    class CMech28
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a0z;
        length_t a1x;
        length_t a1z;
        length_t a2x;
        length_t a2z;
        length_t bx;
        length_t by;
        length_t bz;
        length_t cx;
        length_t cz;
        length_t dx;
        length_t dy;
        length_t dz;
        length_t ex;
        length_t ez;
        length_t fx;
        length_t fy;
        length_t fz;
        length_t mpx;
        length_t mpy;
        length_t mpz;
        length_t a1a;
        length_t a2a;
        length_t ca;
        length_t ae;
        bool left;
        bool upper;
        bool negative;
        CMech28();
    };
    typedef struct CRobot28Nodes_t
    {
        lreal_t pointA[2];
        lreal_t pointC[2];
        lreal_t pointD[2];
        lreal_t pointE[2];
        lreal_t pointF[2];
        lreal_t pointMP[3];
    } CRobot28Nodes_t;
    class CRobot28: public TRobot<
        0,
        0,
        3,
        3,
        0,
        4
        >
    {
    public:
        CRobot28();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1x(length_t a1x);
        length_t getMechA1x();
    protected:
        void setMechA1xImpl(length_t a1x);
        length_t getMechA1xImpl();
    public:
        void setMechA1z(length_t a1z);
        length_t getMechA1z();
    protected:
        void setMechA1zImpl(length_t a1z);
        length_t getMechA1zImpl();
    public:
        void setMechA2x(length_t a2x);
        length_t getMechA2x();
    protected:
        void setMechA2xImpl(length_t a2x);
        length_t getMechA2xImpl();
    public:
        void setMechA2z(length_t a2z);
        length_t getMechA2z();
    protected:
        void setMechA2zImpl(length_t a2z);
        length_t getMechA2zImpl();
    public:
        void setMechBx(length_t bx);
        length_t getMechBx();
    protected:
        void setMechBxImpl(length_t bx);
        length_t getMechBxImpl();
    public:
        void setMechBy(length_t by);
        length_t getMechBy();
    protected:
        void setMechByImpl(length_t by);
        length_t getMechByImpl();
    public:
        void setMechBz(length_t bz);
        length_t getMechBz();
    protected:
        void setMechBzImpl(length_t bz);
        length_t getMechBzImpl();
    public:
        void setMechCx(length_t cx);
        length_t getMechCx();
    protected:
        void setMechCxImpl(length_t cx);
        length_t getMechCxImpl();
    public:
        void setMechCz(length_t cz);
        length_t getMechCz();
    protected:
        void setMechCzImpl(length_t cz);
        length_t getMechCzImpl();
    public:
        void setMechDx(length_t dx);
        length_t getMechDx();
    protected:
        void setMechDxImpl(length_t dx);
        length_t getMechDxImpl();
    public:
        void setMechDy(length_t dy);
        length_t getMechDy();
    protected:
        void setMechDyImpl(length_t dy);
        length_t getMechDyImpl();
    public:
        void setMechDz(length_t dz);
        length_t getMechDz();
    protected:
        void setMechDzImpl(length_t dz);
        length_t getMechDzImpl();
    public:
        void setMechEx(length_t ex);
        length_t getMechEx();
    protected:
        void setMechExImpl(length_t ex);
        length_t getMechExImpl();
    public:
        void setMechEz(length_t ez);
        length_t getMechEz();
    protected:
        void setMechEzImpl(length_t ez);
        length_t getMechEzImpl();
    public:
        void setMechFx(length_t fx);
        length_t getMechFx();
    protected:
        void setMechFxImpl(length_t fx);
        length_t getMechFxImpl();
    public:
        void setMechFy(length_t fy);
        length_t getMechFy();
    protected:
        void setMechFyImpl(length_t fy);
        length_t getMechFyImpl();
    public:
        void setMechFz(length_t fz);
        length_t getMechFz();
    protected:
        void setMechFzImpl(length_t fz);
        length_t getMechFzImpl();
    public:
        void setMechMpx(length_t mpx);
        length_t getMechMpx();
    protected:
        void setMechMpxImpl(length_t mpx);
        length_t getMechMpxImpl();
    public:
        void setMechMpy(length_t mpy);
        length_t getMechMpy();
    protected:
        void setMechMpyImpl(length_t mpy);
        length_t getMechMpyImpl();
    public:
        void setMechMpz(length_t mpz);
        length_t getMechMpz();
    protected:
        void setMechMpzImpl(length_t mpz);
        length_t getMechMpzImpl();
    public:
        void setMechA1a(length_t a1a);
        length_t getMechA1a();
    protected:
        void setMechA1aImpl(length_t a1a);
        length_t getMechA1aImpl();
    public:
        void setMechA2a(length_t a2a);
        length_t getMechA2a();
    protected:
        void setMechA2aImpl(length_t a2a);
        length_t getMechA2aImpl();
    public:
        void setMechCa(length_t ca);
        length_t getMechCa();
    protected:
        void setMechCaImpl(length_t ca);
        length_t getMechCaImpl();
    public:
        void setMechAe(length_t ae);
        length_t getMechAe();
    protected:
        void setMechAeImpl(length_t ae);
        length_t getMechAeImpl();
    public:
        void setMechLeft(bool left);
        bool isMechLeft();
    protected:
        void setMechLeftImpl(bool left);
        bool isMechLeftImpl();
    public:
        void setMechUpper(bool upper);
        bool isMechUpper();
    protected:
        void setMechUpperImpl(bool upper);
        bool isMechUpperImpl();
    public:
        void setMechNegative(bool negative);
        bool isMechNegative();
    protected:
        void setMechNegativeImpl(bool negative);
        bool isMechNegativeImpl();
        CRobot* cloneImpl();
    private:
        CMech28 mech;
        virtual void validateMech();
        virtual void compDirectA();
        virtual void compInverseA();
        virtual mode_t compMode();
        void compNodes(CRobot28Nodes_t& nodes);
    };

    class CMech29
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a0z;
        length_t a1x;
        length_t a1y;
        length_t a1z;
        length_t a2x;
        length_t a2y;
        length_t a2z;
        length_t a3x;
        length_t a3y;
        length_t a3z;
        length_t a4x;
        length_t a4y;
        length_t a4z;
        CMech29();
    };
    class CRobot29: public TRobot<
        6,
        0,
        4,
        4,
        0,
        0
        >
    {
    public:
        CRobot29();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1x(length_t a1x);
        length_t getMechA1x();
    protected:
        void setMechA1xImpl(length_t a1x);
        length_t getMechA1xImpl();
    public:
        void setMechA1y(length_t a1y);
        length_t getMechA1y();
    protected:
        void setMechA1yImpl(length_t a1y);
        length_t getMechA1yImpl();
    public:
        void setMechA1z(length_t a1z);
        length_t getMechA1z();
    protected:
        void setMechA1zImpl(length_t a1z);
        length_t getMechA1zImpl();
    public:
        void setMechA2x(length_t a2x);
        length_t getMechA2x();
    protected:
        void setMechA2xImpl(length_t a2x);
        length_t getMechA2xImpl();
    public:
        void setMechA2y(length_t a2y);
        length_t getMechA2y();
    protected:
        void setMechA2yImpl(length_t a2y);
        length_t getMechA2yImpl();
    public:
        void setMechA2z(length_t a2z);
        length_t getMechA2z();
    protected:
        void setMechA2zImpl(length_t a2z);
        length_t getMechA2zImpl();
    public:
        void setMechA3x(length_t a3x);
        length_t getMechA3x();
    protected:
        void setMechA3xImpl(length_t a3x);
        length_t getMechA3xImpl();
    public:
        void setMechA3y(length_t a3y);
        length_t getMechA3y();
    protected:
        void setMechA3yImpl(length_t a3y);
        length_t getMechA3yImpl();
    public:
        void setMechA3z(length_t a3z);
        length_t getMechA3z();
    protected:
        void setMechA3zImpl(length_t a3z);
        length_t getMechA3zImpl();
    public:
        void setMechA4x(length_t a4x);
        length_t getMechA4x();
    protected:
        void setMechA4xImpl(length_t a4x);
        length_t getMechA4xImpl();
    public:
        void setMechA4y(length_t a4y);
        length_t getMechA4y();
    protected:
        void setMechA4yImpl(length_t a4y);
        length_t getMechA4yImpl();
    public:
        void setMechA4z(length_t a4z);
        length_t getMechA4z();
    protected:
        void setMechA4zImpl(length_t a4z);
        length_t getMechA4zImpl();
        CRobot* cloneImpl();
    private:
        CMech29 mech;
        virtual void compDirectA();
        virtual void compInverseA();
        virtual void compJointsPos();
        virtual mode_t compMode();
    };

    class CMech30
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a0z;
        length_t a1x;
        length_t a1y;
        length_t a1z;
        length_t a2x;
        length_t a2y;
        length_t a2z;
        length_t a3x;
        length_t a3y;
        length_t a3z;
        CMech30();
    };
    class CRobot30: public TRobot<
        0,
        0,
        3,
        3,
        0,
        0
        >
    {
    public:
        CRobot30();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1x(length_t a1x);
        length_t getMechA1x();
    protected:
        void setMechA1xImpl(length_t a1x);
        length_t getMechA1xImpl();
    public:
        void setMechA1y(length_t a1y);
        length_t getMechA1y();
    protected:
        void setMechA1yImpl(length_t a1y);
        length_t getMechA1yImpl();
    public:
        void setMechA1z(length_t a1z);
        length_t getMechA1z();
    protected:
        void setMechA1zImpl(length_t a1z);
        length_t getMechA1zImpl();
    public:
        void setMechA2x(length_t a2x);
        length_t getMechA2x();
    protected:
        void setMechA2xImpl(length_t a2x);
        length_t getMechA2xImpl();
    public:
        void setMechA2y(length_t a2y);
        length_t getMechA2y();
    protected:
        void setMechA2yImpl(length_t a2y);
        length_t getMechA2yImpl();
    public:
        void setMechA2z(length_t a2z);
        length_t getMechA2z();
    protected:
        void setMechA2zImpl(length_t a2z);
        length_t getMechA2zImpl();
    public:
        void setMechA3x(length_t a3x);
        length_t getMechA3x();
    protected:
        void setMechA3xImpl(length_t a3x);
        length_t getMechA3xImpl();
    public:
        void setMechA3y(length_t a3y);
        length_t getMechA3y();
    protected:
        void setMechA3yImpl(length_t a3y);
        length_t getMechA3yImpl();
    public:
        void setMechA3z(length_t a3z);
        length_t getMechA3z();
    protected:
        void setMechA3zImpl(length_t a3z);
        length_t getMechA3zImpl();
        CRobot* cloneImpl();
    private:
        CMech30 mech;
        virtual void compDirectA();
        virtual void compInverseA();
        virtual mode_t compMode();
    };

    class CMech31
    {
    public:
        length_t a0x;
        length_t a0y;
        length_t a0z;
        length_t a1x;
        length_t a1y;
        length_t a1z;
        length_t a2x;
        length_t a2y;
        length_t a2z;
        length_t a3x;
        length_t a3y;
        length_t a3z;
        length_t a4x;
        length_t a4y;
        length_t a4z;
        CMech31();
    };
    class CRobot31: public TRobot<
        0,
        0,
        4,
        4,
        0,
        0
        >
    {
    public:
        CRobot31();

    public:
        void setMechA0x(length_t a0x);
        length_t getMechA0x();
    protected:
        void setMechA0xImpl(length_t a0x);
        length_t getMechA0xImpl();
    public:
        void setMechA0y(length_t a0y);
        length_t getMechA0y();
    protected:
        void setMechA0yImpl(length_t a0y);
        length_t getMechA0yImpl();
    public:
        void setMechA0z(length_t a0z);
        length_t getMechA0z();
    protected:
        void setMechA0zImpl(length_t a0z);
        length_t getMechA0zImpl();
    public:
        void setMechA1x(length_t a1x);
        length_t getMechA1x();
    protected:
        void setMechA1xImpl(length_t a1x);
        length_t getMechA1xImpl();
    public:
        void setMechA1y(length_t a1y);
        length_t getMechA1y();
    protected:
        void setMechA1yImpl(length_t a1y);
        length_t getMechA1yImpl();
    public:
        void setMechA1z(length_t a1z);
        length_t getMechA1z();
    protected:
        void setMechA1zImpl(length_t a1z);
        length_t getMechA1zImpl();
    public:
        void setMechA2x(length_t a2x);
        length_t getMechA2x();
    protected:
        void setMechA2xImpl(length_t a2x);
        length_t getMechA2xImpl();
    public:
        void setMechA2y(length_t a2y);
        length_t getMechA2y();
    protected:
        void setMechA2yImpl(length_t a2y);
        length_t getMechA2yImpl();
    public:
        void setMechA2z(length_t a2z);
        length_t getMechA2z();
    protected:
        void setMechA2zImpl(length_t a2z);
        length_t getMechA2zImpl();
    public:
        void setMechA3x(length_t a3x);
        length_t getMechA3x();
    protected:
        void setMechA3xImpl(length_t a3x);
        length_t getMechA3xImpl();
    public:
        void setMechA3y(length_t a3y);
        length_t getMechA3y();
    protected:
        void setMechA3yImpl(length_t a3y);
        length_t getMechA3yImpl();
    public:
        void setMechA3z(length_t a3z);
        length_t getMechA3z();
    protected:
        void setMechA3zImpl(length_t a3z);
        length_t getMechA3zImpl();
    public:
        void setMechA4x(length_t a4x);
        length_t getMechA4x();
    protected:
        void setMechA4xImpl(length_t a4x);
        length_t getMechA4xImpl();
    public:
        void setMechA4y(length_t a4y);
        length_t getMechA4y();
    protected:
        void setMechA4yImpl(length_t a4y);
        length_t getMechA4yImpl();
    public:
        void setMechA4z(length_t a4z);
        length_t getMechA4z();
    protected:
        void setMechA4zImpl(length_t a4z);
        length_t getMechA4zImpl();
        CRobot* cloneImpl();
    private:
        CMech31 mech;
        virtual void compDirectA();
        virtual void compInverseA();
        virtual mode_t compMode();
    };

    template<id_t UserRobotID>
    class TLiteUserRobot: public CRobotLiteErr
    {
    protected:
        id_t getRobotIDImpl();
    protected:
        void cleanUpToDateFlags(id_t methodID, bool cleanAll);
    };

    template<id_t UserRobotID>
    class TStdUserRobot: public CStdRobot
    {
    private:
        id_t getRobotIDImpl();
    protected:
        void cleanUpToDateFlags(id_t methodID, bool cleanAll);
    };

    template <id_t UserRobotID>
    class TAdvancedUserRobot: public TRobot<
        maximalDimension,
        maximalDimension,
        maximalDimension,
        maximalDimension,
        maximalDimension,
        maximalDimension,
        maximalDimension,
        maximalDimension,
        maximalDimension,
        maximalDimension,
        maximalDimension,
        maximalDimension,
        maximalDimension,
        maximalDimension,
        maximalDimension
        >
    {
    protected:
        id_t getRobotIDImpl();
    };


} /* end of namespace TrfLib */

} /* end of extern "C++" */

#endif /*__cplusplus*/

#endif /*_TRF_LIB_OBJECT_H_INCLUDED_*/
