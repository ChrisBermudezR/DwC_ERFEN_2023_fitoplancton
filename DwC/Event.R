if(!require(worrms)){install.packages("worrms")}
if(!require(dplyr)){install.packages("dplyr")}
if(!require(tidyr)){install.packages("tidyr")}
if(!require(writexl)){install.packages("writexl")}

source("Listado_Encabezados.R")

#Si desea imprimir cualquier explicación puede usar el la linea de comandos: writeLines(Eventos_encabezados$parentEventID, "parentEventID.txt")
#consultar: https://rs.gbif.org/core/dwc_event_2024-02-19.xml


Datos_Colecta<-readxl::read_excel("event_data.xlsx", sheet = "Sheet1")
Datos_Colecta$eventDate<-as.Date(Datos_Colecta$eventDate, format="%Y-%m-%d")
Datos_Colecta$eventTime <- as.POSIXct(Datos_Colecta$eventTime)
Datos_Colecta$eventTime <- format(Datos_Colecta$eventTime, "%H:%M:%S")



#parentEventID####

parentEventID<-as.data.frame(rep("DIMAR:CCCP:ERFEN:2023", time=117))
colnames(parentEventID)="parentEventID"

#eventID####

eventID<-as.data.frame(paste0("DIMAR:CCCP:ERFEN:2023:",Datos_Colecta$fieldNumber))
colnames(eventID)="eventID"

#samplingProtocol####
samplingProtocol<-as.data.frame(rep("Botella Niskin", time=117))
colnames(samplingProtocol)="samplingProtocol"
  
#sampleSizeValue####  
sampleSizeValue<-as.data.frame(rep("1 L", time=117))
colnames(sampleSizeValue)="sampleSizeValue"

#sampleSizeUnit ####
sampleSizeUnit<-as.data.frame(rep("L", time=117))
colnames(sampleSizeUnit)="sampleSizeUnit"

#samplingEffort ####

samplingEffort<-as.data.frame(rep("113 muestras de un litro", time=117))
colnames(samplingEffort)="samplingEffort"

#eventDate####
eventDate<-as.data.frame(Datos_Colecta$eventDate)
colnames(eventDate)<-"eventDate"

#year
year<-as.data.frame(rep("2023", time=117))
colnames(year)="year"



# Extraer el mes
month <- as.data.frame(format(Datos_Colecta$eventDate, "%m"))
colnames(month)="month"

#day
day <- as.data.frame(format(Datos_Colecta$eventDate, "%d"))
colnames(day)="day"


#institutionCode
institutionCode<-as.data.frame(rep("Dirección General Marítima (DIMAR)", time=117))
colnames(institutionCode)="institutionCode"

#eventTime###
eventTime<-as.data.frame(Datos_Colecta$eventTime)
colnames(eventTime)<-"eventTime"

#habitat####
habitat<-as.data.frame(rep("Zona Pelágica", time=117))
colnames(habitat)<-"habitat"

#fieldNumber####
fieldNumber<-as.data.frame(Datos_Colecta$fieldNumber)
colnames(fieldNumber)="fieldNumber"


#eventRemarks####
eventRemarks<-as.data.frame(paste0("La estación de muestra fue la ", Datos_Colecta$station, ". La profundidad de muestra fue de ", Datos_Colecta$Depth, " metros."))
colnames(eventRemarks)="eventRemarks"

#type####
type<-as.data.frame(rep("Event", time=117))
colnames(type)<-"type"

#institutionCode####
institutionID<-as.data.frame(rep("830.027.904-1", time=117))
colnames(institutionID)<-"institutionID"

#datasetName####

datasetName<-as.data.frame(rep("Fitoplancton del Crucero Oceanográfico Cuenca Pacífica Colombiana LXIII / XXVI Crucero Regional Conjunto CPPS", time=117))
colnames(datasetName)<-"datasetName"

#datasetID####
datasetID<-as.data.frame(rep("cecoldo.iden_09ef25db-2917-44ae-b3eb-d2266f0fad3e", time=117))
colnames(datasetID)<-"datasetID"

#language####
language<-as.data.frame(rep("es", time=117))
colnames(language)<-"language"

#rightsHolder####
rightsHolder<-as.data.frame(rep("Dirección General Marítima (DIMAR)", time=117))
colnames(rightsHolder)="rightsHolder"

#references####
references<-as.data.frame(rep("https://cecoldo.dimar.mil.co/geonetwork/srv/spa/catalog.search#/metadata/09ef25db-2917-44ae-b3eb-d2266f0fad3e", time=117))
colnames(references)="references"

#locationID####
locationID<-as.data.frame(rep("http://marineregions.org/mrgid/21972", time=117))
colnames(locationID)="locationID"

#higherGeography####
higherGeography<-as.data.frame(rep("América | Sudamérica | Colombia | Región del Pacífico", time=117))
colnames(higherGeography)="higherGeography"

#continent####
continent<-as.data.frame(rep("América del Sur", time=117))
colnames(continent)="continent"

#waterBody####

waterBody<-as.data.frame(rep("Océano Pacífico", time=117))
colnames(waterBody)="waterBody"

#country####
country<-as.data.frame(rep("Colombia", time=117))
colnames(country)="country"

#countryCode####
countryCode<-as.data.frame(rep("CO", time=117))
colnames(countryCode)="countryCode"

#locality####

locality<-as.data.frame(rep("Cuenca Pacífica Colombiana", time=117))
colnames(locality)="locality"

#minimumDepthInMeters####

minimumDepthInMeters<-as.data.frame(rep("0", time=117))
colnames(minimumDepthInMeters)="minimumDepthInMeters"


#maximumDepthInMeters####

maximumDepthInMeters<-as.data.frame(Datos_Colecta$Depth)
colnames(maximumDepthInMeters)="maximumDepthInMeters"

#decimalLatitude####
decimalLatitude<-as.data.frame(Datos_Colecta$decimalLatitude)
colnames(decimalLatitude)="decimalLatitude"


#decimalLongitude####
decimalLongitude<-as.data.frame(Datos_Colecta$decimalLongitude)
colnames(decimalLongitude)="decimalLongitude"

#geodeticDatum####
geodeticDatum<-as.data.frame(rep("WGS84", time=117))
colnames(geodeticDatum)="geodeticDatum"

#georeferencedBy####
georeferencedBy<-as.data.frame(rep("Laura Carolina Ortiz Mieles ", time=117))
colnames(georeferencedBy)="georeferencedBy"

#Unión Final####

eventFinal<-cbind(parentEventID, 
      eventID,
      samplingProtocol,
      sampleSizeValue,
      sampleSizeUnit,
      samplingEffort,
      eventDate,
      year,
      month,
      day,
      institutionCode,
      eventTime,
      habitat,
      fieldNumber,
      eventRemarks,
      type,
      institutionID,
      datasetName,
      datasetID,
      language,
      rightsHolder,
      references,
      locationID,
      higherGeography,
      continent,
      waterBody,
      country,
      countryCode,
      locality,
      minimumDepthInMeters,
      maximumDepthInMeters,
      decimalLatitude,
      decimalLongitude,
      geodeticDatum,
      georeferencedBy
      )
write.table(eventFinal, "./DwC/event.csv", col.names = TRUE, row.names = FALSE, sep=",", fileEncoding="UTF-8")
