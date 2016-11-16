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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000003528127957_2964965119_init();
    work_m_00000000000060437536_2582214024_init();
    work_m_00000000003616570405_1290841583_init();
    work_m_00000000001858320407_1411027795_init();
    work_m_00000000000539891342_0735898980_init();
    work_m_00000000003476129204_1326887117_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003476129204_1326887117");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
