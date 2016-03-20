install.packages("e1071")
library(e1071)
library(data.table)
trainx <- read.table("featrues3.txt")
trainx1 <- trainx[1:8,]
testx <- trainx[9:12,]
label <- as.data.frame(read.table("featrues3_name.txt"))
trainlabel <- as.matrix(label)
trainblabel <- t(trainlabel)
traindata <- cbind(trainx,trainblabel)
dim(traindata)
obj <- tune.svm(trainblabel ~., data = traindata, cost = seq(0.01,0.1,by=0.005),type="C-classification", kernel = "linear",cross=4)
summary(obj)
plot(obj)
linearmodel <- svm(trainblabel ~ .,data=traindata,type = "C-classification",  kernel = "linear",cost=100000)

pred1 <- predict(linearmodel, testx)
pred1
nonlinearmodel <- svm(trainblabel ~., data = traindata,type = "C-classification", kernel = "radial",cost = 0.05, gamma = 1.2)
pred2 <- predict(nonlinearmodel, testx)
pred2



