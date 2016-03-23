#########################################################
### test a classification model with training images ###
#########################################################

### Author: Team 4
### Project 3
### ADS Spring 2016


test <- function(fit_train,dat_test){
  
  ### test a baseline model and an advanced model
  
  ### Input: 
  ###  baseline and advanced model 
  ###  test dataset
  ### Output: prediction of test dataset

#################################
# prepare data for advanced model  
################################# 
  
  test_adv <- dat_test[,2:4097]  
  
  
  #test_baseline <- matrix(as.numeric(test_baseline),nrow=200,ncol=800)
  #baseline <- predict(fit_train$fit_baseline, test_baseline)
  #adv <- predict(fit_train$fit_adv, test_adv)
  #names(test_baseline)=names(x)
  

  
#################################
#prepare data for baseline model
#################################

  test_baseline <- dat_test[,4098:4897]  
 
  #test_baseline <- dat_test[]
  #test_baseline <-as.matrix(test_baseline)[-1,-1]
  nr=dim(test_baseline)[1]
  nc=dim(test_baseline)[2]
  test_baseline <-matrix(as.numeric(as.matrix(test_baseline)),nrow=nr,ncol=nc)

  #test_baseline <-matrix(as.numeric(test_baseline),nrow=200,ncol=800)

#########################
#make predictions
#########################
  baseline <- predict(fit_baseline, test_baseline)
  adv <- predict(fit_adv, test_adv)
  
  return(list(baseline=baseline,adv=adv))
}
