/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/michael/Documents/GitHub/stopwatch/display.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {3U, 0U};
static unsigned int ng5[] = {1U, 0U};



static void Initial_34_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(34, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 8, 0LL);

LAB1:    return;
}

static void Initial_35_1(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(35, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 5, 0LL);

LAB1:    return;
}

static void Always_37_2(char *t0)
{
    char t11[8];
    char t12[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;

LAB0:    t1 = (t0 + 4304U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 4624);
    *((int *)t2) = 1;
    t3 = (t0 + 4336);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(38, ng0);

LAB5:    xsi_set_current_line(39, ng0);
    t4 = (t0 + 2888);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t7, 32);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 32);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 32);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng4)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 32);
    if (t8 == 1)
        goto LAB13;

LAB14:
LAB15:    xsi_set_current_line(53, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 2888);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    memset(t12, 0, 8);
    xsi_vlog_unsigned_lshift(t12, 5, t2, 5, t5, 2);
    memset(t11, 0, 8);
    t7 = (t11 + 4);
    t9 = (t12 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (~(t13));
    *((unsigned int *)t11) = t14;
    *((unsigned int *)t7) = 0;
    if (*((unsigned int *)t9) != 0)
        goto LAB21;

LAB20:    t19 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t19 & 31U);
    t20 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t20 & 31U);
    t10 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t10, t11, 0, 0, 5, 0LL);
    xsi_set_current_line(54, ng0);
    t2 = (t0 + 2888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 32, t4, 2, t5, 32);
    t7 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t7, t11, 0, 0, 2, 0LL);
    goto LAB2;

LAB7:    xsi_set_current_line(40, ng0);

LAB16:    xsi_set_current_line(41, ng0);
    t9 = (t0 + 1688U);
    t10 = *((char **)t9);
    t9 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t9, t10, 0, 0, 8, 0LL);
    goto LAB15;

LAB9:    xsi_set_current_line(43, ng0);

LAB17:    xsi_set_current_line(44, ng0);
    t3 = (t0 + 1848U);
    t4 = *((char **)t3);
    t3 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t3, t4, 0, 0, 8, 0LL);
    goto LAB15;

LAB11:    xsi_set_current_line(46, ng0);

LAB18:    xsi_set_current_line(47, ng0);
    t3 = (t0 + 2008U);
    t4 = *((char **)t3);
    t3 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t3, t4, 0, 0, 8, 0LL);
    goto LAB15;

LAB13:    xsi_set_current_line(49, ng0);

LAB19:    xsi_set_current_line(50, ng0);
    t3 = (t0 + 2168U);
    t4 = *((char **)t3);
    t3 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t3, t4, 0, 0, 8, 0LL);
    goto LAB15;

LAB21:    t15 = *((unsigned int *)t11);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t11) = (t15 | t16);
    t17 = *((unsigned int *)t7);
    t18 = *((unsigned int *)t9);
    *((unsigned int *)t7) = (t17 | t18);
    goto LAB20;

}


extern void work_m_00000000001858320407_1411027795_init()
{
	static char *pe[] = {(void *)Initial_34_0,(void *)Initial_35_1,(void *)Always_37_2};
	xsi_register_didat("work_m_00000000001858320407_1411027795", "isim/master_tb_isim_beh.exe.sim/work/m_00000000001858320407_1411027795.didat");
	xsi_register_executes(pe);
}
