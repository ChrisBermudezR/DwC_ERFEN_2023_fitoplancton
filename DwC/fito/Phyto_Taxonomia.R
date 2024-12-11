if(!require(worrms)){install.packages("worrms")}
if(!require(dplyr)){install.packages("dplyr")}
if(!require(purrr)){install.packages("purrr")}
if(!require(writexl)){install.packages("writexl")}


data<-readxl::read_excel("Datos_Fito_Final.xlsx", sheet = "Formato")

especies<-colnames(data[7:53])
especies[9]<-"Alexandrium"
especies[10]<-"Dityocha"
especies[11]<-"Plagiotropis"

matchedTaxa<-worrms::wm_records_taxamatch(especies, marine_only = TRUE)

lista_principal <- stats::setNames(matchedTaxa, especies)


# Unir los dataframes en uno solo
df <- dplyr::bind_rows(lista_principal)




writexl::write_xlsx(df,
           path = "matched_Total.xlsx",
           col_names = TRUE,
           format_headers = TRUE,
           use_zip64 = FALSE
)
