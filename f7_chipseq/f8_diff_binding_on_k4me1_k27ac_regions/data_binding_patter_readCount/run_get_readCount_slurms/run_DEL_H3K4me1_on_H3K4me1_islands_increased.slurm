#!/bin/bash
#SBATCH -n 1
#SBATCH --mem=20000
#SBATCH -t 12:00:00
#SBATCH -p standard
#SBATCH -A cphg_cz3d
#SBATCH -o run_get_readCount_slurms/slurm_DEL_H3K4me1_on_H3K4me1_islands_increased.out

python get_pattern_near_site_readcount_write_out_revised.py \
-i /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f7_chipseq/f8_diff_binding_on_k4me1_k27ac_regions/data_hm_binding/H3K4me1_islands_increased.bed \
-t /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/chip_seq/final_chipseq/202102_H3K27ac_H3K4me1_trim/process_qc_out/DEL_H3K4me1/DEL_H3K4me1_treat.bam \
-s hg38 -f bam -w 2000 -b 200 -m -o readCount_csv/DEL_H3K4me1_on_H3K4me1_islands_increased_es2kb_bin200.csv

