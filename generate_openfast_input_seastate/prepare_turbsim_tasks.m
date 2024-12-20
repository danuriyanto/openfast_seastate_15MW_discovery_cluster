function prepare_turbsim_tasks(numCores)
    % List all OpenFAST input files (*.fst)
    turbsimFiles = dir('*.Turbsim.Inp');
    numFiles = length(turbsimFiles);
    
    % Calculate how many jobs are required based on numCores
    numJobs = ceil(numFiles / numCores);
    
    % Save the list of files to a text file
    fid = fopen('file_list_turbsim.txt', 'w');
    for i = 1:numFiles
        fprintf(fid, '%s\n', turbsimFiles(i).name);
    end
    fclose(fid);
    
    % Save job and core information
    fid = fopen('job_info_turbsim.txt', 'w');
    fprintf(fid, '%d\n', numJobs); % First line is number of jobs
    fprintf(fid, '%d\n', numCores); % Second line is number of cores
    fclose(fid);

    % Prepare job scripts for each job
    for jobIdx = 1:numJobs
        startIdx = (jobIdx - 1) * numCores + 1;
        endIdx = min(jobIdx * numCores, numFiles);
        jobFile = sprintf('turbsim_job_%d.sh', jobIdx);
        
        % Create a file list for this job
        jobFileList = sprintf('turbsim_files_job_%d.txt', jobIdx);
        fid = fopen(jobFileList, 'w');
        for i = startIdx:endIdx
            fprintf(fid, '%s\n', turbsimFiles(i).name);
        end
        fclose(fid);

        % Create the SLURM job script
        fid = fopen(jobFile, 'w');
        fprintf(fid, '#!/bin/bash\n');
        fprintf(fid, '#SBATCH --job-name=turbsim_job_%d\n', jobIdx);
        fprintf(fid, '#SBATCH --ntasks=1\n');
        fprintf(fid, '#SBATCH --cpus-per-task=%d\n', numCores);
        fprintf(fid, '#SBATCH --mem=12G\n');
        fprintf(fid, '#SBATCH --partition=short\n');
        fprintf(fid, '#SBATCH --time=01:00:00\n');
        fprintf(fid, '#SBATCH --output=turbsim_job_%d.out\n', jobIdx);

        % MATLAB commands to run OpenFAST using the file list
        fprintf(fid, 'module load matlab\n');
        fprintf(fid, 'matlab -nodisplay -nosplash -r "fileID = fopen(''%s'', ''r''); ', jobFileList);
        fprintf(fid, 'fstFiles = textscan(fileID, ''%%s''); fclose(fileID); ');
        fprintf(fid, 'parpool(%d); parfor i = 1:length(fstFiles{1}), ', numCores);
        fprintf(fid, 'system(sprintf(''turbsim %%s'', fstFiles{1}{i})); end; exit;"\n');
        
        fclose(fid);
    end
end