import sys,argparse
import os,glob
import numpy as np
import pandas as pd
import re,bisect
from scipy import stats
import matplotlib
# matplotlib.use('Agg')
import matplotlib.pyplot as plt
import seaborn as sns
matplotlib.rcParams['font.size']=18
sns.set(font_scale=1.2)
sns.set_style("whitegrid", {'axes.grid' : False})
sns.set_style("ticks",{'ytick.color': 'k','axes.edgecolor': 'k'})
matplotlib.rcParams["font.sans-serif"] = ["Arial"]
matplotlib.rcParams['mathtext.fontset'] = 'custom'
matplotlib.rcParams["mathtext.rm"] = "Arial"

def mark_pvalue(compr_pos,positions,box_vals):
    s,p = stats.ttest_ind(box_vals[compr_pos[0]],box_vals[compr_pos[1]],nan_policy='omit')
    y, h, col = np.percentile(np.append(box_vals[compr_pos[0]],box_vals[compr_pos[1]]),97)*.8 ,1.05, 'k'
    y2 = np.percentile(np.append(box_vals[compr_pos[0]],box_vals[compr_pos[1]]),97)*0.99
    x1,x2 = positions[compr_pos[0]],positions[compr_pos[1]]
    p_label='{:.0e}'.format(p)
    if p_label[-2]=='0':
        p_label = p_label[:-2]+p_label[-1]
    p_label = '{} '.format('**','\nup' if s<0 else '\ndown')
    
    if p<0.5:
        if compr_pos[2] == 't':
            plt.plot([x1*1.05, x1*1.05, x2*0.95, x2*0.95], [y, y*h, y*h, y], lw=1, c=col)
            plt.text((x1+x2)*.5, y*h, p_label, ha='center', va='bottom', color=col,fontsize=14)
        else:
            plt.plot([x1*1.05, x1*1.05, x2*0.95, x2*0.95], [y2, y2*1.1, y2*1.1, y2], lw=1, c=col)
            plt.text((x1+x2)*.5, y2*.9, p_label, ha='center', va='top', color=col,fontsize=14)


def plot_box_figs(infiles,colors,compr_poses,xticklabels,figname):
        
    box_vals=[]
    positions = [1,2,3,4,5,6,7][:len(infiles)]
    # prepare the box values
    for infile in infiles:
        with open(infile) as inf:
            df = pd.read_csv(inf,sep='\t')
        box_vals.append(df['RPKM'].values)

    # ==== plot figs
    fig = plt.figure(figsize=(3,3))
    # g = plt.violinplot(box_vals)
    g = plt.boxplot(box_vals,positions=positions,widths = .5,patch_artist=True,\
                boxprops=dict(color='k',facecolor='w',fill=None,lw=1),\
                medianprops=dict(color='grey'),showfliers=False)    
    
    # for position_id in np.arange(len(positions)):
    #     scatter_x = np.random.normal(positions[position_id],0.06,len(box_vals[position_id]))
    #     plt.scatter(scatter_x,box_vals[position_id],color=colors[position_id],s=7,zorder=0,alpha=0.99,rasterized=True)
    
    for compr_pos in compr_poses:
        mark_pvalue(compr_pos,positions,box_vals)
    plt.axes().set_xticklabels(xticklabels,rotation=45,ha='right')
    plt.ylabel('RPKM',fontsize=13)
    # plt.title(re_names[compr_name_ii],fontsize=13)
    # plt.axhline(y=0,c='k',lw=1)
    # plt.legend(fontsize=16,borderaxespad=0.2,labelspacing=.2,handletextpad=0.2,handlelength=1,loc="upper right",frameon=False)
    plt.savefig(figname,bbox_inches='tight',pad_inches=0.1,dpi=600)
    plt.show()
    plt.close()



## ==== main 

# re_names = ['Vector','WT','$\Delta$cIDR','UTX_eIF$_{IDR}$']
compr_names=['K4M3WT_over_K4M3PCDH','K4M3DEL3_over_K4M3WT','K4M3EIF_over_K4M3DEL3',
             'K27ACWT_over_K27ACVEC','K27ACDEL_over_K27ACWT','K27ACEIF_over_K27ACDEL']
re_names = ['H3K4me3 WT over Vector','H3K4me3 $\Delta$cIDR over WT','H3K4me3 UTX_eIF$_{IDR}$ over $\Delta$cIDR',
            'H3K27ac WT over Vector','H3K27 $\Delta$cIDR over WT','H3K27ac UTX_eIF$_{IDR}$ over $\Delta$cIDR']

outdir = 'f1_figs_compr_k27ac_signal'
os.makedirs(outdir,exist_ok=True)


indir='../data_1st_submit/chip_binding_RPKM_promoter_UDHS/rpkm_csv/'
compr_names=['Vector_H3K27ac','WT_H3K27ac','del_cIDR_H3K27ac','UTX_eIFIDR_H3K27ac']
re_names = ['Vector','WT','DEL','EIF']
colors=['grey']*4

for region in ['Promoter_es10kb']:
    infiles=[]
    for compr_name in compr_names:
        infile=indir+os.sep+'{}_on_{}.csv'.format(compr_name,region)
        infiles.append(infile)
    compr_poses=[[0,1,'t'],[1,2,'t'],[1,3,'t']]
    figname=outdir+os.sep+'data_1st_submit_compr_k27ac_signal_{}.pdf'.format(region)
    plot_box_figs(infiles,colors,compr_poses,re_names,figname)
        



##
indir='../data_20201209/chip_binding_RPKM_promoter_UDHS/rpkm_csv'
compr_names=['PCDHK27AC','WTK27AC','DEL3K27AC','EIFK27AC']
re_names = ['Vector','WT','DEL','EIF']
colors=['grey']*4

for region in ['Promoter_es10kb']:
    infiles=[]
    for compr_name in compr_names:
        infile=indir+os.sep+'{}_on_{}.csv'.format(compr_name,region)
        infiles.append(infile)
    compr_poses=[[0,2,'t'],[1,2,'t'],[2,3,'t']]
    figname=outdir+os.sep+'data_20201209_compr_k27ac_signal_{}.pdf'.format(region)
    plot_box_figs(infiles,colors,compr_poses,re_names,figname)
        


