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
  
  ### load librariesi
  library(e1071)
  data<-dat_train[,c(-1,-2)]
  #advanced
  
  train_adv<-data[,2:4097]
  
  train_adv_matrix<- as.matrix(label_adv)
  
  train_adv_1=subset(train_adv,select=-V1&&-V2)
  data_adv <- cbind(label_train,train_adv_1)
  
  #Adv Linear SVM
  fit_adv <- svm(label_adv ~ .,data=data_adv,type = "C-classification",  kernel = "linear",cost=0.00009)
  
  
  #baseline
  train_base=data[,4098:(4098+800)]
  train_base_matrix<-as.matrix(train_base)
  dat_base <- cbind(label_train,train_base_matrix)
  fit_baseline<-svm(trainlabel1 ~ .,data=traindata,type = "C-classification",  kernel = "linear",cost=0.1)
  
  
  return(list(fit_baseline,fit_adv))
  
  
  
}
