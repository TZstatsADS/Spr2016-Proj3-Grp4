test <- function(fit_train,dat_test){
  
  
  test_baseline <- dat_test[]
  test_baseline <-as.matrix(test_baseline)[-1,-1]
  test_baseline <-matrix(as.numeric(test_baseline),nrow=200,ncol=800)
  
  test_adv <- dat_test[]
  test_baseline <- as.matrix(test_baseline)[-1,-1]
  test_baseline <- matrix(as.numeric(test_baseline),nrow=200,ncol=800)
  
  baseline <- predict(fit_train$fit_baseline, test_baseline)
  adv <- predict(fit_train$fit_adv, test_adv)
  
  return(list(baseline,adv))
}
