#### Calculate RRI (Relative Radiation Index) for whole Nepal
# require libraries
library(raster)
library(rgdal)

# Importa DEM, Slope, and Aspect raster (already prepared)
DEM<- raster("D:/GIS file_Nepal/srtm_90m")
plot(DEM, main="DEM")
aspect<-raster("D:/GIS file_Nepal/aspect_90m")
plot(aspect, main="Aspect")
slope<- raster("D:/GIS file_Nepal/slope_90")
plot(slope, main="Slope")

# Extract Latitude value required for formula
lat = init(DEM, 'y')

# RRI = cos (180° - ??)* sin ?? * sin Ø + cos ?? * cos Ø
# Where ?? is aspect, ?? is the slope, and Ø is the latitude of each transect.

# Calcuation by formula
RRI= cos (180-aspect) * sin (slope) * sin (lat) + cos (slope) * cos (lat)
RRI

# Export RRI raster
RRI.r<- writeRaster(RRI, "d:/GIS file_Nepal/RRI_90.tif", format="GTiff", overwrite=TRUE)
plot(RRI.r, main="Relative Radiation Index")

#### DONE