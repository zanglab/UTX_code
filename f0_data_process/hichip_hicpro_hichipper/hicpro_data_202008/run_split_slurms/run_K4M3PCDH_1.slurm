#!/bin/bash
#SBATCH -n 4
#SBATCH --mem=10000
#SBATCH -t 12:00:00
#SBATCH -p parallel
#SBATCH -A cphg_cz3d
#SBATCH -o run_split_slurms/slurm_K4M3PCDH_1.out

time split_reads.py -n 20000000 --results_folder check_on_terminal_split_fq/K4M3PCDH /nv/vol190/zanglab/zw5j/projects_data/UTX_HaoJiang/data_20200730/usftp21.novogene.com/raw_data//K4M3PCDH/K4M3PCDH_CKDL200158876-1a_H5T7HDSXY_L3_1.fq.gz
