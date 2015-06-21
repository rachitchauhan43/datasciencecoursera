#Introduction
The script run_analysis.R performs the 5 steps (as described in the course project's definition).
##Steps:
1.Merging the training and test sets
--1.1.Load the training sets and bind
--1.2.Load the test sets and bind
--1.3.Finally,Merging operation

2.Now extracting only mean and std related measurements(or columns).
3.Using descriptive activity names to name the activities in the data set.
4.Appropriately labelling the data set with descriptive variable names. 
5.From the data set in step 4 i have created independent tidy data set with the average of each variable for each  activity and each subject.


#Variables
1.train_X_tbl,train_Y,train_sub are training set variables constructed from training set files.
2.test_X_tbl,test_Y,test_sub are test set variables constructed from test set files.
3.merged_set is merged table for training and test data.
4.features variable contains list of features set.
5.Used activities character vector for replacing activity codes with descriptive names.
6.And finally,i have written the required tidy dataset to "final.txt".
