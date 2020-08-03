#!/bin/bash
#SBATCH --job-name=aligment # Job name
#SBATCH --mail-type=ALL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=jeku7901@colorado.edu # Where to send mail
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=23:00:00 # Time limit hrs:min:sec
#SBATCH --mem=100gb # Memory limit
#SBATCH --error=/Users/jeku7901/olwin_dowell_labs/.%j._e.txt
#SBATCH --output=/Users/jeku7901/olwin_dowell_labs/.%j._o.txt


source /Users/jeku7901/jhub_venv/bin/activate

python_aligneddir=${outdir}python_aligned/
rep_number_dfdir=${outdir}rep_number_df/
mkdir -p $python_aligneddir
mkdir -p $rep_number_dfdir

pythonaligned=${python_aligneddir}${rootname}_python_aligned.txt
python barcode_alignment.py $fastqfile $pythonaligned

echo Job: $SLURM_JOB_NAME with ID $SLURM_JOB_ID
echo Running on host ‘hostname’
echo Job Started at ‘date +”%T %a %d %b %y”’
echo Using $SLURM_NTASKS processors across $SLURM_NNODES nodes

#arg1 <- input file
#arg2 <- outpuot matrix file

rep_df=${rep_number_dfdir}${rootname}_rep_number_df.csv
Rscript --vanilla /Users/jeku7901/olwin_dowell_labs/2020_barcode_seq_run2/jupyter_R_analyses/alignedfile_to_repnumber_stringadj.R $pythonaligned $rep_df

