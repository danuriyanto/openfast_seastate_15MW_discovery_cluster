function[scatter_hazard] = create_scatter_hazard(hazard)
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

windTry = 0.1:0.1:max(ceil(Vw));
waveTry = 0.1:0.1:max(ceil(Hs));

k = convhull(Hs,Vw); %Convex hull capturing all combinations

[wave,wind] = meshgrid(waveTry,windTry);
wavevec = wave(:);
windvec = wind(:);


spaceFactor = 1; %Used to expand the convex hull, only used if this is the 1,000 year catalog

% Only use grid from inside of expanded convex hull
ip = inpolygon(wavevec,windvec,Hs(k)*spaceFactor,Vw(k)*spaceFactor);

% Final wind/wave combos
scatter_hazard.waveTry = wave(ip);
scatter_hazard.windTry = wind(ip);
