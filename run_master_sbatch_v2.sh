#fastq_directory=/Users/jeku7901/olwin_dowell_labs/practice/FastQ_files/
#fastq_directory=/Users/jeku7901/olwin_dowell_labs/2020_seq_run1/from_sequncer/Demux_Olwin/
#fastq_directory=/Users/jeku7901/olwin_dowell_labs/2020_barcode_seq_run2/techrep1/200608_Hall_Olwin-1088_techrep1/Demux/
fastq_directory=/Users/jeku7901/olwin_dowell_labs/2020_barcode_seq_run2/techrep2/Demux/


#outdir=/Users/jeku7901/olwin_dowell_labs/reanalysis_07_28_20/outputs_08042020/seqrun_1
#outdir=/Users/jeku7901/olwin_dowell_labs/reanalysis_07_28_20/outputs_08042020/seqrun_2
#outdir=/Users/jeku7901/olwin_dowell_labs/reanalysis_07_28_20/outputs_08042020/seqrun_3_tr1
outdir=/Users/jeku7901/olwin_dowell_labs/reanalysis_07_28_20/outputs_08042020/seqrun_3_tr2

for path_filename in `ls ${fastq_directory}*.fastq`;do
	rootname=`basename $path_filename .fastq`
	sbatch --export=fastqfile=$path_filename,outdir=$outdir,rootname=$rootname master_sbatch.sh
	echo $path_filename 
	echo $rootname 


done
