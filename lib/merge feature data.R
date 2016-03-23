data_adv<-read.table("~/Downloads/featrues2.txt")
load("Baseline_features.RData")
data_bs=Initial
#column 2-4098  are features extracted from overfeat
#column 4099-4898 are features extracted from colorhistogram
joined = cbind(data_adv[match(data_bs[,1], data_adv$V1),], data_bs)[-1,]
save(joined,file = "feature_eval.RData")
