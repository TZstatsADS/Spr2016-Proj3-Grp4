dir_names<- as.character(feature_eval[,1])
breed_name <- rep(NA, length(dir_names))

for(i in 1:length(dir_names)){
        tt <- unlist(strsplit(dir_names[i], "_"))
        tt <- tt[-length(tt)]
        breed_name[i] = paste(tt, collapse="_", sep="")
}
cat_breed <- c("Abyssinian", "Bengal", "Birman", "Bombay", "British_Shorthair", "Egyptian_Mau",
               "Maine_Coon", "Persian", "Ragdoll", "Russian_Blue", "Siamese", "Sphynx")

iscat <- breed_name %in% cat_breed
label_b <- as.numeric(iscat)
train_label_s<-cbind(dir_names,label_b)
feature_label<-as.data.frame(train_label_s)

save(feature_label,file = "label_eval.RData")














