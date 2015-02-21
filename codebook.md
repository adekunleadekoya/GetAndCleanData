 
##CodeBook for the tidy dataset

###Data source

This dataset is derived from the **"Human Activity Recognition Using Smartphones Data Set"** which was originally made available here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Feature Selection 

I refer you to the README and features.txt files in the original dataset to learn more about the feature selection for this dataset. And there you will find the following description:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals (e.g.tAcc-XYZ and tGyro-XYZ). These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

The reasoning behind my selection of features is that the assignment explicitly states "Extracts only the measurements on the mean and standard deviation for each measurement." To be complete, I included all variables having to do with mean or standard deviation.

In short, for this derived dataset, these signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## VARIABLES IN THE TIDY DATA SET
 activity.name<br/>
subject <br/>
tBodyAcc.mean.X <br/>
tBodyAcc.mean.Y <br/>
tBodyAcc.mean.Z <br/>
tBodyAcc.std.X <br/>
tBodyAcc.std.Y <br/>
tBodyAcc.std.Z <br/>
tGravityAcc.mean.X <br/>
tGravityAcc.mean.Y <br/>
tGravityAcc.mean.Z <br/>
tGravityAcc.std.X <br/>
tGravityAcc.std.Y <br/>
tGravityAcc.std.Z <br/>
tBodyAccJerk.mean.X <br/>
tBodyAccJerk.mean.Y <br/>
tBodyAccJerk.mean.Z <br/>
tBodyAccJerk.std.X  <br/>
tBodyAccJerk.std.Y  <br/>
tBodyAccJerk.std.Z <br/>
tBodyGyro.mean.X <br/>
tBodyGyro.mean.Y <br/>
tBodyGyro.mean.Z <br/>
tBodyGyro.std.X <br/>
tBodyGyro.std.Y <br/>
tBodyGyro.std.Z <br/>
tBodyGyroJerk.mean.X  <br/>
tBodyGyroJerk.mean.Y <br/>
tBodyGyroJerk.mean.Z <br/>
tBodyGyroJerk.std.X <br/>
tBodyGyroJerk.std.Y <br/>
tBodyGyroJerk.std.Z <br/>
tBodyAccMag.mean <br/>
tBodyAccMag.std <br/>
tGravityAccMag.mean <br/>
tGravityAccMag.std <br/>
tBodyAccJerkMag.mean <br/>
tBodyAccJerkMag.std <br/>
tBodyGyroMag.mean <br/>
tBodyGyroMag.std <br/>
tBodyGyroJerkMag.mean <br/>
tBodyGyroJerkMag.std <br/>
fBodyAcc.mean.X  <br/>
fBodyAcc.mean.Y <br/>
fBodyAcc.mean.Z <br/>
fBodyAcc.std.X <br/>
fBodyAcc.std.Y <br/>
fBodyAcc.std.Z <br/>
fBodyAccJerk.mean.X  <br/>
fBodyAccJerk.mean.Y <br/>
fBodyAccJerk.mean.Z <br/>
fBodyAccJerk.std.X <br/>
fBodyAccJerk.std.Y <br/>
fBodyAccJerk.std.Z <br/>
fBodyGyro.mean.X <br/>
fBodyGyro.mean.Y <br/>
fBodyGyro.mean.Z <br/>
fBodyGyro.std.X <br/>
fBodyGyro.std.Y <br/>
fBodyGyro.std.Z <br/>
fBodyAccMag.mean <br/>
fBodyAccMag.std <br/>
fBodyAccJerkMag.mean <br/>
fBodyAccJerkMag.std <br/>
fBodyGyroMag.mean <br/>
fBodyGyroMag.std <br/>
fBodyGyroJerkMag.mean <br/>
fBodyGyroJerkMag.std <br/>

The set of variables that were estimated (and kept for this assignment) from these signals are:

    

- mean(): Mean value   
- std(): Standard deviation

Note: features are normalized and bounded within [-1,1].

The resulting variable names are of the following form: 



- tBodyAcc.mean.X, which means the mean value of  tBodyAcc-mean()-X for all measurements taken for every activity,subject pair.
-  tGravityAcc.std.Y  which means the mean value of    tGravityAcc-std()-Y for all measurements taken for every activity,subject pair.
- fBodyGyroJerkMag.mean  which means the mean value of   fBodyBodyGyroJerkMag-mean() for all measurements taken for every activity,subject pair.