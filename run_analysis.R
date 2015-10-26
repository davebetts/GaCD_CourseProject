####################################################
## Download data set
####################################################
## 

fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "CP.zip")
unzip("CP.zip")

####################################################
## Read measurement variables, observation labels, and participant (subject) labels from the "training" subset
####################################################
## 
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt", colClasses = "numeric", header = FALSE)

ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt", colClasses = "numeric", header = FALSE)
colnames(ytrain) <- "ID"

strain <- read.table("./UCI HAR Dataset/train/subject_train.txt", colClasses = "factor", header = FALSE)
colnames(strain) <- "participant"

####################################################
## Read variables, observation labels, and participant (subject) labels from the "testing" subset
####################################################
## 

xtest <- read.table("./UCI HAR Dataset/test/X_test.txt", colClasses = "numeric", header = FALSE)

ytest <- read.table("./UCI HAR Dataset/test/y_test.txt", colClasses = "numeric", header = FALSE)
colnames(ytest) <- "ID"

stest <- read.table("./UCI HAR Dataset/test/subject_test.txt", colClasses = "factor", header = FALSE)
colnames(stest) <- "participant"

####################################################
## Combine each of the following for training and testing subsets: variable values, activity labels, participant (subject) labels
####################################################
## 
full <- rbind(xtrain, xtest)
fullact <- rbind(ytrain, ytest)
fullsubj <- rbind(strain, stest)

####################################################
## Read measurment variable names
## Name columns of combined training and testing data frame with measurement variable names
####################################################
## 
feat <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
featnames <- as.vector(feat[,2])
colnames(full) <- featnames

####################################################
## Subset data frame to include ONLY measures of mean ("mean") and standard deviatin ("std")
####################################################
## 
mean_std_subset <- full[,c(grep("*mean", names(full)), grep("*std", names(full)))]

####################################################
## Combine training and testing subsets with observation labels for subject and activity
####################################################
## 
subj_act_full <- cbind(fullsubj, fullact, full)

####################################################
## Read descriptive activity labels
####################################################
## 
act_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", colClasses = "factor", header = FALSE)
colnames(act_labels) <- c("ID", "activity")

####################################################
## Replace activity numbers with descriptive activity labels
####################################################
## 
namedsubj_act_full <- merge(alabels, subj_act_full, by.x = "ID", by.y = "ID", all = TRUE)
namedsubj_act_full <- namedsubj_act_full[,c(3,2,4:82)]

####################################################
## Modify measurement variable names to a more human readable format
####################################################
## 
oldnames <- names(namedsubj_act_full)
newnames <- gsub("BodyBody", "Body", oldnames)
newnames <- gsub("tBodyAcc", "BodyAccelerometerTime", newnames)
newnames <- gsub("tGravityAcc", "GravityAccelerometerTime", newnames)
newnames <- gsub("tBodyGyro", "BodyGyroscopeTime", newnames)
newnames <- gsub("TimeJerk", "JerkTime", newnames)
newnames <- gsub("fBodyAcc", "BodyAccelerometerFrequency", newnames)
newnames <- gsub("fBodyGyro", "BodyGyroscopeFrequency", newnames)
newnames <- gsub("Mag", "Magnitude", newnames)
newnames <- gsub("FrequencyJerk", "JerkFrequency", newnames)
newnames <- gsub("TimeMagnitude", "MagnitudeTime", newnames)
newnames <- gsub("\\-mean\\(\\)\\-X", "_X_mean", newnames)
newnames <- gsub("\\-mean\\(\\)\\-Y", "_Y_mean", newnames)
newnames <- gsub("\\-mean\\(\\)\\-Z", "_Z_mean", newnames)
newnames <- gsub("\\-std\\(\\)\\-X", "_X_std", newnames)
newnames <- gsub("\\-std\\(\\)\\-Y", "_Y_std", newnames)
newnames <- gsub("\\-std\\(\\)\\-Z", "_Z_std", newnames)
newnames <- gsub("\\-mean\\(\\)", "_mean", newnames)
newnames <- gsub("\\-std\\(\\)", "_std", newnames)
newnames <- gsub("\\-meanFreq\\(\\)\\-X", "_X_meanFrequency", newnames)
newnames <- gsub("\\-meanFreq\\(\\)\\-Y", "_Y_meanFrequency", newnames)
newnames <- gsub("\\-meanFreq\\(\\)\\-Z", "_Z_meanFrequency", newnames)
newnames <- gsub("\\-meanFreq\\(\\)", "_meanFrequency", newnames)

colnames(namedsubj_act_full) <- newnames

####################################################
## Sort columns to assist with readability and to simplify the exclusion of frequency measurments
## if the client chooses to do so after the project is submitted
####################################################
## 
newsort <- namedsubj_act_full[,-c(1:2)]
newsort <- newsort[,sort(names(newsort))]

####################################################
## Summarize the mean of each measurement variable per activity-participant combination.
####################################################
## 

library(dplyr)
by_subj_act <- final %>% group_by(participant, activity)
tidy_data <- by_subj_act %>% summarise_each(funs(mean))
