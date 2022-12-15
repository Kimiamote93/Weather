clc
clear all

%%
%============================ Bylot ==================================

lake = 'bylot';


var = 'AirHumidity';
textFile = 'Input\Bylot\Air Humidity\ds_000609360_Jour_DLY.txt';
[obs,date] = meteo (var, lake, textFile);

var = 'AirTemperature';
textFile = 'Input\Bylot\Air Temperature\ds_000609390_Jour_DLY.txt';
[obs,date] = meteo (var, lake, textFile);

var = 'Radiation';
textFile = 'Input\Bylot\Radiation\ds_000609493_Jour_DLY.txt';
[obs,date] = meteo (var, lake, textFile);

var = 'WindSpeed';
textFile = 'Input\Bylot\Wind Speed\ds_000609414_Jour_DLY.txt';
[obs,date] = meteo (var, lake, textFile);

%%
%============================ Ward Hunt ==================================

lake = 'Ward Hunt';


var = 'AirHumidity';
textFile = 'Input\Ward Hunt\Air Humidity\ds_000609567_Jour_DLY.txt';
[obs,date] = meteo (var, lake, textFile);

var = 'AirTemperature';
textFile = 'Input\Ward Hunt\Air Temperature\ds_000609598_Jour_DLY.txt';
[obs,date] = meteo (var, lake, textFile);

var = 'Radiation';
textFile = 'Input\Ward Hunt\Radiation\ds_000609640_Jour_DLY.txt';
[obs,date] = meteo (var, lake, textFile);

var = 'WindSpeed';
textFile = 'Input\Ward Hunt\Wind Speed\ds_000609610_Jour_DLY.txt';
[obs,date] = meteo (var, lake, textFile);
