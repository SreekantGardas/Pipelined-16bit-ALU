/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
IKI_DLLESPEC extern void execute_11(char*, char *);
IKI_DLLESPEC extern void execute_19(char*, char *);
IKI_DLLESPEC extern void svlog_sampling_process_execute(char*, char*, char*);
IKI_DLLESPEC extern void sequence_expr_m_224cb63d_eab0dc10_1(char*, char *);
IKI_DLLESPEC extern void sequence_expr_m_224cb63d_eab0dc10_2(char*, char *);
IKI_DLLESPEC extern void vlog_sv_sequence_execute_0 (char*, char*, char*);
IKI_DLLESPEC extern void sequence_expr_m_224cb63d_eab0dc10_3(char*, char *);
IKI_DLLESPEC extern void sequence_expr_m_224cb63d_eab0dc10_4(char*, char *);
IKI_DLLESPEC extern void sequence_expr_m_224cb63d_eab0dc10_5(char*, char *);
IKI_DLLESPEC extern void sequence_expr_m_224cb63d_eab0dc10_6(char*, char *);
IKI_DLLESPEC extern void sequence_expr_m_224cb63d_eab0dc10_7(char*, char *);
IKI_DLLESPEC extern void sequence_expr_m_224cb63d_eab0dc10_8(char*, char *);
IKI_DLLESPEC extern void sequence_expr_m_224cb63d_eab0dc10_9(char*, char *);
IKI_DLLESPEC extern void sequence_expr_m_224cb63d_eab0dc10_10(char*, char *);
IKI_DLLESPEC extern void sequence_expr_m_224cb63d_eab0dc10_11(char*, char *);
IKI_DLLESPEC extern void sequence_expr_m_224cb63d_eab0dc10_12(char*, char *);
IKI_DLLESPEC extern void sequence_expr_m_224cb63d_eab0dc10_13(char*, char *);
IKI_DLLESPEC extern void sequence_expr_m_224cb63d_eab0dc10_14(char*, char *);
IKI_DLLESPEC extern void sequence_expr_m_224cb63d_eab0dc10_15(char*, char *);
IKI_DLLESPEC extern void sequence_expr_m_224cb63d_eab0dc10_16(char*, char *);
IKI_DLLESPEC extern void execute_59(char*, char *);
IKI_DLLESPEC extern void execute_60(char*, char *);
IKI_DLLESPEC extern void execute_61(char*, char *);
IKI_DLLESPEC extern void execute_62(char*, char *);
IKI_DLLESPEC extern void execute_63(char*, char *);
IKI_DLLESPEC extern void execute_64(char*, char *);
IKI_DLLESPEC extern void execute_65(char*, char *);
IKI_DLLESPEC extern void execute_66(char*, char *);
IKI_DLLESPEC extern void execute_5(char*, char *);
IKI_DLLESPEC extern void execute_6(char*, char *);
IKI_DLLESPEC extern void execute_7(char*, char *);
IKI_DLLESPEC extern void execute_8(char*, char *);
IKI_DLLESPEC extern void execute_9(char*, char *);
IKI_DLLESPEC extern void execute_10(char*, char *);
IKI_DLLESPEC extern void execute_23(char*, char *);
IKI_DLLESPEC extern void execute_24(char*, char *);
IKI_DLLESPEC extern void execute_25(char*, char *);
IKI_DLLESPEC extern void execute_26(char*, char *);
IKI_DLLESPEC extern void execute_67(char*, char *);
IKI_DLLESPEC extern void execute_68(char*, char *);
IKI_DLLESPEC extern void execute_69(char*, char *);
IKI_DLLESPEC extern void execute_70(char*, char *);
IKI_DLLESPEC extern void execute_71(char*, char *);
IKI_DLLESPEC extern void execute_72(char*, char *);
IKI_DLLESPEC extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
IKI_DLLESPEC extern void transaction_6(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void vlog_transfunc_eventcallback_2state(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[47] = {(funcp)execute_11, (funcp)execute_19, (funcp)svlog_sampling_process_execute, (funcp)sequence_expr_m_224cb63d_eab0dc10_1, (funcp)sequence_expr_m_224cb63d_eab0dc10_2, (funcp)vlog_sv_sequence_execute_0 , (funcp)sequence_expr_m_224cb63d_eab0dc10_3, (funcp)sequence_expr_m_224cb63d_eab0dc10_4, (funcp)sequence_expr_m_224cb63d_eab0dc10_5, (funcp)sequence_expr_m_224cb63d_eab0dc10_6, (funcp)sequence_expr_m_224cb63d_eab0dc10_7, (funcp)sequence_expr_m_224cb63d_eab0dc10_8, (funcp)sequence_expr_m_224cb63d_eab0dc10_9, (funcp)sequence_expr_m_224cb63d_eab0dc10_10, (funcp)sequence_expr_m_224cb63d_eab0dc10_11, (funcp)sequence_expr_m_224cb63d_eab0dc10_12, (funcp)sequence_expr_m_224cb63d_eab0dc10_13, (funcp)sequence_expr_m_224cb63d_eab0dc10_14, (funcp)sequence_expr_m_224cb63d_eab0dc10_15, (funcp)sequence_expr_m_224cb63d_eab0dc10_16, (funcp)execute_59, (funcp)execute_60, (funcp)execute_61, (funcp)execute_62, (funcp)execute_63, (funcp)execute_64, (funcp)execute_65, (funcp)execute_66, (funcp)execute_5, (funcp)execute_6, (funcp)execute_7, (funcp)execute_8, (funcp)execute_9, (funcp)execute_10, (funcp)execute_23, (funcp)execute_24, (funcp)execute_25, (funcp)execute_26, (funcp)execute_67, (funcp)execute_68, (funcp)execute_69, (funcp)execute_70, (funcp)execute_71, (funcp)execute_72, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_6, (funcp)vlog_transfunc_eventcallback_2state};
const int NumRelocateId= 47;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/testcases_tb_behav/xsim.reloc",  (void **)funcTab, 47);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/testcases_tb_behav/xsim.reloc");
}

void simulate(char *dp)
{
iki_register_root_pointers(1, 11256, 1,0,0) ; 
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/testcases_tb_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void iki_initialize_dpi() ; 
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_xsimdir_location_if_remapped(argc, argv)  ;
    iki_set_sv_type_file_path_name("xsim.dir/testcases_tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/testcases_tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/testcases_tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void *)iki_initialize_dpi, 0, isimBridge_getWdbWriter(), 0, argc, argv);
         iki_set_sv_coverage_file_path_name("xsim.dir/testcases_tb_behav/xsim.covinfo");
    iki_set_sv_coverage_cons_file_path_name("xsim.dir/testcases_tb_behav/xsim.covconsinfo");
    iki_set_sv_coverage_run_dir("./");
    iki_set_sv_coverage_run_name("testcases_tb_behav");
iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
