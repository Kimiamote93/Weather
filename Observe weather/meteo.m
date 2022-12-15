% === Extracting daily average weather data from Nordicana ===
% by Kimia Motevalli, 2022

function [obs,date] = meteo(var, lake, textFile)   

% Inputs (to function):
%       var     : The meteorological input
%       textFile      :  The textfile that contains the meteological data
%       lake      : Name of the lake

% Outputs:
%       obs      : Daily average weather data
%       date      : Time domain


DataStartLine = 1;
NumVariables = 7;
VariableNames  = {'lake','date','value'};
VariableWidths = [ 30,     8,     11 ] ;                                                  
DataType       = {'char','double','double'};

opts = fixedWidthImportOptions('NumVariables',NumVariables,...
                               'DataLines',DataStartLine,...
                               'VariableNames',VariableNames,...
                               'VariableWidths',VariableWidths,...
                               'VariableTypes',DataType);
                           
T = readtable(textFile,opts);     
n = table2array (T(:,2));

ns = num2str(n);
date = datetime (ns, 'InputFormat','yyyyMMdd')   ;

obs = table2array (T(:,4));

filename = sprintf('%s_%s.mat', var, lake);
save(filename, 'obs','date'); 

end