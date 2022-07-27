## code to prepare `grandile` dataset goes here

library(readxl)
library(dplyr)

Grandile_brut <- read_excel("data-raw/dataset/Grandile.xls",sheet="Grandile")
NV_MEDIAN = median(Grandile_brut$NV)
Grandile_brut <- Grandile_brut %>% mutate(PAUVRE = ifelse(NV < 0.6*NV_MEDIAN, "1","0")) %>% select(-c(ADULTE,ENFANT_MOINS14,ENFANT_PLUS14,REV_AV_REDISTRIB,UC,NV))

Lib_Pcs <- read_excel("data-raw/dataset/Grandile.xls",sheet="LIB_PCS")
Lib_Dipl <- read_excel("data-raw/dataset/Grandile.xls",sheet="LIB_DIPL") %>% mutate(DIPL = as.character(DIPL))
Lib_Modcoha <- read_excel("data-raw/dataset/Grandile.xls",sheet="LIB_MODCOHA") %>% mutate(MODCOHA = as.character(MODCOHA))
Lib_Act <- read_excel("data-raw/dataset/Grandile.xls",sheet="LIB_ACT") %>% mutate(ACT = as.character(ACT))
Lib_Pauvre <- read_excel("data-raw/dataset/Grandile.xls",sheet="LIB_PAUVRE") %>% mutate(PAUVRE = as.character(PAUVRE))

grandile <- Grandile_brut %>% left_join(Lib_Pcs,by="PCS")
grandile <- grandile %>%  left_join(Lib_Dipl,by="DIPL")
grandile <- grandile %>%  left_join(Lib_Modcoha,by="MODCOHA")
grandile <- grandile %>%  left_join(Lib_Act,by="ACT")
grandile <- grandile %>%  left_join(Lib_Pauvre,by="PAUVRE")
grandile <- as.data.frame(grandile)

usethis::use_data(grandile, overwrite = TRUE)
