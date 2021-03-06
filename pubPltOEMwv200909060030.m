% make manuscript plots for wvOEM

date = 20090906; %20150305;
nb = '00'; % '00'
VERSION = '2-0-1';
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
xlabel('ADC Count Rate (MHz)')
legend off
subplot(1,2,2)
set(gca,'XScale','log')
xlim([5e-5 50]); % 1e-5 100
set(gca,'XTick',[.0001 .001 .01 .1 1 10])
set(gca,'XMinorTick','off')
%set(gca,'XTick',[1 10 100])
set(gca,'FontSize',9);
xlabel('Photocount Rate (MHz)')
legend off
fn = [outPlot 'wvOEM' int2str(date) dextout '-rawCounts.pdf'];
export_fig(fn, '-pdf', '-nocrop')

% Jacobians
hfig(2) = figure(2);
set(gcf,'Units','inches')
set(gcf,'Position', [1 1 5.75 4.3125]);
subplot(2,2,1)
title ''
xlabel('Jacobian (ADC counts/bin/1800 shots)')
ylim([0 14])
set(gca,'FontSize',8);
subplot(2,2,2)
title ''
xlabel('Jacobian (ADC counts/bin/1800 shots)')
ylim([0 14])
set(gca,'FontSize',8);
subplot(2,2,3)
title ''
ylim([0 14])
xlabel('Jacobian (photocounts/bin/1800 shots)')
set(gca,'FontSize',8);
subplot(2,2,4)
title ''
ylim([0 14])
set(gca,'FontSize',8);
xlabel('Jacobian (photocounts/bin/1800 shots)')
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
set(gcf,'Position', [1 1 5.75 4.3125]);
set(gca,'FontSize',9);
xlim([0 1100])
set(gca,'XTick',[0 200 400 600 800 1000])
ylim([0 14])
fn = [outPlot 'wvOEM' int2str(date) dextout '-vertRes.pdf'];
export_fig(fn, '-pdf', '-nocrop')

% Residuals
hfig(5) = figure(5);
set(gcf,'Units','inches')
set(gcf,'Position', [1 1 5.75 4.3125]);
subplot(2,2,1)
set(gca,'FontSize',9);
ylim([0 10])
xlabel('H_2O Analog (%)')
subplot(2,2,2)
set(gca,'FontSize',9);
ylim([0 10])
xlim([-.5 .5])
xlabel('N_2 Analog (%)')
subplot(2,2,3)
set(gca,'FontSize',9);
%axis([-150 150 2.5 14]);  % 2500 only
xlim([-100 100])
ylim([0 10])
xlabel('H_2O Digital (%)')
subplot(2,2,4)
set(gca,'FontSize',9);
xlim([-7.5 7.5])
ylim([0 10])
xlabel('N_2 Digital (%)')
fn = [outPlot 'wvOEM' int2str(date) dextout '-residuals.pdf'];
export_fig(fn, '-pdf', '-nocrop')

% wvmmr
hfig(6) = figure(6);
set(gcf,'Units','inches')
set(gcf,'Position', [1 1 5.75 4.3125]);
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
xlim([1e-2 10]); % 0905 [1e-1 10]
ylim([0 14])
fn = [outPlot 'wvOEM' int2str(date) dextout '-wvmmr.pdf'];
export_fig(fn, '-pdf', '-nocrop')

% wv errors
hfig(7) = figure(11);
set(gcf,'Units','inches')
set(gcf,'Position', [1 1 5.75 4.3125]);
set(gca,'FontSize',9);
ylim([0 14])
hleg = legend('Statistical','\sigma_{Rayleigh}', 'Air Density',...
    'Calibration','Overlap','Total','Location','Best');
set(hleg,'FontSize',8,'Box','off');
fn = [outPlot 'wvOEM' int2str(date) dextout '-errors.pdf'];
export_fig(fn, '-pdf', '-nocrop')

% ASR
hfig(8) = figure(13);
set(gcf,'Units','inches')
set(gcf,'Position', [1 1 5.75 4.3125]);
set(gca,'FontSize',9);
xlabel('Backscatter Ratio')
ylim([0 14])
fn = [outPlot 'wvOEM' int2str(date) dextout '-ASR.pdf'];
export_fig(fn, '-pdf', '-nocrop')

% trans errors
hfig(9) = figure(12);
set(gcf,'Units','inches')
set(gcf,'Position', [1 1 5.75 4.3125]);
set(gca,'FontSize',9);
ylim([0 14])
xlim([0 75])
hleg = legend('Statistical','\sigma_{Rayleigh}', 'Air Density',...
    'Calibration','Overlap','Total','Location','East');
set(hleg,'FontSize',8,'Box','off');
fn = [outPlot 'wvOEM' int2str(date) dextout '-Terrors.pdf'];
export_fig(fn, '-pdf', '-nocrop')

% Transmission
%'skipping transmission plot'
hfig(10) = figure(8);
%'fix legend by hand'
set(gcf,'Units','inches')
set(gcf,'Position', [1 1 5.75 4.3125]);
set(gca,'FontSize',9);
ho = findobj(gca,'LineStyle',':');
set(ho,'LineStyle','none')
ylim([0 14])
xlim([.25 1.5])
fn = [outPlot 'wvOEM' int2str(date) dextout '-trans.pdf'];
export_fig(fn, '-pdf', '-nocrop')

% extinction
hfig(11) = figure(14);
%'fix legend by hand'
set(gcf,'Units','inches')
set(gcf,'Position', [1 1 5.75 4.3125]);
ho = findobj(gca,'LineStyle',':');
set(ho,'LineStyle','none')
subplot(1,2,1)
set(gca,'FontSize',9);
ylim([0 14])
xlim([-10 600])
%xlim([.25 1.5])
subplot(1,2,2)
set(gca,'FontSize',9);
ylim([2.5 14])
xlim([0 65])
set(gca,'YTick',[3 5 7 9 11 13])
ho = findobj(gca,'Color',[.929 .694 .125]);
set(ho,'Color',[.85 .325 .098]);
fn = [outPlot 'wvOEM' int2str(date) dextout '-extinct.pdf'];
export_fig(fn, '-pdf', '-nocrop')

savefig(hfig,[outPlot 'wvOEM' int2str(date) fextout2])
  