# Assignment 

# The goal of your project is to predict the manner in which they did the exercise. This is the "classe" variable in the training set. You may use any of the other variables to predict with. You should create a report describing how you built your model, how you used cross validation, what you think the expected out of sample error is, and why you made the choices you did. You will also use your prediction model to predict 20 different test cases.


# load useful packages

library(caret)
library(rpart)
library(randomForest)

# download training and testing dataset 

fileUrl1 <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
download.file(fileUrl1,destfile = "train.csv",method="curl")
training <- read.csv("train.csv")

fileUrl2 <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"
download.file(fileUrl2,destfile = "test.csv",method="curl")
testing <- read.csv("test.csv")

# first look at the datasets 

dim(training)
names(training)
# head(training), omitted to shorten the final html file 

dim(testing)
names(testing)
# head(testing), omitted to shorten the final html file 

# clean the dataset and make a first selection of potential predictors among names 

training<-training[,colSums(is.na(training)) == 0]
training <- training[,c(8:93)]

testing <-testing[,colSums(is.na(testing)) == 0]
testing <- testing[,c(8:59)]

# subset training dataset for training with "subtrain" and cross validating the model with "subtest"

inTrain <- createDataPartition(y=training$classe,p=0.6,list=FALSE)

subtrain <- training[inTrain,]
subtest <- training[-inTrain,]

# machine learining algorithms are still too slow (or do not converge) when applied over "subtrain"
# further cleaning: eliminate those columns with mean = NA 

subsubtrain <- subtrain[,!is.na(sapply(subtrain,mean))]
subsubtrain $ classe <- subtrain $ classe
dim(subsubtrain)

# first model: Recursive Partitioning And Regression Trees

model1 <- rpart(classe ~ ., data=subsubtrain, method="class")
prediction1 <- predict(model1, subtest, type = "class")
qplot(classe, prediction1, data=subtest, geom = c("boxplot", "jitter"), main = "predicted vs. observed in validation data", xlab = "Observed Classe", ylab = "Predicted Classe")
confusionMatrix(prediction1,subtest$classe)

# model1 has a 74.43 % accuracy and 0.2557 out-of-sample error, let's try a random forest model to improve the predictive power of our model 


# second model: Classification And Regression With Random Forest

model2 <- randomForest(classe ~ ., data=subsubtrain, method="class")
prediction2 <- predict(model2, subtest, type = "class")
qplot(classe, prediction2, data=subtest, geom = c("boxplot", "jitter"), main = "predicted vs. observed in validation data", xlab = "Observed Classe", ylab = "Predicted Classe")
confusionMatrix(prediction2,subtest$classe)

# model2 performs much better, with a 99.39 % accuracy and 0.0061 out-of-sample error!!

# Let's predict the values of the "classe" variable applying our machine learining algorithm (model2) over the 20 test cases 

prediction <- predict(model2, testing, type="class")

