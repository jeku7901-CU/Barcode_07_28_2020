#!/bin/bash
#SBATCH --job-name=aligment # Job name
#SBATCH --mail-type=ALL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=jeku7901@colorado.edu # Where to send mail
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=23:00:00 # Time limit hrs:min:sec
#SBATCH --mem=10gb # Memory limit
#SBATCH --error=/Users/jeku7901/olwin_dowell_labs/.%j._e.txt
#SBATCH --output=/Users/jeku7901/olwin_dowell_labs/.%j._o.txt


source /Users/jeku7901/jhub_venv/bin/activate

python barcode_alignment.py $fastqfile $outdir
