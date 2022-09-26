## code to prepare `petitile` dataset goes here

library(readxl)
library(dplyr)

Petitile_brut <- read_excel("data-raw/dataset/Petitile.xls",sheet="Petitile")
NV_MEDIAN = median(Petitile_brut$NV)
Petitile_brut <- Petitile_brut %>% mutate(PAUVRE = ifelse(NV < 0.6*NV_MEDIAN, "1","0")) %>% select(-c(ADULTE,ENFANT_MOINS14,ENFANT_PLUS14,REV_AV_REDISTRIB,UC,NV))

Lib_Pcs <- read_excel("data-raw/dataset/Petitile.xls",sheet="LIB_PCS")
Lib_Dipl <- read_excel("data-raw/dataset/Petitile.xls",sheet="LIB_DIPL") %>% mutate(DIPL = as.character(DIPL))
Lib_Modcoha <- read_excel("data-raw/dataset/Petitile.xls",sheet="LIB_MODCOHA") %>% mutate(MODCOHA = as.character(MODCOHA))
Lib_Act <- read_excel("data-raw/dataset/Petitile.xls",sheet="LIB_ACT") %>% mutate(ACT = as.character(ACT))
Lib_Pauvre <- read_excel("data-raw/dataset/Petitile.xls",sheet="LIB_PAUVRE") %>% mutate(PAUVRE = as.character(PAUVRE))

petitile <- Petitile_brut %>% left_join(Lib_Pcs,by="PCS")
petitile <- petitile %>%  left_join(Lib_Dipl,by="DIPL")
petitile <- petitile %>%  left_join(Lib_Modcoha,by="MODCOHA")
petitile <- petitile %>%  left_join(Lib_Act,by="ACT")
petitile <- petitile %>%  left_join(Lib_Pauvre,by="PAUVRE")
petitile <- as.data.frame(petitile)

usethis::use_data(petitile, overwrite = TRUE)
