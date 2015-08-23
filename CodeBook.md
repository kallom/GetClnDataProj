# Coursera  Getting and Cleaning Data Course Project
## Code Book

The source data for this project can be obtained from the link below:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The README.txt, features.txt and features_info.txt files contained in the downloadable 
zip file contain all the information regarding the origins of the data. This code book 
explains the transformation done with it and the structure of the result dataset.

The source files in the zip file are:
* activity_labels.txt: contains the codes used to label the activities and their respective names (strings)
6 files in two directories (test and train):
* subject_test.txt, subject_train.txt: these contain the code of the test subject for each observation 
* X_test.txt, X_train.txt: these contain the measurement data (561 measurements for each observation)
* y_test.txt, y_train.txt: these contain the activity code for each observation 

According to the project specifications the following steps were used to create the tidy dataset:

Out of the 561 measurements I have selected 79 measurements (or columns in data set terminology)
that contains either the mean or the standard deviation of a measured variable. I did not exclude 
the MeanFreq variables because these meet the criteria according to my interpretation.

This table contains the 79 selected column number and name based on the features.txt naming 
convention with the following modifications:
* I removed the parentheses or "()"
* I replaced hyphens ("-" characters) with underscores (the "_" character). 


Col #  Column Name 
1	tBodyAcc_mean_X 
2	tBodyAcc_mean_Y 
3	tBodyAcc_mean_Z 
4	tBodyAcc_std_X 
5	tBodyAcc_std_Y 
6	tBodyAcc_std_Z 
41	tGravityAcc_mean_X 
42	tGravityAcc_mean_Y 
43	tGravityAcc_mean_Z 
44	tGravityAcc_std_X 
45	tGravityAcc_std_Y 
46	tGravityAcc_std_Z 
81	tBodyAccJerk_mean_X 
82	tBodyAccJerk_mean_Y 
83	tBodyAccJerk_mean_Z 
84	tBodyAccJerk_std_X 
85	tBodyAccJerk_std_Y 
86	tBodyAccJerk_std_Z 
121	tBodyGyro_mean_X 
122	tBodyGyro_mean_Y 
123	tBodyGyro_mean_Z 
124	tBodyGyro_std_X 
125	tBodyGyro_std_Y 
126	tBodyGyro_std_Z 
161	tBodyGyroJerk_mean_X 
162	tBodyGyroJerk_mean_Y 
163	tBodyGyroJerk_mean_Z 
164	tBodyGyroJerk_std_X 
165	tBodyGyroJerk_std_Y 
166	tBodyGyroJerk_std_Z 
201	tBodyAccMag_mean 
202	tBodyAccMag_std 
214	tGravityAccMag_mean 
215	tGravityAccMag_std 
227	tBodyAccJerkMag_mean 
228	tBodyAccJerkMag_std 
240	tBodyGyroMag_mean 
241	tBodyGyroMag_std 
253	tBodyGyroJerkMag_mean 
254	tBodyGyroJerkMag_std 
266	fBodyAcc_mean_X 
267	fBodyAcc_mean_Y 
268	fBodyAcc_mean_Z 
269	fBodyAcc_std_X 
270	fBodyAcc_std_Y 
271	fBodyAcc_std_Z 
294	fBodyAcc_meanFreq_X 
295	fBodyAcc_meanFreq_Y 
296	fBodyAcc_meanFreq_Z 
345	fBodyAccJerk_mean_X 
346	fBodyAccJerk_mean_Y 
347	fBodyAccJerk_mean_Z 
348	fBodyAccJerk_std_X 
349	fBodyAccJerk_std_Y 
350	fBodyAccJerk_std_Z 
373	fBodyAccJerk_meanFreq_X 
374	fBodyAccJerk_meanFreq_Y 
375	fBodyAccJerk_meanFreq_Z 
424	fBodyGyro_mean_X 
425	fBodyGyro_mean_Y 
426	fBodyGyro_mean_Z 
427	fBodyGyro_std_X 
428	fBodyGyro_std_Y 
429	fBodyGyro_std_Z 
452	fBodyGyro_meanFreq_X 
453	fBodyGyro_meanFreq_Y 
454	fBodyGyro_meanFreq_Z 
503	fBodyAccMag_mean 
504	fBodyAccMag_std 
513	fBodyAccMag_meanFreq 
516	fBodyBodyAccJerkMag_mean 
517	fBodyBodyAccJerkMag_std 
526	fBodyBodyAccJerkMag_meanFreq 
529	fBodyBodyGyroMag_mean 
530	fBodyBodyGyroMag_std 
539	fBodyBodyGyroMag_meanFreq 
542	fBodyBodyGyroJerkMag_mean 
543	fBodyBodyGyroJerkMag_std 
552	fBodyBodyGyroJerkMag_meanFreq 
 

I loaded the X_*.txt observation files and removed the unnecessary columns from the data sets then
joined the two data sets so that the first observations come from the test files, the subsequent 
observations from the train data set. I then joined the subject and activity data sets using the 
same method (these two only ocntain one column for each observation). Then I merged the three data 
sets and included the activity labels according to activity codes based on the code assignment 
described in the activity_labels.txt file.

The results were grouped by activity and subject, then I summarised the data to get the average 
for each measurement. The final tidy data set was written to a text file.

The tidy data set was written with the R command  write.table() using row.name=FALSE. It is a delimited 
text file where the delimiter is the sapce (the " " character), the text qualifier is the " character 
and the decimal separator is the period (the "." character). The first line contains the column headers.

It contains the following columns:
¡¡¡
Column Name	Description
Activity       The name of the activity performed when the measurement happened
Subject        The numeric code of the test subject 
¡¡¡

Subsequent column names follow the conventions below:
* All values are numerical values, averages of the respectively named measurements grouped by activity and test subject
* prefix 't' indicates time domain signals
* prefix 'f' indicates frequency domain signals
* '_XYZ' is used to denote 3-axial signals in the X, Y and Z directions
* tBodyAcc-XYZ and tGravityAcc-XYZ are body and gravity acceleration signals respectively
* tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ areJ erk signals (time derived body linear acceleration and angular velocity signals)
* tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag are the magnitude of these three-dimensional signals, calculated using the Euclidean norm
* fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag are the results of a Fast Fourier Transform (FFT) of the respective signals
For further explanation refer to the features.txt file in the source data.


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

