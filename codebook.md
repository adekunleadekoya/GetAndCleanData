 
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
01	activity.name<br/>
02	subject <br/>
03	tBodyAcc.mean.X <br/>
04	tBodyAcc.mean.Y <br/>
05	tBodyAcc.mean.Z <br/>
06	tBodyAcc.std.X <br/>
07	tBodyAcc.std.Y <br/>
08	tBodyAcc.std.Z <br/>
09	tGravityAcc.mean.X <br/>
10	tGravityAcc.mean.Y <br/>
11	tGravityAcc.mean.Z <br/>
12	tGravityAcc.std.X <br/>
13	tGravityAcc.std.Y <br/>
14	tGravityAcc.std.Z <br/>
15	tBodyAccJerk.mean.X <br/>
16	tBodyAccJerk.mean.Y <br/>
17	tBodyAccJerk.mean.Z <br/>
18	tBodyAccJerk.std.X  <br/>
19	tBodyAccJerk.std.Y  <br/>
20	tBodyAccJerk.std.Z <br/>
21	tBodyGyro.mean.X <br/>
22	tBodyGyro.mean.Y <br/>
23	tBodyGyro.mean.Z <br/>
24	tBodyGyro.std.X <br/>
25	tBodyGyro.std.Y <br/>
26	tBodyGyro.std.Z <br/>
27	tBodyGyroJerk.mean.X  <br/>
28	tBodyGyroJerk.mean.Y <br/>
29	tBodyGyroJerk.mean.Z <br/>
30	tBodyGyroJerk.std.X <br/>
31	tBodyGyroJerk.std.Y <br/>
32	tBodyGyroJerk.std.Z <br/>
33	tBodyAccMag.mean <br/>
34	tBodyAccMag.std <br/>
35	tGravityAccMag.mean <br/>
36	tGravityAccMag.std <br/>
37	tBodyAccJerkMag.mean <br/>
38	tBodyAccJerkMag.std <br/>
39	tBodyGyroMag.mean <br/>
40	tBodyGyroMag.std <br/>
41	tBodyGyroJerkMag.mean <br/>
42	tBodyGyroJerkMag.std <br/>
43	fBodyAcc.mean.X  <br/>
44	fBodyAcc.mean.Y <br/>
45	fBodyAcc.mean.Z <br/>
46	fBodyAcc.std.X <br/>
47	fBodyAcc.std.Y <br/>
48	fBodyAcc.std.Z <br/>
49	fBodyAccJerk.mean.X  <br/>
50	fBodyAccJerk.mean.Y <br/>
51	fBodyAccJerk.mean.Z <br/>
52	fBodyAccJerk.std.X <br/>
53	fBodyAccJerk.std.Y <br/>
54	fBodyAccJerk.std.Z <br/>
55	fBodyGyro.mean.X <br/>
56	fBodyGyro.mean.Y <br/>
57	fBodyGyro.mean.Z <br/>
58	fBodyGyro.std.X <br/>
59	fBodyGyro.std.Y <br/>
60	fBodyGyro.std.Z <br/>
61	fBodyAccMag.mean <br/>
62	fBodyAccMag.std <br/>
63	fBodyAccJerkMag.mean <br/>
64	fBodyAccJerkMag.std <br/>
65	fBodyGyroMag.mean <br/>
66	fBodyGyroMag.std <br/>
67	fBodyGyroJerkMag.mean <br/>
68	fBodyGyroJerkMag.std <br/>

The set of variables that were estimated (and kept for this assignment) from these signals are:

    

- mean(): Mean value   
- std(): Standard deviation

Note: features are normalized and bounded within [-1,1].

The resulting variable names are of the following form: 

- **tBodyAcc.mean.X**, which means the mean value of  **tBodyAcc-mean()-X** for all measurements taken for every activity,subject pair.
-  **tGravityAcc.std.Y**  which means the mean value of    **tGravityAcc-std()-Y** for all measurements taken for every activity,subject pair.
- **fBodyGyroJerkMag.mean**  which means the mean value of   **fBodyBodyGyroJerkMag-mean()** for all measurements taken for every activity,subject pair.

Two additional variables that were part of the tidy data set but that are  not features  are as follow :  

-  **activity.name**  : a categorical variable representing the **6** types of activities performed by the subjects in the experiment
- **subject** - a numerically coded variable representing the **30** individuals that took part in the experiment. This variable takes integer values  between 1 and 30 inclusive

## ACTIVITY TYPES

The subjects in the experiment that gave rise to the dataset described herein took all the activities defined herein-under:

- 1 WALKING
- 2 WALKING_UPSTAIRS
- 3 WALKING_DOWNSTAIRS
- 4 SITTING
- 5 STANDING
- 6 LAYING

##TRANSFORMATION : RAW DATASET TO TIDY DATASET

For details about the transformation,see the file [https://github.com/adekunleadekoya/GetAndCleanData/blob/master/README.md](https://github.com/adekunleadekoya/GetAndCleanData/blob/master/README.md)

