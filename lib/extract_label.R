extract_lable<-function(dir_names){

breed_name <- rep(NA, length(dir_names))

for(i in 1:length(dir_names)){
  tt <- unlist(strsplit(dir_names[i], "_"))
  tt <- tt[-length(tt)]
  breed_name[i] = paste(tt, collapse="_", sep="")
}
cat_breed <- c("Abyssinian", "Bengal", "Birman", "Bombay", "British_Shorthair", "Egyptian_Mau",
               "Maine_Coon", "Persian", "Ragdoll", "Russian_Blue", "Siamese", "Sphynx")

iscat <- breed_name %in% cat_breed
label <- as.numeric(iscat)
train_label<-as.data.frame(label)

# write.table(train_label,file="label.txt",row.names = F, quote = F)
# 
# label<- read.table("label.txt")

return(train_label)

}

