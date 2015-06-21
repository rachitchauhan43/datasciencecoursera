library(dplyr)
features<-read.table("project/features.txt") %>% select(V2)

#1.Merging the training and test sets
#1.1.Load the training sets and bind
train_X_tbl<-tbl_df(read.table("project/train/X_train.txt"))
train_Y<-read.table("project/train/y_train.txt")
train_sub<-read.table("project/train/subject_train.txt")
train_X_tbl<-cbind(train_sub,train_Y,train_X_tbl)

#1.2.Load the test sets and bind
test_X_tbl<-tbl_df(read.table("project/test/X_test.txt"))
test_Y<-read.table("project/test/y_test.txt")
test_sub<-read.table("project/test/subject_test.txt")
test_X_tbl<-cbind(test_sub,test_Y,test_X_tbl)

#1.3.Finally,Merging operation
merged_set<-rbind(train_X_tbl,test_X_tbl)

#2.Now extracting only mean and std related measurements(or columns).
req_Indices<-grep("mean|std",features$V2,ignore.case = T)
req_Indices<-req_Indices+2
req_Set<-merged_set[,c(1,2,req_Indices)]

#3.Using descriptive activity names to name the activities in the data set.
activities<-c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
req_Set$V1.1<-lapply(req_Set$V1.1,function(elem){elem<-activities[elem]})
req_Set$V1.1<-as.character(req_Set$V1.1)

#4.Appropriately labelling the data set with descriptive variable names. 
req_Indices<-req_Indices-2
req_Indices_Names<-as.character(features[req_Indices,])
colnames(req_Set)<-c("Subject_ID","Activity",req_Indices_Names)

#5.From the data set in step 4 i am going to Create independent tidy data set with 
#the average of each variable for each  activity and each subject.
by_act_sub<-group_by(req_Set,Activity,Subject_ID)
final<-summarise_each(by_act_sub,funs(mean))
write.table(final,file = "final.txt",row.names=F)

