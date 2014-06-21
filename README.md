Getting and Cleaning Data - Project 1 READ ME
========================================================

Introduction/Assignment
-----------------------

You should create one R script called run_analysis.R that does the following.  

1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.   
3. Uses descriptive activity names to name the activities in the data set.  
4. Appropriately labels the data set with descriptive variable names.   
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

Good luck!

Repository Contents
-------------------
1. README.md - this file which describes general processing information and rationale.
2. CodeBook.md - a brief explanation of the variables and data used.
3. run_analysis.R - the code file to execute the download, import, manipulation, and export of the resulting tidy data set. Note that this file could hypothetically be run in a fresh directory and as long as the libraries were present and it has internet access it should successfully produce final code.
4. Data folder - this folder contains:  
  *Downloaded zip file (SamsungData.zip)   
  *Expanded raw data files (UCI HAR Data)   
  *Exported tidy data set (SubjectActivityMeans.txt)   
  

Original Data
-------------
Original data was acquired from the course referenced URL, https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  The script also downloads and extracts this file to a data directory.

Processing Steps
----------------

### Step 1  
The first thing I did was download and extract the data.  The code does not check for the existence of the data (it will refresh it if it is already there) but it does create a data directory if it doesn't exist to host all the files.  Once it is downloaded the code unzips the downloaded file to the data subdirectory.

### Step 2  
After the file is extracted, I use the read.table function to bring in the various data sets.  I bring in the three training data sets as train, train.activity, and train.subject (the .notation helps me know that these are parts of the larger data set) and perform the same import on the test data files.  I am using the read.table function because it handles these formats (fixed width/variable-space separations) better than other methods I tried first.

The next thing I do is take the three training sets and the three testing sets and rbind them together.  This gives me three data tables of identical length that I can continue to work with.  After these are concatenated, I remove the interim test and training data from the workspace to preserve memory space.

### Step 3  
Because we have been supplied with a mapping file for activities, the next step is to replace the numeric values with the appropriate activity names.  I do this manually by simply replacing by filtered indices.  We are also supplied with a labels file (features.txt) and I read this into a vector and apply it as the column names for the concatenated data set.  It is at this time that I also attach the vectors containing the composite activities and subjects.

At this point, I have a processed data set.  It has not been trimmed down and the column categories are not 100% "R-friendly" but they match the names used for the features.  This data table can be used as the basis for further investigation or analysis.

### Step 4  
One of the assignment requirements is to filter out the total "wide" data set into something more selective and narrowly focused.  Specifically, we are to find all the means and standard deviations and extract those values into a new data set.  To accomplish this, I simply grepped the column names for the words mean and std, making some allowances for capitalization and excluding meanFrequencies (I assumed these were not actually means per se), and applied it as a column index filter.  After that I appended directly the Activity and Subject tables again, but I had to unlist them in order for them to behave as vectors instead of lists.  This became important for later reshaping steps.

### Step 5  
Some of the forums talk about "R-friendly" column names, so I decided to apply a variety of gsub applications to remove the parenthesis and commas and replace them with hyphens, and then to eliminate duplicate or trailing hyphens for legibility.  This step is optional and a little subjective, but I ended up with slightly more attractive variable names and ones that will be easier to manage in later analysis.

### Step 6
A final requirement of the assignment was to generate a new data set composed of the mean values by Activity and Subject for each of the variables in the reduced data set above.  To accomplish this, I loaded the reshape2 library so I could use the ment and cast functionality we reviewed in class lecture.  This speaks to my experience with BI "fact" tables and also seems like the proper / most effective way to do this.  By melting and casting I am able to generate the file and save it to the data directory for upload to the web site.
