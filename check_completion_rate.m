clc; clear; close all;
aa = dir("outb_*mat");
load designTable.mat;
for i=1:numel(aa)
    
    nn = split(aa(i).name,'outb_');
    nn1 = split(nn{2},'.mat');
    flnm = ['outb_' nn1{1} '.mat'];
    load(aa(i).name)
    load(['hazard_rep/' nn1{1} '.mat'])
    
    f = figure;
    scatter(hazard_rep.Hs, hazard_rep.Vw, SizeData=1,Marker=".",MarkerEdgeColor=[0.4 0.4 0.4],MarkerEdgeAlpha=0.1)
    hold on
    scatter(res,"mean_Hs","mean_Vhub","filled",ColorVariable="GroupCount",SizeData=30)
    c = colorbar;
    clim([0 18])
    c.Ticks = [0:1:18];
    c.Label.String = 'completed simulation';
    cmap = colormap(jet(18));
    colormap(flipud(cmap))
    xlabel('Hs (m)')
    ylabel('Vhub (m/s)')
    title([nn1{1} ' completion rate'])
    exportgraphics(f,sprintf('completion_rate_%s.png', nn1{1}))
end