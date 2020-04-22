DATA_FILE <- 'max202.txt'
X <- read.table(DATA_FILE, header=TRUE, check.names=FALSE)

pdf('scatterplots-logrithmicXY.pdf')
pairs(X, log="xy", main="Scatterplot Matrix")
dev.off()

pdf('scatterplots.pdf')
pairs(X, main="Scatterplot Matrix")
dev.off()

cor(X)

cor(log2(X))

#Salmon TPM vs TraVaRPKM(log scale)
library(MASS)
pdf('salmon-vs-TraVaRPKM-Max20log2.pdf')
x <- log2(X$Salmon)
y <- log2(X$RPKM)
eqscplot(x, y, xlab="log2 Samlon TPM", ylab="log2 TraVaRPKM", main="Salmon versus TraVaRPKM(Max20log2)")
abline(0, 1, col="red")
dev.off()


#Sailfish TPM vs TraVaRPKM(log scale)
library(MASS)
pdf('sailfish-vs-TraVaRPKM-Max20log2.pdf')
x <- log2(X$Sailfish)
y <- log2(X$RPKM)
eqscplot(x, y, xlab="log2 Sailfish TPM", ylab="log2 TraVaRPKM", main="Sailfish versus TraVaRPKM(Max20log2)")
abline(0, 1, col="red")
dev.off()

#STAR TPM vs TraVaRPKM(log scale)
library(MASS)
pdf('STAR-vs-TraVaRPKM-First50log2.pdf')
x <- log2(X$STAR)
y <- log2(X$RPKM)
eqscplot(x, y, xlab="log2 STAR-HTSeq TPM", ylab="log2 TraVaRPKM", main="STAR-HTSeq versus TraVaRPKM(First50log2)")
abline(0, 1, col="red")
dev.off()

# Salmon TPM versus Sailfish TPM
library(MASS)
pdf('salmon-vs-sailfish-raw-scale.pdf')
x <- X$Salmon
y <- X$Sailfish
eqscplot(x, y, xlab="Samlon TPM", ylab="Sailfish TPM", main="Salmon versus Sailfish")
abline(0, 1, col="red")
dev.off()


# Salmon TPM versus Sailfish TPM (log scale)
library(MASS)
pdf('salmon-vs-sailfish-log-scale.pdf')
x <- log2(X$Salmon)
y <- log2(X$Sailfish)
eqscplot(x, y, xlab="log2(Samlon TPM)", ylab="log2(Sailfish TPM)", main="Salmon versus Sailfish(log)")
abline(0, 1, col="red")
dev.off()


# Salmon TPM versus STAR TPM
library(MASS)
pdf('salmon-vs-star-raw-scale.pdf')
x <- X$Salmon
y <- X$STAR
eqscplot(x, y, xlab="Samlon TPM", ylab="STAR-HTSeq TPM", main="Salmon versus STAR-HTSeq")
abline(0, 1, col="red")
dev.off()


# Salmon TPM versus STAR TPM (log scale)
library(MASS)
pdf('salmon-vs-star-log-scale.pdf')
x <- log2(X$Salmon)
y <- log2(X$STAR)
eqscplot(x, y, xlab="log2(Samlon TPM)", ylab="log2(STAR-HTSeq TPM)", main="Salmon versus STAR-HTSeq(log)")
abline(0, 1, col="red")
dev.off()


#Sailfish TPM versus STAR TPM
library(MASS)
pdf('sailfish-vs-star-raw-scale.pdf')
x <- X$Sailfish
y <- X$STAR
eqscplot(x, y, xlab="Sailfish TPM", ylab="STAR-HTSeq TPM", main="Sailfish versus STAR-HTSeq")
abline(0, 1, col="red")
dev.off()


#Sailfish TPM versus STAR TPM(log scale)
library(MASS)
pdf('sailfish-vs-star-log-scale.pdf')
x <- log2(X$Sailfish)
y <- log2(X$STAR)
eqscplot(x, y, xlab="log2(Sailfish TPM)", ylab="log2(STAR-HTSeq TPM)", main="Sailfish versus STAR-HTSeq(log)")
abline(0, 1, col="red")
dev.off()


