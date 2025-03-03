library(readxl)
library(tidyverse)

# Read in BRU data
occurrences <- read.csv("./data/BrownUniversity-BRU_DwC-A/occurrences.csv")

# Read in genera identified by ITIS processor 
genera <- read.csv("data/genera.csv")
genera <- data.frame(genera)

colnames(genera) <- c('ITIS_Family','genus','total_barcodes', 'trnL_barcodes')

# Find only specimens matching the genera
match <- inner_join(occurrences, genera, by = "genus") %>% mutate(BRU_Family = family) %>%
select(total_barcodes, trnL_barcodes, ITIS_Family, BRU_Family, genus, scientificName, year, 
country, stateProvince, occurrenceID)

# SPECIMENS FOR SAMPLING NO YEAR RESTRICTION ONLY 0 BARCODE #
specimens <- match %>% arrange(total_barcodes, trnL_barcodes, ITIS_Family, genus, desc(year))
sliced <- specimens %>% group_by(ITIS_Family) %>% slice(1) %>% ungroup() %>% arrange(total_barcodes, trnL_barcodes)
write.csv(specimens, file='./data/specimens.csv')
write.csv(sliced_specimens, file='./data/sliced_specimens.csv')

# Identify only specimens from the USA from 1975-present
#specimens <- match %>% filter(year >= 1975, country == 'United States of America')

# Read in Yellowstone occuring species data from NPSpecies
yellowstone <- read_excel("data/NPSpecies_Checklist_YELL_20250223195402.xlsx")

# Update all species names to exclude var.
yellowstone$`Scientific Name` <- sub(" var\\..*", "", yellowstone$`Scientific Name`)

# Narrow identified BRU specimens that occur in yellowstone
yellowstone_specimens <- specimens[which(specimens$scientificName %in% yellowstone$`Scientific Name`),]

# write YELL specimen IDs to CSV
write.csv(yellowstone_specimens, file='./data/yellowstone_specimens.csv')
write(paste(yellowstone_specimens$occurrenceID, collapse = ', '), 'yellowstone_specimen_ids.txt')

# write other specimen IDs to CSV
temp <- specimens$occurrenceID[!(specimens$occurrenceID %in% yellowstone_specimens$occurrenceID)]
write(paste(temp, collapse = ', '), 'other_specimen_ids.txt')
