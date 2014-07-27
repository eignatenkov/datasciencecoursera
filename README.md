Description for runanalysis.R


1. the script reads data from x_test.txt and x_train.txt into two different dataframes.
2. It merges these two dataframes into one
3. It creates a vector that contains numbers of columns that we need
4. It leaves in dataframe only the columns that we need
5. It names the columns using the data from features.txt
6. It adds the column with the corresponding activity using data from y_train.txt and y_test.txt
7. It adds the column with the corresponding subject number using data from subject_train.txt and subject_test.txt
8. It splits dataframe by Subject and Activity and then calculates the mean for every variable for every element of the split list
9. It combines the data into matrix. Rows are Subject.Activity, columns are means for every variable for given combination of Subject and Activity.
10. It writes the data down into tidy_matrix.txt

