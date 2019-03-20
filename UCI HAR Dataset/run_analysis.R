# Read the features file to label different measurements 

features <- read.table( "features.txt", as.is = TRUE)

# Read train file, train activities and subjects 

train <- read.table("train/X_train.txt",col.names = features[, 2])
trainsub <- read.table("train/subject_train.txt",col.names=c('Subject'))
trainy <- read.table("train/y_train.txt",col.names=c('Activity'))

# Read test file, test activities and subjects 

test <- read.table("test/X_test.txt",col.names = features[, 2])
testsub <- read.table("test/subject_test.txt",col.names=c('Subject'))
testy <- read.table("test/y_test.txt",col.names=c('Activity'))

# Merge train and test results for different measured variables, subjects and activities and form a finaldataset including both train and test dataset

traindataset <- cbind(train, trainy,trainsub)
testdataset <- cbind(test, testy, testsub)

finaldataset <- rbind(testdataset,traindataset)

# Compute mean and std for all the measured variables 

library('fBasics')

colMeans(subset(finaldataset, select = c(1:561)),na.rm=T)
colStdevs(meas,na.rm=T)

library(plyr)

act1 <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
act2 <- c("1","2","3","4","5","6")

# Name different activities   

for(i in 1:6){
  
finaldataset $ Activity <- replace(finaldataset $ Activity, finaldataset $ Activity == act2[i], act1[i])

}

# Create a tidy dataset containing the mean of each measured variables for each subject for all the activities performed 


meandf <- data.frame(matrix(ncol = 563, nrow = 0))
x <- names(finaldataset)
colnames(meandf) <- x
r <- c(1)

for(i in 1:30){
  for(j in act1){
    meandf[r,][,1:561] <- colMeans(finaldataset[finaldataset $ Activity == j & finaldataset $ Subject == i,][,1:561],na.rm=T)
    meandf[r,][,562] <- c(j)
    meandf[r,][,563] <- c(i)
    r <- r+1 
    
    
    }
}

# Write meandf into a txt file

write.table(meandf,"meandf.txt",row.names=FALSE)




