clc; clear; close all;
load("designTable.mat")
addpath generate_openfast_input_seastate/

%global setting
simdur = 800; %simulation duration in seconds;
rng(12345)
numSeeds = 18;
simDT = 0.001;
seedpool = randi([0,1000000],numSeeds,1); 
summary_openFast = struct();
FST_info = struct();
fact = [1.20 1.26 1.24 1.24 1.21 1.43 1.29 1.38 1.42 1.15 1.20 1.34]; %from Mike21 vs NREL
numCores = 12; % number of the parallel pool workers in MATLAB batches
mkdir("all_bts")
for sitenum = 2 %loop through sites

    % set the folder name
    sitename = designTable.Name{sitenum};
    foldername = ['openfast_bladepitch_var_' sitename '_18_seeds'];
    mkdir(foldername)
    
    % copy the main folder to each running folder and go into site folder
    copyfile("IEA-15-240-RWT-Monopile_DISCON.IN", foldername)
    copyfile("IEA-15-240-RWT", [foldername '/IEA-15-240-RWT']);
    
    cd(foldername)
    % delete all the input files if exists
    ext = {'*.Inp','*.fst','*.ech','*.txt','*.out','*.sh','*.bts'};
    extensions = cellfun(@(x)dir(fullfile(pwd,x)),ext,'UniformOutput',false);
    extensions = vertcat(extensions{:});
    if ~isempty(extensions)
        delete(extensions.name);
    end
    
    bladepitch_array = [5 6 7];
    Vhub_array       = [9 10 11];
    Hs_array         = ones(size(Vhub_array)) * 0.01;

    [BP, VH, HS] = ndgrid(bladepitch_array, Vhub_array, Hs_array);
    combinations = [BP(:), VH(:), HS(:)];
    combinationsTable = array2table(combinations, 'VariableNames', {'BladePitch', 'Vhub', 'Hs'});


    % generate the openfast simulation input for the specific site
    for pairnum=1:numel(combinationsTable.BladePitch)
        % set the Vhub, Hs and Tp from the seastate pairs
        Vhub = combinationsTable.Vhub(pairnum);
        Hs   = combinationsTable.Hs(pairnum);
        BladePitch = combinationsTable.BladePitch(pairnum);
            
        for nseed=1:numel(seedpool)
            seed = seedpool(nseed);
            runIndex = numSeeds*(pairnum-1) + nseed;
            sprintf('site = %s runIndex = %0.0f Hs = %0.02f Vhub = %0.0f simDT = %0.04f ', sitename, runIndex, Hs, Vhub, simDT)
            Tp = 4.3*sqrt(Hs); % Spectral peak period (sec)
          
            % set the environmental criteria
            waterdepth = designTable.Depth_m_(sitenum); % waterdepth m
            wavedir = 0; % wave attack angle (degree)
            winddir = 0; % wind attack angle (degree)

            % structure properties
            interface_loc           = designTable.InterfaceElevation(sitenum);
            diameter_mudline        = designTable.BottomDiameter(sitenum);
            diameter_interface      = designTable.TopDiameter(sitenum);
            thickness_mudline       = designTable.BottomThickness(sitenum);
            thickness_interface     = designTable.TopThickness(sitenum);

            %make empty structures for each simulation input:
            SubDyn      = struct();
            HydroDyn    = struct();
            SeaState    = struct();
            AeroDyn     = struct();
            ServoDyn    = struct();
            ElastoDyn   = struct();
            InflowWind  = struct();
            TurbSim     = struct();
            fst         = struct();

            % file naming
            site_name               = designTable.Name{sitenum};
            env_info                = ['_Vhub_'      num2str(Vhub) ...
                                       '_BladePitch_' num2str(BladePitch) ... 
                                       '_seed_'      num2str(seed)];
            env_info_wind_only      = ['_Vhub_' num2str(Vhub) '_seednum_' num2str(seed)];
            SubDyn.FileName         = [site_name env_info '.SubDyn.Inp'];
            HydroDyn.FileName       = [site_name env_info '.HydroDyn.Inp'];
            SeaState.FileName       = [site_name env_info '.SeaState.Inp'];
            AeroDyn.FileName        = [site_name env_info '.AeroDyn.Inp'];
            ServoDyn.FileName       = [site_name env_info '.ServoDyn.Inp'];
            ElastoDyn.FileName      = [site_name env_info '.ElastoDyn.Inp'];
            TurbSim.FileName        = ['Turbsim' ...
                                       env_info_wind_only '.Turbsim.Inp'];
            InflowWind.FileName     = [site_name env_info '.Inflow.Inp'];
            fst.FileName            = [site_name env_info '.fst'];

            % setup SubDyn input file
            SubDyn.Mudline_loc          = waterdepth;
            SubDyn.Interface_loc        = interface_loc;
            SubDyn.Thickness_Mudline    = thickness_mudline;
            SubDyn.Thickness_Interface  = thickness_interface;
            SubDyn.Diameter_Mudline     = diameter_mudline;
            SubDyn.Diameter_Interface   = diameter_interface;
            SubDyn.SSI_File             = ssiFileLookup(site_name);
            SubDyn.env_info             = env_info;
            writeSubDyn_seastate(SubDyn);

            % setup HydroDyn input file
            HydroDyn.WaterDepth         = waterdepth;
            HydroDyn.Transition_Height  = interface_loc;
            HydroDyn.Diameter_Mudline   = diameter_mudline;
            HydroDyn.Thickness_Mudline  = thickness_mudline;
            HydroDyn.Diameter_Interface = diameter_interface;
            HydroDyn.Thickness_Interface= thickness_interface;
            HydroDyn.env_info           = env_info;
            writeHydroDyn_seastate(HydroDyn);

            % setup SeaState input file
            SeaState.Z_Depth            = waterdepth;
            SeaState.env_info           = env_info;
            SeaState.WaveMod            = 1; %{0: none=still water, 1: regular (periodic), 1P#: regular with user-specified phase, 2: JONSWAP/Pierson-Moskowitz spectrum (irregular), 3: White noise spectrum (irregular), 4: user-defined spectrum from routine UserWaveSpctrm (irregular), 5: Externally generated wave-elevation time series, 6: Externally generated full wave-kinematics time series [option 6 is invalid for PotMod/=0]}
            SeaState.WaveStMod          = 0; %{0: none=no stretching, 1: vertical stretching, 2: extrapolation stretching, 3: Wheeler stretching}
            SeaState.WaveTMax           = simdur;
            SeaState.WaveDT             = 0.1;
            SeaState.WaveHs             = Hs;
            SeaState.WaveTp             = Tp;
            SeaState.WaveDir            = wavedir;
            SeaState.WaveSeed           = seed;
            SeaState.CurrMod            = 0;
            SeaState.CurrSSV0           = 0;
            SeaState.CurrSSDir          = 0; 
            SeaState.MCFD               = diameter_mudline;
            SeaState.ConstWaveMod       = 2;
            SeaState.CrestHmax          = 1.86*Hs;
            SeaState.CrestTime          = 350; 
            writeSeaState_seastate(SeaState);

            % setup AeroDyn input file
            AeroDyn.WakeMod   = 0;
            AeroDyn.AFAeroMod = 1;
            writeAeroDyn_seastate(AeroDyn);

            % setup ServoDyn input file
            ServoDyn.DLL_FileName = '/Users/macbook/miniconda3/envs/openfast_seastate/lib/libdiscon.dylib';
            writeServoDyn_v352(ServoDyn);

            % setup ElastoDyn input file
            ElastoDyn.NacYaw    = 0; % nacelle yaw angle
            ElastoDyn.BlPitch   = BladePitch; %blade pitch, 90 deg == feathered blade
            ElastoDyn.RotSpeed  = 0; % initial rotor speed
            ElastoDyn.Azimuth   = 60;
            ElastoDyn.GenDOF    = 'True'; % True = idling, False = fixed
            writeElastoDyn_seastate(ElastoDyn);

            % setup Turbsim simulation
            TurbSim.RandSeed1    = seed;
            TurbSim.AnalysisTime = simdur;
            TurbSim.Vhub         = Vhub;
            writeTurbSim_v352(TurbSim);

            % setup inflowwind input file
            InflowWind.WindType         = 3;
            InflowWind.PropagationDir   = winddir;
            InflowWind.HWindSpeed       = Vhub;
            InflowWind.FileName_BTS     = ['../all_bts/' TurbSim.FileName(1:end-4) '.bts'];
            writeInflowWind_seastate(InflowWind);

            % setup the OpenFast .fst file
            fst.echo        = 'True';
            fst.env_info    = env_info;
            fst.Tmax        = simdur; %simulation duration
            fst.DT          = simDT; %simulation DT
            fst.CompElast   = 1; % {1=ElastoDyn; 2=ElastoDyn + BeamDyn for blades}
            fst.CompInflow  = 1; % {0=still air; 1=InflowWind; 2=external from OpenFOAM}
            fst.CompAero    = 2; % {0=None; 1=AeroDyn v14; 2=AeroDyn v15}
            fst.CompServo   = 0; % {0=None; 1=ServoDyn}
            fst.CompHydro   = 1; % {0=None; 1=HydroDyn}
            fst.CompSub     = 1; % {0=None; 1=SubDyn; 2=External Platform MCKF}
            fst.CompSeaSt   = 1; % {0=None; 1=SeaState}
            fst.WtrDpth     = waterdepth;% waterdepth in m
            fst.MSL2SWL     = 0; % Mean Sea Level distance to Still Water Level (positive)
            fst.EDFile      = ElastoDyn.FileName; % ElastoDyn input file
            fst.AeroFile    = AeroDyn.FileName; % AeroDyn input file
            fst.ServoFile   = ServoDyn.FileName;  % ServoDyn input file
            fst.HydroFile   = HydroDyn.FileName;  % Hydrodyn input file
            fst.SubFile     = SubDyn.FileName;    % Subdyn input file
            fst.InflowFile  = InflowWind.FileName; %inflow wind input file
            fst.SeaStFile   = SeaState.FileName; %seastate input file
            fst.FolderName  = foldername;
            writeFST_seastate(fst);


%             % save all the fst properties in the summary struct
%             summary_openFast(runIndex).sitename   = site_name;
%             summary_openFast(runIndex).Hs         = Hs;
%             summary_openFast(runIndex).Vhub       = Vhub;
%             summary_openFast(runIndex).seed       = seed;
%             summary_openFast(runIndex).SubDyn     = SubDyn;
%             summary_openFast(runIndex).HydroDyn   = HydroDyn;
%             summary_openFast(runIndex).AeroDyn    = AeroDyn;
%             summary_openFast(runIndex).ServoDyn   = ServoDyn;
%             summary_openFast(runIndex).ElastoDyn  = ElastoDyn;
%             summary_openFast(runIndex).InflowWind = InflowWind;
%             summary_openFast(runIndex).TurbSim    = TurbSim;
%             summary_openFast(runIndex).fst        = fst;
        end
    end
    prepare_openfast_tasks_array(numCores)
    prepare_turbsim_tasks_array(numCores)
    copyfile('../submit_jobs_openfast_array.sh', './');
    copyfile('../submit_jobs_turbsim_array.sh', './');
    system('chmod +x *sh')
    movefile("*.Turbsim.Inp", "../all_bts/")
    cd ../
end

cd all_bts/
prepare_openfast_tasks_array(numCores)
cd ../

fprintf('FINISH!!!!')