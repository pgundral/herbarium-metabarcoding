library(tidyverse)
library(httr)
library(jsonlite)
library(ritis)
library(taxize)

# read in S2 data set and set all NA to 0
bold <- read.csv("./data/Kartzinel_et_al_Dataset_S2_20250129.csv")
bold <- bold %>% mutate(across(everything(), ~ replace(., is.na(.), 0)))
# head(bold)

# find no-barcode families by summing over seq regions
barcode_sums <- bold %>%
  mutate(row_sum = rowSums(across(-c(ITIS.Family.Name, ITIS.Species.Count, BOLD.Specimen.Count, 
                                     BOLD.Species.Count)))) 

# head(barcode_sums)

# find appropriate families by sorting sums and filtering to a given sum
nb_families <- arrange(barcode_sums, by = barcode_sums$row_sum) %>% select(ITIS.Family.Name, row_sum)
nb_families <- nb_families %>% filter(row_sum <= 100) # returns between 0 and 100

# find all trachoephyte families from ITIS 'Tracheophyta'
tracheo <- downstream('Tracheophyta', db = 'itis', downto = 'family')
tracheo_families <- tracheo$Tracheophyta$taxonname

# # find all angiosperm families from ITIS 'Magnoliopsida'
# angio <- downstream('Magnoliopsida', db = 'itis', downto = 'family')
# angio_families <- angio$Magnoliopsida$taxonname

# subset all no-barcode families to only angiosperm families
families <- nb_families$ITIS.Family.Name[nb_families$ITIS.Family.Name %in% 
                        tracheo_families]

# write families to csv
write.csv(families, file='./data/families.csv', row.names=FALSE, 
quote=FALSE)

# taxize::get_tsn() to get ITIS Taxonomic Serial No.s
tsn <- get_tsn(families)
# write tsns to csv
write.csv(tsn, file='./data/tsn.csv', row.names=FALSE, quote=FALSE)

# find all downstream genera using taxize::downstream()
genera <- downstream(tsn, db = 'itis', downto = 'genus')
genera_list <- do.call("rbind", genera)$taxonname 
genera_list <- genera_list[genera_list != "No data"]
# write genera to csv
write.csv(genera_list, file='./data/genera.csv', row.names=FALSE,
quote=FALSE)

# collapse into searchable term
write(paste(genera_list, collapse = ', '), 'searchable-100.txt')
