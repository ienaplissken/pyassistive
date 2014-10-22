function Hd = equiripple_filter_banpass
%EQUIRIPPLE_FILTER_BANPASS Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 8.1 and the Signal Processing Toolbox 6.19.
% Generated on: 08-Jul-2014 14:56:11

% Equiripple Bandpass filter designed using the FIRPM function.

% All frequency values are in Hz.
%Fs = 128;  % Sampling Frequency

Fstop1 = 4;               % First Stopband Frequency
Fpass1 = 5;               % First Passband Frequency
Fpass2 = 49;              % Second Passband Frequency
Fstop2 = 50;              % Second Stopband Frequency
Dstop1 = 0.01;            % First Stopband Attenuation
Dpass  = 0.057501127785;  % Passband Ripple
Dstop2 = 0.01;            % Second Stopband Attenuation
dens   = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fstop1 Fpass1 Fpass2 Fstop2]/(Fs/2), [0 1 ...
                          0], [Dstop1 Dpass Dstop2]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]
