#################################################################################
# trainx_b <- the training data set
# trainblabel_b <- labels of training dada
# testx_b <- the test data set
#################################################################################
load("~/Desktop/Git Repository/cycle3cvd-team4/data/Baseline_features.RData")
trainb=Initial
trainx_b<-trainb[-1,]
trainlabel_b <- as.data.frame(read.table("label_base.txt"),header=T)
trainlabel_b <- as.matrix(trainlabel_b)[-1,]

#Using to do cross validation
set.seed(1)
ind=sample(1:dim(trainx_b)[1],200)
traintest_b=subset(trainx_b[ind,],select=-1)
ttlabel_b<-trainlabel_b[ind,2]
ttdata_b <- cbind(ttlabel_b,traintest_b)

#Using to train linear SVM
trainx1_b <- subset(trainx_b[1:7000,],select=-1)
trainlabel1_b<-trainlabel_b[1:7000,2]
traindata_b<- cbind(trainlabel1_b,trainx1_b)
testx_b <- subset(trainx_b[7001:7377,],select=-1)
testlabel_b<-trainlabel_b[7001:7377,2]

#################################################################################
# obj_b <- Cross-validate the margin parameter, k=10
#################################################################################

obj_b <- tune.svm(ttlabel_b ~., data = ttdata_b, cost = seq(1,5,by=0.5),type="C-classification", kernel = "linear",sampling="cross",cross=10)
summary(obj_b)
plot(obj_b)

#################################################################################
#Train linear SVM
#################################################################################
linearmodel_b <- svm(trainlabel1_b ~ .,data=traindata_b,type = "C-classification",  kernel = "linear",cost=0.00005)
pred_b <- predict(linearmodel_b, testx_b)
pred_b







