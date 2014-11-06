# Gene Sets as R Environments

Gene sets (such as genes within the same pathway) as R environment variables for easy toggling between different gene sets. 

## Usage
```
load('my_env.RData')
pathways <- ls(my.env)
genes.in.pathway1 <- get(pathways[1], env=my.env)
genes.in.pathway2 <- get(pathways[2], env=my.env)
```

## Example
```
> load('GO_Hs_GS.RData')
> ls()
[1] "GO.GS2Name"       "GO.Hs.ENSEMBL2GS" "GO.Hs.GS2ENSEMBL" "GO.Hs.GS2Symbol" 
[5] "GO.Hs.Symbol2GS" 
> gos <- ls(GO.Hs.GS2Symbol)
> head(gos)
[1] "GO:0000002" "GO:0000012" "GO:0000018" "GO:0000030" "GO:0000038"
[6] "GO:0000041"
> genes <- get(gos[1], env=GO.Hs.GS2Symbol)
> genes
[1] "AKT3"    "C10orf2" "DNA2"    "MEF2A"   "MPV17"   "PID1"    "SLC25A4"
[8] "TYMP"  
> get(gos[1], env=GO.GS2Name)
[1] "mitochondrial genome maintenance (BP)"
```

## Contents
### Gene Sets
- CPDB_Hs_GS.RData
  - Contains: CPDB.Hs.GS2ENSEMBL
- MSigDB_Hs_GS.RData
  - Contains: MSigDB.Hs.GS2Symbol 
- GO_Hs_GS.RData
  - Contains: GO.Hs.GS2ENSEMBL, GO.Hs.GS2Symbol, GO.Hs.Symbol2HS, GO.Hs.ENSEMBL2GS, GO.GS2Name

### Code Tutorial
- gmt2gs.R
  - Dependency: msigdb.v4.0.symbols.gmt
