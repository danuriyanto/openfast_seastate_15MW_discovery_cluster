#!/bin/bash
#SBATCH --job-name=openfast_array
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=128G
#SBATCH --partition=short
#SBATCH --time=23:58:00
#SBATCH --output=openfast_%A_%a.out
startIdx=$(( ($SLURM_ARRAY_TASK_ID - 1) * 12 + 1 ))
endIdx=$(( $SLURM_ARRAY_TASK_ID * 12 ))
if [ "$endIdx" -gt "82" ]; then endIdx=82; fi
module load matlab
matlab -nodisplay -nosplash -r "fileID = fopen('file_list.txt', 'r'); fstFiles = textscan(fileID, '%s'); fclose(fileID); parpool(12); parfor i = $startIdx:$endIdx, outputFile = sprintf('%s.out', fstFiles{1}{i}(1:end-4)); system(sprintf('openfast %s > %s', fstFiles{1}{i}, outputFile)); end; exit;"
