data_adv<-read.table("~/Downloads/featrues2.txt")
load("Baseline_features.RData")

data_bs=Initial[-1,]
nr=dim(data_bs)[1]
nc=dim(data_bs)[2]-1
data_bs1=matrix(as.numeric(data_bs[,-1]),nrow=nr,ncol=nc)
data_bs2=matrix(as.character(data_bs[,1]))
newdata<-cbind(data_bs2,data_bs1)



#columns 2-4097  are features extracted from overfeat
#columns 4098-4897 are features extracted from colorhistogram
baseline=as.data.frame(newdata)
feature_eval=merge(data_adv,baseline,by="V1")
save(feature_eval,file = "feature_eval.RData")

