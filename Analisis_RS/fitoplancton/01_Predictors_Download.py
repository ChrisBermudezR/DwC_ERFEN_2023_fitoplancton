# -*- coding: utf-8 -*-
"""
Titulo del script: Descarga de datos del Copernicus.
Autor: Christian Bermúdez-Rivas 
Objetivo: Descarga de archivos NetCDF del Copernicus: https://resources.marine.copernicus.eu/products
Lenguaje: Python
Fecha: December 2023
Notas:
 No olvidar descargar e instalar el Miniconda: https://docs.conda.io/en/latest/miniconda.html in order to execute this code.
 Para cualquier error consultar este link: https://help.marine.copernicus.eu/en/articles/4947158-what-does-an-error-message-mean#h_9bf2ad6483

"""

import copernicusmarine



"""
Función para descargar los datos
"""

def descarga_datos(variable, minDepth, maxDepth, fechaInicio, fechaFinal, idDataset, nombreArchivoSalida, password):
            copernicusmarine.subset(
                username= "cbermdezrivas",
                dataset_id=idDataset,
                variables=[variable],
                minimum_longitude=-85,
                maximum_longitude=-76,
                minimum_latitude=0,
                maximum_latitude=10,
                password=password,
                start_datetime=fechaInicio,
                end_datetime=fechaFinal,
                minimum_depth=minDepth,
                maximum_depth=maxDepth,
                output_filename = nombreArchivoSalida,
                output_directory = "C:/Users/cbermudezr/OneDrive - dimar.mil.co/Documentos/DwC/ERFEN_2023/Analisis_RS/fitoplancton"
            )


"""
Descarga de los datos de Panamá
"""

#Green Ocean

descarga_datos("npp", 0, 0, "2023-10-25T00:00:00", "2023-11-18T23:59:59","cmems_mod_glo_bgc_my_0.083deg-lmtl_PT1D-i", "net_primary_productivity_of_biomass_expressed_as_carbon_0m.nc", "C94b061r504")
descarga_datos("npp", 20, 20, "2023-10-25T00:00:00", "2023-11-18T23:59:59","cmems_mod_glo_bgc_my_0.083deg-lmtl_PT1D-i", "net_primary_productivity_of_biomass_expressed_as_carbon_20m.nc", "C94b061r504")
descarga_datos("npp", 50, 50, "2023-10-25T00:00:00", "2023-11-18T23:59:59","cmems_mod_glo_bgc_my_0.083deg-lmtl_PT1D-i", "net_primary_productivity_of_biomass_expressed_as_carbon_50m.nc", "C94b061r504")
descarga_datos("npp", 100, 100, "2023-10-25T00:00:00", "2023-11-18T23:59:59","cmems_mod_glo_bgc_my_0.083deg-lmtl_PT1D-i", "net_primary_productivity_of_biomass_expressed_as_carbon_100m.nc", "C94b061r504")




descarga_datos("chl", 0, 0, "2023-10-25T00:00:00", "2023-11-18T23:59:59","cmems_mod_glo_bgc-pft_anfc_0.25deg_P1D-m", "Mass_concentration_chlorophyll_0m.nc", "C94b061r504")
descarga_datos("chl", 20, 20, "2023-10-25T00:00:00", "2023-11-18T23:59:59","cmems_mod_glo_bgc-pft_anfc_0.25deg_P1D-m", "Mass_concentration_chlorophyll_0m.nc", "C94b061r504")
descarga_datos("chl", 50, 50, "2023-10-25T00:00:00", "2023-11-18T23:59:59","cmems_mod_glo_bgc-pft_anfc_0.25deg_P1D-m", "Mass_concentration_chlorophyll_0m.nc", "C94b061r504")
descarga_datos("chl", 100, 100, "2023-10-25T00:00:00", "2023-11-18T23:59:59","cmems_mod_glo_bgc-pft_anfc_0.25deg_P1D-m", "Mass_concentration_chlorophyll_0m.nc", "C94b061r504")

