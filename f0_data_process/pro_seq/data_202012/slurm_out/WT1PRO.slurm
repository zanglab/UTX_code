#!/bin/bash
#SBATCH -n 4
#SBATCH --mem=20000
#SBATCH -t 24:00:00
#SBATCH -p parallel
#SBATCH -A cphg_cz3d
#SBATCH -o slurm_out/WT1PRO.out 

module load bwa
module load samtools

bwa aln  -q 5 -l 32 -k 2 -t 8 /nv/vol190/zanglab/zw5j/data/index/bwa_index/hg38/hg38.fa /nv/vol190/zanglab/bs6yk/Pro-seq/WT1PRO_S7_L001_R1_001.fastq.gz > /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L001.1.sai
bwa aln  -q 5 -l 32 -k 2 -t 8 /nv/vol190/zanglab/zw5j/data/index/bwa_index/hg38/hg38.fa /nv/vol190/zanglab/bs6yk/Pro-seq/WT1PRO_S7_L001_R2_001.fastq.gz > /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L001.2.sai
bwa sampe /nv/vol190/zanglab/zw5j/data/index/bwa_index/hg38/hg38.fa /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L001.1.sai /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L001.2.sai /nv/vol190/zanglab/bs6yk/Pro-seq/WT1PRO_S7_L001_R1_001.fastq.gz /nv/vol190/zanglab/bs6yk/Pro-seq/WT1PRO_S7_L001_R2_001.fastq.gz > /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L001.sam
samtools view -bS -q 1 -@ 8 /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L001.sam > /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L001.bam

bwa aln  -q 5 -l 32 -k 2 -t 8 /nv/vol190/zanglab/zw5j/data/index/bwa_index/hg38/hg38.fa /nv/vol190/zanglab/bs6yk/Pro-seq/WT1PRO_S7_L002_R1_001.fastq.gz > /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L002.1.sai
bwa aln  -q 5 -l 32 -k 2 -t 8 /nv/vol190/zanglab/zw5j/data/index/bwa_index/hg38/hg38.fa /nv/vol190/zanglab/bs6yk/Pro-seq/WT1PRO_S7_L002_R2_001.fastq.gz > /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L002.2.sai
bwa sampe /nv/vol190/zanglab/zw5j/data/index/bwa_index/hg38/hg38.fa /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L002.1.sai /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L002.2.sai /nv/vol190/zanglab/bs6yk/Pro-seq/WT1PRO_S7_L002_R1_001.fastq.gz /nv/vol190/zanglab/bs6yk/Pro-seq/WT1PRO_S7_L002_R2_001.fastq.gz > /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L002.sam
samtools view -bS -q 1 -@ 8 /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L002.sam > /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L002.bam

bwa aln  -q 5 -l 32 -k 2 -t 8 /nv/vol190/zanglab/zw5j/data/index/bwa_index/hg38/hg38.fa /nv/vol190/zanglab/bs6yk/Pro-seq/WT1PRO_S7_L003_R1_001.fastq.gz > /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L003.1.sai
bwa aln  -q 5 -l 32 -k 2 -t 8 /nv/vol190/zanglab/zw5j/data/index/bwa_index/hg38/hg38.fa /nv/vol190/zanglab/bs6yk/Pro-seq/WT1PRO_S7_L003_R2_001.fastq.gz > /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L003.2.sai
bwa sampe /nv/vol190/zanglab/zw5j/data/index/bwa_index/hg38/hg38.fa /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L003.1.sai /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L003.2.sai /nv/vol190/zanglab/bs6yk/Pro-seq/WT1PRO_S7_L003_R1_001.fastq.gz /nv/vol190/zanglab/bs6yk/Pro-seq/WT1PRO_S7_L003_R2_001.fastq.gz > /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L003.sam
samtools view -bS -q 1 -@ 8 /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L003.sam > /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L003.bam

bwa aln  -q 5 -l 32 -k 2 -t 8 /nv/vol190/zanglab/zw5j/data/index/bwa_index/hg38/hg38.fa /nv/vol190/zanglab/bs6yk/Pro-seq/WT1PRO_S7_L004_R1_001.fastq.gz > /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L004.1.sai
bwa aln  -q 5 -l 32 -k 2 -t 8 /nv/vol190/zanglab/zw5j/data/index/bwa_index/hg38/hg38.fa /nv/vol190/zanglab/bs6yk/Pro-seq/WT1PRO_S7_L004_R2_001.fastq.gz > /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L004.2.sai
bwa sampe /nv/vol190/zanglab/zw5j/data/index/bwa_index/hg38/hg38.fa /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L004.1.sai /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L004.2.sai /nv/vol190/zanglab/bs6yk/Pro-seq/WT1PRO_S7_L004_R1_001.fastq.gz /nv/vol190/zanglab/bs6yk/Pro-seq/WT1PRO_S7_L004_R2_001.fastq.gz > /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L004.sam
samtools view -bS -q 1 -@ 8 /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L004.sam > /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L004.bam

macs2 callpeak --SPMR -B -q 0.01 --keep-dup 1 -g hs -f BAMPE -t \
/nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L001.bam \
/nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L002.bam \
/nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L003.bam \
/nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L004.bam -n /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO

bdg2bw /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_treat_pileup.bdg /nv/vol190/zanglab/zw5j/data/Genome/ucsc/hg38/hg38.chrom.sizes

samtools merge -@ 4 /nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_treat.bam \
/nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L001.bam \
/nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L002.bam \
/nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L003.bam \
/nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/pro_seq/data_202012/processed_out/WT1PRO/WT1PRO_WT1PRO_S7_L004.bam

python 2_chipseq_qc_pe.py -i name_list_chipseq_pe.txt -o slurm_out/WT1PRO_qc.log -s hg38 -b WT1PRO -f1 _R1_001 -f2 _R2_001

