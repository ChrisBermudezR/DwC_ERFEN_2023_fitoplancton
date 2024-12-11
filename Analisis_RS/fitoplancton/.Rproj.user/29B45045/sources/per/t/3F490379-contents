if(!require(sf)){install.packages("sf")}
if(!require(dplyr)){install.packages("dplyr")}
if(!require(ggplot2)){install.packages("ggplot2")}
if(!require(raster)){install.packages("raster")}
if(!require(lattice)){install.packages("lattice")}
if(!require(RColorBrewer)){install.packages("RColorBrewer")}
if(!require(rasterVis)){install.packages("rasterVis")}

library(corrplot)

# Especifica la ruta al archivo NetCDF

source("Funciones.R")
options(scipen=9999)

modelo <- raster(nrow=121, 
                 ncol=109, 
                 xmn= -85.04167, 
                 xmx= -75.95833, 
                 ymn= -0.04166667, 
                 ymx= 10.04167,
                 crs="+proj=longlat +datum=WGS84 +no_defs",
                 resolution=c(0.08333333, 0.08333333 )) 

color_npp<-c("#ffffcc", "#a1dab4", "#41b6c4", "#2c7fb8", "#253494")
color_chl<-c("#edf8fb", "#b2e2e2", "#66c2a4", "#2ca25f", "#006d2c")



#1993-04####

npp_map_0 <- raster::brick("net_primary_productivity_of_biomass_expressed_as_carbon_0m.nc")

vector_fecha<-c("Oct 25",
                "Oct 26",
                "Oct 27",
                "Oct 28",
                "Oct 29",
                "Oct 30",
                "Oct 31",
                "Nov 1",
                "Nov 2",
                "Nov 3",
                "Nov 4",
                "Nov 5",
                "Nov 6",
                "Nov 7",
                "Nov 8",
                "Nov 9",
                "Nov 10",
                "Nov 11",
                "Nov 12",
                "Nov 13",
                "Nov 14",
                "Nov 15",
                "Nov 16",
                "Nov 17",
                "Nov 18")

png(filename="npp_0_mapa.png",width = 2000, height = 2500, res = 300)
mapeoVariables(npp_0, 
color_npp, 
vector_fecha,
expression(paste("mg m"^-2, "día"^-1)),
"Productividad Primaria Neta - 0 m")
dev.off()

png(filename="npp_20_mapa.png",width = 2000, height = 2500, res = 300)
mapa_npp_map_20 <- mapeoVariables(npp_20, 
                                  color_npp, 
                                 vector_fecha,
                                 expression(paste("mg m"^-2, "día"^-1)),
                                 "Productividad Primaria Neta - 20 m")
dev.off()

png(filename="npp_50_mapa.png",width = 2000, height = 2500, res = 300)
mapa_npp_map_50 <- mapeoVariables(npp_50, 
                                  color_npp, 
                                 vector_fecha,
                                 expression(paste("mg m"^-2, "día"^-1)),
                                 "Productividad Primaria Neta - 50 m")
dev.off()

png(filename="npp_100_mapa.png",width = 2000, height = 2500, res = 300)
mapa_npp_map_100 <- mapeoVariables(npp_100, 
                                   color_npp, 
                                 vector_fecha,
                                 expression(paste("mg m"^-2, "día"^-1)),
                                 "Productividad Primaria Neta - 100 m")
dev.off()



png(filename="chl_0_mapa.png",width = 2000, height = 2500, res = 300)
mapa_chl_map_0 <- mapeoVariables(chl_0, 
                                 color_chl, 
                                 vector_fecha,
                                 expression(paste("mg m"^-3)),
                                 "Clorofila - 0 m")
dev.off()

png(filename="chl_20_mapa.png",width = 2000, height = 2500, res = 300)
mapa_chl_map_20 <- mapeoVariables(chl_20, 
                                  color_chl, 
                                  vector_fecha,
                                  expression(paste("mg m"^-3)),
                                  "Clorofila- 20 m")
dev.off()

png(filename="chl_50_mapa.png",width = 2000, height = 2500, res = 300)
mapa_chl_map_50 <- mapeoVariables(chl_50, 
                                  color_chl, 
                                  vector_fecha,
                                  expression(paste("mg m"^-3)),
                                  "Clorofila - 50 m")
dev.off()

png(filename="chl_100_mapa.png",width = 2000, height = 2500, res = 300)
mapa_chl_map_100 <- mapeoVariables(chl_100, 
                                   color_chl, 
                                   vector_fecha,
                                   expression(paste("mg m"^-3)),
                                   "Clorofila- 100 m")
dev.off()
