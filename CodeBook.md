# Getting and Cleaning Data Course Project

An analysis of data from the UCI Machine Learning Repository. The "Human Activity Recognition Using
 Smartphones Data Set" contains 10299 observations of 561 variables.

From the DataSet README.txt:
>==================================================================
>Human Activity Recognition Using Smartphones Dataset
>Version 1.0
>==================================================================
>Jorge L. ReyesOrtiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
>Smartlab  Non Linear Complex Systems Laboratory
>DITEN  Universit‡ degli Studi di Genova.
>Via Opera Pia 11A, I16145, Genoa, Italy.
>activityrecognition@smartlab.ws
>www.smartlab.ws
>==================================================================
>
>The experiments have been carried out with a group of 30 volunteers within an age bracket of 1948 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded Accelerometerelerometer and Gyroscopescope, we captured 3axial linear Accelerometereleration and 3axial angular velocity at a constant rate of 50Hz. The experiments have been videorecorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
>
>The sensor signals (Accelerometerelerometer and Gyroscopescope) were preprocessed by applying noise filters and then sampled in fixedwidth sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor Accelerometereleration signal, which has gravitational and body motion components, was separated using a Butterworth lowpass filter into body Accelerometereleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
>
>For each record it is provided:
>======================================
>
> Triaxial Accelerometereleration from the Accelerometerelerometer (total Accelerometereleration) and the estimated body Accelerometereleration.
> Triaxial Angular velocity from the Gyroscopescope. 
> A 561feature vector with time and frequency domain variables. 
> Its activity label. 
> An identifier of the subject who carried out the experiment.
>


For our purposes the data was trimmed to only include variables of TestSubject, Activity, and 
measurement data that calculated either a Mean or a StdDev deviation.

Test Subject:  an ID number to identify a specific test subject without revealing the person's name.

Activity: a character string to describe what the test subject was doing during the observation.
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

The following variables are based on the information from the original data set:

* timeBodyAccelerometerMeanX
* timeBodyAccelerometerMeanY
* timeBodyAccelerometerMeanZ
* timeBodyAccelerometerStdDevX
* timeBodyAccelerometerStdDevY
* timeBodyAccelerometerStdDevZ
* timeGravityAccelerometerMeanX
* timeGravityAccelerometerMeanY
* timeGravityAccelerometerMeanZ
* timeGravityAccelerometerStdDevX
* timeGravityAccelerometerStdDevY
* timeGravityAccelerometerStdDevZ
* timeBodyAccelerometerJerkMeanX
* timeBodyAccelerometerJerkMeanY
* timeBodyAccelerometerJerkMeanZ
* timeBodyAccelerometerJerkStdDevX
* timeBodyAccelerometerJerkStdDevY
* timeBodyAccelerometerJerkStdDevZ
* timeBodyGyroscopeMeanX
* timeBodyGyroscopeMeanY
* timeBodyGyroscopeMeanZ
* timeBodyGyroscopeStdDevX
* timeBodyGyroscopeStdDevY
* timeBodyGyroscopeStdDevZ
* timeBodyGyroscopeJerkMeanX
* timeBodyGyroscopeJerkMeanY
* timeBodyGyroscopeJerkMeanZ
* timeBodyGyroscopeJerkStdDevX
* timeBodyGyroscopeJerkStdDevY
* timeBodyGyroscopeJerkStdDevZ
* timeBodyAccelerometerMagnitudeMean
* timeBodyAccelerometerMagnitudeStdDev
* timeGravityAccelerometerMagnitudeMean
* timeGravityAccelerometerMagnitudeStdDev
* timeBodyAccelerometerJerkMagnitudeMean
* timeBodyAccelerometerJerkMagnitudeStdDev
* timeBodyGyroscopeMagnitudeMean
* timeBodyGyroscopeMagnitudeStdDev
* timeBodyGyroscopeJerkMagnitudeMean
* timeBodyGyroscopeJerkMagnitudeStdDev
* freqBodyAccelerometerMeanX
* freqBodyAccelerometerMeanY
* freqBodyAccelerometerMeanZ
* freqBodyAccelerometerStdDevX
* freqBodyAccelerometerStdDevY
* freqBodyAccelerometerStdDevZ
* freqBodyAccelerometerMeanFreqX
* freqBodyAccelerometerMeanFreqY
* freqBodyAccelerometerMeanFreqZ
* freqBodyAccelerometerJerkMeanX
* freqBodyAccelerometerJerkMeanY
* freqBodyAccelerometerJerkMeanZ
* freqBodyAccelerometerJerkStdDevX
* freqBodyAccelerometerJerkStdDevY
* freqBodyAccelerometerJerkStdDevZ
* freqBodyAccelerometerJerkMeanFreqX
* freqBodyAccelerometerJerkMeanFreqY
* freqBodyAccelerometerJerkMeanFreqZ
* freqBodyGyroscopeMeanX
* freqBodyGyroscopeMeanY
* freqBodyGyroscopeMeanZ
* freqBodyGyroscopeStdDevX
* freqBodyGyroscopeStdDevY
* freqBodyGyroscopeStdDevZ
* freqBodyGyroscopeMeanFreqX
* freqBodyGyroscopeMeanFreqY
* freqBodyGyroscopeMeanFreqZ
* freqBodyAccelerometerMagnitudeMean
* freqBodyAccelerometerMagnitudeStdDev
* freqBodyAccelerometerMagnitudeMeanFreq
* freqBodyBodyAccelerometerJerkMagnitudeMean
* freqBodyBodyAccelerometerJerkMagnitudeStdDevDev
* freqBodyBodyGyroscopeMagnitudeMean
* freqBodyBodyGyroscopeMagnitudeStdDev
* freqBodyBodyGyroscopeMagnitudeMeanFreq
* freqBodyBodyGyroscopeJerkMagnitudeMean
* freqBodyBodyGyroscopeJerkMagnitudeStdDev
* freqBodyBodyGyroscopeJerkMagnitudeMeanFreq
