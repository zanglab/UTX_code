#!/bin/bash
#SBATCH -n 1
#SBATCH --mem=20000
#SBATCH -t 12:00:00
#SBATCH -p standard
#SBATCH -A cphg_cz3d
#SBATCH -o run_get_RPKM_slurms/slurm_Vector_H3K4me3_on_Promoter.out

python get_RPM_RPKM_count_on_regions.py \
-i /Volumes/zanglab/zw5j/data/geneID_annotation/hg38/hg38_4k_promoter_geneID.bed \
-t /Volumes/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/chip_seq/final_chipseq/re_1st_submission_H3K4me3_MLL4SC_trim/process_qc_out/Vector_H3K4me3/Vector_H3K4me3_treat.bam \
-s hg38 -f bam -m -e 2000 -o RPKM_csv/Vector_H3K4me3_on_Promoter_es2kb.csv

