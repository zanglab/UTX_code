import sys,argparse
import os,glob
import numpy as np
import pandas as pd
import re,bisect
from scipy import stats
# import matplotlib
# matplotlib.use('Agg')
# import matplotlib.pyplot as plt
# matplotlib.rcParams['font.size']=15
# import seaborn as sns
# sns.set(font_scale=1.2)
# sns.set_style("whitegrid", {'axes.grid' : False})
# sns.set_style("ticks",{'ytick.color': 'k','axes.edgecolor': 'k'})
# matplotlib.rcParams["font.sans-serif"] = ["Arial"]
# matplotlib.rcParams['mathtext.fontset'] = 'custom'
# matplotlib.rcParams["mathtext.rm"] = "Arial"





cellType_labels= {'Vector':'Vector',\
                  'WT':'WT',\
                  'DEL':'$\Delta$cIDR',\
                  'EIF':'UTX-eIF$_{IDR}$',\
                  'TPR':'$\Delta$TPR',\
                  'MT2':'MT2',\
                  'FUS':'UTX-FUS$_{IDR}$'}

outdir = 'f1_promoter_DCI_rename'
os.makedirs(outdir,exist_ok=True)

project_dir="/nv/vol190/zanglab/zw5j/since2019_projects/UTX_HaoJiang"
# project_dir="/Volumes/zanglab/zw5j/since2019_projects/UTX_HaoJiang"
# expr_dir='{}/f0_data_process/rna_seq/data_1st_submit_STAR_RSEM_new/f6_deg/f1_deseq2_out'.format(project_dir)

subdirs=['bart3d_dis200k_data_1st_submit','bart3d_dis200k_data202008',
         'bart3d_dis500k_data_1st_submit','bart3d_dis500k_data202008']


name_match_df = pd.read_excel('dci_deg_matching.xlsx',index_col=0)

for subdir in subdirs[:]:
    outdir_tmp='{}/{}'.format(outdir,subdir)
    os.makedirs(outdir_tmp,exist_ok=True)
    promoter_dci_files=sorted(glob.glob('f1_promoter_DCI/{}/*.csv'.format(subdir)))
    for dci_file in promoter_dci_files:
        dci_file_basename = os.path.basename(dci_file)
        if dci_file_basename in name_match_df.index:
            # print(dci_file_basename)
            compr_figname = name_match_df.loc[dci_file_basename,'compr_figname']
            hm = name_match_df.loc[dci_file_basename,'hm']
            os.system('cp {} {}/{}_{}_promoter_DCI.csv'.format(dci_file,outdir_tmp,hm,compr_figname))
            print('cp {} {}/{}_{}_promoter_DCI.csv'.format(dci_file,outdir_tmp,hm,compr_figname))
            
    

