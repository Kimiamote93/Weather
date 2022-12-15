%program to combines n years of narr data in a single file

% C. Bélanger, mars 2017

clear all;

lake = 'TAN';

years = (2016:1:2022); 
% years = (2018:1:2019);
%years = 1979;

for h=1:length(years)
    year=years(h);
    disp(num2str(year));

filein = ['narr_TAN_wind_u_',num2str(year),'.mat'];
disp(filein);
load (filein);
u=uwnd(:);
[mdata,ndata]=size(u);
%mdata
%ndata

filein = ['narr_TAN_wind_v_',num2str(year),'.mat'];
disp(filein);
load (filein);
v=vwnd(:);
[mdata,ndata]=size(v);
%mdata
%ndata

clear uwnd vwnd;

%'flag1 airtmp data were read'

%calculating speed and direction
sp = ((u.^2)+(v.^2)).^0.5;

dir = 90.0-(atan2(v,u)*180.0/pi);
[mdir,ndir]=size(dir);
for i=1:mdir
    if dir(i) < 0.0
    dir(i)=dir(i)+360.0;
    end
    
end
% *****

if h == 1
    u37y=u;
    v37y=v;
    sp37y=sp;
    dir37y=dir;
    time37y=time;
else
    u37y=[u37y;u];
    v37y=[v37y;v];
    sp37y=[sp37y;sp];
    dir37y=[dir37y;dir];
    time37y=[time37y;time];
end

clear u v sp dir time;
end

uwnd=u37y;
vwnd=v37y;
windsp=sp37y;
winddir=dir37y;
time=time37y;
time = datetime(time, 'ConvertFrom', 'datenum');

lat = slat;
lon = slon;

fileout1 = [lake,'_narr_wind'];
fileout2 = [lake,'_narr_wind_position'];
save (fileout1,'uwnd','vwnd','windsp','winddir','time');
save (fileout2,'lat','lon');
