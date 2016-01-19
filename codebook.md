---
title: "codebook.md"
author: "squirrelpatrick"
date: "19 January 2016"
---

Readanalysis.R

Overview

This program is designed to work with the UCI Smartphone Data Set as described on http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
and to fulfil the following assignment

1. Merges the training and the test sets to create one data set.
2. Extracts columns containing mean and standard deviation for each measurement (Hint: Since some feature/column names are repeated, you may need to use the make.names() function in R)
3. Creates variables called ActivityLabel and ActivityName that label all observations with the corresponding activity labels and names respectively
4. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Objects
features        dataframe	561 obs. of 2 variables		    list of variable descriptions.
x_test		      dataframe	2947 obs. of 561 variables		experimental observations without 										                                                    descriptions / allocation to subject
x_train		      dataframe	7352 obs. of 561 variables		experimental observations without 										                                                    descriptions / allocation to subject
y_test		      dataframe	2947 obs. of 1 variable		    corresponding user activity to observations in 								                                            x_test
y_train		      dataframe	7352 obs. of 1 variable		    corresponding user activity to observations in 								                                            x_train
subject_test	  dataframe	2947 obs. of 1 variable		    corresponding subject identifier to observations                                                         in x_test
subject_train	  dataframe	7352 obs. of 1 variable		    corresponding subject identifier to observations                                                         in x_train
x		            dataframe	10299 obs. Of 563 variables	  combination of x_test, x_train, y_test, y_train, 								                                        features
activity_labels	dataframe	6 obs of 2 variables		      activity descriptions (to match y_test, y_train)
x1		          dataframe	10299 obs of 564 variables		combination of x and with lookup from 									                                                  activity_labels


Transformations

The x_train & x_test, and y_train and y_test sets are combined vertically with the rbind function to make an x and y set respectively.

The variable names are then added to x from features by use of the colnames() function.

The y and subject sets are then combined horizontally with x.

The final transformation to complete the merges is the activity descriptions, added with a left_join() function. The new column is reordered with an extract ( [] ) function.

This completes the merges in part(1).

The columns reflecting mean and standard deviation are then extracted using the select function. This completes parts(2) & (3).

Part (4) is completed by means of a summarise_each function with the data appropriately grouped.

Additional notes are supplied by comments in the script.

 
Outputs
The dataset requested in the first part of the assignment is given by x1.
The final dataset requested is given by x2.

