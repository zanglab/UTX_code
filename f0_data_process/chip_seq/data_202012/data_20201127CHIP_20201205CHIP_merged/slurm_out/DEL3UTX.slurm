#!/bin/bash
#SBATCH -n 4
#SBATCH --mem=20000
#SBATCH -t 24:00:00
#SBATCH -p parallel
#SBATCH -A cphg_cz3d
#SBATCH -o slurm_out/DEL3UTX.out 

genome_index="/nv/vol190/zanglab/zw5j/data/index/bwa_index/hg38/hg38.fa"
fqdir="/nv/vol190/zanglab/zw5j/projects_data/UTX_HaoJiang/chipseq/chipseq202012/"
outdir="./process_qc_out/DEL3UTX"

bwa mem -t 8 ${genome_index} ${fqdir}/DEL3UTX_L001.fastq.gz > ${outdir}/DEL3UTX_DEL3UTX_L001.sam
samtools view -bS -q 1 -@ 8 ${outdir}/DEL3UTX_DEL3UTX_L001.sam > ${outdir}/DEL3UTX_DEL3UTX_L001.bam

bwa mem -t 8 ${genome_index} ${fqdir}/DEL3UTX_L002.fastq.gz > ${outdir}/DEL3UTX_DEL3UTX_L002.sam
samtools view -bS -q 1 -@ 8 ${outdir}/DEL3UTX_DEL3UTX_L002.sam > ${outdir}/DEL3UTX_DEL3UTX_L002.bam

bwa mem -t 8 ${genome_index} ${fqdir}/DEL3UTX_L003.fastq.gz > ${outdir}/DEL3UTX_DEL3UTX_L003.sam
samtools view -bS -q 1 -@ 8 ${outdir}/DEL3UTX_DEL3UTX_L003.sam > ${outdir}/DEL3UTX_DEL3UTX_L003.bam

bwa mem -t 8 ${genome_index} ${fqdir}/DEL3UTX_L004.fastq.gz > ${outdir}/DEL3UTX_DEL3UTX_L004.sam
samtools view -bS -q 1 -@ 8 ${outdir}/DEL3UTX_DEL3UTX_L004.sam > ${outdir}/DEL3UTX_DEL3UTX_L004.bam

bwa mem -t 8 ${genome_index} ${fqdir}/DEL3UTX_S10_L001_R1_001.fastq.gz > ${outdir}/DEL3UTX_DEL3UTX_S10_L001_R1_001.sam
samtools view -bS -q 1 -@ 8 ${outdir}/DEL3UTX_DEL3UTX_S10_L001_R1_001.sam > ${outdir}/DEL3UTX_DEL3UTX_S10_L001_R1_001.bam

bwa mem -t 8 ${genome_index} ${fqdir}/DEL3UTX_S10_L002_R1_001.fastq.gz > ${outdir}/DEL3UTX_DEL3UTX_S10_L002_R1_001.sam
samtools view -bS -q 1 -@ 8 ${outdir}/DEL3UTX_DEL3UTX_S10_L002_R1_001.sam > ${outdir}/DEL3UTX_DEL3UTX_S10_L002_R1_001.bam

bwa mem -t 8 ${genome_index} ${fqdir}/DEL3UTX_S10_L003_R1_001.fastq.gz > ${outdir}/DEL3UTX_DEL3UTX_S10_L003_R1_001.sam
samtools view -bS -q 1 -@ 8 ${outdir}/DEL3UTX_DEL3UTX_S10_L003_R1_001.sam > ${outdir}/DEL3UTX_DEL3UTX_S10_L003_R1_001.bam

bwa mem -t 8 ${genome_index} ${fqdir}/DEL3UTX_S10_L004_R1_001.fastq.gz > ${outdir}/DEL3UTX_DEL3UTX_S10_L004_R1_001.sam
samtools view -bS -q 1 -@ 8 ${outdir}/DEL3UTX_DEL3UTX_S10_L004_R1_001.sam > ${outdir}/DEL3UTX_DEL3UTX_S10_L004_R1_001.bam

macs2 callpeak --SPMR -B -q 0.01 --keep-dup 1 -g hs -t \
${outdir}/DEL3UTX_DEL3UTX_L001.bam \
${outdir}/DEL3UTX_DEL3UTX_L002.bam \
${outdir}/DEL3UTX_DEL3UTX_L003.bam \
${outdir}/DEL3UTX_DEL3UTX_L004.bam \
${outdir}/DEL3UTX_DEL3UTX_S10_L001_R1_001.bam \
${outdir}/DEL3UTX_DEL3UTX_S10_L002_R1_001.bam \
${outdir}/DEL3UTX_DEL3UTX_S10_L003_R1_001.bam \
${outdir}/DEL3UTX_DEL3UTX_S10_L004_R1_001.bam -n ${outdir}/DEL3UTX

bdg2bw ${outdir}/DEL3UTX_treat_pileup.bdg /nv/vol190/zanglab/zw5j/data/Genome/ucsc/hg38/hg38.chrom.sizes

python 2_chipseq_qc_se.py -i name_list_chipseq_se.txt -o slurm_out/DEL3UTX_qc.log -s hg38 -b DEL3UTX -f .fastq.gz

samtools merge -@ 4 ${outdir}/DEL3UTX_treat.bam \
${outdir}/DEL3UTX_DEL3UTX_L001.bam \
${outdir}/DEL3UTX_DEL3UTX_L002.bam \
${outdir}/DEL3UTX_DEL3UTX_L003.bam \
${outdir}/DEL3UTX_DEL3UTX_L004.bam \
${outdir}/DEL3UTX_DEL3UTX_S10_L001_R1_001.bam \
${outdir}/DEL3UTX_DEL3UTX_S10_L002_R1_001.bam \
${outdir}/DEL3UTX_DEL3UTX_S10_L003_R1_001.bam \
${outdir}/DEL3UTX_DEL3UTX_S10_L004_R1_001.bam

