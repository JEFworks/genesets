## Making gene sets as R environments

## Example with Broad's MSigDB
## Source: http://www.broadinstitute.org/gsea/downloads.jsp
## Current MSigDB gene sets, gene symbols msigdb.v4.0.symbols.gmt
## Downloaded October 28, 2014

## read in Broad gmt format
library(cnvGSA)
filename <- 'msigdb.v4.0.symbols.gmt'
gs <- readGMT(filename)

## number of gene sets
n <- length(gs$gs2gene)

## create environment
env <- new.env(parent=globalenv())
invisible(lapply(1:n,function(i) {
    genes <- as.character(unlist(gs$gs2gene[i]))
    name <- as.character(unlist(gs$gs2name[i]))
    assign(name,genes,envir=env)
}))

MSigDB.Hs.GS2Symbol <- env

## double check
gs.test <- ls(env=MSigDB.Hs.GS2Symbol)
gs.test[1] ## category 1
gl.test <- get(gs.test[1], env=env)
gl.test ## list of genes in gene set 1

## save environment
save(MSigDB.Hs.GS2Symbol, file="MSigDB_Hs_GS.RData")
