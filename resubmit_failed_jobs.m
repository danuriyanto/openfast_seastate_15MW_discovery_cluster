clc; clear; close all;

addpath generate_openfast_input_seastate/

% Load design table
load designTable.mat

for sitenum = 9
    % Define the sitename
    sitename = designTable.Name{sitenum};

    % Define the directory
    directory = sprintf('%s/openfast_seastate_%s', pwd, sitename);

    % Get lists of input and output files
    input_files = dir(fullfile(directory, sprintf('%s*.fst', sitename)));
    output_files = dir(fullfile(directory, sprintf('%s*.outb', sitename)));

    % Extract the base names (without extensions)
    input_basenames = arrayfun(@(f) erase(f.name, '.fst'), input_files, 'UniformOutput', false);
    output_basenames = arrayfun(@(f) erase(f.name, '.outb'), output_files, 'UniformOutput', false);

    % Find input files without corresponding output files
    missing_outputs = setdiff(input_basenames, output_basenames);

    % Populate rerun_sims with the full names (including .fst extension)
    rerun_sims = strcat(missing_outputs, '.fst');
    numel(rerun_sims)
    % Delete the *fst files that DO NOT need to rerun
    files_to_delete = setdiff({input_files.name}, rerun_sims); % Files to delete
    for i = 1:numel(files_to_delete)
        delete(fullfile(directory, files_to_delete{i})); % Delete the file
    end

    % Run 'prepare_openfast_task_array(numCores)' with numCores = 24
    cd(directory); % Change directory to the sitename folder
    numCores = 24; % Number of cores
    prepare_openfast_tasks_array(numCores); % Run the function

    % Copy 'submit_jobs_openfast_array.sh' from the parent folder and set executable
    copyfile('../submit_jobs_openfast_array.sh', './'); % Copy the file
    system('chmod +x *sh'); % Make shell scripts executable
    cd ../
end