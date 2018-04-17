# Attached script works after downloading and unzipping the data file for the project.
Unzipped main folder should be set as working directory.
Scripts contain 5 main steps:
#The data file is downloaded and unzipped in working directory, Working directory is changed on "UCI HAR Dataset". These actions are not described in this code as it was not required in Course Project.
#1. Merges the training and the test sets to create one data set.
    #1.1.Creating common basic tables with column names.
        #1.1.1. Creating table with activity names
        #1.1.2. Creating table with features names
    #1.2. Creating Training set
        #1.2.1.Creating Training set tables with column name as features
        #1.2.2. Creating subject train table
        #1.2.3.Creating  train labeltable
        #1.2.4.Combining trainset with subject and activity info
    #1.3..Creating testdataset:
        #1.3.1.Creating Training set tables with column name as features
        #1.3.2. Creating subject test table
        #1.3.3.Creating  test labeltable 
        #1.3.4.Combining testset with subject and activity info
    #1.4. Combining test and train dataset
#2.Uses descriptive activity names to name the activities in the data set
#3.Extracts only the measurements on the mean and standard deviation for each measurement.      
    #3.1. Choosing column names with mean mean and standard deviation
   #3.2.Creating table from trainwithlabels with only needed colums
#4.Appropriately labels the data set with descriptive variable names.
      #5.2. Creating tidy data set#5.2. Creating tidy data set
#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    #5.1. Reshaping the dataframe to extract values for mean calculation      
   #5.2. Creating tidy data set     
   #5.3. Creating csv.file with final data frame 
   
   
