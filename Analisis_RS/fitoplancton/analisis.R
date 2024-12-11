
library(dplyr)
library(hilldiv)
library(tidyr)
library(sf)
library(sp)
library(raster)
library(cowplot)
library(ggplot2)
library(dplyr)
library(gridExtra)
library(lubridate)

data<-read.table("Occurrence.csv", sep=",", head=TRUE)
event_data<-readxl::read_excel("../../DwC/event_data.xlsx", sheet="Sheet1")
event_data <- event_data %>%
  mutate(eventTime = format(lubridate::ymd_hms(eventTime), "%H:%M:%S"))


data_bio_0<-data%>%
  select(verbatimIdentification,
         maximumDepthInMeters, 
                  fieldNumber, 
         organismQuantity,
         decimalLatitude, 
         decimalLongitude)%>%
  filter(maximumDepthInMeters == 0)
data_bio_20<-data%>%
  select(verbatimIdentification,
         maximumDepthInMeters, 
         fieldNumber, 
         organismQuantity,
         decimalLatitude, 
         decimalLongitude)%>%
  filter(maximumDepthInMeters == 20)
data_bio_50<-data%>%
  select(verbatimIdentification,
         maximumDepthInMeters, 
         fieldNumber, 
         organismQuantity,
         decimalLatitude, 
         decimalLongitude)%>%
  filter(maximumDepthInMeters == 50)
data_bio_100<-data%>%
  select(verbatimIdentification,
         maximumDepthInMeters, 
         fieldNumber, 
         organismQuantity,
         decimalLatitude, 
         decimalLongitude)%>%
  filter(maximumDepthInMeters == 100)



data_bio_0<-base::merge(data_bio_0, event_data, by = "fieldNumber")
data_bio_20<-base::merge(data_bio_20, event_data, by = "fieldNumber")
data_bio_50<-base::merge(data_bio_50, event_data, by = "fieldNumber")
data_bio_100<-base::merge(data_bio_100, event_data, by = "fieldNumber")



data_bio_0<-data_bio_0%>%
  select(verbatimIdentification,
         station, 
         organismQuantity)
data_bio_20<-data_bio_20%>%
  select(verbatimIdentification,
         station, 
         organismQuantity)
data_bio_50<-data_bio_50%>%
  select(verbatimIdentification,
         station, 
         organismQuantity)
data_bio_100<-data_bio_100%>%
  select(verbatimIdentification,
         station, 
         organismQuantity)


data_final_0<-data_bio_0%>%tidyr::pivot_wider(names_from = station, 
                       values_from = organismQuantity, 
                       values_fill = 0)
data_final_20<-data_bio_20%>%tidyr::pivot_wider(names_from = station, 
                                              values_from = organismQuantity, 
                                              values_fill = 0)
data_final_50<-data_bio_50%>%tidyr::pivot_wider(names_from = station, 
                                              values_from = organismQuantity, 
                                              values_fill = 0)
data_final_100<-data_bio_100%>%tidyr::pivot_wider(names_from = station, 
                                              values_from = organismQuantity, 
                                              values_fill = 0)




data_div0<-data_final_0[,2:31]
data_div20<-data_final_20[,2:30]
data_div50<-data_final_50[,2:29]
data_div100<-data_final_100[,2:27]


D0_FitoTotal_0 <- hilldiv::hill_div(data_div0, qvalue = 0)
D1_FitoTotal_0  <- hilldiv::hill_div(data_div0, qvalue = 1)
D2_FitoTotal_0  <- hilldiv::hill_div(data_div0, qvalue = 2)

D0_FitoTotal_20 <- hilldiv::hill_div(data_div20, qvalue = 0)
D1_FitoTotal_20  <- hilldiv::hill_div(data_div20, qvalue = 1)
D2_FitoTotal_20  <- hilldiv::hill_div(data_div20, qvalue = 2)

D0_FitoTotal_50 <- hilldiv::hill_div(data_div50, qvalue = 0)
D1_FitoTotal_50  <- hilldiv::hill_div(data_div50, qvalue = 1)
D2_FitoTotal_50  <- hilldiv::hill_div(data_div50, qvalue = 2)

D0_FitoTotal_100 <- hilldiv::hill_div(data_div100, qvalue = 0)
D1_FitoTotal_100  <- hilldiv::hill_div(data_div100, qvalue = 1)
D2_FitoTotal_100  <- hilldiv::hill_div(data_div100, qvalue = 2)



Diversidad_Hill_Fito_0 <- as.data.frame(list(D0_FitoTotal_0, D1_FitoTotal_0, D2_FitoTotal_0))
Diversidad_Hill_Fito_20 <- as.data.frame(list(D0_FitoTotal_20, D1_FitoTotal_20, D2_FitoTotal_20))
Diversidad_Hill_Fito_50 <- as.data.frame(list(D0_FitoTotal_50, D1_FitoTotal_50, D2_FitoTotal_50))
Diversidad_Hill_Fito_100 <- as.data.frame(list(D0_FitoTotal_100, D1_FitoTotal_100, D2_FitoTotal_100))

colnames(Diversidad_Hill_Fito_0) <- c("q0", "q1", "q2")
colnames(Diversidad_Hill_Fito_20) <- c("q0", "q1", "q2")
colnames(Diversidad_Hill_Fito_50) <- c("q0", "q1", "q2")
colnames(Diversidad_Hill_Fito_100) <- c("q0", "q1", "q2")


Diversidad_Hill_Fito_0<-cbind(rownames(Diversidad_Hill_Fito_0), data.frame(Diversidad_Hill_Fito_0, row.names = NULL))
Diversidad_Hill_Fito_20<-cbind(rownames(Diversidad_Hill_Fito_20), data.frame(Diversidad_Hill_Fito_20, row.names = NULL))
Diversidad_Hill_Fito_50<-cbind(rownames(Diversidad_Hill_Fito_50), data.frame(Diversidad_Hill_Fito_50, row.names = NULL))
Diversidad_Hill_Fito_100<-cbind(rownames(Diversidad_Hill_Fito_100), data.frame(Diversidad_Hill_Fito_100, row.names = NULL))


colnames(Diversidad_Hill_Fito_0) <- c("station", "q0", "q1", "q2")
colnames(Diversidad_Hill_Fito_20) <- c("station", "q0", "q1", "q2")
colnames(Diversidad_Hill_Fito_50) <- c("station", "q0", "q1", "q2")
colnames(Diversidad_Hill_Fito_100) <- c("station", "q0", "q1", "q2")



Diversidad_Hill_Fito_0$station<-as.numeric(Diversidad_Hill_Fito_0$station)
Diversidad_Hill_Fito_20$station<-as.numeric(Diversidad_Hill_Fito_20$station)
Diversidad_Hill_Fito_50$station<-as.numeric(Diversidad_Hill_Fito_50$station)
Diversidad_Hill_Fito_100$station<-as.numeric(Diversidad_Hill_Fito_100$station)

event_data_0<-event_data%>%filter(Depth==0)
event_data_20<-event_data%>%filter(Depth==20)
event_data_50<-event_data%>%filter(Depth==50)
event_data_100<-event_data%>%filter(Depth==100)

Diversidad_Hill_Fito_0<-dplyr::left_join(Diversidad_Hill_Fito_0, event_data_0, by = "station")
Diversidad_Hill_Fito_20<-dplyr::left_join(Diversidad_Hill_Fito_20, event_data_20, by = "station")
Diversidad_Hill_Fito_50<-dplyr::left_join(Diversidad_Hill_Fito_50, event_data_50, by = "station")
Diversidad_Hill_Fito_100<-dplyr::left_join(Diversidad_Hill_Fito_100, event_data_100, by = "station")

Diversidad_Hill_Fito_0_geo<-Diversidad_Hill_Fito_0
Diversidad_Hill_Fito_20_geo<-Diversidad_Hill_Fito_20
Diversidad_Hill_Fito_50_geo<-Diversidad_Hill_Fito_50
Diversidad_Hill_Fito_100_geo<-Diversidad_Hill_Fito_100


coordinates(Diversidad_Hill_Fito_0_geo) <- c("decimalLongitude", "decimalLatitude")
coordinates(Diversidad_Hill_Fito_20_geo) <- c("decimalLongitude", "decimalLatitude")
coordinates(Diversidad_Hill_Fito_50_geo) <- c("decimalLongitude", "decimalLatitude")
coordinates(Diversidad_Hill_Fito_100_geo) <- c("decimalLongitude", "decimalLatitude")


npp_0<-raster::stack("net_primary_productivity_of_biomass_expressed_as_carbon_0m.nc")
npp_20<-raster::stack("net_primary_productivity_of_biomass_expressed_as_carbon_20m.nc")
npp_50<-raster::stack("net_primary_productivity_of_biomass_expressed_as_carbon_50m.nc")
npp_100<-raster::stack("net_primary_productivity_of_biomass_expressed_as_carbon_100m.nc")

npp_0_date <- as.data.frame(raster::extract(npp_0, Diversidad_Hill_Fito_0_geo))
npp_20_date <- as.data.frame(raster::extract(npp_20, Diversidad_Hill_Fito_20_geo))
npp_50_date <- as.data.frame(raster::extract(npp_50, Diversidad_Hill_Fito_50_geo))
npp_100_date <- as.data.frame(raster::extract(npp_100, Diversidad_Hill_Fito_100_geo))


npp_0_df<-cbind(Diversidad_Hill_Fito_0, npp_0_date)
npp_20_df<-cbind( Diversidad_Hill_Fito_20, npp_20_date)
npp_50_df<-cbind( Diversidad_Hill_Fito_50, npp_50_date)
npp_100_df<-cbind( Diversidad_Hill_Fito_100, npp_100_date)




npp_0_df_long<-npp_0_df%>%tidyr::pivot_longer(col=11:35)
npp_20_df_long<-npp_20_df%>%tidyr::pivot_longer(col=11:35)
npp_50_df_long<-npp_50_df%>%tidyr::pivot_longer(col=11:35)
npp_100_df_long<-npp_100_df%>%tidyr::pivot_longer(col=11:35)

total<-rbind(npp_0_df_long,
      npp_20_df_long,
      npp_50_df_long,
      npp_100_df_long)


total$name <- gsub("X", "", total$name)        # Reemplaza "X" con una cadena vacía
total$name <- gsub("\\.", "-", total$name)     # Reemplaza puntos con guiones
total$name <-as.Date(total$name)

total<-total%>%
  mutate(boolean = ifelse(eventDate == name, TRUE, FALSE) )%>%
  filter(boolean == TRUE)
  

q0_npp <- ggplot(data = total, aes(x = value, y = q0)) +
  geom_jitter(color = "#66c2a4", size=2) +
  labs(x = expression(paste("Productividad Primaria Neta ", "[", "mg m"^-2, "day"^-1, "]" )),
       y = expression(paste("Riqueza - D"[q0]))) +
  theme_classic()
   
q1_npp <- ggplot(data = total, aes(x = value, y = q1)) +
  geom_jitter(color = "#66c2a4", size=2) +
  labs(x = expression(paste("Productividad Primaria Neta ", "[", "mg m"^-2, "day"^-1, "]" )),
       y = expression(paste("Riqueza - D"[q1]))) +
    theme_classic()

q2_npp <- ggplot(data = total, aes(x = value, y = q2)) +
  geom_jitter(color = "#66c2a4", size=2) +
  labs(x = expression(paste("Productividad Primaria Neta ", "[", "mg m"^-2, "day"^-1, "]" )),
       y = expression(paste("Riqueza - D"[q2]))) +
  theme_classic()


png(filename="graficos_diversidad_vs_NPP.png",width = 2000, height = 2500, res = 300)
grid.arrange(q0_npp, q1_npp, q2_npp, ncol = 1)
dev.off()
#q0


cor.test( total$value, total$q0,
          method = c("spearman")
)

modeloq0vsNPP<-lm( total$value~ 
              total$q0
)

capture.output(
  "Resultados de la correlacion q0",
  cor.test( total$value, total$q0,
            method = c("spearman")),
  "Resultados del Modelo q0",
  summary(lm( total$value~ 
                total$q0)),
  "Resultados de la correlacion q1",
  cor.test( total$value, total$q1,
            method = c("spearman")),
  "Resultados del Modelo q1",
  summary(lm( total$value~ 
                total$q1)),
  "Resultados de la correlacion q2",
  cor.test( total$value, total$q2,
            method = c("spearman")),
  "Resultados del Modelo q2",
  summary(lm( total$value~ 
                total$q2)),
  file = "resultado_modelo_q0vsNPP.txt")




q0_npp_lm <- ggplot(data = total, aes(x = value, y = q0)) +
  geom_jitter(color = "#66c2a4", size=2) +
  labs(x = expression(paste("Productividad Primaria Neta ", "[", "mg m"^-2, "day"^-1, "]" )),
       y = expression(paste("Riqueza - D"[q0]))) +
  geom_smooth(method = "lm", color = "black", se = FALSE) +
  theme_classic()

q1_npp_lm <- ggplot(data = total, aes(x = value, y = q1)) +
  geom_jitter(color = "#66c2a4", size=2) +
  labs(x = expression(paste("Productividad Primaria Neta ", "[", "mg m"^-2, "day"^-1, "]" )),
       y = expression(paste("Riqueza - D"[q1]))) +
  geom_smooth(method = "lm", color = "black", se = FALSE) +
  theme_classic()

q2_npp_lm <- ggplot(data = total, aes(x = value, y = q2)) +
  geom_jitter(color = "#66c2a4", size=2) +
  labs(x = expression(paste("Productividad Primaria Neta ", "[", "mg m"^-2, "day"^-1, "]" )),
       y = expression(paste("Riqueza - D"[q2]))) +
  geom_smooth(method = "lm", color = "black", se = FALSE) +
  theme_classic()


png(filename="graficos_diversidad_vs_NPP_lm.png",width = 2000, height = 2500, res = 300)
grid.arrange(q0_npp_lm, q1_npp_lm, q2_npp_lm, ncol = 1)
dev.off()



#clorofila####


chl_0<-raster::stack("Mass_concentration_chlorophyll_0m.nc")
chl_20<-raster::stack("Mass_concentration_chlorophyll_20m.nc")
chl_50<-raster::stack("Mass_concentration_chlorophyll_50m.nc")
chl_100<-raster::stack("Mass_concentration_chlorophyll_100m.nc")

chl_0_date <- as.data.frame(raster::extract(chl_0, Diversidad_Hill_Fito_0_geo))
chl_20_date <- as.data.frame(raster::extract(chl_20, Diversidad_Hill_Fito_20_geo))
chl_50_date <- as.data.frame(raster::extract(chl_50, Diversidad_Hill_Fito_50_geo))
chl_100_date <- as.data.frame(raster::extract(chl_100, Diversidad_Hill_Fito_100_geo))


chl_0_df<-cbind(Diversidad_Hill_Fito_0, chl_0_date)
chl_20_df<-cbind( Diversidad_Hill_Fito_20, chl_20_date)
chl_50_df<-cbind( Diversidad_Hill_Fito_50, chl_50_date)
chl_100_df<-cbind( Diversidad_Hill_Fito_100, chl_100_date)




chl_0_df_long<-chl_0_df%>%tidyr::pivot_longer(col=11:35)
chl_20_df_long<-chl_20_df%>%tidyr::pivot_longer(col=11:35)
chl_50_df_long<-chl_50_df%>%tidyr::pivot_longer(col=11:35)
chl_100_df_long<-chl_100_df%>%tidyr::pivot_longer(col=11:35)

chl_total<-rbind(chl_0_df_long,
                 chl_20_df_long,
                 chl_50_df_long,
                 chl_100_df_long)

chl_total$name <- gsub("X", "", chl_total$name)        # Reemplaza "X" con una cadena vacía
chl_total$name <- gsub("\\.", "-", chl_total$name)     # Reemplaza puntos con guiones
chl_total$name <-as.Date(chl_total$name)

chl_total<-chl_total%>%
  mutate(boolean = ifelse(eventDate == name, TRUE, FALSE) )%>%
  filter(boolean == TRUE)




q0_chl <- ggplot(data = chl_total, aes(x = value, y = q0)) +
  geom_jitter(color = "#66c2a4", size=2) +
  labs(x = expression(paste("Clorofila", "[", "mg m"^-3,"]" )),
       y = expression(paste("Riqueza - D"[q0]))) +
  theme_classic()

q1_chl <- ggplot(data = chl_total, aes(x = value, y = q1)) +
  geom_jitter(color = "#66c2a4", size=2) +
  labs(x = expression(paste("Clorofila", "[", "mg m"^-3,"]" )),
       y = expression(paste("Riqueza - D"[q1]))) +
  theme_classic()

q2_chl <- ggplot(data = chl_total, aes(x = value, y = q2)) +
  geom_jitter(color = "#66c2a4", size=2) +
  labs(x = expression(paste("Clorofila", "[", "mg m"^-3,"]" )),
       y = expression(paste("Riqueza - D"[q2]))) +
  theme_classic()


png(filename="graficos_diversidad_vs_chl.png",width = 2000, height = 2500, res = 300)
grid.arrange(q0_chl, q1_chl, q2_chl, ncol = 1)
dev.off()


capture.output(
  "Resultados de la correlacion q0",
  cor.test( chl_total$value, chl_total$q0,
            method = c("spearman")),
  "Resultados del Modelo q0",
  summary(lm( chl_total$value~ 
                chl_total$q0)),
  "Resultados de la correlacion q1",
  cor.test( chl_total$value, chl_total$q1,
            method = c("spearman")),
  "Resultados del Modelo q1",
  summary(lm( chl_total$value~ 
                chl_total$q1)),
  "Resultados de la correlacion q2",
  cor.test( chl_total$value, chl_total$q2,
            method = c("spearman")),
  "Resultados del Modelo q2",
  summary(lm( chl_total$value~ 
                chl_total$q2)),
  file = "resultado_modelo_q0vsCHL.txt")




q0_chl_lm <- ggplot(data = chl_total, aes(x = value, y = q0)) +
  geom_jitter(color = "#66c2a4", size=2) +
  labs(x = expression(paste("Clorofila", "[", "mg m"^-3,"]" )),
       y = expression(paste("Riqueza - D"[q0]))) +
  geom_smooth(method = "lm", color = "black", se = FALSE) +
  theme_classic()

q1_chl_lm <- ggplot(data = chl_total, aes(x = value, y = q1)) +
  geom_jitter(color = "#66c2a4", size=2) +
  labs(x = expression(paste("Clorofila", "[", "mg m"^-3,"]" )),
       y = expression(paste("Riqueza - D"[q1]))) +
  geom_smooth(method = "lm", color = "black", se = FALSE) +
  theme_classic()

q2_chl_lm <- ggplot(data = chl_total, aes(x = value, y = q2)) +
  geom_jitter(color = "#66c2a4", size=2) +
  labs(x = expression(paste("Clorofila", "[", "mg m"^-3,"]" )),
       y = expression(paste("Riqueza - D"[q2]))) +
  geom_smooth(method = "lm", color = "black", se = FALSE) +
  theme_classic()


png(filename="graficos_diversidad_vs_CHL_lm.png",width = 2000, height = 2500, res = 300)
grid.arrange(q0_chl_lm, q1_chl_lm, q2_chl_lm, ncol = 1)
dev.off()


cor.test(chl_total$value, total$value)


