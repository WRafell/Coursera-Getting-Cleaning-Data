# Project for the Getting and Cleaning Data course

## Overview
This project consists in the application of techniques for getting and cleaning data as learned in the Johns Hopkins Getting and Cleaning Data course, gettinga [**tidy data**](http://vita.had.co.nz/papers/tidy-data.html) as result.

The *raw data* is provided by the [**UCI Machine Learning Repository**](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), about the Human Activity Recognition Using Smartphones.

The *tidy data* is obtained after merging the training and testing sets and subjects, renaming the features in a 'more-easy-to-read' form, and naming the activities in the data. From the original data, only the feautures containing **Means** and **Standard Deviation** is subtracted.

## Project Summary
The files in the repository are the following:

#### The data files
There are two data files in two formats each: text file and csv file. The **tidy_data** files contain the result after cleaning the raw data. The **means_data** files contain the means of all the feautures in the tidy_data file per subject and per activity.

#### The script file
The **run_analysis.R** is the code that transforms the raw data into the tidy data explained above.

#### The Code Book
This file, **CodeBook.md**, indicates all the variables and summaries calculated, as required for the project.


> *Willmer Quiñones*


