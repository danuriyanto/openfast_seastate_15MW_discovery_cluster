function[IM] = createIM(hazard,depth,sitenum)
% Creates intensity measures based on hazard data

% Spencer Hallowell, University of Maine, 10/17/2023

% Inputs: 
% hazard - MATLAB structure containing wind and wave hazard information
% depth - Water depth at the site of interest

% Outputs:
% IM - MATLAB structure containing the combinations of wind and wave to run
% through EDP analysis

Hs = hazard.Hs;
Vw = hazard.Vw;

windTry = 1:8:1.1*max(ceil(Vw));
break_height = 0.78*depth;
if ismember(sitenum,[1 2 3 4 7 8 10 11 12])
    waveTry = 0.5:1.5:ceil(break_height/1.86)+1;
elseif ismember(sitenum,[6])
    waveTry = 0.5:1.5:ceil(break_height)+1;
else
    waveTry = 0.5:1.5:ceil(break_height/1.6)+1;
end 
k = convhull(Hs,Vw); %Convex hull capturing all combinations

[wave,wind] = meshgrid(waveTry,windTry);
wavevec = wave(:);
windvec = wind(:);


spaceFactor = 1.1; %Used to expand the convex hull, only used if this is the 1,000 year catalog

% Only use grid from inside of expanded convex hull
ip = inpolygon(wavevec,windvec,Hs(k)*spaceFactor,Vw(k)*spaceFactor);

% Final wind/wave combos
IM.waveTry = wave(ip);
IM.windTry = wind(ip);
