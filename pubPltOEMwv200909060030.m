% make manuscript plots for wvOEM

date = 20090906; %20150305;
nb = '00'; % '00'
VERSION = '2-0-0';
outPath = '/Users/BobSica/Dropbox/matlab/matlabWork/fromMCH/ralmoOEMwvOutput/';
fextout = [nb '30chan2-v' VERSION '.fig'];
fextout2 = [nb '30chan2-v' VERSION '-pubPlt.fig'];
dextout = [nb '30chan2-v' VERSION]; % extension for output file with version
hgload([outPath 'wvOEM' int2str(date) fextout]);
outPlot = '/Users/BobSica/Dropbox/VirtualDesktop/oemWVpaper/';

% raw counts
hfig(1) = figure(1);
set(gcf,'Units','inches')
set(gcf,'Position', [1 1 5.75 4.3125]); % [1" 1" xwidth ywidth], y=0.75*x
subplot(1,2,1)
xlim([1.4 2.2]); % 0.04 0.075
set(gca,'FontSize',9);
legend off
subplot(1,2,2)
set(gca,'XScale','log')
xlim([5e-5 50]); % 1e-5 100
set(gca,'XTick',[.0001 .001 .01 .1 1 10])
set(gca,'XMinorTick','off')
%set(gca,'XTick',[1 10 100])
set(gca,'FontSize',9);
legend off
fn = [outPlot 'wvOEM' int2str(date) dextout '-rawCounts.pdf'];
export_fig(fn, '-pdf', '-nocrop')

% Jacobians
hfig(2) = figure(2);
set(gcf,'Units','inches')
set(gcf,'Position', [1 1 5.75 4.3125]);
subplot(2,2,1)
title ''
ylim([0 12])
set(gca,'FontSize',9);
subplot(2,2,2)
title ''
ylim([0 12])
set(gca,'FontSize',9);
subplot(2,2,3)
title ''
ylim([0 12])
set(gca,'FontSize',9);
subplot(2,2,4)
title ''
ylim([0 12])
set(gca,'FontSize',9);
fn = [outPlot 'wvOEM' int2str(date) dextout '-jacobians.pdf'];
export_fig(fn, '-pdf', '-nocrop')

% Averaging Kernels
hfig(3) = figure(3);
set(gcf,'Units','inches')
set(gcf,'Position', [1 1 5.75 4.3125]);
subplot(1,2,1)
title ''
set(gca,'FontSize',9);
subplot(1,2,2)
title ''
set(gca,'FontSize',9);
fn = [outPlot 'wvOEM' int2str(date) dextout '-avKernels.pdf'];
export_fig(fn, '-pdf', '-nocrop')

% Vertical Resolution
hfig(4) = figure(4);
set(gcf,'Units','inches')
set(gcf,'Position', [1 1 3.25 2.4375]);
set(gca,'FontSize',9);
%xlim([0 160])
ylim([0 12])
fn = [outPlot 'wvOEM' int2str(date) dextout '-vertRes.pdf'];
export_fig(fn, '-pdf', '-nocrop')

% Residuals
hfig(5) = figure(5);
set(gcf,'Units','inches')
set(gcf,'Position', [1 1 5.75 4.3125]);
subplot(2,2,1)
set(gca,'FontSize',9);
ylim([0 10])
subplot(2,2,2)
set(gca,'FontSize',9);
ylim([0 10])
subplot(2,2,3)
set(gca,'FontSize',9);
%axis([-150 150 2.5 14]);  % 2500 only
xlim([-100 100])
ylim([0 10])
subplot(2,2,4)
set(gca,'FontSize',9);
xlim([-20 20])
fn = [outPlot 'wvOEM' int2str(date) dextout '-residuals.pdf'];
export_fig(fn, '-pdf', '-nocrop')

% wvmmr
hfig(6) = figure(6);
set(gcf,'Units','inches')
set(gcf,'Position', [1 1 3.25 2.4375]);
xlabel('Water Vapor (g/kg)')
set(gca,'FontSize',9);
ho = findobj(gca,'Marker','o');
set(ho,'Marker','none')
set(ho,'LineStyle','none')
ho = findobj(gca,'Color','c');
set(ho,'Color','none')
set(ho,'LineStyle','none');
ho = findobj(gca,'Color','g');
set(ho,'LineWidth',1)
ho = findobj(gca,'Color','r');
set(ho,'LineWidth',1)
ho = findobj(gca,'Color','b');
set(ho,'LineWidth',1)
xlim([1e-4 10]); % 0905 [1e-1 10]
ylim([0 12])
fn = [outPlot 'wvOEM' int2str(date) dextout '-wvmmr.pdf'];
export_fig(fn, '-pdf', '-nocrop')

% wv errors
hfig(7) = figure(11);
set(gcf,'Units','inches')
set(gcf,'Position', [1 1 3.25 2.4375]);
set(gca,'FontSize',9);
ylim([0 12])
fn = [outPlot 'wvOEM' int2str(date) dextout '-errors.pdf'];
export_fig(fn, '-pdf', '-nocrop')

% ASR
hfig(8) = figure(13);
set(gcf,'Units','inches')
set(gcf,'Position', [1 1 3.25 2.4375]);
set(gca,'FontSize',9);
ylim([0 12])
fn = [outPlot 'wvOEM' int2str(date) dextout '-ASR.pdf'];
export_fig(fn, '-pdf', '-nocrop')

% Transmission
hfig(9) = figure(8);
set(gcf,'Units','inches')
set(gcf,'Position', [1 1 3.25 2.4375]);
set(gca,'FontSize',9);
ho = findobj(gca,'LineStyle',':');
set(ho,'LineStyle','none')
ylim([0 12])
fn = [outPlot 'wvOEM' int2str(date) dextout '-trans.pdf'];
export_fig(fn, '-pdf', '-nocrop')

% trans errors
hfig(10) = figure(12);
set(gcf,'Units','inches')
set(gcf,'Position', [1 1 3.25 2.4375]);
set(gca,'FontSize',9);
ylim([0 12])
xlim([0 50])
fn = [outPlot 'wvOEM' int2str(date) dextout '-Terrors.pdf'];
export_fig(fn, '-pdf', '-nocrop')

savefig(hfig,[outPlot 'wvOEM' int2str(date) fextout2])
  