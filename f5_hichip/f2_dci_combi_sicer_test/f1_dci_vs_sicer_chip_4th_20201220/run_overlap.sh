
find_overlap()
{
    dci_dir=$1
    sicer_dir=$2
    outdir=$3
    dci_prename=$4
    sicer_prename=$5
    dci_file=${dci_dir}/${dci_prename}_differential_score.bed
    sicer_prename_sub=$(cut -d '_' -f1 <<< $sicer_prename)
    increased_file=${sicer_dir}/${sicer_prename}/${sicer_prename_sub}_treat-W200-G600-increased-islands-summary-FDR0.01
    decreased_file=${sicer_dir}/${sicer_prename}/${sicer_prename_sub}_treat-W200-G600-decreased-islands-summary-FDR0.01
    python $python_file -a $dci_file -b $increased_file -s hg38 -p $outdir/${dci_prename}_dci_overlap_sicer_increased.bed
    python $python_file -a $dci_file -b $decreased_file -s hg38 -p $outdir/${dci_prename}_dci_overlap_sicer_decreased.bed
}



python_file=/nv/vol190/zanglab/zw5j/scripts/Modules/find_overlap_keep_info_NOT_sep_strand.py

for bart_dis in 200k 500k
do
    # dir of files
    dci_dir=../data_dci_${bart_dis}/
    sicer_dir=../data_sicer2_chipseq_4th_20201220/sicer_results/
    outdir=overlapped_${bart_dis}
    mkdir $outdir
    # K4#
    # revise the prename
    dci_prename=K4M3WT_over_K4M3PCDH
    sicer_prename=WTUTX4_vs_PCDHUTX4
    find_overlap $dci_dir $sicer_dir $outdir $dci_prename $sicer_prename
    
    # revise the prename
    dci_prename=K4M3DEL3_over_K4M3WT
    sicer_prename=DEL3UTX4_vs_WTUTX4
    find_overlap $dci_dir $sicer_dir $outdir $dci_prename $sicer_prename
    
    # revise the prename
    dci_prename=K4M3EIF_over_K4M3DEL3
    sicer_prename=EIFUTX4_vs_DEL3UTX4
    find_overlap $dci_dir $sicer_dir $outdir $dci_prename $sicer_prename

    # K27#
    # revise the prename
    dci_prename=K27ACWT_over_K27ACVEC
    sicer_prename=WTUTX4_vs_PCDHUTX4
    find_overlap $dci_dir $sicer_dir $outdir $dci_prename $sicer_prename

    # revise the prename
    dci_prename=K27ACDEL_over_K27ACWT
    sicer_prename=DEL3UTX4_vs_WTUTX4
    find_overlap $dci_dir $sicer_dir $outdir $dci_prename $sicer_prename

    # revise the prename
    dci_prename=K27ACEIF_over_K27ACDEL
    sicer_prename=EIFUTX4_vs_DEL3UTX4
    find_overlap $dci_dir $sicer_dir $outdir $dci_prename $sicer_prename


done    
     