# Coursera  Getting and Cleaning Data Course Project
## Code Book

The source data for this project can be obtained from the link below:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The _README.txt_, _features.txt_ and _features_info.txt_ files contained in the downloadable 
zip file contain all the information regarding the origins of the data. This code book 
explains the transformation done with it and the structure of the result dataset.

The source files in the zip file are:
* _activity_labels.txt_: contains the codes used to label the activities and their respective names (strings)
6 files in two directories (test and train):
* _subject_test.txt, subject_train.txt_: these contain the code of the test subject for each observation 
* _X_test.txt, X_train.txt_: these contain the measurement data (561 measurements for each observation)
* _y_test.txt, y_train.txt_: these contain the activity code for each observation 

According to the project specifications the following steps were used to create the tidy dataset:

Out of the 561 measurements I have selected 79 measurements (or columns in data set terminology)
that contains either the mean or the standard deviation of a measured variable. I did not exclude 
the MeanFreq variables because these meet the criteria according to my interpretation.

This table contains the 79 selected column number and name based on the _features.txt_ naming 
convention with the following modifications:
* I removed the parentheses or "()"
* I replaced hyphens ("-" characters) with underscores (the "_" character). 

```
Column# Column Name
1   tBodyAcc-mean()-X
2   tBodyAcc-mean()-Y
3   tBodyAcc-mean()-Z
4   tBodyAcc-std()-X
5   tBodyAcc-std()-Y
6   tBodyAcc-std()-Z
41  tGravityAcc-mean()-X
42  tGravityAcc-mean()-Y
43  tGravityAcc-mean()-Z
44  tGravityAcc-std()-X
45  tGravityAcc-std()-Y
46  tGravityAcc-std()-Z
81  tBodyAccJerk-mean()-X
82  tBodyAccJerk-mean()-Y
83  tBodyAccJerk-mean()-Z
84  tBodyAccJerk-std()-X
85  tBodyAccJerk-std()-Y
86  tBodyAccJerk-std()-Z
121 tBodyGyro-mean()-X
122 tBodyGyro-mean()-Y
123 tBodyGyro-mean()-Z
124 tBodyGyro-std()-X
125 tBodyGyro-std()-Y
126 tBodyGyro-std()-Z
161 tBodyGyroJerk-mean()-X
162 tBodyGyroJerk-mean()-Y
163 tBodyGyroJerk-mean()-Z
164 tBodyGyroJerk-std()-X
165 tBodyGyroJerk-std()-Y
166 tBodyGyroJerk-std()-Z
201 tBodyAccMag-mean()
202 tBodyAccMag-std()
214 tGravityAccMag-mean()
215 tGravityAccMag-std()
227 tBodyAccJerkMag-mean()
228 tBodyAccJerkMag-std()
240 tBodyGyroMag-mean()
241 tBodyGyroMag-std()
253 tBodyGyroJerkMag-mean()
254 tBodyGyroJerkMag-std()
266 fBodyAcc-mean()-X
267 fBodyAcc-mean()-Y
268 fBodyAcc-mean()-Z
269 fBodyAcc-std()-X
270 fBodyAcc-std()-Y
271 fBodyAcc-std()-Z
294 fBodyAcc-meanFreq()-X
295 fBodyAcc-meanFreq()-Y
296 fBodyAcc-meanFreq()-Z
345 fBodyAccJerk-mean()-X
346 fBodyAccJerk-mean()-Y
347 fBodyAccJerk-mean()-Z
348 fBodyAccJerk-std()-X
349 fBodyAccJerk-std()-Y
350 fBodyAccJerk-std()-Z
373 fBodyAccJerk-meanFreq()-X
374 fBodyAccJerk-meanFreq()-Y
375 fBodyAccJerk-meanFreq()-Z
424 fBodyGyro-mean()-X
425 fBodyGyro-mean()-Y
426 fBodyGyro-mean()-Z
427 fBodyGyro-std()-X
428 fBodyGyro-std()-Y
429 fBodyGyro-std()-Z
452 fBodyGyro-meanFreq()-X
453 fBodyGyro-meanFreq()-Y
454 fBodyGyro-meanFreq()-Z
503 fBodyAccMag-mean()
504 fBodyAccMag-std()
513 fBodyAccMag-meanFreq()
516 fBodyBodyAccJerkMag-mean()
517 fBodyBodyAccJerkMag-std()
526 fBodyBodyAccJerkMag-meanFreq()
529 fBodyBodyGyroMag-mean()
530 fBodyBodyGyroMag-std()
539 fBodyBodyGyroMag-meanFreq()
542 fBodyBodyGyroJerkMag-mean()
543 fBodyBodyGyroJerkMag-std()
552 fBodyBodyGyroJerkMag-meanFreq()
```

I loaded the X_*.txt observation files and removed the unnecessary columns from the data sets then
joined the two data sets so that the first observations come from the test files, the subsequent 
observations from the train data set. I then joined the subject and activity data sets using the 
same method (these two only ocntain one column for each observation). Then I merged the three data 
sets and included the activity labels according to activity codes based on the code assignment 
described in the _activity_labels.txt_ file.

The results were grouped by activity and subject, then I summarised the data to get the average 
for each measurement. The final tidy data set was written to a text file.

The tidy data set was written with the R command  write.table() using row.name=FALSE. It is a delimited 
text file where the delimiter is the sapce (the " " character), the text qualifier is the " character 
and the decimal separator is the period (the "." character). The first line contains the column headers.

It contains the following columns:
```
Column Name	Description
Activity       The name of the activity performed when the measurement happened
Subject        The numeric code of the test subject 
```

Subsequent column names follow the conventions below:
* All values are numerical values, averages of the respectively named measurements grouped by activity and test subject
* prefix 't' indicates time domain signals
* prefix 'f' indicates frequency domain signals
* '_XYZ' is used to denote 3-axial signals in the X, Y and Z directions
* tBodyAcc-XYZ and tGravityAcc-XYZ are body and gravity acceleration signals respectively
* tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ areJ erk signals (time derived body linear acceleration and angular velocity signals)
* tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag are the magnitude of these three-dimensional signals, calculated using the Euclidean norm
* fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag are the results of a Fast Fourier Transform (FFT) of the respective signals
For further explanation refer to the _features.txt_ file in the source data.

```
Column Name	
tBodyAcc_mean_X	 
tBodyAcc_mean_Y	 
tBodyAcc_mean_Z	 
tBodyAcc_std_X	 
tBodyAcc_std_Y	 
tBodyAcc_std_Z	 
tGravityAcc_mean_X	 
tGravityAcc_mean_Y	 
tGravityAcc_mean_Z	 
tGravityAcc_std_X	 
tGravityAcc_std_Y	 
tGravityAcc_std_Z	 
tBodyAccJerk_mean_X	 
tBodyAccJerk_mean_Y	 
tBodyAccJerk_mean_Z	 
tBodyAccJerk_std_X	 
tBodyAccJerk_std_Y	 
tBodyAccJerk_std_Z	 
tBodyGyro_mean_X	 
tBodyGyro_mean_Y	 
tBodyGyro_mean_Z	 
tBodyGyro_std_X	 
tBodyGyro_std_Y	 
tBodyGyro_std_Z	 
tBodyGyroJerk_mean_X	 
tBodyGyroJerk_mean_Y	 
tBodyGyroJerk_mean_Z	 
tBodyGyroJerk_std_X	 
tBodyGyroJerk_std_Y	 
tBodyGyroJerk_std_Z	 
tBodyAccMag_mean	 
tBodyAccMag_std	 
tGravityAccMag_mean	 
tGravityAccMag_std	 
tBodyAccJerkMag_mean	 
tBodyAccJerkMag_std	 
tBodyGyroMag_mean	 
tBodyGyroMag_std	 
tBodyGyroJerkMag_mean	 
tBodyGyroJerkMag_std	 
fBodyAcc_mean_X	 
fBodyAcc_mean_Y	 
fBodyAcc_mean_Z	 
fBodyAcc_std_X	 
fBodyAcc_std_Y	 
fBodyAcc_std_Z	 
fBodyAcc_meanFreq_X	 
fBodyAcc_meanFreq_Y	 
fBodyAcc_meanFreq_Z	 
fBodyAccJerk_mean_X	 
fBodyAccJerk_mean_Y	 
fBodyAccJerk_mean_Z	 
fBodyAccJerk_std_X	 
fBodyAccJerk_std_Y	 
fBodyAccJerk_std_Z	 
fBodyAccJerk_meanFreq_X	 
fBodyAccJerk_meanFreq_Y	 
fBodyAccJerk_meanFreq_Z	 
fBodyGyro_mean_X	 
fBodyGyro_mean_Y	 
fBodyGyro_mean_Z	 
fBodyGyro_std_X	 
fBodyGyro_std_Y	 
fBodyGyro_std_Z	 
fBodyGyro_meanFreq_X	 
fBodyGyro_meanFreq_Y	 
fBodyGyro_meanFreq_Z	 
fBodyAccMag_mean	 
fBodyAccMag_std	 
fBodyAccMag_meanFreq	 
fBodyBodyAccJerkMag_mean	 
fBodyBodyAccJerkMag_std	 
fBodyBodyAccJerkMag_meanFreq	 
fBodyBodyGyroMag_mean	 
fBodyBodyGyroMag_std	 
fBodyBodyGyroMag_meanFreq	 
fBodyBodyGyroJerkMag_mean	 
fBodyBodyGyroJerkMag_std	 
fBodyBodyGyroJerkMag_meanFreq	 
```
