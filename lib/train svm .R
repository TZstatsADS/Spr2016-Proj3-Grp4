library(e1071)
library(data.table)
#################################################################################
# trainx <- the training data set
# trainblabel <- labels of training dada
# testx <- the test data set
#################################################################################
trainx<-read.table("~/Downloads/featrues2.txt")
trainx1 <- subset(trainx[1:1000,],select=-V1)
testx <- trainx[1001:2000,]
label <- as.data.frame(read.table("label.txt"))
trainlabel <- as.matrix(label)
trainblabel <- t(trainlabel)
trainlabel1<-trainlabel[1:1000,2]
traindata <- cbind(trainlabel1,trainx1)
#################################################################################
# obj <- Cross-validate the margin parameter, k=10
# obj2 <- cross-validate both the soft-margin parameter and the kernel bandwidth
#################################################################################
obj <- tune.svm(trainlabel1 ~., data = traindata, cost = seq(0.1,10,by=0.5),type="C-classification", kernel = "linear",sampling="cross",cross=10)
summary(obj)
plot(obj)
obj2 <- tune.svm(label ~.,data = tunetraindata,cost = seq(0.1,0.7,by=0.1),gamma = seq(0.01,0.02,by=0.005),type="C-classification", kernel="radial",sampling="cross",cross=5)
plot(obj2)
#need the whole train data to process 

#################################################################################
#Train linear and non-linear SVM
#################################################################################
linearmodel <- svm(trainblabel ~ .,data=traindata,type = "C-classification",  kernel = "linear",cost=100000)
nonlinearmodel <- svm(trainblabel ~., data = traindata,type = "C-classification", kernel = "radial",cost = 0.05, gamma = 1.2)

pred1 <- predict(linearmodel, testx)
pred1
pred2 <- predict(nonlinearmodel, testx)
pred2




