#!/bin/bash
#SBATCH -n 4
#SBATCH --mem=40000
#SBATCH -t 48:00:00
#SBATCH -p parallel
#SBATCH -A cphg_cz3d
#SBATCH -o out_bart3d_dis500k.log

# Run program


hicpro_results=/nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/hichip_hicpro_hichipper/hicpro/human_hichip/hic_results/matrix/
genomicDistance=500000
outdir=bart3d_dis500k
mkdir ${outdir}

treat_arr=(K4M3WT  K4M3DEL3 K4M3EIF  K27ACWT  K27ACDEL K27ACEIF)
ctrl_arr=(K4M3PCDH K4M3WT   K4M3DEL3 K27ACVEC K27ACWT  K27ACDEL)

for ii in 0 1 2 3 4 5
do
    time bart3d -f hicpro -s hg38 \
           -t ${hicpro_results}/${treat_arr[ii]}/raw/5000/${treat_arr[ii]}_5000.matrix \
           -c ${hicpro_results}/${ctrl_arr[ii]}/raw/5000/${ctrl_arr[ii]}_5000.matrix \
           --bedFileHicpro ${hicpro_results}/${treat_arr[ii]}/raw/5000/${treat_arr[ii]}_5000_abs.bed \
           --genomicDistance ${genomicDistance} \
           --outdir ${outdir} \
           --outFileName ${treat_arr[ii]}_over_${ctrl_arr[ii]}
done


