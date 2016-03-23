
test <- function(fit_train,dat_test){
  
#########################
#  baseline
#########################

  test_baseline <- dat_test[,4098:4897]  
 
  #test_baseline <- dat_test[]
  #test_baseline <-as.matrix(test_baseline)[-1,-1]

  nr=dim(test_baseline)[1]
  nc=dim(test_baseline)[2]
  test_baseline <-matrix(as.numeric(as.matrix(test_baseline)),nrow=nr,ncol=nc)

  #test_baseline <-matrix(as.numeric(test_baseline),nrow=200,ncol=800)

####################
#advanced  
#####################  
   test_adv <- dat_test[,1:4097]  

    
  

  #test_baseline <- matrix(as.numeric(test_baseline),nrow=200,ncol=800)
  

  #baseline <- predict(fit_train$fit_baseline, test_baseline)
  #adv <- predict(fit_train$fit_adv, test_adv)
  
  #names(test_baseline)=names(x)
  baseline <- predict(fit_baseline, test_baseline)
  adv <- predict(fit_adv, test_adv)
  
  return(list(baseline,adv))
}
