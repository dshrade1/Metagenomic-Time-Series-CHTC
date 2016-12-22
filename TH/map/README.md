To run:  

condor_submit run_bbmap.sub
map_postscript.sh

Optional but quite useful:  
After preprocessing is complete, run usage.sh to quantify the memory, RSS, and disk usage each metagenome uses during preprocessing.  
Output of this script is a directory containing sorted usage values pulled from the preprocessing run output.  
Similar scripts can be useful for mapping and count steps as well.
