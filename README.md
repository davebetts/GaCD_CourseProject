# GaCD_CourseProject
## Course project for Getting and Cleaning data

Data for this project are from a study of the body movement tracking software for the Samsung Galaxy S smartphone.  The data set and version of the data were selected by the instructors for the Getting and Cleaning Data course on Coursera.org.

If R has the working directory that is set to a branch of this github repo, the final tidy data set can be read into R using the following code:

...
data <- read.table("tidy_data.txt", header = TRUE)
data
...

## Project Objectives
* Combine multiple tables from the body movement tracking study into a single table of tidy data
* Subset the data reported from the study to those measurements reporting either the mean or standard deviations (std) of a measurement.
* Summarize the subset of data by taking the mean of observations for each participant-activity combination.

Not all of the data provided from the study were requested to be added to the final tidy data set

## Codebook
"CodeBook.md" contains:
* General instructions provided for the course project by the instructors
* Descriptions of the files used to create the final table of tidy data produced ("tidy_data.txt")
* Descriptions of the measurement variables (columns) and the observation event labels (rows) which are adaptations of data descriptions provided by the original data files provided for the project 

## Project data
The raw data downloaded for this project is found in both the "CP.zip" file and in the folder "UCI HAR Dataset"

## R-script
"run_analysis.R" can perform the following processes and transformations of the data:
Steps 1 and 2 can be skipped if the "UCI HAR Dataset" folder is available
1. Download the original data from the url provided by the course instructors
2. Unzip and read the raw data from the file "CP.zip"
3. Combine, subset and summarize the requested data into a single table, having the characteristics of a tidy data set.

## Final output vs. objectives
The description of tidy data provided by the course can be found in the lecture "Components of Tidy Data" from Week 1 of the Getting and Cleaning Data course.
This course project fulfils the characteristics of a tidy data project by including:
* The raw data ("CP.zip" or "UCI HAR Dataset")
* A tidy data set ("tidy_data.txt")
* A code book describing each variable and its values in the tidy data set. ("CodeBook.md")
* The explicit and exact recipe used to go from the raw data to the tidy data set ("run_analysis.R")

## Tidy data characteristics
"tidy_data.txt" has the characteristics of tidy data because:
* Each variable you measure should be in one column
  * There are no repeated column names
  * Each column contains the values for a single measurement
* Each different observation of that variable should be in a different row
  * Two columns of the table - the participant's number, and activity name - provide the row labels for each observation event.  
  * There is a row for each participant-activity combination, and no repetitions
* There should be one table for each "kind" of variable
  * all of the measurements have been summarised as a mean for each observation (row)
  * the data is normalized, therefore there are no units to report --> all of the units are equal
* The first row of "tidy_data.txt" contains the names of each variable
  * column names
* The variable names (column names) have been expanded to make them human readable.
  * Abbreviations were expanded to full words
  * Separate terms within each variable name were re-arranged to make it easier to read the movement type: in the X, Y or Z direction, Jerk movements, Gyroscope or Accelerometer readings, etc.
  * Columns were arranged in alphabetical order in order to improve readability of the data set as a whole by putting similar measurements next to each other.  
  * Column order also facilitates additional sub-setting of the variables in the future (e.g. all of the mean frequency data is grouped, and could be excluded with minimal effort)