#!/bin/bash
#SBATCH --job-name=turbsim_array
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=128G
#SBATCH --partition=short
#SBATCH --time=23:58:00
#SBATCH --output=turbsim_%A_%a.out
startIdx=$(( ($SLURM_ARRAY_TASK_ID - 1) * 12 + 1 ))
endIdx=$(( $SLURM_ARRAY_TASK_ID * 12 ))
if [ "$endIdx" -gt "234" ]; then endIdx=234; fi
module load matlab
matlab -nodisplay -nosplash -r "fileID = fopen('turbsim_file_list.txt', 'r'); turbsimFiles = textscan(fileID, '%s'); fclose(fileID); parpool(12); parfor i = $startIdx:$endIdx, outputFile = sprintf('%s.out', turbsimFiles{1}{i}(1:end-12)); system(sprintf('turbsim %s > %s', turbsimFiles{1}{i}, outputFile)); end; exit;"
