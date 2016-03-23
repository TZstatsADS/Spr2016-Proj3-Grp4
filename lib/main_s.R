source("~/Desktop/cycle3cvd-team4/lib/train_s.R")
source("~/Desktop/cycle3cvd-team4/lib/test_s.R")

load('~/Desktop/cycle3cvd-team4/data/feature_eval.RData')
load('~/Desktop/cycle3cvd-team4/data/label_eval.RData')

########################################
#####这一段code是我自己提取的2000张照片，正式script需要删掉
##########################################
cat=which(feature_label[,2] == 1)
dog=which(feature_label[,2]== 0) 
ind_a=sample(cat,1000)
ind_b=sample(dog,1000)
ind=c(ind_a,ind_b)
feature_eval=joined[ind,]
rownames(feature_eval) <- 1:nrow(feature_eval)
label_eval=feature_label[ind,2]
label_eval=label_eval

##########################################

n <- 2000
n_rep <- 20
K <- 5

ind_cat <- which(label_eval == 1) # 1000 cats
ind_dog <- which(label_eval== 0) # 1000 dogs
n_cat_fold <- n_dog_fold <- 200

CV_err_baseline <- rep(0, n_rep)
CV_err_adv <- rep(0, n_rep)
CV_fit_baseline <- array(dim=c(n, n_rep))
CV_fit_adv <- array(dim=c(n, n_rep))
train_time <- array(dim=c(K, n_rep))

for(r in 1:n_rep){
  set.seed(309+r)
  assign_cat <- sample(rep(1:K, times=n_cat_fold))
  set.seed(1310+r)
  assign_dog <- sample(rep(1:K, times=n_dog_fold))
  
  CV_index <- rep(NA, n)
  CV_index[ind_cat] <- assign_cat
  CV_index[ind_dog] <- assign_dog
  
  for(c in 1:K){
    cat("fold= ", c, "\n")
    ind_test <- which(CV_index == c)
    dat_train <- feature_eval[-ind_test,]
    label_train <- label_eval[-ind_test]
    dat_test <- feature_eval[ind_test,]
    label_test <- label_eval[ind_test]
    train_time[c,r] <- system.time(mod_train <- train(dat_train, label_train))[1]
    pred_test <- test(mod_train, dat_test)
    CV_fit_baseline[ind_test, r] <- pred_test$baseline
    CV_fit_adv[ind_test, r] <- pred_test$adv
  }
  CV_err_baseline[r] <- mean(CV_fit_baseline[,r] != label_eval)
  CV_err_adv[r] <- mean(CV_fit_adv[,r] != label_eval)
  
}

save(CV_fit_baseline, CV_fit_adv,  cv_err_baseline, cv_err_adv, train_time, file="CV_result.RData")





sum(lala!=pred_test$baseline)
sum(lala!=pred_test$adv)
