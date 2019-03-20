# Code book for Getting and Cleaning Data final project 

The main objective consists in creating a tidy data set with the average of each variable for each activity and each subject from independent txt files containing the results of different measurements of a given variable, a list of 30 subjects who performed 6 different activities. 

### Subjects

30 different subjects, list contained in "train/subject_train.txt" for train subjects and in "test/subject_test.txt" fir test subjects.

### Activities 

Activities performed by the subjects, 6 different activities (contained in "activity_labels.txt"): 

	1. `WALKING`
	2. `WALKING_UPSTAIRS`
	3. `WALKING_DOWNSTAIRS`
	4. `SITTING`
	5. `STANDING`
	6. `LAYING`
	
## Variables 

There are two main files: "train/X_train.txt" and "test/X_test.txt" for train and test samples respectively; they contain the results of the measurements of 561 different variables for 30 different subjects while performing 6 different activities (listed in the above section). 

All measurements for every feature are floating-point values, normalised and bounded within [-1,1]. Each feature vector is a row on the text file. 

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

The 561 different features measured over both training and test sets are listed in "features.txt" file. 

## Transformations 

The folder UCI HAR Dataset has been downloaded and unzipped. Then we read in the form of data table both test and train sets as well as related subjects and activity. Labelling different measurements for each variables with subjects and activity variables, we created a "testdataset" and a "traindataset" with 563 columns. The first 561 for each of the measured features and the last two columns for Activity and Subject. The two data tables have been merged into a "finaldataset" with the same structure but containing both train and test data. Then, the mean and standard deviation for each measurement were extracted using the functions "colMeans" and "colStdevs" (see the R script `run_analysis.R`). The values in the column Activity were replated with the descriptive names contained in "activity_labels.txt". Finally, from "finaldataset" a second, independent tidy data set was created with the average of each variable for each activity and each subject.

All these operations have been performed with an R script named `run_analysis.R`  (see also README.md` file).