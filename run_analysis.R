#The data file is downloaded and unzipped in working directory, Working directory is changed on "UCI HAR Dataset". These actions are not described in this code as it was not required in Course Project.
#1. Merges the training and the test sets to create one data set.
    #1.1.Creating common basic tables with column names.
        #1.1.1. Creating table with activity names
    activities<-read.table("activity_labels.txt",col.names = c("activitynumber","activity_name"))
        #1.1.2. Creating table with features names
    features<-read.table("features.txt",col.names = c("feanumber","features_name"))
    #1.2. Creating Training set
        #1.2.1.Creating Training set tables with column name as features
    train<-read.table("./train/x_train.txt",col.names =features$features_name )
        #1.2.2. Creating subject train table
    subject_train<-read.table("./train/subject_train.txt",col.names ="subjectnumber" )
        #1.2.3.Creating  train labeltable 
    train_labels<-read.table("./train/y_train.txt",col.names ="activitynumber" )
        #1.2.4.Combining trainset with subject and activity info
    trainwithlabels<-cbind(train,train_labels,subject_train)
    #1.3..Creating testdataset:
        #1.3.1.Creating Training set tables with column name as features
    test<-read.table("./test/x_test.txt",col.names =features$features_name )
        #1.3.2. Creating subject test table
      subject_test<-read.table("./test/subject_test.txt",col.names ="subjectnumber" )
        #1.3.3.Creating  test labeltable 
    test_labels<-read.table("./test/y_test.txt",col.names ="activitynumber" )
        #1.3.4.Combining testset with subject and activity info
    testwithlabels<-cbind(test,test_labels,subject_test)
    #1.4. Combining test and train dataset
      combinedset<-rbind(trainwithlabels,testwithlabels)
#2.Uses descriptive activity names to name the activities in the data set
      combinedsetactnames<-merge(combinedset,activities,by.x="activitynumber",by.y="activitynumber")
#3.Extracts only the measurements on the mean and standard deviation for each measurement.      
  #3.1. Choosing column names with mean mean and standard deviation
      meanandstdcolumns<-grep("activity_name|subjectnumber|std|mean[^(Freq)]",names(combinedsetactnames),value = T)
  #3.2.Creating table from trainwithlabels with only needed colums
      library(dplyr)
      meanstdtable<-select(combinedsetactnames,meanandstdcolumns)
#4.Appropriately labels the data set with descriptive variable names.
      names(meanstdtable)<-gsub("^t", "time", names(meanstdtable))
      names(meanstdtable)<-gsub("^f", "frequency", names(meanstdtable))
      names(meanstdtable)<-gsub("Acc", "Accelerometer", names(meanstdtable))
      names(meanstdtable)<-gsub("Gyro", "Gyroscope", names(meanstdtable))
      names(meanstdtable)<-gsub("Mag", "Magnitude", names(meanstdtable))
      names(meanstdtable)<-gsub("BodyBody", "Body", names(meanstdtable))
      names(meanstdtable)<-gsub("\\.", "", names(meanstdtable))
      #5.2. Creating tidy data set#5.2. Creating tidy data set
#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  #5.1. Reshaping the dataframe to extract values for mean calculation      
      melted<-melt(meanstdtable,id=c("activity_name","subjectnumber"))
  #5.2. Creating tidy data set     
      final<-dcast(melted,activity_name+subjectnumber~variable,mean)
  #5.3. Creating csv.file with final data frame   
      write.csv(final,"tidy.csv",row.names=F)
