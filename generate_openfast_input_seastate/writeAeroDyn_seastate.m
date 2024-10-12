function writeAeroDyn_seastate(AeroDyn)

C(1,1) = {['------- AERODYN v15.03.* INPUT FILE ------------------------------------------------']};
C(end+1,1) = {['IEA           MW            - Offshore Reference Turbine	']};
C(end+1,1) = {['======  General Options  ============================================================================']};
C(end+1,1) = {['True         Echo          - Echo the input to "<rootname>.AD.ech"? (flag)']};
C(end+1,1) = {['default       DTAero        - Time interval for aerodynamic calculations {or "default"} (s)']};
C(end+1,1) = {[num2str(AeroDyn.WakeMod)    ' WakeMod       - Type of wake/induction model (switch) {0=none, 1=BEMT, 2=DBEMT, 3=OLAF} [WakeMod cannot be 2 or 3 when linearizing]']};
C(end+1,1) = {[num2str(AeroDyn.AFAeroMod)  ' AFAeroMod     - Type of blade airfoil aerodynamics model (switch) {1=steady model, 2=Beddoes-Leishman unsteady model} [AFAeroMod must be 1 when linearizing]']};
C(end+1,1) = {['2             TwrPotent     - Type tower influence on wind based on potential flow around the tower (switch) {0=none, 1=baseline potential flow, 2=potential flow with Bak correction}']};
C(end+1,1) = {['1             TwrShadow     - Calculate tower influence on wind based on downstream tower shadow (switch) {0=none, 1=Powles model, 2=Eames model}']};
C(end+1,1) = {['True          TwrAero       - Calculate tower aerodynamic loads? (flag)']};
C(end+1,1) = {['False         FrozenWake    - Assume frozen wake during linearization? (flag) [used only when WakeMod=1 and when linearizing]']};
C(end+1,1) = {['False         CavitCheck    - Perform cavitation check? (flag) [AFAeroMod must be 1 when CavitCheck=true]']};
C(end+1,1) = {['False         Buoyancy      - Include buoyancy effects? (flag)']};
C(end+1,1) = {['False         CompAA        - Flag to compute AeroAcoustics calculation [only used when WakeMod=1 or 2]']};
C(end+1,1) = {['AeroAcousticsInput.dat AA_InputFile  - AeroAcoustics input file [used only when CompAA=true]']};
C(end+1,1) = {['======  Environmental Conditions  ===================================================================']};
C(end+1,1) = {['"default"     AirDens       - Air density (kg/m^3)']};
C(end+1,1) = {['"default"     KinVisc       - Kinematic air viscosity (m^2/s)']};
C(end+1,1) = {['"default"     SpdSound      - Speed of sound (m/s)']};
C(end+1,1) = {['"default"     Patm          - Atmospheric pressure (Pa) [used only when CavitCheck=True]']};
C(end+1,1) = {['"default"     Pvap          - Vapour pressure of fluid (Pa) [used only when CavitCheck=True]']};
C(end+1,1) = {['======  Blade-Element/Momentum Theory Options  ====================================================== [used only when WakeMod=1]']};
C(end+1,1) = {['2             SkewMod       - Type of skewed-wake correction model (switch) {1=uncoupled, 2=Pitt/Peters, 3=coupled} [unused when WakeMod=0 or 3]']};
C(end+1,1) = {['default       SkewModFactor - Constant used in Pitt/Peters skewed wake model {or "default" is 15/32*pi} (-) [used only when SkewMod=2; unused when WakeMod=0 or 3]']};
C(end+1,1) = {['True          TipLoss       - Use the Prandtl tip-loss model? (flag) [unused when WakeMod=0 or 3]']};
C(end+1,1) = {['True          HubLoss       - Use the Prandtl hub-loss model? (flag) [unused when WakeMod=0 or 3]']};
C(end+1,1) = {['True          TanInd        - Include tangential induction in BEMT calculations? (flag) [unused when WakeMod=0 or 3]']};
C(end+1,1) = {['True          AIDrag        - Include the drag term in the axial-induction calculation? (flag) [unused when WakeMod=0 or 3]']};
C(end+1,1) = {['True          TIDrag        - Include the drag term in the tangential-induction calculation? (flag) [unused when WakeMod=0,3 or TanInd=FALSE]']};
C(end+1,1) = {['default       IndToler      - Convergence tolerance for BEMT nonlinear solve residual equation {or "default"} (-) [unused when WakeMod=0 or 3]']};
C(end+1,1) = {['500           MaxIter       - Maximum number of iteration steps (-) [unused when WakeMod=0]']};
C(end+1,1) = {['======  Dynamic Blade-Element/Momentum Theory Options  ====================================================== [used only when WakeMod=1]']};
C(end+1,1) = {['2             DBEMT_Mod     - Type of dynamic BEMT (DBEMT) model {1=constant tau1, 2=time-dependent tau1} (-) [used only when WakeMod=2]']};
C(end+1,1) = {['29.03         tau1_const    - Time constant for DBEMT (s) [used only when WakeMod=2 and DBEMT_Mod=1]']};
C(end+1,1) = {['=====  OLAF -- cOnvecting LAgrangian Filaments (Free Vortex Wake) Theory Options  ================== [used only when WakeMod=3]']};
C(end+1,1) = {['IEA-15-240-RWT_OLAF.dat OLAFInputFileName - Input file for OLAF [used only when WakeMod=3]']};
C(end+1,1) = {['======  Beddoes-Leishman Unsteady Airfoil Aerodynamics Options  ===================================== [used only when AFAeroMod=2]']};
C(end+1,1) = {['3             UAMod         - Unsteady Aero Model Switch (switch) {1=Baseline model (Original), 2=Gonzalez"s variant (changes in Cn,Cc,Cm), 3=Minnema/Pierce variant (changes in Cc and Cm)} [used only when AFAeroMod=2]']};
C(end+1,1) = {['True          FLookup       - Flag to indicate whether a lookup for f" will be calculated (TRUE) or whether best-fit exponential equations will be used (FALSE); if FALSE S1-S4 must be provided in airfoil input files (flag) [used only when AFAeroMod=2]']};
C(end+1,1) = {['0             UAStartRad    - Starting radius for dynamic stall (fraction of rotor radius) [used only when AFAeroMod=2]']};
C(end+1,1) = {['1             UAEndRad      - Ending radius for dynamic stall (fraction of rotor radius) [used only when AFAeroMod=2]']};
C(end+1,1) = {['======  Airfoil Information =========================================================================']};
C(end+1,1) = {['1             AFTabMod      - Interpolation method for multiple airfoil tables {1=1D interpolation on AoA (first table only); 2=2D interpolation on AoA and Re; 3=2D interpolation on AoA and UserProp} (-)']};
C(end+1,1) = {['1             InCol_Alfa    - The column in the airfoil tables that contains the angle of attack (-)']};
C(end+1,1) = {['2             InCol_Cl      - The column in the airfoil tables that contains the lift coefficient (-)']};
C(end+1,1) = {['3             InCol_Cd      - The column in the airfoil tables that contains the drag coefficient (-)']};
C(end+1,1) = {['4             InCol_Cm      - The column in the airfoil tables that contains the pitching-moment coefficient; use zero if there is no Cm column (-)']};
C(end+1,1) = {['0             InCol_Cpmin   - The column in the airfoil tables that contains the Cpmin coefficient; use zero if there is no Cpmin column (-)']};
C(end+1,1) = {['50            NumAFfiles    - Number of airfoil files used (-)']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_00.dat" AFNames - Airfoil file names (NumAFfiles lines) (quoted strings)']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_01.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_02.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_03.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_04.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_05.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_06.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_07.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_08.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_09.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_10.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_11.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_12.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_13.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_14.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_15.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_16.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_17.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_18.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_19.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_20.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_21.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_22.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_23.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_24.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_25.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_26.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_27.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_28.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_29.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_30.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_31.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_32.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_33.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_34.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_35.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_36.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_37.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_38.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_39.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_40.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_41.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_42.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_43.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_44.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_45.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_46.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_47.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_48.dat"']};
C(end+1,1) = {['"IEA-15-240-RWT/Airfoils/IEA-15-240-RWT_AeroDyn15_Polar_49.dat"']};
C(end+1,1) = {['======  Rotor/Blade Properties  =====================================================================']};
C(end+1,1) = {['	True          UseBlCm       - Include aerodynamic pitching moment in calculations? (flag)']};
C(end+1,1) = {['"IEA-15-240-RWT/IEA-15-240-RWT_AeroDyn15_blade.dat" ADBlFile(1)   - Name of file containing distributed aerodynamic properties for Blade #1 (-)']};
C(end+1,1) = {['"IEA-15-240-RWT/IEA-15-240-RWT_AeroDyn15_blade.dat" ADBlFile(2)   - Name of file containing distributed aerodynamic properties for Blade #2 (-) [unused if NumBl < 2]']};
C(end+1,1) = {['"IEA-15-240-RWT/IEA-15-240-RWT_AeroDyn15_blade.dat" ADBlFile(3)   - Name of file containing distributed aerodynamic properties for Blade #3 (-) [unused if NumBl < 3]']};
C(end+1,1) = {['======  Hub Properties ============================================================================== [used only when Buoyancy=True]']};
C(end+1,1) = {['0.0           VolHub        - Hub volume (m^3)']};
C(end+1,1) = {['0.0           HubCenBx      - Hub center of buoyancy x direction offset (m)']};
C(end+1,1) = {['======  Nacelle Properties ========================================================================== [used only when Buoyancy=True]']};
C(end+1,1) = {['0.0           VolNac        - Nacelle volume (m^3)']};
C(end+1,1) = {['0, 0, 0 NacCenB - Position of nacelle center of buoyancy from yaw bearing in nacelle coordinates (m)']};
C(end+1,1) = {['======  Tail fin Aerodynamics ========================================================================']};
C(end+1,1) = {['False         TFinAero      - Calculate tail fin aerodynamics model (flag)']};
C(end+1,1) = {['"unused"      TFinFile      - Input file for tail fin aerodynamics [used only when TFinAero=True]']};
C(end+1,1) = {['======  Tower Influence and Aerodynamics ============================================================= [used only when TwrPotent/=0, TwrShadow/=0, or TwrAero=True]']};
C(end+1,1) = {['10            NumTwrNds     - Number of tower nodes used in the analysis (-) [used only when TwrPotent/=0, TwrShadow/=0, or TwrAero=True]']};
C(end+1,1) = {['TwrElev         TwrDiam         TwrCd           TwrTI           TwrCb	']};
C(end+1,1) = {['(m)             (m)             (-)             (-)             (-)']};
C(end+1,1) = {['20	             10	 5.00000000e-01	 1.00000000e-01	              0']};
C(end+1,1) = {['28	             10	 5.00000000e-01	 1.00000000e-01	              0']};
C(end+1,1) = {['41	 9.92600000e+00	 5.00000000e-01	 1.00000000e-01	              0']};
C(end+1,1) = {['67	 8.83300000e+00	 5.00000000e-01	 1.00000000e-01	              0']};
C(end+1,1) = {['80	 8.15100000e+00	 5.00000000e-01	 1.00000000e-01	              0']};
C(end+1,1) = {['93	 7.39000000e+00	 5.00000000e-01	 1.00000000e-01	              0']};
C(end+1,1) = {['106	 6.90900000e+00	 5.00000000e-01	 1.00000000e-01	              0']};
C(end+1,1) = {['119	 6.74800000e+00	 5.00000000e-01	 1.00000000e-01	              0']};
C(end+1,1) = {['132	 6.57200000e+00	 5.00000000e-01	 1.00000000e-01	              0']};
C(end+1,1) = {['1.44386000e+02	 6.50000000e+00	 5.00000000e-01	 1.00000000e-01	              0']};
C(end+1,1) = {['======  Outputs  ====================================================================================']};
C(end+1,1) = {['False         SumPrint      - Generate a summary file listing input options and interpolated properties to "<rootname>.AD.sum"? (flag)']};
C(end+1,1) = {['0             NBlOuts       - Number of blade node outputs [0 - 9] (-)']};
C(end+1,1) = {['0             BlOutNd       - Blade nodes whose values will be output (-)']};
C(end+1,1) = {['0             NTwOuts       - Number of tower node outputs [0 - 9] (-)']};
C(end+1,1) = {['0             TwOutNd       - Tower nodes whose values will be output (-)']};
C(end+1,1) = {['OutList The next line(s) contains a list of output parameters.  See OutListParameters.xlsx for a listing of available output channels, (-)']};
C(end+1,1) = {['"RtFldFxh"	']};
C(end+1,1) = {['"RtFldFyh"	']};
C(end+1,1) = {['"RtFldFzh"	']};
C(end+1,1) = {['"RtFldMxh"	']};
C(end+1,1) = {['"RtFldMyh"	']};
C(end+1,1) = {['"RtFldMzh"	']};
C(end+1,1) = {['"RtVAvgxh"	']};
C(end+1,1) = {['"RtFldCp"	']};
C(end+1,1) = {['"RtFldCt"	']};
C(end+1,1) = {['"RtArea"	']};
C(end+1,1) = {['"RtSpeed"	']};
C(end+1,1) = {'RtAeroFxh'};
C(end+1,1) = {'RtAeroFyh'};
C(end+1,1) = {'RtAeroFzh'};
C(end+1,1) = {'RtAeroMxh'};
C(end+1,1) = {'RtAeroMyh'};
C(end+1,1) = {'RtAeroMzh'};
C(end+1,1) = {['"RtTSR"	']};
C(end+1,1) = {['END	']};
C(end+1,1) = {['====== Outputs for all blade stations (same ending as above for B1N1.... =========================== [optional section]']};
C(end+1,1) = {['0             BldNd_BladesOut - Number of blades to output all node information at. Up to number of blades on turbine. (-)']};
C(end+1,1) = {['"All"         BldNd_BlOutNd - Future feature will allow selecting a portion of the nodes to output. Not implemented yet. (-)']};
C(end+1,1) = {['OutList_Nodal The next line(s) contains a list of output parameters.  See OutListParameters.xlsx for a listing of available output channels, (-)']};
C(end+1,1) = {['END	']};
C(end+1,1) = {['---------------------------------------------------------------------------------------']};

writecell(C,AeroDyn.FileName,QuoteStrings="none",FileType="text",WriteMode="overwrite");
end