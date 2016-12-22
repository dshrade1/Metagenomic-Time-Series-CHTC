Run all the following from ~/Metagenomic-Time-Series-CHTC/TH/minid:

1. To import, format, and subsample the FASTA files:
condor_submit subset.sub

2. Concatenate the subsampled files into a single file
cat sub_* > random_MG.fasta

3. Split random read file
condor_submit split.sub

4. Run the mapping.
condor_submit run_bbmap_random.sub
Note: this calls run_bbmap_random.sh

5. Create a list of the read files.
./listReadFiles_random.sh

6. Extract information on percent mapped, percent perfect, and percent error per minid value tested.
./percent_mapped.sh

7. Transfer files from CHTC to local machine for analysis & plotting in R.

8. Run select_minid.R to produce plots of the % reads mapped and % bases mapped across a range of different values of minid
