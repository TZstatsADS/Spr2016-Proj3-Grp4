source("http://bioconductor.org/biocLite.R")
biocLite()
biocLite("EBImage")
library(EBImage)

dirf<-"./images"
#dir_names <- list.files(dirf)
#install.packages("grDevices")
file_list=dir(dirf)

getColorFeature=function(filename)
{
img=readImage(paste0(dirf,"/",filename))
mat <- imageData(img)
nR <- 10
nG <- 8
nB <- 10
# Caution: the bins should be consistent across all images!
rBin <- seq(0, 1, length.out=nR)
gBin <- seq(0, 1, length.out=nG)
bBin <- seq(0, 1, length.out=nB)
freq_rgb <- as.data.frame(table(factor(findInterval(mat[,,1], rBin), levels=1:nR), 
                                factor(findInterval(mat[,,2], gBin), levels=1:nG), 
                                factor(findInterval(mat[,,3], bBin), levels=1:nB)))
rgb_feature <- as.numeric(freq_rgb$Freq)/(ncol(mat)*nrow(mat))
return(rgb_feature)
}


#length(rgb_feature)
Initial=c(1:501)



for(f in file_list)
{ 
tryCatch(
{feature=append(f,getColorFeature(f))
Initial=rbind(Initial,feature)}
,error=function(e){}
)
}

save(Initial,file="Baseline_features.RData")