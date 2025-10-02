#!/bin/bash
#SBATCH --job-name=turbsim_array
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=128G
#SBATCH --partition=short
#SBATCH --time=23:58:00
#SBATCH --output=turbsim_%A_%a.out
startIdx=$(( ($SLURM_ARRAY_TASK_ID - 1) * 24 + 1 ))
endIdx=$(( $SLURM_ARRAY_TASK_ID * 24 ))
if [ "$endIdx" -gt "235" ]; then endIdx=235; fi
module load matlab
matlab -nodisplay -nosplash -r "fileID = fopen('turbsim_file_list.txt', 'r'); turbsimFiles = textscan(fileID, '%s'); fclose(fileID); parpool(24); parfor i = $startIdx:$endIdx, outputFile = sprintf('%s.out', turbsimFiles{1}{i}(1:end-12)); system(sprintf('turbsim %s > %s', turbsimFiles{1}{i}, outputFile)); end; exit;"
