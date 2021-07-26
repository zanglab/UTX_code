
maps_results_dir=/nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang/f0_data_process/hichip/data_202008_sicer2_merged_islands_with_new_k27/maps_results/
plot_dir=maps_tabix
mkdir $plot_dir

for mark in K27ACDEL  K27ACEIF  K27ACTPR  K27ACVEC  K27ACWT  K4M3DEL3  K4M3DTPR  K4M3EIF  K4M3PCDH  K4M3WT
# for mark in K27ACDEL
do
    bedpe_file=${maps_results_dir}${mark}/MAPS_output/${mark}*_current/*sig3Dinteractions.bedpe
    echo $mark
    Rscript bedpe2tabix.R -i $bedpe_file -t ${plot_dir}/${mark}
done