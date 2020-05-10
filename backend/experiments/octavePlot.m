args = argv();

txtName = [args{1} ".txt"];
imgName = [args{1} ".png"];

x = load(["experiments/data/" txtName]);

freq = 0.25;
nSamples = length(x(:,1));
maxTime = nSamples*freq;
% equivale a for t = 0; t <= tMax; t+=h        
% no octave arrays começam do 1    
t = 0: freq : maxTime-freq;                               

fh = figure();  

plot(t, x(:,1), 'r', t, x(:,4), 'b');
ylim([0 50]);

grid;
title('Controle de temperatura interna do silo');
xlabel('Tempo');
ylabel('oC');

print('./experiments/currentPlot.png', '-dpng');
% print('./frontend/src/assets/chart.png', '-dpng'); 

% para Linux
system(["cp experiments/currentPlot.png " "experiments/plots/" imgName]);
% para Windows
system(["copy experiments\\currentPlot.png " "experiments\\plots\\" imgName]);
    
close(fh); % destruir janela