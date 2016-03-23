library(e1071)
#################################################################################
# trainx_b <- the training data set
# trainblabel_b <- labels of training dada
# testx_b <- the test data set
#################################################################################
load("~/Desktop/cycle3cvd-team4/data/Baseline_features.RData")
trainb=Initial
trainx_b<-as.matrix(trainb)[-1,-1]
trainlabel_b <- as.data.frame(read.table("~/Desktop/cycle3cvd-team4/data/label_base.txt"),header=T)
trainlabel_b <- as.matrix(trainlabel_b)[-1,]

#Using to do cross validation
set.seed(1)
ind=sample(1:dim(trainx_b)[1],200)
traintest_b=trainx_b[ind,]
traintest_b=matrix(as.numeric(traintest_b),nrow=200,ncol=800)
ttlabel_b<-trainlabel_b[ind,2]
ttdata_b <- cbind(ttlabel_b,traintest_b)


#Using to train linear SVM
set.seed(2)
ind2=sample(1:dim(trainx_b)[1],7000)
trainx1_b=trainx_b[ind2,]
trainx1_b =matrix(as.numeric(trainx1_b ),nrow=7000,ncol=800)
trainlabel1_b<-trainlabel_b[ind2,2]

traindata_b<- cbind(as.data.frame(trainlabel1_b),as.data.frame(trainx1_b))
testx_b=trainx_b[-ind2,]
textx_b =matrix(as.numeric(testx_b),nrow=376,ncol=800)
testlabel_b=trainlabel_b[-ind2,2]



#################################################################################
# obj_b <- Cross-validate the margin parameter, k=10
#################################################################################
x=as.data.frame(traintest_b)
y=as.data.frame(ttlabel_b)
da1=cbind(y,x)

se=seq(1,3,by=0.1)
co1=10^se
obj_b <- tune.svm(ttlabel_b~.,data=da1,cost = 0.1,type="C-classification", kernel = "linear",sampling="cross",cross=10)
summary(obj_b)
plot(obj_b)

#################################################################################
#Train linear SVM
#################################################################################
linearmodel_b <- svm(trainlabel1_b ~ .,data=traindata_b,type = "C-classification",  kernel = "linear",cost=0.1)
pred_b <- predict(linearmodel_b,textx_b)
pred_b
sum(pred_b!=testlabel_b)
102/376





