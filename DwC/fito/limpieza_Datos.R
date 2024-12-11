if(!require(worrms)){install.packages("worrms")}
if(!require(dplyr)){install.packages("dplyr")}
if(!require(tidyr)){install.packages("tidyr")}
if(!require(writexl)){install.packages("writexl")}

registros<-readxl::read_excel("Plantilla de registros 4.0.xlsx", sheet = "Plantilla")

individualCount<-readxl::read_excel("Datos_Fito_Final.xlsx", sheet = "Conteo")
organismQuantity<-readxl::read_excel("Datos_Fito_Final.xlsx", sheet = "Densidad")
verbatimIdentification<-readxl::read_excel("matched_Total.xlsx", sheet = "Sheet1")


# Convertir de wide a long
individualCount_long <- pivot_longer(individualCount, 
                           cols = 2:48,
                           names_to = "verbatimIdentification",
                           values_to = "individualCount")
organismQuantity_long <- pivot_longer(organismQuantity, 
                                     cols = 2:48,
                                     names_to = "verbatimIdentification",
                                     values_to = "organismQuantity")



union<-cbind(individualCount_long, organismQuantity_long[,3])


prueba<-merge(union, verbatimIdentification, by="verbatimIdentification")

sort(prueba$fieldNumber)
