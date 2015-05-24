#getting the features list
features <- read.table("UCI HAR Dataset/features.txt")

#obtaining test set data
test.set <- read.table("UCI HAR Dataset/test/X_test.txt")
test.subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
test.labels <- read.table("UCI HAR Dataset/test/y_test.txt")

#obtaining training set data
train.set <- read.table("UCI HAR Dataset/train/X_train.txt")
train.subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
train.labels <- read.table("UCI HAR Dataset/train/y_train.txt")

#merging data, subject and labels for both test and train sets
test.all <- cbind(test.set, test.subject, test.labels)
train.all <- cbind(train.set, train.subject, train.labels)

#merging test and train sets
merged.set <- rbind(test.all, train.all)
#appropriately labeling the data set with descriptive variable names
colnames(merged.set) <- c(as.vector(features$V2), "subject", "labels")

#filtering only the measurements on the mean and standard deviation for each measurement
filtered.set <- merged.set[c(as.vector(features[grep("mean|std",as.vector(features$V2)), 2]),"subject", "labels")]

#naming the activities in the data set
activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt")
act.set <- merge(x = filtered.set, y = activity.labels, by.x = "labels", by.y = "V1")
act.set$labels <- NULL
colnames(act.set)[length(act.set)] <- "activity"

#average of each variable for each activity and each subject
agg.set <- aggregate(x = act.set[, -c(length(act.set) - 1, length(act.set))], by = list(act.set$subject, act.set$activity), FUN = mean)
colnames(agg.set)[1] <- "subject"
colnames(agg.set)[2] <- "activity"

write.table(agg.set, file = "output.txt", row.names= FALSE)
