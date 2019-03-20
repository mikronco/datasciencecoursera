# Getting and Cleaning Data final project

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



The repository contains the following files:

- `run_analysis.R`
- `README.md`
- `code_book.md`
- `meandf.txt`

## Project description 

The source data set that this project was based on was obtained from the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#), which describes how the data was initially collected as follows:

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
> 
> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Training and test data were merged together to create one data set ("finaldataset"), then the measurements on the mean and standard deviation were computed for each feature measured. From the "finaldataset", a second, independent tidy data set was created with the average of each variable for each activity and each subject.

## Creating the final data set with mean values 

The R script `run_analysis.R` can be used to create the "meandf" data set. It reads the source data set and transforms it to produce the final data set with the following steps:

1. Read data.
2. Merge the training and the test sets to create one data set, called "finaldataset";
3. Calculate the mean and the std for the measurements of each feature;
4. Use descriptive activity names to name the activities in the data set;
5. Create a second, independent tidy set ("meandf") with the average of each variable for each activity and each subject;
6. The "meandf" data fram was written into a "meandf.txt" file. 

To perform the above steps the following packages have been used: 

1. fBasics
2. plyr
