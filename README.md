# UCI-HAR-Dataset

 The attached R script called run_analysis.R  does the following. 

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

It was done through the following steps:
- getting the features list
- obtaining test set data
- obtaining training set data
- merging data, subject and labels for both test and train sets
- merging test and train sets
- appropriately labeling the data set with descriptive variable names
- filtering only the measurements on the mean and standard deviation for each measurement
- naming the activities in the data set
- averaging of each variable for each activity and each subject
- writing the output file

The initial dataset included the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
