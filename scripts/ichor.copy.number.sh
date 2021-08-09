#!/bin/bash

sample_wig=$1
out_dir=$2
b=$(basename $sample_wig) ## removes /path/to/file
filename=${b%.*} ### removes file extension

# try alternate installation

###Rscript /home/groups/Spellmandata/heskett/packages/envs/chris.ichor/share/r-ichorcna-0.1.0.20180710-0/scripts/runIchorCNA.R --id $filename \
source activate r3.6
#source activate chris.ichor
Rscript /home/groups/Spellmandata/heskett/english/ichorCNA/scripts/runIchorCNA.R --id $filename \
  --WIG $sample_wig --gcWig ../mm10.reference/refdata-gex-mm10-2020-A/fasta/genome.gc.wig \
  --chrs "c(\"chr1\",\"chr2\",\"chr3\",\"chr4\",\"chr5\",\"chr6\",\"chr7\",\"chr8\",\"chr9\",\"chr10\",\"chr11\",\"chr12\",\"chr13\",\"chr14\",\"chr15\",\"chr16\",\"chr17\",\"chr18\",\"chr19\",\"chrX\",\"chrY\")" \
  --chrNormalize "c(\"chr1\",\"chr2\",\"chr3\",\"chr4\",\"chr5\",\"chr6\",\"chr7\",\"chr8\",\"chr9\",\"chr10\",\"chr11\",\"chr12\",\"chr13\",\"chr14\",\"chr15\",\"chr16\",\"chr17\",\"chr18\",\"chr19\",\"chrX\",\"chrY\")" \
  --mapWig ../mm10.reference/refdata-gex-mm10-2020-A/fasta/genome2.50000.window.wig \
  --ploidy "c(2)" --normal "c(0.9)" --maxCN 8 --includeHOMD False  --estimateNormal True --estimatePloidy True \
  --estimateScPrevalence True --centromere /home/groups/Spellmandata/heskett/english/mm10.reference/mm10.centromeres.txt \
  --genomeBuild mm10 \
  --txnE 0.9999 --txnStrength 10000 --fracReadsInChrYForMale 0.001 --plotFileType png --plotYLim "c(-2,4)" --outDir $out_dir
 
source deactivate
 
 
