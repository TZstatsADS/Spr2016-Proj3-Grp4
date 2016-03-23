data_adv<-read.table("~/Downloads/featrues2.txt")
load("Baseline_features.RData")

data_bs=Initial[-1,]
data_bs1=matrix(as.numeric(data_bs[,-1]),nrow=7376,ncol=800)
newdata<-cbind(data_bs[,1],data_bs1)


#columns 2-4097  are features extracted from overfeat
#columns 4098-4897 are features extracted from colorhistogram
baseline=as.data.frame(newdata)
joined=merge(data_adv,baseline,by="V1")
save(joined,file = "feature_eval.RData")

