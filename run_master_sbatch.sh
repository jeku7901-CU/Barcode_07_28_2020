fastq_directory=/Users/jeku7901/olwin_dowell_labs/practice/FastQ_files/
outdir=/Users/jeku7901/olwin_dowell_labs/reanalysis_07_28_20/temp_outputs/
for path_filename in `ls ${fastq_directory}*.fastq`;do
	rootname=`basename $path_filename .fastq`
	sbatch --export=fastqfile=$path_filename,outdir=$outdir,rootname=$rootname master_sbatch.sh
	echo $path_filename 
	echo $rootname 


done
