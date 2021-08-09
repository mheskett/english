#!/bin/bash
#SBATCH --partition=exacloud
#SBATCH -c 1
#SBATCH --time=2:0:0
#SBATCH --mem 12000

conda activate hmmcopy
/home/groups/Spellmandata/heskett/packages/envs/hmmcopy/bin/readCounter --window 50000 --quality 20 \
--chromosome "chr1,chr2,chr3,chr4,chr5,chr6,chr7,chr8,chr9,chr10,chr11,chr12,chr13,chr14,chr15,chr16,chr17,chr18,chr19,chrX,chrY" \
$1 > $1.wig
