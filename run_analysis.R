library(dplyr)
#Reading train data
X_train<-read.table("C:/DataScience/CourseraAll/UCI_HAR_Dataset/train/X_train.txt")
Y_train<-read.table("C:/DataScience/CourseraAll/UCI_HAR_Dataset/train/y_train.txt")
Subject_train<-read.table("C:/DataScience/CourseraAll/UCI_HAR_Dataset/train/subject_train.txt")

#Reading test data
X_test<-read.table("C:/DataScience/CourseraAll/UCI_HAR_Dataset/test/X_test.txt")
Y_test<-read.table("C:/DataScience/CourseraAll/UCI_HAR_Dataset/test/y_test.txt")
Subject_test<-read.table("C:/DataScience/CourseraAll/UCI_HAR_Dataset/test/subject_test.txt")

#Reading data description
feature_names<-read.table("C:/DataScience/CourseraAll/UCI_HAR_Dataset/features.txt")
activity_labels<-read.table("C:/DataScience/CourseraAll/UCI_HAR_Dataset/activity_labels.txt")

#Merging train and test data
X_total<-rbind(X_train,X_test)
Y_total<-rbind(Y_train,Y_test)
Subject_total<-rbind(Subject_train,Subject_test)

#Extracting only the measurements on the mean and standard deviation for each measurement
Extracted_measures<-feature_names[grep("mean\\(\\)|std\\(\\)",feature_names[,2]),]
X_total<-X_total[,Extracted_measures[,1]]

#Uses descriptive activity names to name the activities in the data set
colnames(Y_total)<-"activity"
Y_total$activitylabel<-factor(Y_total$activity,labels = as.character(activity_labels[,2]))
activitylabel<-Y_total[,-1]

#Appropriately label the data set with descriptive variable names
colnames(X_total)<-feature_names[Extracted_measures[,1],2]

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
colnames(Subject_total)<-"subject"
total<-cbind(X_total,Y_total,Subject_total)
total_mean<-total %>% group_by(activitylabel,subject) %>% summarize_all(funs(mean))
write.table(total_mean,file="C:/DataScience/CourseraAll/UCI_HAR_Dataset/tidydata.txt")

