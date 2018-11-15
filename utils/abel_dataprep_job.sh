#!/bin/bash

#SBATCH --mail-user=robinhruska@email.cz
#SBATCH --mail-type=END

# Job name:
#
# Project:
#SBATCH --account=nn9447k
#
# Wall clock limit:
#SBATCH --time=1:00:00
#
# Max memory usage:
#SBATCH --mem-per-cpu=12000

module purge   # clear any inherited modules
set -o errexit # exit on errors
workstation=/usit/abel/u1/rohr5997/nobackup/accentless-parsing
cd $workstation

module load python3

datadir=/usit/abel/u1/rohr5997/nobackup/data/ud-treebanks/cs/
logfile=/usit/abel/u1/rohr5997/nobackup/logs/$(date +'%Y%m%d-%H%M%S')-dataprep.log

bash prepare-data.sh $datadir $datadir

