# Brown University Herbarium (BRU) research

## Metabarcoding study
### Title
Sequencing Yellowstone-occurring species in 'no-barcode' families, leveraging existing herbarium records 

### Abstract
Currently, there exists a gap in available genetic data for various “no-barcode” families of ecological importance, mainly Aceraceae (now included in Sapindaceae), Lycopodiaceae, Juncaginaceae, Ceratophyllaceae, Menyanthaceae, and Najadaceae, among others. Representative species from these families, especially those that occur at Yellowstone National Park, were selected from the available specimens housed in the Brown University Herbarium (BRU). By leveraging these existing specimens, sampling them, and DNA-barcoding them, we can contribute to the pool of available genetic data associated with plants important for ecological research at Yellowstone and beyond. We can also use computational techniques to analyze the data for phylogenetic and other purposes. Importantly, this process does not require the collection of new specimens and can be conducted outside of the normal field research season. As a part of this research, we first need to identify a list of key no-barcode families (expanded from the list above), and find herbarium specimens that are good candidates for sequencing. These would be specimens where DNA has not degraded due to age, are collected from appropriate locations for the scope of this project, and have plant tissue that can easily be sampled. Examples of specimens that have already been identified include:

1. Aceraceae: Acer negundo, PBRU00072249
2. Lycopodiaceae: Lycopodiella inundata, PBRU00050985
3. Juncaginaceae: Triglochin maritima, PBRU00067984
4. Ceratophyllaceae: Ceratophyllum demersum, PBRU00067821
5. Menyanthaceae: Menyanthes trifoliata, PBRU00059383
6. Najadaceae: Najas flexilis, PBRU00067833

**Note: these families use [ITIS](https://itis.gov/) designations**

### Methods
`filtering.r` uses rITIS and taxize to call the ITIS API and identify genera circumscribed by no-barcode families listed in the metabarcoding database. 

`@output` `genera.csv` and `search.txt` store the genera to be queried by `search.r`

## Rhode Island Flora (BIOL0940D) archival work
*WIP*
