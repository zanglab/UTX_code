#!/bin/bash
#SBATCH -n 4
#SBATCH --mem=20000
#SBATCH -t 24:00:00
#SBATCH -p parallel
#SBATCH -A cphg_cz3d
#SBATCH -o slurm_merge_bam_out/UTX_eIFIDR_UTX_with_Vector_ctrl.out 

samtools merge -@ 4 /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/chip_seq/data_1st_submit/process_qc_out/UTX_eIFIDR_UTX_with_Vector_ctrl/UTX_eIFIDR_UTX_with_Vector_ctrl_treat.bam \
/nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/chip_seq/data_1st_submit/process_qc_out/UTX_eIFIDR_UTX_with_Vector_ctrl/UTX_eIFIDR_UTX_with_Vector_ctrl_EIF-UTX_L001.bam \
/nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/chip_seq/data_1st_submit/process_qc_out/UTX_eIFIDR_UTX_with_Vector_ctrl/UTX_eIFIDR_UTX_with_Vector_ctrl_EIF-UTX_L002.bam \
/nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/chip_seq/data_1st_submit/process_qc_out/UTX_eIFIDR_UTX_with_Vector_ctrl/UTX_eIFIDR_UTX_with_Vector_ctrl_EIF-UTX_L003.bam \
/nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/chip_seq/data_1st_submit/process_qc_out/UTX_eIFIDR_UTX_with_Vector_ctrl/UTX_eIFIDR_UTX_with_Vector_ctrl_EIF-UTX_L004.bam

samtools merge -@ 4 /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/chip_seq/data_1st_submit/process_qc_out/UTX_eIFIDR_UTX_with_Vector_ctrl/UTX_eIFIDR_UTX_with_Vector_ctrl_control.bam \
/nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/chip_seq/data_1st_submit/process_qc_out/UTX_eIFIDR_UTX_with_Vector_ctrl/UTX_eIFIDR_UTX_with_Vector_ctrl_PCDH-UTX_L001.bam \
/nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/chip_seq/data_1st_submit/process_qc_out/UTX_eIFIDR_UTX_with_Vector_ctrl/UTX_eIFIDR_UTX_with_Vector_ctrl_PCDH-UTX_L002.bam \
/nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/chip_seq/data_1st_submit/process_qc_out/UTX_eIFIDR_UTX_with_Vector_ctrl/UTX_eIFIDR_UTX_with_Vector_ctrl_PCDH-UTX_L003.bam \
/nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/chip_seq/data_1st_submit/process_qc_out/UTX_eIFIDR_UTX_with_Vector_ctrl/UTX_eIFIDR_UTX_with_Vector_ctrl_PCDH-UTX_L004.bam

