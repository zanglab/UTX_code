#!/bin/bash
#SBATCH -n 4
#SBATCH --mem=20000
#SBATCH -t 24:00:00
#SBATCH -p parallel
#SBATCH -A cphg_cz3d
#SBATCH -o slurm_out/WTUTX4.out 

genome_index="/nv/vol190/zanglab/zw5j/data/index/bwa_index/hg38/hg38.fa"
fqdir="/nv/vol190/zanglab/bs6yk/Jianglab-20201220seq"
outdir="./process_qc_out/WTUTX4"

bwa mem -t 8 ${genome_index} ${fqdir}/WTUTX4_S2_L001_R1_001.fastq.gz > ${outdir}/WTUTX4_WTUTX4_S2_L001_R1_001.sam
samtools view -bS -q 1 -@ 8 ${outdir}/WTUTX4_WTUTX4_S2_L001_R1_001.sam > ${outdir}/WTUTX4_WTUTX4_S2_L001_R1_001.bam

bwa mem -t 8 ${genome_index} ${fqdir}/WTUTX4_S2_L002_R1_001.fastq.gz > ${outdir}/WTUTX4_WTUTX4_S2_L002_R1_001.sam
samtools view -bS -q 1 -@ 8 ${outdir}/WTUTX4_WTUTX4_S2_L002_R1_001.sam > ${outdir}/WTUTX4_WTUTX4_S2_L002_R1_001.bam

bwa mem -t 8 ${genome_index} ${fqdir}/WTUTX4_S2_L003_R1_001.fastq.gz > ${outdir}/WTUTX4_WTUTX4_S2_L003_R1_001.sam
samtools view -bS -q 1 -@ 8 ${outdir}/WTUTX4_WTUTX4_S2_L003_R1_001.sam > ${outdir}/WTUTX4_WTUTX4_S2_L003_R1_001.bam

bwa mem -t 8 ${genome_index} ${fqdir}/WTUTX4_S2_L004_R1_001.fastq.gz > ${outdir}/WTUTX4_WTUTX4_S2_L004_R1_001.sam
samtools view -bS -q 1 -@ 8 ${outdir}/WTUTX4_WTUTX4_S2_L004_R1_001.sam > ${outdir}/WTUTX4_WTUTX4_S2_L004_R1_001.bam

macs2 callpeak --SPMR -B -q 0.01 --keep-dup 1 -g hs -t \
${outdir}/WTUTX4_WTUTX4_S2_L001_R1_001.bam \
${outdir}/WTUTX4_WTUTX4_S2_L002_R1_001.bam \
${outdir}/WTUTX4_WTUTX4_S2_L003_R1_001.bam \
${outdir}/WTUTX4_WTUTX4_S2_L004_R1_001.bam -n ${outdir}/WTUTX4

bdg2bw ${outdir}/WTUTX4_treat_pileup.bdg /nv/vol190/zanglab/zw5j/data/Genome/ucsc/hg38/hg38.chrom.sizes

python 2_chipseq_qc_se.py -i name_list_chipseq_se.txt -o slurm_out/WTUTX4_qc.log -s hg38 -b WTUTX4 -f .fastq.gz

samtools merge -@ 4 ${outdir}/WTUTX4_treat.bam \
${outdir}/WTUTX4_WTUTX4_S2_L001_R1_001.bam \
${outdir}/WTUTX4_WTUTX4_S2_L002_R1_001.bam \
${outdir}/WTUTX4_WTUTX4_S2_L003_R1_001.bam \
${outdir}/WTUTX4_WTUTX4_S2_L004_R1_001.bam

