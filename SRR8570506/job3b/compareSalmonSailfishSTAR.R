setwd("D://newFo//SRR8570506//job3b")
DATA<-'job3bfinal.txt'
X <- read.table(DATA, header=TRUE, check.names=FALSE)
#去小数
library(dplyr)
X<- X %>% mutate(id = gsub("\\.[0-9]+", "", id))
#Xc<-as.matrix(X[,c(1,5)])
write.table(X,file="s1.txt",sep="    ",row.names = FALSE,col.names = FALSE,quote=FALSE)


# Hexbin
library(hexbin)

pdf('Total gene reads versus NumReads -log-scale-hexbin.pdf')
NumReads <- log2(X$NumReads)
Total_gene_reads <- log2(X$control2Reads)
bin <- hexbin(NumReads, Total_gene_reads, xbins=15)
plot(bin, main="Total gene reads versus NumReads -log-scale-hexbin")
dev.off()

