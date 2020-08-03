from Bio import SeqIO
from Bio import pairwise2
from Bio.pairwise2 import format_alignment
import glob
import os
import sys
import Bio
from Bio import SeqIO
from Bio import pairwise2
import pandas


#fastqfile = fastqfile1 #this will change everytime running it

#outdir = "/Users/jeku7901/olwin_dowell_labs/2020_barcode_seq_run2/jupyter_R_analyses/alignment_notebook_JVK_barcode_seq_run_final_OUTPUT/"

def score(fastqfile, outdir):
    fastqroot = fastqfile.split(".")[-2]
    fastqroot2 = fastqroot.split("/")[-1]    
    wf = open(outdir+fastqroot2+"2020_Marys_scored_aligned.txt", "w")
    mid = '-----ATC--GAT--AAA--GGT--ACCCAGCTTTCTTGTACAAAGTGGTTGATCGATGCGATGTACGGGCCAGATATACGCGTATCTGAGGGGACTAGGGTGTGTTTAGGCGAAAAGCGG--------TGAGCGTCTGAACTCCAGTCAC'
    for record in SeqIO.parse(fastqfile, "fastq"):
            alignments = pairwise2.align.globalms(mid, record.seq, 5, -1,-5, -1)
            score = alignments[0][2]
            simalign = []
            for nt in alignments[0][1]:
                if nt=="-":
                    simalign.append("-")
                else: 
                    simalign.append("N")
            simalign = "".join(simalign)
            line = [record.id, record.seq, alignments[0][0], alignments[0][1], simalign, alignments[0][2],alignments[0][3],alignments[0][4]]
            wf.write("\t".join(list(map(str,line)))+"\n") 
    wf.close()
 
if __name__ == "__main__":
	n = len(sys.argv)
	print(n)
	if n < 2: 
		print("python barcode_alignment.py <fastqfile> <outdir>")
	else:
		fastqfile = sys.argv[1]
		outdir = sys.argv[2] 
		score(fastqfile, outdir)
