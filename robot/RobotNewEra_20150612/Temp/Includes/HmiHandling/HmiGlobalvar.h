/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1479044160_19_
#define _BUR_1479044160_19_

#include <bur/plctypes.h>

/* Constants */
#ifdef _REPLACE_CONST
 #define STOP 0U
 #define PAUSE 1U
 #define RUN 2U
 #define JOG 0U
 #define DISABLED 3U
 #define AUTO 1U
 #define LOCK 2U
 #define ERROR 3U
 #define USER_ADMINISTRATOR 3U
 #define WARN_MESSAGE_NUM 19U
 #define LINENUMBER_PERPAGE_MINUS 18U
 #define LINENUMBER_PERPAGE 19U
 #define USER_PROGRAMMER 2U
 #define USER_OPERATOR 1U
 #define USER_GUEST 0U
 #define LANG_CHINESE 1U
 #define LANG_ENGLISH 0U
 #define LAYER_SHOW 0U
 #define LAYER_HIDE 1U
 #define PROG_CMD_NUMBER 1000U
 #define PROG_READ_NUMBER 120000U
 #define STRING_PER_LINE 120U
 #define PAGE_ALARM 700U
 #define PAGE_JOGGING 600U
 #define PAGE_EDITOR_DATA 510U
 #define PAGE_EDITOR 500U
 #define PAGE_PROGRAM 400U
 #define PAGE_IO 300U
 #define PAGE_SETUP 200U
 #define PAGE_SETUPCALIB 240U
 #define PAGE_SETUPAXIS 220U
 #define PAGE_SETUPKINEMATICS 230U
 #define PAGE_MAIN 100U
 #define MAX_FIELD_ALRAMS 6U
 #define MAX_WARNINGS 50U
 #define MAX_ALARMS 100U
 #define MAX_ERRORS 1000U
 #define MAX_PAGE_KEY_MINUS_ONE 6U
 #define MAX_PAGE_KEY 7U
 #define MAX_FUNCTION_KEY_MINUS_ONE 8U
 #define MAX_FUNCTION_KEY 9U
 #define MAX_PLUS_MINUS_KEY_MINUS_ONE 5U
 #define MAX_PLUS_MINUS_KEY 6U
 #define MAX_DEVICES 9U
 #define ARSIM_PC 3U
 #define MAX_REAL_AX_MINUS_ONE 5U
#else
 _GLOBAL_CONST unsigned char STOP;
 _GLOBAL_CONST unsigned char PAUSE;
 _GLOBAL_CONST unsigned char RUN;
 _GLOBAL_CONST unsigned char JOG;
 _GLOBAL_CONST unsigned char DISABLED;
 _GLOBAL_CONST unsigned char AUTO;
 _GLOBAL_CONST unsigned char LOCK;
 _GLOBAL_CONST unsigned char ERROR;
 _GLOBAL_CONST unsigned char USER_ADMINISTRATOR;
 _GLOBAL_CONST unsigned char WARN_MESSAGE_NUM;
 _GLOBAL_CONST unsigned char LINENUMBER_PERPAGE_MINUS;
 _GLOBAL_CONST unsigned char LINENUMBER_PERPAGE;
 _GLOBAL_CONST unsigned char USER_PROGRAMMER;
 _GLOBAL_CONST unsigned char USER_OPERATOR;
 _GLOBAL_CONST unsigned char USER_GUEST;
 _GLOBAL_CONST unsigned char LANG_CHINESE;
 _GLOBAL_CONST unsigned char LANG_ENGLISH;
 _GLOBAL_CONST unsigned char LAYER_SHOW;
 _GLOBAL_CONST unsigned char LAYER_HIDE;
 _GLOBAL_CONST unsigned short PROG_CMD_NUMBER;
 _GLOBAL_CONST unsigned long PROG_READ_NUMBER;
 _GLOBAL_CONST unsigned char STRING_PER_LINE;
 _GLOBAL_CONST unsigned short PAGE_ALARM;
 _GLOBAL_CONST unsigned short PAGE_JOGGING;
 _GLOBAL_CONST unsigned short PAGE_EDITOR_DATA;
 _GLOBAL_CONST unsigned short PAGE_EDITOR;
 _GLOBAL_CONST unsigned short PAGE_PROGRAM;
 _GLOBAL_CONST unsigned short PAGE_IO;
 _GLOBAL_CONST unsigned short PAGE_SETUP;
 _GLOBAL_CONST unsigned short PAGE_SETUPCALIB;
 _GLOBAL_CONST unsigned short PAGE_SETUPAXIS;
 _GLOBAL_CONST unsigned short PAGE_SETUPKINEMATICS;
 _GLOBAL_CONST unsigned short PAGE_MAIN;
 _GLOBAL_CONST unsigned char MAX_FIELD_ALRAMS;
 _GLOBAL_CONST unsigned char MAX_WARNINGS;
 _GLOBAL_CONST unsigned char MAX_ALARMS;
 _GLOBAL_CONST unsigned short MAX_ERRORS;
 _GLOBAL_CONST unsigned char MAX_PAGE_KEY_MINUS_ONE;
 _GLOBAL_CONST unsigned char MAX_PAGE_KEY;
 _GLOBAL_CONST unsigned char MAX_FUNCTION_KEY_MINUS_ONE;
 _GLOBAL_CONST unsigned char MAX_FUNCTION_KEY;
 _GLOBAL_CONST unsigned char MAX_PLUS_MINUS_KEY_MINUS_ONE;
 _GLOBAL_CONST unsigned char MAX_PLUS_MINUS_KEY;
 _GLOBAL_CONST unsigned short MAX_DEVICES;
 _GLOBAL_CONST unsigned char ARSIM_PC;
 _GLOBAL_CONST unsigned char MAX_REAL_AX_MINUS_ONE;
#endif


/* Variables */
_GLOBAL plcbit WarnMessage[20];
_GLOBAL_RETAIN struct HmiRetain_Type HmiRetain;
_GLOBAL struct HmiGlobal_Type HmiGlobal;
_GLOBAL struct MXToolType MX_TOOL_ZERO;
_GLOBAL struct MXFrameType MX_FRAME_ZERO;
_GLOBAL struct MXPointType MX_POINT_ZERO;





__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/HmiHandling/HmiGlobal.var\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1479044160_19_ */

