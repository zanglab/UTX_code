#!/bin/bash
#SBATCH -n 1
#SBATCH --mem=10000
#SBATCH -t 12:00:00
#SBATCH -p standard
#SBATCH -A cphg_cz3d
#SBATCH -o slurm_files/slurm_CRPCDHUTX.out

processed_bam_dir="/nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/chip_seq//data_202012/data_202012CUTRUN/process_qc_out/CRPCDHUTX"

time sicer -t ${processed_bam_dir}/CRPCDHUTX_treat.bam \
-s hg38 --output_directory sicer_results/CRPCDHUTX
