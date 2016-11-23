##Step 1 - Load required packages

library(data.table)
library(plyr)
library(knitr)

##Step 2 - download the zip file from the url
fileUrl<- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./Dataset.zip", mode="wb")

##Step 3 - unzip the file and save it into folder
unzip(zipfile="./Dataset.zip")
list.files("UCI HAR Dataset", recursive=TRUE)

##Step 4 - Read necessary files into the table
get_data<- {setwd("./UCI HAR Dataset/train")
dActivityTrain<- read.table("./y_train.txt", header=FALSE)
dSubjectTrain<- read.table("./subject_train.txt", header= FALSE)
dFeaturesTrain<- read.table("./X_train.txt", header=FALSE)          
setwd("../")
setwd("./test")
dActivityTest <- read.table("./y_test.txt", header=FALSE)
dSubjectTest <- read.table("./subject_test.txt", header=FALSE)
dFeaturesTest<- read.table("./X_test.txt", header=FALSE) 
setwd("../")
setwd("../")}

##Step 5 - Combine Train and Test datasets
dSubject<- rbind(dSubjectTrain, dSubjectTest)
dActivity<- rbind(dActivityTrain, dActivityTest)
dFeatures<- rbind(dFeaturesTrain, dFeaturesTest)

##Step 6 - Assign appropriate names for the activity and subject
names(dSubject)<- "Subject"
names(dActivity)<- "Activity"

##Step 7 - read the column name dataset and assign it to the Features table column names
dFeaturesNames <- read.table(("./UCI HAR Dataset/features.txt"),head=FALSE)
head(dFeaturesNames)
names(dFeatures) <- dFeaturesNames$V2 

##Step 8 - Combine the Subject, Activity and the features dataset
SubjectActivity<- cbind(dSubject, dActivity)
Data<- cbind(dFeatures, SubjectActivity)

##Step 9 - Select only the mean and standard deviaion column names
sdFeaturesNames<-dFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dFeaturesNames$V2)]
selectedNames<-c(as.character(sdFeaturesNames), "Subject", "Activity" )

##Step 10 - Select the data of only those selected column names
Data<-subset(Data,select=selectedNames)

##Step 11 - Read Activity labels file and assign the Activity names
activityNames<- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activityNames)<- c("Activity", "ActivityName")
activity<- factor(Data$Activity,
                  levels=c(1:6),
                  labels= activityNames$ActivityName)
Data$Activity<- activity
head(Data$Activity, 40)

##Step 12 - Assign appropriate names for the column names.
names(Data)
names(Data)<- gsub("^t", "time", names(Data))
names(Data)<- gsub("^f", "frequency", names(Data))
names(Data)<- gsub("Acc", "Accelerometer", names(Data))
names(Data)<- gsub("Gyro", "Gyroscope", names(Data))
names(Data)<- gsub("Mag", "Magnitude", names(Data))
names(Data)<- gsub("BodyBody", "Body", names(Data))
names(Data)<- gsub("std", "SD", names(Data))
names(Data)<- gsub("mean", "Mean", names(Data))
Data2<-aggregate(. ~Subject + Activity, Data, mean) 

##Step 13 - Write the data back into a text file
write.table(Data2,"./Final Data.txt")
