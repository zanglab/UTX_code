#!/bin/bash
#SBATCH -n 1
#SBATCH --mem=20000
#SBATCH -t 12:00:00
#SBATCH -p standard
#SBATCH -A cphg_cz3d
#SBATCH -o run_get_RPKM_slurms/slurm_WT_UTX.out

python get_RPM_RPKM_count_on_regions.py \
-i /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/chip_seq/final_chipseq/sicer_df/sicer_out/WT_over_Vector_H3K4me1/WT_H3K4me1_treat-vs-Vector_H3K4me1_treat-W200-G600-E1000-union.island \
-t /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/chip_seq/final_chipseq/202011_UTX_trim/process_qc_out/WT_UTX/WT_UTX_treat.bam \
-s hg38 -f bam -m -e 500 -o rpkm_csv/WT_UTX_on_H3K4me1_islands_es500bp.csv

python get_RPM_RPKM_count_on_regions.py \
-i /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/chip_seq/final_chipseq/sicer_df/sicer_out/WT_over_Vector_H3K4me1/WT_H3K4me1_treat-vs-Vector_H3K4me1_treat-W200-G600-E1000-union.island \
-t /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/chip_seq/final_chipseq/202011_UTX_trim/process_qc_out/WT_UTX/WT_UTX_treat.bam \
-s hg38 -f bam -m -e 2000 -o rpkm_csv/WT_UTX_on_H3K4me1_islands_es2kb.csv

python get_RPM_RPKM_count_on_regions.py \
-i /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/chip_seq/final_chipseq/sicer_df/sicer_out/WT_over_Vector_H3K4me1/WT_H3K4me1_treat-vs-Vector_H3K4me1_treat-W200-G600-E1000-union.island \
-t /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/chip_seq/final_chipseq/202011_UTX_trim/process_qc_out/WT_UTX/WT_UTX_treat.bam \
-s hg38 -f bam -o rpkm_csv/WT_UTX_on_H3K4me1_islands.csv

