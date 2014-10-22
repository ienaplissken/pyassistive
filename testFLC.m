Fs = 600;
nfft=4096;
window = 20 * Fs;

% Hd = equiripple_filter_brainnet;
% SELECTED = CARn(data, 12);
% SELECTED = filtfilt(Hd.Numerator,1, SELECTED);
% 
% % POz
% y = SELECTED(1:window,4);
% 
% [Pw3, Fw3] = periodogram(y, hann(window),nfft,Fs);
% plot(Fw3, Pw3);

time = (1:window) / Fs;
X = [];
x0 = sin(2*pi*5.6*time);  
x1 = sin(2*pi*2*5.6*time); 
x2 = cos(2*pi*5.6*time);
x3 = cos(2*pi*2*5.6*time);
X = [X;x0;x1;x2;x3];
w = [3;0.3;5;0.2];

x = x0 + x1 + x2 + x3;
d = X' * w + random('norm', 0, 500, 12000,1);
mu = 0.8;
ha = adaptfilt.nlms(20,mu);

[y,e] = filter(ha,x,d);
ha.coefficients
plot(e);
