# Gene Sets as R Environments

Store gene sets (such as genes within the same pathway) as R environment variables for easy toggling between different gene sets. 

## Usage
```
load('my_env.RData')
pathways <- ls(my.env)
genes.in.pathway1 <- get(pathways[1], env=my.env)
genes.in.pathway2 <- get(pathways[2], env=my.env)
```

## Contents
### Gene Sets
- CPDB_Hs_GS.RData
  - Contains: CPDB.Hs.GS2ENSEMBL
- MSigDB_Hs_GS.RData
  - Contains: MSigDB.Hs.GS2Symbol 
- GO_Hs_GS.RData
  - Contains: GO.Hs.GS2ENSEMBL, GO.Hs.GS2Symbol, GO.Hs.Symbol2HS, GO.Hs.ENSEMBL2GS

### Code Tutorial
- gmt2gs.R
  - Dependency: msigdb.v4.0.symbols.gmt
