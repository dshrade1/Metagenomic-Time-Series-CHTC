To preprocess metagenome files, submit:

condor_submit preprocess_fasta.sub  
condor_submit preprocess_fastq.sub  
preprocess_postscript.sh

Edits you may wish to make:

Add or subtract fasta/fastq files from the TH_fasta_ID.txt and TH_fastq_ID.txt.  

Optional but quite useful:  
After preprocessing is complete, run usage.sh to quantify the memory, RSS, and disk usage each metagenome uses during preprocessing.  
Output of this script is a directory containing sorted usage values pulled from the preprocessing run output.  
Similar scripts can be useful for mapping and count steps as well.
