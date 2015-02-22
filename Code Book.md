## Code Book

### Raw Data
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Tidy Data  
The result dataset has 68 variables (2 variables - subjectId and activity; 66 variables - features measures) and 180 rows and contains the average values of the following variables for all of the features:  
mean(): Mean value  
std(): Standard deviation  

Average values are grouped by each subject and activity.

Variable names were cleaned, removing non-alphabetic symbols, and using CamelCase notation.

#### Variables  
SubjectId  
Description: Id of the person, participated in experiment  
Values: 1-30  

Activity  
Description:  
Name of the activity, performed by person  
Values:  
WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING  

TimeBodyAccMeanX  
TimeBodyAccMeanY  
TimeBodyAccMeanZ  
TimeBodyAccStdX  
TimeBodyAccStdY  
TimeBodyAccStdZ  
Description: Average of the mean value and standard deviation for body motion acceleration signal (time domain signal from accelerometer, 3 axis)  
Values: [-1, 1]  

TimeGravityAccMeanX  
TimeGravityAccMeanY  
TimeGravityAccMeanZ  
TimeGravityAccStdX  
TimeGravityAccStdY  
TimeGravityAccStdZ  
Description: Average of the mean value and standard deviation for gravity acceleration signal (time domain signal from accelerometer, 3 axis)  
Values: [-1, 1] 

TimeBodyAccJerkMeanX  
TimeBodyAccJerkMeanY  
TimeBodyAccJerkMeanZ  
TimeBodyAccJerkStdX  
TimeBodyAccJerkStdY  
TimeBodyAccJerkStdZ  
Description: Average of the mean value and standard deviation for body linear acceleration of the Jerk signal (time domain signal from accelerometer, 3 axis)  
Values: [-1, 1]  

TimeBodyGyroMeanX  
TimeBodyGyroMeanY  
TimeBodyGyroMeanZ  
TimeBodyGyroStdX  
TimeBodyGyroStdY  
TimeBodyGyroStdZ  
Description: of the mean value and standard deviation for body motion acceleration signal (time domain signal from gyroscope, 3 axis)  
Values: [-1, 1]  

TimeBodyGyroJerkMeanX  
TimeBodyGyroJerkMeanY  
TimeBodyGyroJerkMeanZ  
TimeBodyGyroJerkStdX  
TimeBodyGyroJerkStdY  
TimeBodyGyroJerkStdZ  
Description: Average of the mean value and standard deviation for angular velocity of the Jerk signal (time domain signal from gyroscope, 3 axis)  
Values: [-1, 1]  

TimeBodyAccMagMean  
TimeBodyAccMagStd  
Description: Average of the mean value and standard deviation for body motion acceleration signal (time domain signal from accelerometer, magnitude of the three-dimensional signal)  
Values: [-1, 1]  

TimeGravityAccMagMean  
TimeGravityAccMagStd  
Description: Average of the mean value and standard deviation for gravity acceleration signal (time domain signal from accelerometer, magnitude of the three-dimensional signal)  
Values: [-1, 1]  

TimeBodyAccJerkMagMean  
TimeBodyAccJerkMagStd  
Description: Average of the mean value and standard deviation for body linear acceleration of the Jerk signal (time domain signal from accelerometer, magnitude of the three-dimensional signal)  
Values: [-1, 1]  

TimeBodyGyroMagMean  
TimeBodyGyroMagStd  
Description: Average of the mean value and standard deviation for body motion acceleration signal (time domain signal from gyroscope, magnitude of the three-dimensional signal)  
Values: [-1, 1]  

TimeBodyGyroJerkMagMean  
TimeBodyGyroJerkMagStd  
Description: Average of the mean value and standard deviation for angular velocity of the Jerk signal (time domain signal from gyroscope, magnitude of the three-dimensional signal)  
Values: [-1, 1]  

FreqBodyAccMeanX  
FreqBodyAccMeanY  
FreqBodyAccMeanZ  
FreqBodyAccStdX  
FreqBodyAccStdY  
FreqBodyAccStdZ  
Description: Average of the mean value and standard deviation for body motion acceleration signal (frequency domain signal from accelerometer, 3 axis)  
Values: [-1, 1]  

FreqBodyAccJerkMeanX  
FreqBodyAccJerkMeanY  
FreqBodyAccJerkMeanZ  
FreqBodyAccJerkStdX  
FreqBodyAccJerkStdY  
FreqBodyAccJerkStdZ  
Description: Average of the mean value and standard deviation for body linear acceleration of the Jerk signal (frequency domain signal from accelerometer, 3 axis)  
Values: [-1, 1]  

FreqBodyGyroMeanX  
FreqBodyGyroMeanY  
FreqBodyGyroMeanZ  
FreqBodyGyroStdX  
FreqBodyGyroStdY  
FreqBodyGyroStdZ  
Description: Average of the mean value and standard deviation for body motion acceleration signal (frequency domain signal from gyroscope, 3 axis)  
Values: [-1, 1]  

FreqBodyAccMagMean  
FreqBodyAccMagStd  
Description: Average of the mean value and standard deviation for body motion acceleration signal (frequency domain signal from accelerometer, magnitude of the three-dimensional signal)  
Values: [-1, 1]  
 
FreqBodyAccJerkMagMean  
FreqBodyAccJerkMagStd  
Description: Average of the mean value and standard deviation for body linear acceleration of the Jerk signal (frequency domain signal from accelerometer, magnitude of the three-dimensional signal) 
Values: [-1, 1]  

FreqBodyGyroMagMean  
FreqBodyGyroMagStd  
Description: Average of the mean value and standard deviation for body motion acceleration signal (frequency domain signal from gyroscope, magnitude of the three-dimensional signal)  
Values: [-1, 1]  
 
FreqBodyGyroJerkMagMean  
FreqBodyGyroJerkMagStd  
Description: Average of the mean value and standard deviation for angular velocity of the Jerk signal (time domain signal from gyroscope, magnitude of the three-dimensional signal)  
Values: [-1, 1]  

#### Transformation
There are the following steps, that were used for cleaning raw data:  
* For train and test data:  
  * Load dataset from "X_{train|test}.txt" file  
  * Load feature ids and names from "features.txt" file  
  * If there are any duplicates in features names, make unique names  
  * Use feature names for dataset as column names  
  * Select only columns, that have "std()" and "mean()" in column names  
  * Load activity ids for all observations for dataset from "y_{train|test}.txt" file  
  * Load mapping between activity ids and their names  
  * Merge activity ids for each observation with activity names  
  * Load subject ids from "subject_{train|test}.txt" file  
  * Create result dataset using data with subjects, activity names and experimental dataset  
* Merge train and test data rows  
* Change column names to CamelCase notation  
* Group data by subject and activity, calculate mean for all 66 variables, arrange result dataset by subject and activity
