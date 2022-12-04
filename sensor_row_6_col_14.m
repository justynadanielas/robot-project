x1 = sensorrow6col14hexload.Fx;
y1 = sensorrow6col14hexload.Tx;

x2 = sensorrow6col14hexunload.Fx;
y2 = sensorrow6col14hexunload.Tx;

x3 = sensorrow6col14hexload.Fy;
y3 = sensorrow6col14hexload.Ty;

x4 = sensorrow6col14hexunload.Fy;
y4 = sensorrow6col14hexunload.Ty;

x5 = sensorrow6col14hexload.Fz;
y5 = sensorrow6col14hexload.Tz;

x6 = sensorrow6col14hexunload.Fz;
y6 = sensorrow6col14hexunload.Tz;

figure(1)
scatter(x1, y1);
title("sensorrow6col14hexload & unload x coordinate")
xlabel("Fx")
ylabel("Tx")
hold on
scatter(x2, y2);
hold off

figure(2)
scatter(x3, y3)
title("sensorrow6col14hexload & unload y coordinate")
xlabel("Fy")
ylabel("Ty")
hold on
scatter(x4, y4);
hold off

figure(3)
scatter(x5, y5)
title("sensorrow6col14hexload & unload z coordinate")
xlabel("Fz")
ylabel("Tz")
hold on
scatter(x6, y6);
hold off


% sprintf
% load 
% save 
% można eksportować wykresy do pliku jpg

% gui - wybrać sensor (ograniczenie); wykreślić siłę 
% (hex i skin dla load i unload)
% niektóre czujniki nie działają

% trzeba rozciągnąć Fz w taki sposób, żeby jego wymiary zgadzały się 
% z wymiarami z robotic skin
% można użyć interpolacji liniowej
