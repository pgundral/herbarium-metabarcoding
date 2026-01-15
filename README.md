# Brown University Herbarium (BRU) research

## Metabarcoding study
### Title
Sequencing Yellowstone-occurring species in 'no-barcode' families, leveraging existing herbarium records 

### Abstract
Currently, there exists a gap in available genetic data for various “no-barcode” families of ecological importance, mainly Aceraceae (now included in Sapindaceae), Lycopodiaceae, Juncaginaceae, Ceratophyllaceae, Menyanthaceae, and Najadaceae, among others. Representative species from these families, especially those that occur at Yellowstone National Park, were selected from the available specimens housed in the Brown University Herbarium (BRU). By leveraging these existing specimens, sampling them, and DNA-barcoding them, we can contribute to the pool of available genetic data associated with plants important for ecological research at Yellowstone and beyond. We can also use computational techniques to analyze the data for phylogenetic and other purposes. Importantly, this process does not require the collection of new specimens and can be conducted outside of the normal field research season. As a part of this research, we first need to identify a list of key no-barcode families (expanded from the list above), and find herbarium specimens that are good candidates for sequencing. These would be specimens where DNA has not degraded due to age, are collected from appropriate locations for the scope of this project, and have plant tissue that can easily be sampled. Examples of specimens that have already been identified include:

1. Linnaeaceae: Linnaea borealis, PBRU00050298
2. Hydrophyllaceae: Phacelia tanacetifolia, PBRU00055711
3. Diervillaceae: Diervilla lonicera, PBRU00078736
4. Loxsomataceae: Loxsoma cunninghamii, PBRU00073743
5. Nephrolepidaceae: Nephrolepis exaltata, PBRU00025308

**Note: these families use [ITIS](https://itis.gov/) designations**

### Methods
THe `src/` directory contains R scripts for specimen idenfitication and Jupyter Notebooks for visualization of the results post-sequencing.
* `filtering.r` uses rITIS and taxize to call the ITIS API and identify genera circumscribed by no-barcode families listed in the metabarcoding database. After multi-constraint filtering, `genera.csv` and `searchable.txt` store the appropriate genera to be queried within the Herbarium's database
* `search.r` searches the BRU specimen table to identify appropriate specimens and rank them by their barcoding value
* `plots.ipynb` uses `ggplot` to produce figures used in the final poster (found in `figures/`)

### Requirements and Data
To run the scripts, install R version `4.5.1` or later and install packages `tidyverse`, `httr`, `jsonlite`, `ritis`, and `taxize`. 

The BRU herbarium's metadata can be downloaded from the [Consortium of Northeastern Herbaria](https://neherbaria.org/portal/collections/misc/collprofiles.php?collid=26) at the DwC-Archive access point.

The barcode availability data from the review by [Kartzinel et. al. 2025](https://doi.org/10.1111/mec.17712) can be accessed from the supporting information published with the paper in [Molecular Ecology](https://onlinelibrary.wiley.com/doi/10.1111/mec.17712).


### Paper
A research article that details the genomic methods and findings from this project can be found in `paper.pdf` or here:
[Read the full paper](paper.pdf)

### Poster
![poster](figures/pranav_capstone_poster_final.png)
