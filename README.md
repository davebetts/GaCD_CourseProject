# GaCD_CourseProject
Course project for Getting and Cleaning data

Data for this project are from a study of the body movement tracking software for the Samsung Galaxy S smartphone.  The data set and version of the data were selected by the Getting and Cleaning course instructors.

## Project Objectives
Combine multiple tables from the body movement tracking study into a single table of tidy data
Subset the data reported from the study to those measurements reporting either the mean or standard deviations (std) of a measurement.
Summarize the subset of data by taking the mean of observations for each participant-activity combination.
Not all of the data provided from the study were requested to be added to the final tidy data set

## Codebook
"CodeBook.md" contains:
- General instructions provided for the course project by the instructors
- Descriptions of the files used to create the final table of tidy data produced ("tidy_data.txt")
- Descriptions of the measurement variables (columns) and the observation event labels (rows) which are adaptations of data descriptions provided by the original data files provided for the project 

## Project data
The raw data downloaded for this project is found in "CP.zip" and in the folder "UCI HAR Dataset"

## R-script
"run_analysis.R" can perform the following processes and transformations of the data:
Steps 1 and 2 can be skipped if the "UCI HAR Dataset" folder is available
1. Download the original data from the url provided by the course instructors (This step is not necessary if the file "CP.zip" is present in the working directory)
2. Unzip and read the raw data from the file "CP.zip"
3. Combine, subset and summarize the requested data into a single table, having the characteristics of a tidy data set.

## Final output vs. objectives
The description of tidy data provided by the course can be found in the lecture "Components of Tidy Data" from Week 1 of the Getting and Cleaning Data course.
This course project fulfils the characteristics of a tidy data project by including:
1. The raw data ("CP.zip" and "UCI HAR Dataset")
2. A tidy data set ("tidy_data.txt")
3. A code book describing each variable and its values in the tidy data set. ("CodeBook.md")
4. The explicit and exact recipe used to go from the raw data to the tidy data set ("run_analysis.R")

"tidy_data.txt" has the characteristics of tidy data because:
1. Each variable you measure should be in one column (There are no repeated columns and each column contains the values for a single measurement)
2. Each different observation of that variable should be in a different row (Two columns of the table - the particpant's number, and activity name - provide the row labels for each observation event.  There is a row for each participant-activity combination, and no repetitions.)
3. There should be one table for each "kind" of variable ("tidy_data.txt" contains mean values of the normalized data - i.e. all of the measurements have been summarised as a mean, and the units of measurement are equal)
4. The first row of "tidy_data.txt" contains the names of each variable (column names)
5. The variable names (column names) have been expanded to make them human readable.