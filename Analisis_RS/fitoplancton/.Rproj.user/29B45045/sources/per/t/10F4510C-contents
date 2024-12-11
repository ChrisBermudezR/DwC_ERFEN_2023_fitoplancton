mapeoVariables<-function(Datos, Gradiente_Color, vector_epoca, vTitulo, TituloP){
 

   
  assign(paste("coords"), 
         raster::xyFromCell(Datos, seq_len(ncell(Datos))), 
         envir = .GlobalEnv)
  
  assign(paste("data_asDataframe") , 
         as.data.frame(getValues(Datos)), 
         envir = .GlobalEnv)
  
  colnames(data_asDataframe)<-vector_epoca
  
  assign(paste("data_stack"), 
         stack(data_asDataframe), 
         envir = .GlobalEnv)
  
  
  names(data_stack)<-  c('value', 'variable')
  
  assign(paste("data_df"), 
         cbind(coords, data_stack), 
         envir = .GlobalEnv)
  
  names(data_df)<-  c('longitud', 'latitud', 'value', 'variable')
  
  mapa<-ggplot(data=data_df, aes(longitud, latitud, fill = value)) + 
    geom_raster() +
    facet_wrap(~ variable) +
    scale_fill_gradientn(colours = Gradiente_Color) +
    coord_equal()+
    xlim(c(-85,-77)) + 
    ylim(c(0,10))+
    labs(x = "Longitud", y = "Latitud", fill=vTitulo, title = TituloP) + 
    theme_classic()+
    theme(legend.position="right", 
          axis.text.y =  element_text(size = 8),
          axis.title =  element_text(size = 8),
          plot.title = element_text(size = 10),
          plot.subtitle = element_text(size = 8),
          plot.caption= element_text(size = 8),
          plot.tag = element_text(size=10),
          strip.text = element_text(color = "black", size = 10),  # Cambia el color y tamaño del texto del título de la faceta
          strip.background = element_blank())
  
  print(mapa)
} 


calcular_magnitud <- function(raster1, raster2) {
  # Verificar si los dos rasters tienen las mismas dimensiones
  if (!all(dim(raster1) == dim(raster2))) {
    stop("Los rasters no tienen las mismas dimensiones.")
  }
  
  # Calcular la magnitud
  magnitud <- sqrt(raster1^2 + raster2^2)
  
  return(magnitud)
}


# Definir función para generar y guardar las gráficas
generar_y_guardar_grafica <- function(mapa, nombre_archivo) {
  png(nombre_archivo, width = 20, height = 20, units = "cm", pointsize = 12, bg = "white", res = 300, symbolfamily = "default")
  print(mapa)
  dev.off()
}

exportLayer<-function(layer, statistic, name){
  
  
  
  modelo <- raster(nrow=121, 
                   ncol=109, 
                   xmn= -85.04167, 
                   xmx= -75.95833, 
                   ymn= -0.04166667, 
                   ymx= 10.04167,
                   crs="+proj=longlat +datum=WGS84 +no_defs",
                   resolution=c(0.08333333, 0.08333333 )) 
 
  
  data <- raster::calc(layer, statistic, na.rm = TRUE)
  data<-resample(data, modelo, method='bilinear')
  writeRaster(data, 
              filename = paste0("./layers/",name,".gpkg"), 
              format = "GPKG", 
              overwrite=TRUE)
  
}

generar_Mapa_Estadistico<- function(datos_df, colores, titulo_mapa, titulo_variable, nombre_objeto) {
assign(nombre_objeto,ggplot(data=datos_df, aes(x, y, fill = Height)) + 
  geom_raster() +
  scale_fill_gradientn(colours = colores) +
  coord_equal()+
  labs(x = "Longitud", y = "Latitud", fill=titulo_variable, title = titulo_mapa) + 
  theme_classic()+
  theme(legend.position="right", 
        axis.text.y =  element_text(size = 8),
        axis.title =  element_text(size = 8),
        plot.title = element_text(size = 10),
        plot.subtitle = element_text(size = 8),
        plot.caption= element_text(size = 8),
        plot.tag = element_text(size=10),
        strip.text = element_text(color = "black", size = 10),  # Cambia el color y tamaño del texto del título de la faceta
        strip.background = element_blank()),
        envir = .GlobalEnv)

}

