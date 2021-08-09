#!/bin/bash

#SBATCH --partition=exacloud
#SBATCH --mem-per-cpu 12G
#SBATCH -c 4
#SBATCH --time=6:0:0
#SBATCH --mem 50000

fq1=$1
fq2=$2
name=$3
ref='/home/groups/Spellmandata/heskett/english/mm10.reference/refdata-gex-mm10-2020-A/fasta/genome.fa'
out_dir=$4
readgroup='@RG\tID:'$name'\tSM:'1'\tPL:'illumina'\tLB:'$name

source activate for_bwa
bwa mem -R $readgroup -t 4 -Ma $ref $fq1 $fq2 > $out_dir$name.sam
