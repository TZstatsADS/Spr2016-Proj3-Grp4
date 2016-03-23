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
  library(e1071)
  #advanced
  train_adv<-dat_train[]
  label_adv<- label_train[]
  train_adv_matrix<- as.matrix(label_adv)
  
  train_adv_1=subset(train_adv,select=-V1)
  data_adv <- cbind(label_adv,train_adv_1)
  
  #Adv Linear SVM
  fit_adv <- svm(label_adv ~ .,data=data_adv,type = "C-classification",  kernel = "linear",cost=0.00009)
 
  
   #baseline
  train_base=data_train[]
  trainx_b<-as.matrix(trainb)[-1,-1]
  label_base <- label_train[]
  trainlabel_b <- as.matrix(trainlabel_b)[-1,]
  
  ttdata_b <- cbind(ttlabel_b,traintest_b)
  
  x=as.data.frame(traintest_b)
  y=as.data.frame(ttlabel_b)
  da1=cbind(y,x)
  
  fit_baseline<-svm(trainlabel1 ~ .,data=traindata,type = "C-classification",  kernel = "linear",cost=0.1)
  
  
  return(list(fit_baseline,fit_adv))
  
  
  
}
