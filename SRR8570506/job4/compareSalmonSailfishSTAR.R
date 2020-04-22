setwd("D:\\newFo\\SRR8570506\\job4")
DATA_FILE <- 'completeMADS.txt'
X <- read.table(DATA_FILE, header=TRUE, check.names=FALSE)

library(MASS)

# Salmon TPM versus Sailfish TPM (log scale)
pdf('MADSsalmon-vs-sailfish-log-scale.pdf')
y <- log2(X$Salmon)
x <- log2(X$Sailfish)
eqscplot(x, y, xlab="log2(Sailfish TPM)", ylab="log2(Salmon TPM)", main="MADS Salmon versus Sailfish(TPM in log scale)")
abline(0, 1, col="red")
dev.off()



# Salmon TPM versus STAR TPM (log scale)
pdf('MADSsalmon-vs-star-log-scale.pdf')
y <- log2(X$Salmon)
x <- log2(X$STAR)
eqscplot(x, y, xlab="log2(STAR-HTSeq TPM)", ylab="log2(Salmon TPM)", main="MADS Salmon versus STAR-HTSeq(TPM in log scale)")
abline(0, 1, col="red")
dev.off()


#Sailfish TPM versus STAR TPM(log scale)
pdf('MADSsailfish-vs-star-log-scale.pdf')
y <- log2(X$Sailfish)
x <- log2(X$STAR)
eqscplot(x, y, xlab="log2(STAR-HTSeq TPM)", ylab="log2(Sailfish TPM)", main="MADS Sailfish versus STAR-HTSeq(TPM in log scale)")
abline(0, 1, col="red")
dev.off()

