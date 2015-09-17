## Making gene sets as R environments

## Example with Broad's MSigDB
## Source: http://www.broadinstitute.org/gsea/downloads.jsp
## Current MSigDB gene sets, gene symbols msigdb.v5.0.symbols.gmt
## Downloaded September 17, 2015

## read in Broad gmt format
library(GSA)
filename <- 'msigdb.v5.0.symbols.gmt'
gs <- GSA.read.gmt(filename)

## number of gene sets
n <- length(gs$geneset.names)

## create environment
env <- new.env(parent=globalenv())
invisible(lapply(1:n,function(i) {
  genes <- as.character(unlist(gs$genesets[i]))
  name <- as.character(gs$geneset.names[i])
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