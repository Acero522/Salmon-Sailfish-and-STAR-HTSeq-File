library(dplyr)
setwd("/home/acero/workplace/STARmap/HTseqcount")
counts.df<- read.table("DRR016125.counts", sep="\t", header=F, stringsAsFactors = F)

names(counts.df)<- c("gene_name","HTseq.125")

Salmon.gene.quant<- read.table("/home/acero/workplace/SalmonData/geneLevel_quant/DRR016125_quant/quant.genes.sf",sep="\t",header=T,stringsAsFactors = F)
//gene_level
gene.length<- dplyr::select(Salmon.gene.quant, c(Name, Length))
counts.df<- inner_join(counts.df, gene.length, by =c("gene_name"="Name"))


##counts_to_tpm function from https://gist.github.com/slowkow/c6ab0348747f86e2748b

counts_to_tpm <- function(counts, featureLength, meanFragmentLength) {
  
  # Ensure valid arguments.
  stopifnot(length(featureLength) == nrow(counts))
  stopifnot(length(meanFragmentLength) == ncol(counts))
  
  # Compute effective lengths of features in each library.
  effLen <- do.call(cbind, lapply(1:ncol(counts), function(i) {
    featureLength - meanFragmentLength[i] + 1
  }))
  
  # Exclude genes with length less than the mean fragment length.
  idx <- apply(effLen, 1, function(x) min(x) > 1)
  counts <- counts[idx,]
  effLen <- effLen[idx,]
  featureLength <- featureLength[idx]
  
  # Process one column at a time.
  tpm <- do.call(cbind, lapply(1:ncol(counts), function(i) {
    rate = log(counts[,i]) - log(effLen[,i])
    denom = log(sum(exp(rate)))
    exp(rate - denom + log(1e6))
  }))

  # Copy the column names from the original matrix.
  colnames(tpm) <- colnames(counts)
  rownames(tpm) <- rownames(counts)
  return(tpm)
}

featureLength<- counts.df$Length

## fragment length is 200bp 
meanFragmentLength<- c(200)

counts<- as.matrix(counts.df[,c(2)])
rownames(counts)<- counts.df$gene_name

TPM.from.HTSeq<- counts_to_tpm(counts, featureLength, meanFragmentLength)
TPM<- TPM.from.HTSeq

write.table (TPM[,1:1], file ="TPM.txt", sep ="    ", row.names =TRUE, col.names =FALSE, quote =FALSE)
HTSeq转TPM结束

