Data Set Information

The database contains information about the experiments that have been carried out with a group of 30 volunteers. Data was captured by a smartphone that people were wearing on their waists wgile performing 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).Using the smartphone's accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Description of the DATA

Time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. Example of variables: tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, and etc.

The set of variables that were estimated from these signals are:

mean(): Mean value

std(): Standard deviation

Description of abbreviations of measurements

leading t or f is based on time or frequency measurements. Body = related to body movement. Gravity = acceleration of gravity Acc = accelerometer measurement Gyro = gyroscopic measurements Jerk = sudden movement acceleration Mag = magnitude of movement mean and SD are calculated for each subject for each activity for each mean and SD measurements.