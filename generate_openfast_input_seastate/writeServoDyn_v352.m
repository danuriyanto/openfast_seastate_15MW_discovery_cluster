function writeServoDyn_v352(ServoDyn)

C(1,1) = {['	------- SERVODYN v1.05.* INPUT FILE --------------------------------------------	']};
C(end+1,1) = {['IEA 15 MW offshore reference model monopile configuration	']};

C(end+1,1) = {['---------------------- SIMULATION CONTROL --------------------------------------	']};
C(end+1,1) = {['True Echo - Echo input data to <RootName>.ech (flag)	']};
C(end+1,1) = {['"default" DT - Communication interval for controllers (s) (or "default")	']};

C(end+1,1) = {['---------------------- PITCH CONTROL -------------------------------------------	']};
C(end+1,1) = {['5 PCMode - Pitch control mode {0: none, 3: user-defined from routine PitchCntrl, 4: user-defined from Simulink/Labview, 5: user-defined from Bladed-style DLL} (switch)	']};
C(end+1,1) = {['0.0 TPCOn - Time to enable active pitch control (s) [unused when PCMode=0]	']};
C(end+1,1) = {['9999.9 TPitManS(1) - Time to start override pitch maneuver for blade 1 and end standard pitch control (s)	']};
C(end+1,1) = {['9999.9 TPitManS(2) - Time to start override pitch maneuver for blade 2 and end standard pitch control (s)	']};
C(end+1,1) = {['9999.9 TPitManS(3) - Time to start override pitch maneuver for blade 3 and end standard pitch control (s) [unused for 2 blades]	']};
C(end+1,1) = {['2.0 PitManRat(1) - Pitch rate at which override pitch maneuver heads toward final pitch angle for blade 1 (deg/s)	']};
C(end+1,1) = {['2.0 PitManRat(2) - Pitch rate at which override pitch maneuver heads toward final pitch angle for blade 2 (deg/s)	']};
C(end+1,1) = {['2.0 PitManRat(3) - Pitch rate at which override pitch maneuver heads toward final pitch angle for blade 3 (deg/s) [unused for 2 blades]	']};
C(end+1,1) = {['0.0 BlPitchF(1) - Blade 1 final pitch for pitch maneuvers (degrees)	']};
C(end+1,1) = {['0.0 BlPitchF(2) - Blade 2 final pitch for pitch maneuvers (degrees)	']};
C(end+1,1) = {['0.0 BlPitchF(3) - Blade 3 final pitch for pitch maneuvers (degrees) [unused for 2 blades]	']};

C(end+1,1) = {['---------------------- GENERATOR AND TORQUE CONTROL ----------------------------	']};
C(end+1,1) = {['5 VSContrl - Variable-speed control mode {0: none, 1: simple VS, 3: user-defined from routine UserVSCont, 4: user-defined from Simulink/Labview, 5: user-defined from Bladed-style DLL} (switch)	']};
C(end+1,1) = {['1 GenModel - Generator model {1: simple, 2: Thevenin, 3: user-defined from routine UserGen} (switch) [used only when VSContrl=0]	']};
C(end+1,1) = {['95.756 GenEff - Generator efficiency [ignored by the Thevenin and user-defined generator models] (%)	']};
C(end+1,1) = {['True GenTiStr - Method to start the generator {T: timed using TimGenOn, F: generator speed using SpdGenOn} (flag)	']};
C(end+1,1) = {['True GenTiStp - Method to stop the generator {T: timed using TimGenOf, F: when generator power = 0} (flag)	']};
C(end+1,1) = {['9999.9 SpdGenOn - Generator speed to turn on the generator for a startup (HSS speed) (rpm) [used only when GenTiStr=False]	']};
C(end+1,1) = {['0.0 TimGenOn - Time to turn on the generator for a startup (s) [used only when GenTiStr=True]	']};
C(end+1,1) = {['9999.9 TimGenOf - Time to turn off the generator (s) [used only when GenTiStp=True]	']};

C(end+1,1) = {['---------------------- SIMPLE VARIABLE-SPEED TORQUE CONTROL --------------------	']};
C(end+1,1) = {['7.559987120819503 VS_RtGnSp - Rated generator speed for simple variable-speed generator control (HSS side) (rpm) [used only when VSContrl=1]	']};
C(end+1,1) = {['19624046.66639  VS_RtTq - Rated generator torque/constant generator torque in Region 3 for simple variable-speed generator control (HSS side) (N-m) [used only when VSContrl=1]	']};
C(end+1,1) = {['343357.4355671095 VS_Rgn2K - Generator torque constant in Region 2 for simple variable-speed generator control (HSS side) (N-m/rpm^2) [used only when VSContrl=1]	']};
C(end+1,1) = {['2. VS_SlPc - Rated generator slip percentage in Region 2 1/2 for simple variable-speed generator control (%) [used only when VSContrl=1]	']};

C(end+1,1) = {['---------------------- SIMPLE INDUCTION GENERATOR ------------------------------	']};
C(end+1,1) = {['9999.9 SIG_SlPc - Rated generator slip percentage (%) [used only when VSContrl=0 and GenModel=1]	']};
C(end+1,1) = {['9999.9 SIG_SySp - Synchronous (zero-torque) generator speed (rpm) [used only when VSContrl=0 and GenModel=1]	']};
C(end+1,1) = {['9999.9 SIG_RtTq - Rated torque (N-m) [used only when VSContrl=0 and GenModel=1]	']};
C(end+1,1) = {['9999.9 SIG_PORt - Pull-out ratio (Tpullout/Trated) (-) [used only when VSContrl=0 and GenModel=1]	']};

C(end+1,1) = {['---------------------- THEVENIN-EQUIVALENT INDUCTION GENERATOR -----------------	']};
C(end+1,1) = {['9999.9 TEC_Freq - Line frequency [50 or 60] (Hz) [used only when VSContrl=0 and GenModel=2]	']};
C(end+1,1) = {['100 TEC_NPol - Number of poles [even integer > 0] (-) [used only when VSContrl=0 and GenModel=2]	']};
C(end+1,1) = {['9999.9 TEC_SRes - Stator resistance (ohms) [used only when VSContrl=0 and GenModel=2]	']};
C(end+1,1) = {['9999.9 TEC_RRes - Rotor resistance (ohms) [used only when VSContrl=0 and GenModel=2]	']};
C(end+1,1) = {['9999.9 TEC_VLL - Line-to-line RMS voltage (volts) [used only when VSContrl=0 and GenModel=2]	']};
C(end+1,1) = {['9999.9 TEC_SLR - Stator leakage reactance (ohms) [used only when VSContrl=0 and GenModel=2]	']};
C(end+1,1) = {['9999.9 TEC_RLR - Rotor leakage reactance (ohms) [used only when VSContrl=0 and GenModel=2]	']};
C(end+1,1) = {['9999.9 TEC_MR - Magnetizing reactance (ohms) [used only when VSContrl=0 and GenModel=2]	']};

C(end+1,1) = {['---------------------- HIGH-SPEED SHAFT BRAKE ----------------------------------	']};
C(end+1,1) = {['0 HSSBrMode - HSS brake model {0: none, 1: simple, 3: user-defined from routine UserHSSBr, 4: user-defined from Simulink/Labview, 5: user-defined from Bladed-style DLL} (switch)	']};
C(end+1,1) = {['9999.9 THSSBrDp - Time to initiate deployment of the HSS brake (s)	']};
C(end+1,1) = {['9999.9 HSSBrDT - Time for HSS-brake to reach full deployment once initiated (sec) [used only when HSSBrMode=1]	']};
C(end+1,1) = {['9999.9 HSSBrTqF - Fully deployed HSS-brake torque (N-m)	']};

C(end+1,1) = {['---------------------- NACELLE-YAW CONTROL -------------------------------------	']};
C(end+1,1) = {['5 YCMode - Yaw control mode {0: none, 3: user-defined from routine UserYawCont, 4: user-defined from Simulink/Labview, 5: user-defined from Bladed-style DLL} (switch)	']};
C(end+1,1) = {['200 TYCOn - Time to enable active yaw control (s) [unused when YCMode=0]	']};
C(end+1,1) = {['0.0 YawNeut - Neutral yaw position--yaw spring force is zero at this yaw (degrees)	']};
C(end+1,1) = {['6009291301.0 YawSpr - Nacelle-yaw spring constant (N-m/rad)	']};
C(end+1,1) = {['4811254.0 YawDamp - Nacelle-yaw damping constant (N-m/(rad/s))	']};
C(end+1,1) = {['9999.9 TYawManS - Time to start override yaw maneuver and end standard yaw control (s)	']};
C(end+1,1) = {['0.25 YawManRat - Yaw maneuver rate (in absolute value) (deg/s)	']};
C(end+1,1) = {['0.0 NacYawF - Final yaw angle for override yaw maneuvers (degrees)	']};

C(end+1,1) = {['---------------------- Aerodynamic Flow Control -------------------------------------	']};
C(end+1,1) = {['0 AfCmode - Airfoil control mode {0- none, 1- cosine wave cycle, 4- user-defined from Simulink/Labview, 5- user-defined from Bladed-style DLL}	']};
C(end+1,1) = {['0.0 AfC_Mean - Mean level for sinusoidal cycling or steady value (-) [used only with AfCmode==1]	']};
C(end+1,1) = {['0.0 AfC_Amp - Amplitude for for cosine cycling of flap signal (AfC = AfC_Amp*cos(Azimuth+phase)+AfC_mean) (-) [used only with AfCmode==1]	']};
C(end+1,1) = {['0.0 AfC_phase - Phase relative to the blade azimuth (0 is vertical) for for cosine cycling of flap signal (deg) [used only with AfCmode==1]	']};

C(end+1,1) = {['---------------------- STRUCTURAL CONTROL ---------------------------------------	']};
C(end+1,1) = {['0 NumBStC - Number of blade structural controllers (integer)	']};
C(end+1,1) = {['"unused" BStCfiles - Name of the file for blade tuned mass damper (quoted string) [unused when CompNTMD is false]	']};
C(end+1,1) = {['0 NumNStC - Number of nacelle structural controllers (integer)	']};
C(end+1,1) = {['"unused" NStCfiles - Name of the file for nacelle tuned mass damper (quoted string) [unused when CompNTMD is false]	']};
C(end+1,1) = {['0 NumTStC - Number of tower structural controllers (integer)	']};
C(end+1,1) = {['"unused" TStCfiles - Name of the file for tower tuned mass damper (quoted string) [unused when CompNTMD is false]	']};
C(end+1,1) = {['0 NumSStC - Number of sbustructure structural controllers (integer)	']};
C(end+1,1) = {['"unused" SStCfiles - Name of the file for sbustructure tuned mass damper (quoted string) [unused when CompNTMD is false]	']};

C(end+1,1) = {['---------------------- CABLE CONTROL ---------------------------------------- 	']};
C(end+1,1) = {['0 CCmode - Cable control mode {0- none, 4- user-defined from Simulink/Labview, 5- user-defineAfC_phased from Bladed-style DLL}	']};

C(end+1,1) = {['---------------------- BLADED INTERFACE ---------------------------------------- [used only with Bladed Interface]	']};
C(end+1,1) = {['"' ServoDyn.DLL_FileName '"' ' DLL_FileName - Name/location of the dynamic library {.dll [Windows] or .so [Linux]} in the Bladed-DLL format (-) [used only with Bladed Interface]	']};
C(end+1,1) = {['"IEA-15-240-RWT-Monopile_DISCON.IN" DLL_InFile - Name of input file sent to the DLL (-) [used only with Bladed Interface]	']};
C(end+1,1) = {['"DISCON" DLL_ProcName - Name of procedure in DLL to be called (-) [case sensitive; used only with DLL Interface]	']};
C(end+1,1) = {['"default" DLL_DT - Communication interval for dynamic library (s) (or "default") [used only with Bladed Interface]	']};
C(end+1,1) = {['False DLL_Ramp - Whether a linear ramp should be used between DLL_DT time steps [introduces time shift when true] (flag) [used only with Bladed Interface]	']};
C(end+1,1) = {['9999.9 BPCutoff - Cuttoff frequency for low-pass filter on blade pitch from DLL (Hz) [used only with Bladed Interface]	']};
C(end+1,1) = {['0.0 NacYaw_North - Reference yaw angle of the nacelle when the upwind end points due North (deg) [used only with Bladed Interface]	']};
C(end+1,1) = {['0 Ptch_Cntrl - Record 28: Use individual pitch control {0: collective pitch; 1: individual pitch control} (switch) [used only with Bladed Interface]	']};
C(end+1,1) = {['0.0 Ptch_SetPnt - Record 5: Below-rated pitch angle set-point (deg) [used only with Bladed Interface]	']};
C(end+1,1) = {['0.0 Ptch_Min - Record 6: Minimum pitch angle (deg) [used only with Bladed Interface]	']};
C(end+1,1) = {['0.0 Ptch_Max - Record 7: Maximum pitch angle (deg) [used only with Bladed Interface]	']};
C(end+1,1) = {['0.0 PtchRate_Min - Record 8: Minimum pitch rate (most negative value allowed) (deg/s) [used only with Bladed Interface]	']};
C(end+1,1) = {['0.0 PtchRate_Max - Record 9: Maximum pitch rate (deg/s) [used only with Bladed Interface]	']};
C(end+1,1) = {['0.0 Gain_OM - Record 16: Optimal mode gain (Nm/(rad/s)^2) [used only with Bladed Interface]	']};
C(end+1,1) = {['0.0 GenSpd_MinOM - Record 17: Minimum generator speed (rpm) [used only with Bladed Interface]	']};
C(end+1,1) = {['0.0 GenSpd_MaxOM - Record 18: Optimal mode maximum speed (rpm) [used only with Bladed Interface]	']};
C(end+1,1) = {['0.0 GenSpd_Dem - Record 19: Demanded generator speed above rated (rpm) [used only with Bladed Interface]	']};
C(end+1,1) = {['0.0 GenTrq_Dem - Record 22: Demanded generator torque above rated (Nm) [used only with Bladed Interface]	']};
C(end+1,1) = {['0.0 GenPwr_Dem - Record 13: Demanded power (W) [used only with Bladed Interface]	']};

C(end+1,1) = {['---------------------- BLADED INTERFACE TORQUE-SPEED LOOK-UP TABLE -------------	']};
C(end+1,1) = {['0 DLL_NumTrq - Record 26: No. of points in torque-speed look-up table {0 = none and use the optimal mode parameters; nonzero = ignore the optimal mode PARAMETERs by setting Record 16 to 0.0} (-) [used only with Bladed Interface]	']};
C(end+1,1) = {['GenSpd_TLU GenTrq_TLU 	']};
C(end+1,1) = {['(rpm) (Nm) 	']};

C(end+1,1) = {['---------------------- OUTPUT --------------------------------------------------	']};
C(end+1,1) = {['True SumPrint - Print summary data to <RootName>.sum (flag) (currently unused)	']};
C(end+1,1) = {['2 OutFile - Switch to determine where output will be placed: {1: in module output file only; 2: in glue code output file only; 3: both} (currently unused)	']};
C(end+1,1) = {['True TabDelim - Use tab delimiters in text tabular output file? (flag) (currently unused)	']};
C(end+1,1) = {['"ES10.3E2" OutFmt - Format used for text tabular output (except time). Resulting field should be 10 characters. (quoted string) (currently unused)	']};
C(end+1,1) = {['0.0 TStart - Time to begin tabular output (s) (currently unused)	']};
C(end+1,1) = {['OutList - The next line(s) contains a list of output parameters. See OutListParameters.xlsx for a listing of available output channels, (-)	']};
C(end+1,1) = {['"GenPwr"	']};
C(end+1,1) = {['"GenTq"	']};
C(end+1,1) = {['END of input file (the word "END" must appear in the first 3 columns of this last OutList line)	']};
C(end+1,1) = {['---------------------------------------------------------------------------------------	']};
writecell(C,ServoDyn.FileName,QuoteStrings="none",FileType="text",WriteMode="overwrite");
end