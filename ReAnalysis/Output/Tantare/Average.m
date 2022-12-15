clc
clear all

load TAN_narr_wind_raw.mat

% airtem = arrayfun(@(i) mean(airtem(i:i+6-1)),1:6:length(airtem)-6+1)'; % the averaged vector
% lake ='TAN'
% fileout1 = [lake,'_narr_airtmp'];
% save (fileout1,'airtem','time');
% 
% precip = arrayfun(@(i) mean(precip(i:i+6-1)),1:6:length(precip)-6+1)'; % the averaged vector
% lake ='TAN'
% fileout1 = [lake,'_narr_apcp'];
% save (fileout1,'precip','time');

% glorad = arrayfun(@(i) mean(glorad(i:i+6-1)),1:6:length(glorad)-6+1)'; % the averaged vector
% lake ='TAN'
% fileout1 = [lake,'_narr_dswrf'];
% save (fileout1,'glorad','time');

% atmpre = arrayfun(@(i) mean(atmpre(i:i+6-1)),1:6:length(atmpre)-6+1)'; % the averaged vector
% lake ='TAN'
% fileout1 = [lake,'_narr_pressfc'];
% save (fileout1,'atmpre','time');

% relhum = arrayfun(@(i) mean(relhum(i:i+6-1)),1:6:length(relhum)-6+1)'; % the averaged vector
% lake ='TAN'
% fileout1 = [lake,'_narr_rhum'];
% save (fileout1,'relhum','time');


% clocov = arrayfun(@(i) mean(clocov(i:i+6-1)),1:6:length(clocov)-6+1)'; % the averaged vector
% lake ='TAN'
% fileout1 = [lake,'_narr_tcdc'];
% save (fileout1,'clocov','time');

windsp = arrayfun(@(i) mean(windsp(i:i+6-1)),1:6:length(windsp)-6+1)'; % the averaged vector
lake ='TAN';
fileout1 = [lake,'_narr_wind'];
save (fileout1,'windsp','time');