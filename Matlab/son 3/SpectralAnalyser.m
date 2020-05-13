function  SpectralAnalyser(son_2_avec_perturbation_1_ROI,sampleRate,frequencyLimits,startTime,timeLimits)
%SPECTRALANALYSER Summary of this function goes here
%   Detailed explanation goes here
%timeLimits = [0 15]; % seconds
%frequencyLimits = [0 24000]; % Hz


%son_2_avec_perturbation_1_ROI = son_2_avec_perturbation(:,1);
%startTime = 0; % seconds
minIdx = ceil(max((timeLimits(1)-startTime)*sampleRate,0))+1;
maxIdx = floor(min((timeLimits(2)-startTime)*sampleRate,length(son_2_avec_perturbation_1_ROI)-1))+1;
son_2_avec_perturbation_1_ROI = son_2_avec_perturbation_1_ROI(minIdx:maxIdx);

% Compute spectral estimate
 pspectrum(son_2_avec_perturbation_1_ROI,sampleRate, ...
    'FrequencyLimits',frequencyLimits);



xlabel('Fréquence kHz');
ylabel('Puissance Spectrale (dB)');


xlim([-0.8 23.2]); % fitting to make it look nice
ylim([-169 -9]);


end

