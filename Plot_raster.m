%%
%extracting pixel values from SOS raster (TIFF) data
LOS_02_M = imread('U:\Ex_5_TimeSeries\DOY_Seasons\LOS_year002_season1.tif');
LOS_11_M = imread('U:\Ex_5_TimeSeries\DOY_Seasons\LOS_year011_season1.tif');
LOS_19_M = imread('U:\Ex_5_TimeSeries\DOY_Seasons\LOS_year019_season1.tif');
SI_02_M = imread('U:\Ex_5_TimeSeries\DOY_Seasons\SI_year002_season1.tif');
SI_11_M = imread('U:\Ex_5_TimeSeries\DOY_Seasons\SI_year011_season1.tif');
SI_19_M = imread('U:\Ex_5_TimeSeries\DOY_Seasons\SI_year019_season1.tif');
PP_02_M = imread('T:\Maho\Time series\Climate data\New_pp\pp_2002_ext.tif');
% info = geotiffinfo('U:\Ex_5_TimeSeries\DOY_Seasons\season_start_year002_season1.tif');
% height = info.Height; % Integer indicating the height of the image in pixels
% width = info.Width; % Integer indicating the width of the image in pixels
% [rows,cols] = meshgrid(1:height,1:width);
% [ADlat,ADlon] = pix2latlon(info.RefMatrix, rows, cols);
%%
%convert matrix to single column vector
LOS_02_V = LOS_02_M(:);
LOS_11_V = LOS_11_M(:);
LOS_19_V = LOS_19_M(:);
SI_02_V = SI_02_M(:);
SI_11_V = SI_11_M(:);
SI_19_V = SI_19_M(:);
PP_02_V = PP_02_M(:);
%%
%merge all columns into one table
data_full = table(PP_02_V,LOS_02_V,LOS_11_V,LOS_19_V,SI_02_V,SI_11_V,SI_19_V);

%%
%clean datasets removing values equal to or less than zero
cleanindex = (data_full.LOS_02_V > 0 & data_full.LOS_11_V > 0 & data_full.LOS_19_V > 0 & data_full.SI_02_V > 0 & data_full.SI_11_V > 0 & data_full.SI_19_V > 0); %return index where conditions met
data_final = data_full(cleanindex,:); %select rows from table based on index
data_final = table2array(data_final); %convert table to array
%%
%split each column from data_final
LOS_02 = data_final(:,2);
LOS_11 = data_final(:,3);
LOS_19 = data_final(:,4);
SI_02 = data_final(:,5);
SI_11 = data_final(:,6);
SI_19 = data_final(:,7);
PP_02 = data_final(:,1);
%%
%plot scatter diagram where precipitation is in x-axis
% dependent variables like LOS, small integral will be in y-axis 
scatter(PP_02,LOS_02)