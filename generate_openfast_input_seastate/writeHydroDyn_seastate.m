function writeHydroDyn_seastate(HydroDyn)

C(1,1) = {['------- HydroDyn v2.03.* Input File --------------------------------------------	']};
C(end+1,1) = {['IEA           MW            - offshore reference model with monopile	']};
C(end+1,1) = {['True         Echo          - Echo the input file data (flag)	']};
C(end+1,1) = {['---------------------- FLOATING PLATFORM --------------------------------------- [unused with WaveMod=6]	']};
C(end+1,1) = {['0             PotMod        - Potential-flow model {0: none=no potential flow, 1: frequency-to-time-domain transforms based on WAMIT output, 2: fluid-impulse theory (FIT)} (switch)	']};
C(end+1,1) = {['0             ExctnMod      - Wave Excitation model {0: None, 1: DFT, 2: state-space} (switch) [only used when PotMod=1; STATE-SPACE REQUIRES *.ssexctn INPUT FILE]	']};
C(end+1,1) = {['0             ExctnDisp     -	']};
C(end+1,1) = {['0             ExctnCutOff   -	']};
C(end+1,1) = {['0             RdtnMod       - Radiation memory-effect model {0: no memory-effect calculation, 1: convolution, 2: state-space} (switch) [only used when PotMod=1; STATE-SPACE REQUIRES *.ss INPUT FILE]	']};
C(end+1,1) = {['60.0          RdtnTMax      - Analysis time for wave radiation kernel calculations (sec) [only used when PotMod=1; determines RdtnDOmega=Pi/RdtnTMax in the cosine transform; MAKE SURE THIS IS LONG ENOUGH FOR THE RADIATION IMPULSE RESPONSE FUNCTIONS TO DECAY TO NEAR-ZERO FOR THE GIVEN PLATFORM!]	']};
C(end+1,1) = {['0.0           RdtnDT        - Time step for wave radiation kernel calculations (sec) [only used when PotMod=1; DT<=RdtnDT<=0.1 recommended; determines RdtnOmegaMax=Pi/RdtnDT in the cosine transform]	']};
C(end+1,1) = {['1             NBody         - Number of WAMIT bodies to be used (-) [>=1; only used when PotMod=1. If NBodyMod=1, the WAMIT data contains a vector of size 6*NBody x 1 and matrices of size 6*NBody x 6*NBody; if NBodyMod>1, there are NBody sets of WAMIT data each with a vector of size 6 x 1 and matrices of size 6 x 6]	']};
C(end+1,1) = {['1             NBodyMod      - Body coupling model {1: include coupling terms between each body and NBody in HydroDyn equals NBODY in WAMIT, 2: neglect coupling terms between each body and NBODY=1 with XBODY=0 in WAMIT, 3: Neglect coupling terms between each body and NBODY=1 with XBODY=/0 in WAMIT} (switch) [only used when PotMod=1]	']};
C(end+1,1) = {['unused        PotFile       - Root name of potential-flow model data; WAMIT output files containing the linear, nondimensionalized, hydrostatic restoring matrix (.hst), frequency-dependent hydrodynamic added mass matrix and damping matrix (.1), and frequency- and direction-dependent wave excitation force vector per unit wave amplitude (.3) (quoted string) [MAKE SURE THE FREQUENCIES INHERENT IN THESE WAMIT FILES SPAN THE PHYSICALLY-SIGNIFICANT RANGE OF FREQUENCIES FOR THE GIVEN PLATFORM; THEY MUST CONTAIN THE ZERO- AND INFINITE-FREQUENCY LIMITS!]	']};
C(end+1,1) = {['1             WAMITULEN     - Characteristic body length scale used to redimensionalize WAMIT output (meters) [only used when PotMod=1]	']};
C(end+1,1) = {['0.0           PtfmRefxt     - The xt offset of the body reference point(s) from (0,0,0) (meters) [1 to NBody] [only used when PotMod=1]	']};
C(end+1,1) = {['0.0           PtfmRefyt     - The yt offset of the body reference point(s) from (0,0,0) (meters) [1 to NBody] [only used when PotMod=1]	']};
C(end+1,1) = {['0.0           PtfmRefzt     - The zt offset of the body reference point(s) from (0,0,0) (meters) [1 to NBody] [only used when PotMod=1. If NBodyMod=2,PtfmRefzt=0.0]	']};
C(end+1,1) = {['0.0           PtfmRefztRot  - The rotation about zt of the body reference frame(s) from xt/yt (degrees) [1 to NBody] [only used when PotMod=1]	']};
C(end+1,1) = {['0.0           PtfmVol0      - Displaced volume of water when the platform is in its undisplaced position (m^3) [only used when PotMod=1; USE THE SAME VALUE COMPUTED BY WAMIT AS OUTPUT IN THE .OUT FILE!]	']};
C(end+1,1) = {['0.0           PtfmCOBxt     - The xt offset of the center of buoyancy (COB) from the platform reference point (meters) [only used when PotMod=1]	']};
C(end+1,1) = {['0.0           PtfmCOByt     - The yt offset of the center of buoyancy (COB) from the platform reference point (meters) [only used when PotMod=1]	']};
C(end+1,1) = {['---------------------- 2ND-ORDER FLOATING PLATFORM FORCES ---------------------- [unused with WaveMod=0 or 6, or PotMod=0 or 2]	']};
C(end+1,1) = {['0             MnDrift       - Mean-drift 2nd-order forces computed {0: None; [7, 8, 9, 10, 11, or 12]: WAMIT file to use} [Only one of MnDrift, NewmanApp, or DiffQTF can be non-zero]	']};
C(end+1,1) = {['0             NewmanApp     - Mean- and slow-drift 2nd-order forces computed with Newman"s approximation {0: None; [7, 8, 9, 10, 11, or 12]: WAMIT file to use} [Only one of MnDrift, NewmanApp, or DiffQTF can be non-zero. Used only when WaveDirMod=0]	']};
C(end+1,1) = {['0             DiffQTF       - Full difference-frequency 2nd-order forces computed with full QTF {0: None; [10, 11, or 12]: WAMIT file to use} [Only one of MnDrift, NewmanApp, or DiffQTF can be non-zero]	']};
C(end+1,1) = {['0             SumQTF        - Full summation -frequency 2nd-order forces computed with full QTF {0: None; [10, 11, or 12]: WAMIT file to use}	']};
C(end+1,1) = {['---------------------- PLATFORM ADDITIONAL STIFFNESS AND DAMPING  --------------	']};
C(end+1,1) = {['0.0   AddF0    - Additional preload (N, N-m) [If NBodyMod=1, one size 6*NBody x 1 vector; if NBodyMod>1, NBody size 6 x 1 vectors] KDAdd 	']};
C(end+1,1) = {['0.0	']};
C(end+1,1) = {['0.0	']};
C(end+1,1) = {['0.0	']};
C(end+1,1) = {['0.0	']};
C(end+1,1) = {['0.0	']};
C(end+1,1) = {['	             0             0             0             0             0             0   AddCLin  - Additional linear stiffness (N/m, N/rad, N-m/m, N-m/rad)	']};
C(end+1,1) = {['	             0             0             0             0             0             0	']};
C(end+1,1) = {['	             0             0             0             0             0             0	']};
C(end+1,1) = {['	             0             0             0             0             0             0	']};
C(end+1,1) = {['	             0             0             0             0             0             0	']};
C(end+1,1) = {['	             0             0             0             0             0             0	']};
C(end+1,1) = {['	             0             0             0             0             0             0   AddBLin  - Additional linear damping(N/(m/s), N/(rad/s), N-m/(m/s), N-m/(rad/s))	']};
C(end+1,1) = {['	             0             0             0             0             0             0	']};
C(end+1,1) = {['	             0             0       4389794.6           0             0             0	']};
C(end+1,1) = {['	             0             0             0             0             0             0	']};
C(end+1,1) = {['	             0             0             0             0             0             0	']};
C(end+1,1) = {['	             0             0             0             0             0             0	']};
C(end+1,1) = {['	             0             0             0             0             0             0   AddBQuad - Additional quadratic drag(N/(m/s)^2, N/(rad/s)^2, N-m(m/s)^2, N-m/(rad/s)^2)	']};
C(end+1,1) = {['	             0             0             0             0             0             0	']};
C(end+1,1) = {['	             0             0             0             0             0             0	']};
C(end+1,1) = {['	             0             0             0             0             0             0	']};
C(end+1,1) = {['	             0             0             0             0             0             0	']};
C(end+1,1) = {['	             0             0             0             0             0             0	']};
C(end+1,1) = {['---------------------- STRIP THEORY --------------------------------------	']};
C(end+1,1) = {['0             WaveDisp      - Method of computing Wave Kinematics {0: use undisplaced position, 1: use displaced position)	']};
C(end+1,1) = {['1             AMMod         - Method of computing distributed added-mass force. {0: nodes below SWL when undisplaced. 1: Up to the free surface}	']};
C(end+1,1) = {['---------------------- AXIAL COEFFICIENTS --------------------------------------	']};
C(end+1,1) = {['1             NAxCoef       - Number of axial coefficients (-)	']};
C(end+1,1) = {['AxCoefID        AxCd            AxCa            AxCp            AxFDMod         AxVnCOff        AxFDLoFSc      	']};
C(end+1,1) = {['(-)             (-)             (-)             (-)             (-)             (-)             (-)            	']};
C(end+1,1) = {['              1	              0	              0	              1	              0	              0	              0']};
C(end+1,1) = {['---------------------- MEMBER JOINTS -------------------------------------------	']};
C(end+1,1) = {['2             NJoints       - Number of joints (-) [must be exactly 0 or at least 2]	']};
C(end+1,1) = {['JointID         Jointxi         Jointyi         Jointzi         JointAxID       JointOvrlp     	']};
C(end+1,1) = {['(-)             (m)             (m)             (m)             (-)             (switch)       	']};
C(end+1,1) = {['              1	              0	              0	              '     num2str(HydroDyn.WaterDepth *-1)	  '              1	              0	']};
C(end+1,1) = {['              2	              0	              0	              '   num2str(HydroDyn.Transition_Height)   '	             1	              0	']};
C(end+1,1) = {['---------------------- MEMBER CROSS-SECTION PROPERTIES -------------------------	']};
C(end+1,1) = {['2             NPropSets     - Number of member property sets (-)	']};
C(end+1,1) = {['PropSetID       PropD           PropThck       	']};
C(end+1,1) = {['(-)             (m)             (m)            	']};
C(end+1,1) = {['1             ' num2str(HydroDyn.Diameter_Mudline)      '             '     num2str(HydroDyn.Thickness_Mudline) ]};
C(end+1,1) = {['2             ' num2str(HydroDyn.Diameter_Interface)    '             '     num2str(HydroDyn.Thickness_Interface) ]};
C(end+1,1) = {['---------------------- SIMPLE HYDRODYNAMIC COEFFICIENTS (model 1) --------------	']};
C(end+1,1) = {['SimplCd         SimplCdMG       SimplCa         SimplCaMG       SimplCp         SimplCpMG       SimplAxCd       SimplAxCdMG     SimplAxCa       SimplAxCaMG     SimplAxCp       SimplAxCpMG    	SimplAxCpMG         SimplCb']};
C(end+1,1) = {['(-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)            	(-)                 (-)']};
C(end+1,1) = {['1.0	1.0	1.0	1.0	1.0	1.0	0.0	0.0	1.0	1.0	1.0	1.0 1.0 1.0']};
C(end+1,1) = {['---------------------- DEPTH-BASED HYDRODYNAMIC COEFFICIENTS (model 2) ---------	']};
C(end+1,1) = {['0             NCoefDpth     - Number of depth-dependent coefficients (-)	']};
C(end+1,1) = {['Dpth            DpthCd          DpthCdMG        DpthCa          DpthCaMG        DpthCp          DpthCpMG        DpthAxCd        DpthAxCdMG      DpthAxCa        DpthAxCaMG      DpthAxCp        DpthAxCpMG     	']};
C(end+1,1) = {['(m)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)            	']};
C(end+1,1) = {['---------------------- MEMBER-BASED HYDRODYNAMIC COEFFICIENTS (model 3) --------	']};
C(end+1,1) = {['0             NCoefMembers  - Number of member-based coefficients (-)	']};
C(end+1,1) = {['MemberID_HydC   MemberCd1       MemberCd2       MemberCdMG1     MemberCdMG2     MemberCa1       MemberCa2       MemberCaMG1     MemberCaMG2     MemberCp1       MemberCp2       MemberCpMG1     MemberCpMG2     MemberAxCd1     MemberAxCd2     MemberAxCdMG1   MemberAxCdMG2   MemberAxCa1     MemberAxCa2     MemberAxCaMG1   MemberAxCaMG2   MemberAxCp1     MemberAxCp2     MemberAxCpMG1   MemberAxCpMG2  	']};
C(end+1,1) = {['(-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)             (-)            	']};
C(end+1,1) = {['-------------------- MEMBERS ------------------------------------------------- 	']};
C(end+1,1) = {['1             NMembers      - Number of members (-)	']};
C(end+1,1) = {['MemberID        MJointID1       MJointID2       MPropSetID1     MPropSetID2     MDivSize        MCoefMod        PropPot        	']};
C(end+1,1) = {['(-)             (-)             (-)             (-)             (-)             (m)             (switch)        (flag)         	']};
C(end+1,1) = {['1	1	2	1	2	0.1	  1	  1   False']};
C(end+1,1) = {['---------------------- FILLED MEMBERS ------------------------------------------	']};
C(end+1,1) = {['0             NFillGroups   - Number of filled member groups (-) [If FillDens = DEFAULT, then FillDens = WtrDens; FillFSLoc is related to MSL2SWL]	']};
C(end+1,1) = {['FillNumM        FillMList       FillFSLoc       FillDens       	']};
C(end+1,1) = {['(-)             (-)             (m)             (kg/m^3)       	']};
C(end+1,1) = {['---------------------- MARINE GROWTH -------------------------------------------	']};
C(end+1,1) = {['0             NMGDepths     - Number of marine-growth depths specified (-)	']};
C(end+1,1) = {['MGDpth          MGThck          MGDens         	']};
C(end+1,1) = {['(m)             (m)             (kg/m^3)       	']};
C(end+1,1) = {['---------------------- MEMBER OUTPUT LIST --------------------------------------	']};
C(end+1,1) = {['0             NMOutputs     - Number of member outputs (-) [must be < 10]	']};
C(end+1,1) = {['MemberID        NOutLoc         NodeLocs       	']};
C(end+1,1) = {['(-)             (-)             (-)            	']};
C(end+1,1) = {['---------------------- JOINT OUTPUT LIST ---------------------------------------	']};
C(end+1,1) = {['2             NJOutputs     - Number of joint outputs [Must be < 10]	']};
C(end+1,1) = {['1, 2 JOutLst - List of JointIDs which are to be output (-)[unused if NJOutputs=0]	']};
C(end+1,1) = {['---------------------- OUTPUT --------------------------------------------------	']};
C(end+1,1) = {['False         HDSum         - Output a summary file [flag]	']};
C(end+1,1) = {['False         OutAll        - Output all user-specified member and joint loads (only at each member end, not interior locations) [flag]	']};
C(end+1,1) = {['2             OutSwtch      - Output requested channels to: [1=Hydrodyn.out, 2=GlueCode.out, 3=both files]	']};
C(end+1,1) = {['ES11.4e2    OutFmt        - Output format for numerical results (quoted string) [not checked for validity!]	']};
C(end+1,1) = {['A11         OutSFmt       - Output format for header strings (quoted string) [not checked for validity!]	']};
C(end+1,1) = {['---------------------- OUTPUT CHANNELS -----------------------------------------	']};
C(end+1,1) = {['END	']};
C(end+1,1) = {['---------------------------------------------------------------------------------------	']};

writecell(C,HydroDyn.FileName,QuoteStrings="none",FileType="text",WriteMode="overwrite");

end