setwd("D:\\newFo\\SRR8570506\\job3a")
DATA_FILE <- 'final.txt'
X <- read.table(DATA_FILE, header=TRUE, check.names=FALSE)

# Hexbin
library(hexbin)
pdf('salmon-vs-RPKM-log-scale-hexbin.pdf')
Salmon <- log2(X$Salmon)
RPKM <- log2(X$control2)
bin <- hexbin(Salmon, RPKM, xbins=15)
plot(bin, main="salmon-vs-RPKM-log-scale-hexbin")
dev.off()

# Hexbin
pdf('sailfish-vs-RPKM-log-scale-hexbin.pdf')
Sailfish <- log2(X$Sailfish)
RPKM <- log2(X$control2)
bin <- hexbin(Sailfish, RPKM, xbins=15)
plot(bin, main="sailfish-vs-RPKM-log-scale-hexbin")
dev.off()

#
pdf('STAR-vs-RPKM-log-scale-hexbin.pdf')
STAR <- log2(X$STAR)
RPKM <- log2(X$control2)
bin <- hexbin(STAR, RPKM, xbins=15)
plot(bin, main="STAR-vs-RPKM-log-scale-hexbin")
dev.off()