%program to combines n years of narr data in a single file

% C. B�langer, mars 2017

clear all;

lake = 'TAN';

years = (2016:1:2022); 

%years = 1979;

for h=1:length(years)
    year=years(h);
    disp(num2str(year));

filein = ['narr_TAN_precipitation_',num2str(year),'.mat'];
disp(filein);
load (filein);
data=apcp(:);
[mdata,ndata]=size(data);
%mdata
%ndata

clear apcp;

%'flag1 airtmp data were read'

% *****

%data = data';

if h == 1
    data37y=data;
    time37y=time;
else
    data37y=[data37y;data];
    time37y=[time37y;time];
end
clear data data time;
end

precip=data37y;
time=time37y;
time = datetime(time, 'ConvertFrom', 'datenum');

lat = slat;
lon = slon;

fileout1 = [lake,'_narr_apcp'];
fileout2 = [lake,'_narr_apcp_position'];
save (fileout1,'precip','time');
save (fileout2,'lat','lon');
