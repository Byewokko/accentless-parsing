#!/bin/bash

#SBATCH --mail-user=robinhruska@email.cz
#SBATCH --mail-type=END

# Job name:
#
# Project:
#SBATCH --account=nn9447k
#
# Wall clock limit:
#SBATCH --time=20:00:00
#
# Max memory usage:
#SBATCH --mem-per-cpu=12000

module purge   # clear any inherited modules
set -o errexit # exit on errors
workstation=/usit/abel/u1/rohr5997/nobackup/uuparser/barchybrid
cd $workstation

module load dynet

datadir=/usit/abel/u1/rohr5997/nobackup/data/ud-treebanks/
outdir=/usit/abel/u1/rohr5997/nobackup/out/parser/
logfile=/usit/abel/u1/rohr5997/nobackup/logs/$(date +'%Y%m%d-%H%M%S')-parser.log

language=$1

dynet_python src/parser.py --dynet-seed 123456789 --outdir $outdir --datadir $datadir --include $language --epochs 30 --k 3 --usehead --userlmost --dynet-mem 10000 > $logfile
