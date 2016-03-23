#########################################################
### Train a classification model with training images ###
#########################################################

### Author: Yuting Ma
### Project 3
### ADS Spring 2016


train <- function(dat_train,label_train, par=NULL){
  
  ### Train a Gradient Boosting Model (GBM) using processed features from training images
  
  ### Input: 
  ###  -  processed features from images 
  ###  -  class labels for training images
  ### Output: training model specification
  
  ### load libraries
###############
  #install.packages(e1071)
###############
  library(e1071)
  #advanced
  train_adv<-dat_train[,2:4097]
  label_adv<- label_train[,2]
  #train_adv_matrix<- as.matrix(label_adv)
  
  #train_adv_1=subset(train_adv,select=-V1)
  data_adv <- cbind(label_adv,train_adv)
  
  #Adv Linear SVM

  fit_adv <- svm(label_adv~ .,data=data_adv,type = "C-classification",  kernel = "linear",cost=0.009)
 
#######################  
   #baseline
####################################
  train_base=dat_train[,4098:4897]
  
  #trainx_b<-as.matrix(trainb)[-1,-1]
  label_base <- label_train[,2]
  #trainlabel_b <- as.matrix(trainlabel_b)[-1,]
  
  nr=dim(train_base)[1]
  nc=dim(train_base)[2]
  train_baseline <-matrix(as.numeric(as.matrix(train_base)),nrow=nr,ncol=nc)
  
  
  
  data_baseline <- cbind(as.data.frame(label_base),as.data.frame(train_baseline))
  
  #x=as.data.frame(traintest_b)
  #y=as.data.frame(ttlabel_b)
  #da1=cbind(y,x)
  
  fit_baseline<-svm(label_base~ .,data=data_baseline,type = "C-classification",  kernel = "linear",cost=0.1)
  
  
  return(list(fit_baseline,fit_adv))
  
  
  
}
