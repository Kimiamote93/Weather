%Cette fonction permet de transformer des données NARR en format NetCDF en format mat.
%La dimension de la grille est diminuée; voir variable "limits".
%
%Les données NARR ont été téléchargé à partir de l'URL :
%http://www.esrl.noaa.gov/psd/data/gridded/data.narr.monolevel.html
%
%Sur le serveur ftp suivant:
%ftp://ftp.cdc.noaa.gov/Datasets/NARR/monolevel/
%
%Jessy Barrette, 27 juillet 2009
% adapté par C.B. décembre 2009
% this version, March 2012 (one parameters, 32 years, writes 32 files)

clear all

%limits = [48 61 -122 -108];   %[min_lat max_lat min_lon max_lon]
%limits = [74.6 74.8 -94.9 -94.7];
% limits = [72.9 73.4 -80.2 -79.8];
% %years = [2009];
% years = (1979:1:2016);
years = (2016:1:2022); 
% limits = [72.9 73.4 -80.2 -79.8];
% limits = [82 84 -74.4 -73.9];
limits = [46.8 47.25 -72.1 -71];

% change names of output variables according to year! (NOT DONE HERE)

%para_str = {'air.2m','pres.sfc','uwnd.10m','vwnd.10m'};
para_str = {'shum.2m'};
%par = {'air','pres','uwnd','vwnd'};
par = {'shum'};
para_name = para_str;
for h=1:length(para_str)
    point = find(para_str{h}=='.');
    para_name{h}(point)='_';
end
clear h point

lat = nan(1,1);
lon = nan(1,1);


%Importation des données, réduction de la grille
for h=1:length(years);
    
    year = years(h);
    time=nan(1,1);
          disp(num2str(year));
%    drive='H:\';
%    where=[drive num2str(year)];
%    cd('H:\''num2str(year)');
%    cd(where);

%    cd h:\narr_dailies;

    for i=1:length(para_str)
        disp(para_str{i})
%        'flag1'
        eval(['nlat = nc_varget(''',para_str{i},'.',num2str(year),'.nc'',''lat'');']);
%        'flag2'
        eval(['nlon = nc_varget(''',para_str{i},'.',num2str(year),'.nc'',''lon'');']);
%        'flag3'
        eval(['ntime = nc_varget(''',para_str{i},'.',num2str(year),'.nc'',''time'');']);
%        'flag4'
        ntime = ntime/24+datenum(1800,1,1);
        
          if time ~= ntime;
              disp('changement de la droite de temps')
              time = ntime;
          end

        if lat~=nlat & lon~=nlon
            disp('reformation de la grille')
            zone_lat = find(nlat>limits(1)&nlat<limits(2));
            zone_lon = find(nlon>limits(3)&nlon<limits(4));

            pos_cmp=zone_lat;
            for j=1:length(zone_lat)
                srch = find(zone_lon==zone_lat(j));
                if isempty(srch)==1
                    pos_cmp(j)=NaN;
                end
            end
            out_cmp = find(isnan(pos_cmp));
            pos_cmp(out_cmp)=[];

            [m,n] = ind2sub(size(nlat),pos_cmp);
            m_min = min(m);
            m_max = max(m);
            n_min = min(n);
            n_max = max(n);

            slat = nlat(m_min:m_max,n_min:n_max);
            slon = nlon(m_min:m_max,n_min:n_max);

            lat=nlat;
            lon=nlon;
        end

        eval(['var = nc_varget(''',para_str{i},'.',num2str(year),'.nc'',''',par{i},''',[0 m_min n_min],[-1 m_max-m_min+1 n_max-n_min+1]);']);

%      eval(['data.',para_name{i},'   = permute(var,[2 3 1]);'])
       if i==1;       
%         airtem2009 = permute(var,[2 3 1]);
         shum = permute(var,[2 3 1]);
       end
%       if i==2;       
%         atmpre2009 = permute(var,[2 3 1]);
%       end
%       if i==3;       
%         uwnd2009 = permute(var,[2 3 1]);
%       end
%       if i==4;       
%         vwnd2009 = permute(var,[2 3 1]);
%       end
%    end

    disp(['enregistrement ',num2str(year)])
    if i==1;
%    cd f:\lakes\narr\32years;    
    %save(['narr_quebec_specifichumidity_',num2str(year)],'shum','slon','slat','limits','time');
    %save(['narr_alberta_specifichumidity_',num2str(year)],'shum','slon','slat','limits','time');
    save(['narr_TAN_specifichumidity_',num2str(year)],'shum','slon','slat','limits','time');
    end
%    if i==2;
%    save(['region_atmpre_',num2str(year)],'atmpre2009','slon','slat','limits','time');
%    end
%    if i==3;
%    save(['region_uwind_',num2str(year)],'uwnd2009','slon','slat','limits','time');
%    end
%    if i==4;
%    save(['region_vwind_',num2str(year)],'vwnd2009','slon','slat','limits','time');
%    end
        
%    clear var airtem2009 atmpre2009 uwnd2009 vwnd2009
    clear var shum
    clear zone_lat zone_lon pos_cmp out_cmp
%    clear m_min m_max n_min n_max 
    
    end
end

