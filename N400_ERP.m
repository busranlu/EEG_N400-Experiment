restoredefaultpath
addpath C:\Users\Busra\Documents\MATLAB\fieldtrip-20180925
ft_defaults

cfg             = [];
cfg.dataset     = 'ERP_N400.trc';
cfg.headerfile  = 'ERP_N400';
cfg.continuous  = 'yes';


cfg = [];
cfg.dataset             = 'ERP_N400.trc';
cfg.trialdef.eventtype  = 'MARKER'; 
cfg.trialdef.eventvalue = {100}; % 100 is cogrent
cfg.trialdef.prestim    = 1; % seconds
cfg.trialdef.poststim   = 2; % seconds
cfg.trialfun            = 'ft_trialfun_general';
cfg                     = ft_definetrial(cfg); 




cfg.continuous          = 'yes';    % data is continuous
cfg.channel             = 'Fz';
cfg.bpfilter            = 'yes';    % we do apply a band-pass filter
cfg.bpfreq              = [1 10];   % bandpass frequency is 1-10
cfg.bpfilttype          ='but';     % filter type
cfg.bpfiltord           =2;         % order of filter
cfg.demean              = 'yes';    % demean (baseline correct) ...
cfg.detrend             = 'no';     % do not detrend
data                    = ft_preprocessing(cfg);


cfg               = [];
cfg.trials        ='all';
cfg.removemean    ='yes';
cfg.keeptrials    ='no';
cfg.channel       = 'Fz';
ERP_cogrent       = ft_timelockanalysis(cfg, data);


 cfg=[];
 cfg.baseline     = [0 1];
 cfg.channel      = 'Fz';
 ERP_cogrent      = ft_timelockbaseline(cfg, ERP_cogrent);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
restoredefaultpath
addpath C:\Users\Busra\Documents\MATLAB\fieldtrip-20180925
ft_defaults

cfg             = [];
cfg.dataset     = 'ERP_N400.trc';
cfg.headerfile  = 'ERP_N400';
cfg.continuous  = 'yes';


cfg = [];
cfg.dataset             = 'ERP_N400.trc';
cfg.trialdef.eventtype  = 'MARKER'; 
cfg.trialdef.eventvalue = {99}; % 99 is incogrent
cfg.trialdef.prestim    = 1; % seconds
cfg.trialdef.poststim   = 2; % seconds
cfg.trialfun            = 'ft_trialfun_general';
cfg                     = ft_definetrial(cfg); 




cfg.continuous          = 'yes';    % data is continuous
cfg.channel             = 'Fz';
cfg.bpfilter            = 'yes';     % we do not apply a high-pass filter
cfg.bpfreq              = [1 10];
cfg.bpfilttype          ='but';
cfg.bpfiltord           =2;
cfg.demean              = 'yes';    % we demean (baseline correct) ...
cfg.detrend             = 'no';     % we do not detrend
data                    = ft_preprocessing(cfg);


cfg                   = [];
cfg.trials            ='all';
cfg.removemean        ='yes';
cfg.keeptrials        ='no';
cfg.channel           = 'Fz';
ERP_incogrent         = ft_timelockanalysis(cfg, data);


 cfg              =[];
 cfg.baseline     = [0 -0.3];
 cfg.channel      = 'Fz';
 ERP_incogrent    = ft_timelockbaseline(cfg, ERP_incogrent);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% plot
cfg               = [];
cfg.xlim          = [0 1];
cfg.ylim          = [-7 6];
cfg.channel       = 'Fz';
cfg.fontsize      = 10;
cfg.linewidth     = 3;
cfg.graphcolor    = 'brgkywrgbkywrgbkywrgbkyw';
cfg.layout        = 'natmeg_customized_eeg1005.lay';

figure
ft_singleplotER(cfg, ERP_incogrent,ERP_cogrent);
title ('N400 experiment ERPs');
xlabel('time (sec)');
ylabel('Amplitudeo (µV)');
legend('Incogrent ERP','Cogrent ERP');





