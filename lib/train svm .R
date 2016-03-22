library(e1071)
library(data.table)

#################################################################################
# trainx <- the training data set
# trainblabel <- labels of training dada
# testx <- the test data set
#################################################################################
trainx<-read.table("~/Downloads/featrues2.txt")
label <- as.data.frame(read.table("label.txt"))
trainlabel <- as.matrix(label)

set.seed(1)
ind=sample(1:dim(trainx)[1],200)
traintest=subset(trainx[ind,],select=-V1)
ttlabel<-trainlabel[ind,2]
ttdata <- cbind(ttlabel,traintest)

trainx1 <- subset(trainx[1:7000,],select=-V1)
trainlabel1<-trainlabel[1:7000,2]
traindata <- cbind(trainlabel1,trainx1)
testx <- subset(trainx[7001:7392,],select=-V1)
testlabel<-trainlabel[7001:7392,2]

#################################################################################
# obj <- Cross-validate the margin parameter, k=10
# obj2 <- cross-validate both the soft-margin parameter and the kernel bandwidth
#################################################################################

obj <- tune.svm(ttlabel ~., data = ttdata, cost = seq(0.00001,0.00005,by=0.00001),type="C-classification", kernel = "linear",sampling="cross",cross=10)
summary(obj)
plot(obj)
obj2 <- tune.svm(ttlabel ~., data =ttdata, cost = seq(0.2,0.7,by=0.05),gamma = seq(0.01,1,by=0.01),type="C-classification", kernel="radial",sampling="cross",cross=10)
summary(obj2)
plot(obj2)

#################################################################################
#Train linear and non-linear SVM
#################################################################################
linearmodel <- svm(trainlabel1 ~ .,data=traindata,type = "C-classification",  kernel = "linear",cost=0.00005)
nonlinearmodel <- svm(trainlabel1 ~., data = traindata,type = "C-classification", kernel = "radial",cost = 2.5, gamma = 0.0001)

pred1 <- predict(linearmodel, testx)
pred1
pred2 <- predict(nonlinearmodel, testx)
pred2
#################################################################################
# Get the misclassified rate
#################################################################################
pred1 <- predict(linearmodel, testx)
pred1 <- as.numeric(as.character(pred1))
y <- testlabel

accurate <- function(y1,y2)
{
        if(length(y1)!=length(y2)) return(-1)
        n = length(y1)
        r <- 0
        for (i in 1:n){
                if (y1[i]== y2[i]) r <- r+1
        }
        return(r/n)
}
linearaccurate <- accurate(pred1,y)
nonlinearaccurate <- accurate(pred2,y)
print(c(linearaccurate,nonlinearaccurate))



