---
title: "readme"
author: "squirrelpatrick"
date: "19 January 2016"
---

README.md

RunAnalysis.R completes the following assignment:

*******************************************************************
You should create one R script called run_analysis.R that does the following.
1. Merges the training and the test sets to create one data set.
2. Extracts columns containing mean and standard deviation for each measurement (Hint: Since some feature/column names are repeated, you may need to use the make.names() function in R)
3. Creates variables called ActivityLabel and ActivityName that label all observations with the corresponding activity labels and names respectively
4. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
*******************************************************************
Section 1 is accomplished by means of first combining the train and test datasets with rbind()
Combining the resulting and other sets with cbind(), colnames() and left_join() to create a tidy dataset with variable names.
Sections 2&3 are accomplished with a select() function.
Section 4 is accomplished with a group_by and summarise_each function.
Further documentation is available on codebook.md
