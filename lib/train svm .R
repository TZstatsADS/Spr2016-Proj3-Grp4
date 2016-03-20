library(e1071)
library(data.table)
#################################################################################
# trainx <- the training data set
# trainblabel <- labels of training dada
# testx <- the test data set
#################################################################################
trainx <- read.table("featrues3.txt")
trainx1 <- trainx[1:8,]
testx <- trainx[9:12,]
label <- as.data.frame(read.table("featrues3_name.txt"))
trainlabel <- as.matrix(label)
trainblabel <- t(trainlabel)
traindata <- cbind(trainx,trainblabel)
#################################################################################
# obj <- Cross-validate the margin parameter, k=4
# obj2 <- cross-validate both the soft-margin parameter and the kernel bandwidth
#################################################################################
obj <- tune.svm(trainblabel ~., data = traindata, cost = seq(0.01,0.1,by=0.005),type="C-classification", kernel = "linear",cross=4)
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



