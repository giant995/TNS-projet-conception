%% Exemple avec un signal de voix

% le but est 

clear all;
close all; 
clc;
format short eng

used_time = 15; % temps en secondes

delay_time = 35 ;% temps en delais en [s]

%% Extraction du signal

% [son_1_sans_perturbation,Fs] = audioread('raspoutine.mp4'); Used to
% exctract Fs from original file

% Fs est statique a 48000 et sera donc declare de facon staique
Fs = 48000;
%time_total = (length(son_1_sans_perturbation)/ Fs); % temps en secondes

delay_points = delay_time*Fs;

cropped_sound = audioread('raspoutine.mp4',[(1+delay_points) (Fs*used_time+delay_points)]);

sample_point=1:1:length(cropped_sound);
%% ajout du bruit gaussien
range = 200;
SNR = 0;


son_1_avec_perturbation = awgn(cropped_sound, SNR,  'measured');
son_2_avec_perturbation = awgn(son_1_avec_perturbation, SNR,  'measured');

%sound(cropped_sound,Fs); % ecouter son sans perturbation
%sound(son_1_avec_perturbation,Fs);  ecouter son avec perturbation [niv 1]
%sound(son_2_avec_perturbation,Fs);  ecouter son avec perturbation [niv 2]

%% FFT of signal 

trans_base = fft(cropped_sound);
trans_bruit1 = fft(son_1_avec_perturbation);
trans_bruit2 = fft(son_2_avec_perturbation);


%%


%% Plots PURE sans perturbation
figure
plot(sample_point,cropped_sound(:,1));
title('Son')
xlabel('nombre de samples')
ylabel('Amplitude du son')


figure
%plot(sample_point,son_1_avec_perturbation)
fig2 = plot(sample_point,abs(trans_base(:,1)));
xlim([0 32000])
title('FFT du signal Pure')
xlabel('Frequence en Hz')
ylabel('Counts')
%xtickformat('%.4');
%fig2.XRuler.exponent =0;
ax = gca;
ax.XRuler.Exponent = 3;


%% Plots avec perturbation
figure
plot(sample_point,son_2_avec_perturbation(:,1));
title('Son avec bruit')
xlabel('nombre de samples')
ylabel('Amplitude du son')


figure
%plot(sample_point,son_1_avec_perturbation)
fig2 = plot(sample_point,abs(trans_bruit2(:,1)));
xlim([0 32000])
title('FFT du signal avec bruit gaussien')
xlabel('Frequence en Hz')
ylabel('Counts')
%xtickformat('%.4');
%fig2.XRuler.exponent =0;
ax = gca;
ax.XRuler.Exponent = 3;



%% Application d'un filtre simple (lowpass)
freq_coupure_lowpasse = 8000; % les frequences de coupures sont determin/es a partir de la FFT

son_1_filtre_lowpass = lowpass(son_2_avec_perturbation,freq_coupure_lowpasse,Fs);

%filters the input signal x using a lowpass filter with normalized passband frequency wpass in units of ? rad/sample. lowpass uses a minimum-order filter with a stopband attenuation of 60 dB and compensates for the delay introduced by the filter. If x is a matrix, the function filters each column independently.


%% Application d'un filtre Bandpass
% puisque le son original est d'une seule et unique fréquence, il est trivial de supposer qu'un filtre passeband avec une gamme de fréquence proche du signal original sera relativement efficace pour filtrer le son



son_1_filtre_bandpass = bandpass(son_1_avec_perturbation,[5000 10000],Fs);


%% plot filtre bandpass

figure
plot(sample_point,son_1_filtre_bandpass)
title('son avec filtre passebande')
xlabel('temps [s]')
ylabel('Amplitude du son')

%hold on 
figure 

fft_passebande = fft(son_1_filtre_bandpass);

plot(sample_point,abs(fft_passebande));

title('fft passbande')
xlabel('Frequence en Hz')
ylabel('Counts')


% figure 
% 
% idx = (t>2.6 & t <=2.) ;
% 
% plot(t(idx) , son_1_filtre_bandpass)
% title('son 1 avec filtre passebande')
% xlabel('temps [s]')
% ylabel('Amplitude du son')

