mainProj2 <- function() {
    # Save system locale first (the project requires an English locale)
    mySysLocale <- Sys.getlocale("LC_TIME")
    # Now set locale to English
    Sys.setlocale("LC_TIME", "English")
    
    message("Working directory: ", getwd())
    # Downloads and unzips the data to the data subdirectory in the working directory
    message("Checking if download is required...")
    setInternet2(use = TRUE)
    fUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    # Create data subdir if it doesn't exist
    if (!file.exists("./data")) {dir.create("./data")}
    setwd("./data")
    # If we the data isn't downloaded yet, download it
    if (!file.exists("./weardata.zip")) {
        message("Downloading the ZIP file...")
        download.file(fUrl, destfile = "./weardata.zip", mode="wb", method="internal")
    } 
    else {message("File already downloaded.")}
    # If the file isn't yet unzipped, unzip it
    if (!file.exists("./UCI HAR Dataset")) {
        message("Unzipping raw data...")
        unzip("./weardata.zip")
    }
    else {message("Raw data already unzipped.")}
    
    # The raw data is acquired
    message("Raw data is acquired.")

    # The ColumnSubsetVector will be used to subset columns which contain mean 
    # or std data from X_test.txt and X_train.txt files 
    ColumnSubsetVector <- c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,
                            122,123,124,125,126,161,162,163,164,165,166,201,202,
                            214,215,227,228,240,241,253,254,266,267,268,269,270,
                            271,294,295,296,345,346,347,348,349,350,373,374,375,
                            424,425,426,427,428,429,452,453,454,503,504,513,516,
                            517,526,529,530,539,542,543,552)
    
    # The ColumnNamesVector will be used to name the columns in the resulting
    # (subset) data frame 
    ColumnNamesVector <- c("tBodyAcc_mean_X","tBodyAcc_mean_Y","tBodyAcc_mean_Z",
                           "tBodyAcc_std_X","tBodyAcc_std_Y","tBodyAcc_std_Z",
                           "tGravityAcc_mean_X","tGravityAcc_mean_Y","tGravityAcc_mean_Z",
                           "tGravityAcc_std_X","tGravityAcc_std_Y","tGravityAcc_std_Z",
                           "tBodyAccJerk_mean_X","tBodyAccJerk_mean_Y","tBodyAccJerk_mean_Z",
                           "tBodyAccJerk_std_X","tBodyAccJerk_std_Y","tBodyAccJerk_std_Z",
                           "tBodyGyro_mean_X","tBodyGyro_mean_Y","tBodyGyro_mean_Z",
                           "tBodyGyro_std_X","tBodyGyro_std_Y","tBodyGyro_std_Z",
                           "tBodyGyroJerk_mean_X","tBodyGyroJerk_mean_Y","tBodyGyroJerk_mean_Z",
                           "tBodyGyroJerk_std_X","tBodyGyroJerk_std_Y","tBodyGyroJerk_std_Z",
                           "tBodyAccMag_mean","tBodyAccMag_std","tGravityAccMag_mean",
                           "tGravityAccMag_std","tBodyAccJerkMag_mean","tBodyAccJerkMag_std",
                           "tBodyGyroMag_mean","tBodyGyroMag_std","tBodyGyroJerkMag_mean",
                           "tBodyGyroJerkMag_std","fBodyAcc_mean_X","fBodyAcc_mean_Y",
                           "fBodyAcc_mean_Z","fBodyAcc_std_X","fBodyAcc_std_Y","fBodyAcc_std_Z",
                           "fBodyAcc_meanFreq_X","fBodyAcc_meanFreq_Y","fBodyAcc_meanFreq_Z",
                           "fBodyAccJerk_mean_X","fBodyAccJerk_mean_Y","fBodyAccJerk_mean_Z",
                           "fBodyAccJerk_std_X","fBodyAccJerk_std_Y","fBodyAccJerk_std_Z",
                           "fBodyAccJerk_meanFreq_X","fBodyAccJerk_meanFreq_Y",
                           "fBodyAccJerk_meanFreq_Z","fBodyGyro_mean_X","fBodyGyro_mean_Y",
                           "fBodyGyro_mean_Z","fBodyGyro_std_X","fBodyGyro_std_Y","fBodyGyro_std_Z",
                           "fBodyGyro_meanFreq_X","fBodyGyro_meanFreq_Y","fBodyGyro_meanFreq_Z",
                           "fBodyAccMag_mean","fBodyAccMag_std","fBodyAccMag_meanFreq",
                           "fBodyBodyAccJerkMag_mean","fBodyBodyAccJerkMag_std",
                           "fBodyBodyAccJerkMag_meanFreq","fBodyBodyGyroMag_mean","fBodyBodyGyroMag_std",
                           "fBodyBodyGyroMag_meanFreq","fBodyBodyGyroJerkMag_mean",
                           "fBodyBodyGyroJerkMag_std","fBodyBodyGyroJerkMag_meanFreq")
    
    
    message("Reading test X data file...")
    df1 <- read.table("./UCI HAR Dataset/test/X_test.txt")
    df1 <- df1[,ColumnSubsetVector]
    message("Reading done. # of NAs = ", sum(is.na(df1)))
    message("Reading train X data file...")
    df2 <- read.table("./UCI HAR Dataset/train/X_train.txt")
    df2 <- df2[,ColumnSubsetVector]
    message("Reading done. # of NAs = ", sum(is.na(df2)))
    
    # Joining the main test and train data
    message("Joining data frames...")
    df.main <- rbind(df1, df2)
    # Set up meaningful column name(s)
    names(df.main) <- ColumnNamesVector
    
    
    # read and join the subject files
    message("Reading subject data files...")
    df1 <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    message("Reading done. # of NAs = ", sum(is.na(df1)))
    df2 <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    message("Reading done. # of NAs = ", sum(is.na(df2)))
    # Joining test and train data
    df.subj <- rbind(df1, df2)
    # Set up meaningful column name(s)
    names(df.subj) <- c("Subject")
    
    # read and join the activity label files
    message("Reading activity label data files...")
    df1 <- read.table("./UCI HAR Dataset/test/y_test.txt")
    message("Reading done. # of NAs = ", sum(is.na(df1)))
    df2 <- read.table("./UCI HAR Dataset/train/y_train.txt")
    message("Reading done. # of NAs = ", sum(is.na(df2)))
    
    # Joining test and train data
    df.activity <- rbind(df1, df2)
    # Set up meaningful column name(s)
    names(df.activity) <- c("ActivityLbl")
    
    # Remove the original data frames
    rm(df1, df2)
    
    # Merging the three data frames
    df.full <- cbind(df.subj, df.main, df.activity)
    
    # read the activity string file
    message("Reading activity names...")
    df.labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
    names(df.labels) <- c("ActivityLbl", "Activity")
    
    # Merge the data with the activity names to get descriptive activity names
    df.full <- merge(df.full, df.labels, by = "ActivityLbl") 
    
    library(dplyr)
    # Group results by activity and subject
    df.full <- group_by(df.full,Activity, Subject)
    # Summarise the data to get the average for each measurement
    df.full <- summarise(df.full,
                          tBodyAcc_mean_X=mean(tBodyAcc_mean_X),tBodyAcc_mean_Y=mean(tBodyAcc_mean_Y),
                          tBodyAcc_mean_Z=mean(tBodyAcc_mean_Z),tBodyAcc_std_X=mean(tBodyAcc_std_X),
                          tBodyAcc_std_Y=mean(tBodyAcc_std_Y),tBodyAcc_std_Z=mean(tBodyAcc_std_Z),
						  tGravityAcc_mean_X=mean(tGravityAcc_mean_X),tGravityAcc_mean_Y=mean(tGravityAcc_mean_Y),
						  tGravityAcc_mean_Z=mean(tGravityAcc_mean_Z),tGravityAcc_std_X=mean(tGravityAcc_std_X),
						  tGravityAcc_std_Y=mean(tGravityAcc_std_Y),tGravityAcc_std_Z=mean(tGravityAcc_std_Z),
						  tBodyAccJerk_mean_X=mean(tBodyAccJerk_mean_X),tBodyAccJerk_mean_Y=mean(tBodyAccJerk_mean_Y),
						  tBodyAccJerk_mean_Z=mean(tBodyAccJerk_mean_Z),tBodyAccJerk_std_X=mean(tBodyAccJerk_std_X),
						  tBodyAccJerk_std_Y=mean(tBodyAccJerk_std_Y),tBodyAccJerk_std_Z=mean(tBodyAccJerk_std_Z),
						  tBodyGyro_mean_X=mean(tBodyGyro_mean_X),tBodyGyro_mean_Y=mean(tBodyGyro_mean_Y),
						  tBodyGyro_mean_Z=mean(tBodyGyro_mean_Z),tBodyGyro_std_X=mean(tBodyGyro_std_X),
						  tBodyGyro_std_Y=mean(tBodyGyro_std_Y),tBodyGyro_std_Z=mean(tBodyGyro_std_Z),
						  tBodyGyroJerk_mean_X=mean(tBodyGyroJerk_mean_X),tBodyGyroJerk_mean_Y=mean(tBodyGyroJerk_mean_Y),
						  tBodyGyroJerk_mean_Z=mean(tBodyGyroJerk_mean_Z),tBodyGyroJerk_std_X=mean(tBodyGyroJerk_std_X),
						  tBodyGyroJerk_std_Y=mean(tBodyGyroJerk_std_Y),tBodyGyroJerk_std_Z=mean(tBodyGyroJerk_std_Z),
						  tBodyAccMag_mean=mean(tBodyAccMag_mean),tBodyAccMag_std=mean(tBodyAccMag_std),
						  tGravityAccMag_mean=mean(tGravityAccMag_mean),tGravityAccMag_std=mean(tGravityAccMag_std),
						  tBodyAccJerkMag_mean=mean(tBodyAccJerkMag_mean),tBodyAccJerkMag_std=mean(tBodyAccJerkMag_std),
						  tBodyGyroMag_mean=mean(tBodyGyroMag_mean),tBodyGyroMag_std=mean(tBodyGyroMag_std),
						  tBodyGyroJerkMag_mean=mean(tBodyGyroJerkMag_mean),tBodyGyroJerkMag_std=mean(tBodyGyroJerkMag_std),
						  fBodyAcc_mean_X=mean(fBodyAcc_mean_X),fBodyAcc_mean_Y=mean(fBodyAcc_mean_Y),
						  fBodyAcc_mean_Z=mean(fBodyAcc_mean_Z),fBodyAcc_std_X=mean(fBodyAcc_std_X),
						  fBodyAcc_std_Y=mean(fBodyAcc_std_Y),fBodyAcc_std_Z=mean(fBodyAcc_std_Z),
						  fBodyAcc_meanFreq_X=mean(fBodyAcc_meanFreq_X),fBodyAcc_meanFreq_Y=mean(fBodyAcc_meanFreq_Y),
						  fBodyAcc_meanFreq_Z=mean(fBodyAcc_meanFreq_Z),fBodyAccJerk_mean_X=mean(fBodyAccJerk_mean_X),
						  fBodyAccJerk_mean_Y=mean(fBodyAccJerk_mean_Y),fBodyAccJerk_mean_Z=mean(fBodyAccJerk_mean_Z),
						  fBodyAccJerk_std_X=mean(fBodyAccJerk_std_X),fBodyAccJerk_std_Y=mean(fBodyAccJerk_std_Y),
						  fBodyAccJerk_std_Z=mean(fBodyAccJerk_std_Z),fBodyAccJerk_meanFreq_X=mean(fBodyAccJerk_meanFreq_X),
						  fBodyAccJerk_meanFreq_Y=mean(fBodyAccJerk_meanFreq_Y),fBodyAccJerk_meanFreq_Z=mean(fBodyAccJerk_meanFreq_Z),
						  fBodyGyro_mean_X=mean(fBodyGyro_mean_X),fBodyGyro_mean_Y=mean(fBodyGyro_mean_Y),
						  fBodyGyro_mean_Z=mean(fBodyGyro_mean_Z),fBodyGyro_std_X=mean(fBodyGyro_std_X),
						  fBodyGyro_std_Y=mean(fBodyGyro_std_Y),fBodyGyro_std_Z=mean(fBodyGyro_std_Z),
						  fBodyGyro_meanFreq_X=mean(fBodyGyro_meanFreq_X),fBodyGyro_meanFreq_Y=mean(fBodyGyro_meanFreq_Y),
						  fBodyGyro_meanFreq_Z=mean(fBodyGyro_meanFreq_Z),fBodyAccMag_mean=mean(fBodyAccMag_mean),
						  fBodyAccMag_std=mean(fBodyAccMag_std),fBodyAccMag_meanFreq=mean(fBodyAccMag_meanFreq),
						  fBodyBodyAccJerkMag_mean=mean(fBodyBodyAccJerkMag_mean),fBodyBodyAccJerkMag_std=mean(fBodyBodyAccJerkMag_std),
						  fBodyBodyAccJerkMag_meanFreq=mean(fBodyBodyAccJerkMag_meanFreq),fBodyBodyGyroMag_mean=mean(fBodyBodyGyroMag_mean),
						  fBodyBodyGyroMag_std=mean(fBodyBodyGyroMag_std),fBodyBodyGyroMag_meanFreq=mean(fBodyBodyGyroMag_meanFreq),
						  fBodyBodyGyroJerkMag_mean=mean(fBodyBodyGyroJerkMag_mean),fBodyBodyGyroJerkMag_std=mean(fBodyBodyGyroJerkMag_std),
						  fBodyBodyGyroJerkMag_meanFreq=mean(fBodyBodyGyroJerkMag_meanFreq)
						  )
    # Write the final tidy data set to a file
    write.table(df.full, file = "tidy_dataset.txt", row.names = FALSE)

    # Go back to the original working directory 
    setwd("..")
    # Now set locale to what it was before
    Sys.setlocale("LC_TIME", mySysLocale)
    return(paste("End of processing. Working directory: ", getwd()))
}









