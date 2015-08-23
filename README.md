# Coursera  Getting and Cleaning Data Course Project
## Read Me file

#TODO:
* replace <<-

###Notes:

The script checks if there's a data subdirectory in the working directory and 
creates it if there isn't. At the first run it will download the dataset and 
unzip it to the data subdirectiry. At each step the script will check whether the 
downloaded ZIP file and the directory 'UCI HAR Dataset' exist. If they do it skips
the respective step (to save time on subsequent runs).

Since the training and test data have the same structure it is reasonable to 
first getting rid of the unnecessary columns from the datasets and only then 
uniting the test and training data.

There are 79 variables in X_test and X_train files that contain mean or std data.
These are subsetted after the files are loaded, then the two data frames are 
joined (test first).

The same steps are done with the subject and activity files (except the subsetting, 
which is not needed since these files only contain 1 column of data).
Then the three resulting rowbound data frames are merged column-wise and this data 
frame is merged with the activity label data read from the activity_labels.txt file
to create a column which contains activity names instead of numerical activity codes.


The results were grouped by activity and subject, then the data were summarised  
to get the average for each measurement. 

The final tidy data set was written to a text file.

This repository contains: 

1) a tidy data set as per specifications (tidy_dataset.txt), 
2) the script for performing the analysis (run_analysis.R), and 
3) a code book that describes the variables, the data, and any transformations
or work that I performed to clean up the data called CodeBook.md. 

The R script called run_analysis.R that does the following. 

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for 
	   each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names. 
    5. From the data set in step 4, creates a second, independent tidy data 
	   set with the average of each variable for each activity and each subject.

