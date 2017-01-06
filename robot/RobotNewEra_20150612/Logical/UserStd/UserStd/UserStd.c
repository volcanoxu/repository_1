/********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: User
 * File: User.c
 * Author: Liub
 * Created: January 16, 2012
 ********************************************************************
 * Implementation of program User
 ********************************************************************/
/*任务功能*/
/*日期时间设定 用户登录推出 密码级别管理*/
/* Level 1 - machine worker 机长*/
/* Level 2 - factory worker 班长*/
/* Level 3 - 设备管理员 */
/* Level 4 - 厂方人员*/
#include <bur/plctypes.h>
#include <string.h>
#ifdef _DEFAULT_INCLUDES
	#include <AsDefault.h>
#endif

/*step for task*/
#define		STEP_WAIT_COMMAND			0
#define		STEP_LOG_IN			        100
#define		STEP_LOG_OUT_TO_PRE			200
#define		STEP_LOG_OUT			    300
#define		STEP_NEW_USER				400
#define		STEP_DEL_USER				500
#define		STEP_SAVE_DATAOBJ           550
#define		STEP_REFRESH_VIS            600
/*info to vis*/
#define		MAX_NO_INFO				    15
#define		INFO_CREATE_OK			    1
#define		INFO_LOAD_OK			    2
#define		INFO_WRITE_OK			    3
#define		INFO_DEL_OK				    4
#define		INFO_HAVE_NAME			    5		/*have name can not save at here*/
/*alarm to vis*/
#define		ERR_CREATE_MODULE		    16		/*Alarm*/
#define		ERR_LOAD				    17
#define		ERR_WRITE				    18
#define		ERR_DEL					    19
#define		ERR_REFRESH_NAME            20
#define		ERR_STRU_NAME               21      /*data object structure name can not find*/
#define		ERR_DATA_OBJ_SIZE           22      /*data object size has changed,delete old one restart again*/
#define		ERR_MEM_ALLOC               23      /*memalloc error*/


void _INIT UserINIT(void)
{
	/* TODO: Add code here */
    /*constant variable declear,otherwise buile warning happen*/
    constant = MAX_PASSWORD_LENGTH;
    constant = MAX_USER_MINUS_ONE;
    constant = MAX_USER_NAME_LENGTH;
    /*Get data object info*/
    dataObjInfo.enable = 1;
    dataObjInfo.pName = (UDINT)PASSWORD_DATA_NAME;
    DatObjInfo(&dataObjInfo);
    if(dataObjInfo.status == 0)                           /*数据模块存在    --  获取id*/
    {
        ident = dataObjInfo.ident;
        dataObjSize = dataObjInfo.len;
        /**********Read*********/
        dataObjRead.enable 		= 1;
        dataObjRead.ident 		= ident;
        dataObjRead.Offset 		= 0;
        dataObjRead.pDestination	= (UDINT) &userData;
        dataObjRead.len 			= sizeof (userData);
 
        /* Call FUB */
        DatObjRead(&dataObjRead);
        if(dataObjRead.status==0)
        {
        }
        else if(dataObjRead.status!=65535)
        {
            errorInfo = ERR_LOAD;		/*Datamodule read error Please restart again*/
            errorNumber = dataObjRead.status;
        }
    }	
    else if(dataObjInfo.status == doERR_MODULNOTFOUND)    /*数据模块不存在   --  创建数据模块*/
    {
        dataObjSize             = sizeof (userData_typ);
        dataObjCreate.enable    = 1;
        dataObjCreate.grp	    = 0;
        dataObjCreate.pName     = (UDINT)PASSWORD_DATA_NAME;
        dataObjCreate.len	    = sizeof (userData);
        dataObjCreate.MemType   = 2;		/*doUSRROM  2 */
        dataObjCreate.Option	= 0;		/*with  checksum*/
        dataObjCreate.pCpyData  = 0;
        DatObjCreate(&dataObjCreate);
        if(dataObjCreate.status == 0)
        {
            ident = dataObjCreate.ident;
        }
        else
        {
            errorInfo = ERR_CREATE_MODULE;		/*Datamodule create error Please restart again*/
            errorNumber = dataObjCreate.status;
        }
    }	
    /*data object size maybe a little bigger(1-3) than structure size because of offset*/
    /*data structure size must smaller than data object size*/ 
    dataStruSize = sizeof (userData);
    userData.level[0] = userData.level[0];
    /*dataObjSize is multiple of 4,so some time it is a little bigger than dataStruSize*/
    /*for example dataStruSize=3,dataObjSize=4*/
    if((dataObjSize - dataStruSize)>=4 || (dataStruSize > dataObjSize))
    {
        errorInfo = ERR_DATA_OBJ_SIZE;	
        initError = 1;
    }
}

void _CYCLIC UserCYCLIC(void)
{
    /* TODO: Add code here */
    if(initError == 1) return;
    /*Only high password level can quit to low password level*/
    if((curUser.level > preUser.level) && (preUser.userName[0] != 0))
    {
        disableLogOutToPre = 0;		/*Show this button*/
    }
    else
    {
        disableLogOutToPre = 1;		/*do not show button on vis*/
    }
    switch(userStep)
    {
        case STEP_WAIT_COMMAND:
            if(cmdLogIn)
            {
                cmdLogIn = 0;
                if(curPassword[0] != 0)	/*password not empty*/
                {
                    userStep = STEP_LOG_IN;
                }	
            }
            else if(cmdLogOutToPre)
            {
                cmdLogOutToPre = 0;
                userStep = STEP_LOG_OUT_TO_PRE;
            }
            else if(cmdLogOut)
            {
                cmdLogOut = 0;
                userStep = STEP_LOG_OUT;
            }
            else if(cmdNewUser)
            {
                cmdNewUser = 0;
                if(newUser.userName[0] != 0)
                {
                    userStep = STEP_NEW_USER;
                }	
            }
            else if(cmdDelUser)
            {
                cmdDelUser = 0;
                if(visUserData.userName[focusIndex][0] != 0)
                {
                    userStep = STEP_DEL_USER;
                }	
            }			
            break;
        case STEP_LOG_IN:
            if(strcmp(curPassword,USER_ADMIN_PASSWORD)==0 )     /*system administrator password---3652101002101905469--091321186290913--*/
            {
                memcpy(&preUser,&curUser,sizeof(curUser));
                curUser.level = 4;
                strcpy(curUser.userName,"admin");
                userStep = STEP_REFRESH_VIS;
                curPassword[0] = 0;	                            /*Clear password*/
                break;				
            }		

            for(i=0;i<MAX_USER;i++)
            {
                result = strcmp(curPassword,userData.password[i]);
                if(result == 0)			/*Found a same password*/
                {
                    /*Transfer data to preUser*/
                    memcpy(&preUser,&curUser,sizeof(curUser));
                    /*Get curUser data*/
                    strcpy(curUser.userName,userData.userName[i]);
                    strcpy(curUser.password,userData.password[i]);
                    curUser.level = userData.level[i];
                    
                    userStep = STEP_REFRESH_VIS;
                    curPassword[0] = 0;	/*Clear password*/
                    break;
                }
            }
            if(i == MAX_USER)
            {
                userStep = STEP_WAIT_COMMAND;
            }
            curPassword[0] = 0;	                /*Clear password*/
            memset(&newUser,0,sizeof(newUser));	/*clear new user data*/
            break;
        case STEP_LOG_OUT_TO_PRE:
            memcpy(&curUser,&preUser,sizeof(curUser));
            memset(&newUser,0,sizeof(newUser));	/*clear new user data*/
            userStep = STEP_REFRESH_VIS;
            break;
        case STEP_LOG_OUT:
            memset(&curUser,0,sizeof(curUser));
            memset(&preUser,0,sizeof(preUser));
            memset(&newUser,0,sizeof(newUser));	/*clear new user data*/
            userStep = STEP_REFRESH_VIS;		
            break;
        case STEP_NEW_USER:
            if(newUser.password[0] == 0)
            {
                userStep = STEP_WAIT_COMMAND;
            }
            else
            {
                /*Save user to dataobj*/
                for(i=0;i<MAX_USER;i++)
                {
                    if(userData.userName[i][0] == 0)/*this is empty*/
                    {
                        strcpy(userData.userName[i],newUser.userName);
                        strcpy(userData.password[i],newUser.password);
                        if(newUser.level == 0)              newUser.level = 1;		        /*limit user level*/
                        if(newUser.level > MAX_USER_LEVEL)  newUser.level = MAX_USER_LEVEL; /*limit user level*/
                        userData.level[i] = newUser.level;
                        /*clear new user info*/
                        newUser.userName[0] = 0;
                        newUser.password[0] = 0;
                        newUser.level       = 0;
                        
                        userStep = STEP_SAVE_DATAOBJ;
                        break;
                    }
                }
                if(i == MAX_USER)
                {
                    userStep = STEP_WAIT_COMMAND;
                }
            }
            break;
        case STEP_DEL_USER:
            if(visUserData.userName[focusIndex][0] != 0)	/*Choose is not empty*/
            {
                memset(&userData.userName[visUserIndex[focusIndex]],0,sizeof(userData.userName[0]));
                memset(&userData.password[visUserIndex[focusIndex]],0,sizeof(userData.password[0]));
                userData.level[visUserIndex[focusIndex]] = 0;				
                userStep = STEP_SAVE_DATAOBJ;
            }
            break;   
        case STEP_SAVE_DATAOBJ:
            dataObjWrite.enable 	= 1;
            dataObjWrite.ident 	= ident;
            dataObjWrite.Offset 	= 0;
            dataObjWrite.pSource = (UDINT) &userData;
            dataObjWrite.len 	= sizeof (userData);
             			
            /* Call FUB */
            DatObjWrite(&dataObjWrite);
            if(dataObjWrite.status==0)
            {
                userStep = STEP_REFRESH_VIS;
            }
            else if(dataObjWrite.status!=65535)
            {
                userStep = STEP_WAIT_COMMAND;
            }		
            break;  
        case STEP_REFRESH_VIS:	/*user can only see level lower than himself*/
            memset(&visUserData,0,sizeof(visUserData));
            k = 0;
			// Added by RJ 2014/12/29
			HmiKeyControl.Components.LayerLogin.Layer.StatusDatapoint = 1;
            if(curUser.level != 0)
            {
                for(i=0;i<curUser.level;i++)
                {
                    for(j=0;j<MAX_USER;j++)
                    {
                        if(userData.level[j]==(i+1))
                        {
                            strcpy(visUserData.userName[k],userData.userName[j]);
                            strcpy(visUserData.password[k],userData.password[j]);
                            visUserData.level[k] = userData.level[j];
                            visUserIndex[k] = j;
                            k++;
                        }
                    }	
                }
            }
            userStep = STEP_WAIT_COMMAND;		
            break;		
    }
    gUserLevel = curUser.level;
}
