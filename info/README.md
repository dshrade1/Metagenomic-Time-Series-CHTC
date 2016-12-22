The scripts in this folder enable the user to retrieve some useful information.  

fasta_sizes.sh and fastq_sizes.sh can be run from the main directory for the sample site of interest.  They produce lists in bytes of each metagenome's file size, which is useful for estimating the memory and disk usage required for preprocessings and mapping steps.  TH_fasta_sizes.txt and TH_fastq_sizes.txt are examples of such output.

Directories ending in "_usage92" describe the disk, RSS, and memory usage each process ran for each sample site. These directories are outputs of the scripts titled usage.sh. In combination with metagenome size data, these outputs can help inform how much memory and disk space to request for future samples.

