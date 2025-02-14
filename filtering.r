library(tidyverse)
library(httr)
library(jsonlite)
library(ritis)
library(taxize)

bold <- read.csv("./data/Kartzinel_et_al_Dataset_S2_20250129.csv")

bold <- bold %>% mutate(across(everything(), ~ replace(., is.na(.), 0)))

#head(bold)

no_barcode <- bold %>%
  mutate(row_sum = rowSums(across(-c(ITIS.Family.Name, ITIS.Species.Count, BOLD.Specimen.Count, 
                                     BOLD.Species.Count)))) 

head(no_barcode)

families <- arrange(no_barcode, by = no_barcode$row_sum) %>% select(ITIS.Family.Name, row_sum)

families <- families %>% filter(row_sum <= 0)

tsn <- get_tsn(families$ITIS.Family.Name[1:30])

genera <- downstream(tsn, db = 'itis', downto = 'genus')

genera_list <- do.call("rbind", genera)$taxonname 

genera_list <- genera_list[genera_list != "No data"]

write.csv(genera_list, file='./data/genera.csv', row.names=FALSE)
