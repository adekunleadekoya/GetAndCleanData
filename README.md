# COURSE PROJECT Getting and Cleaning Data


The Course Project is an important component of this course and most of the other courses in the Data Science Specialization. Course Projects are usually evaluated and graded through peer assessment.

The purpose of this project is to demonstrate my  ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis

## INSTRUCTIONS

Here are the data for the project:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

I have created an R script called R_ANALYSIS.R that does the following. 

    

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##  PRE-ANALYSIS CLEASING OF INPUT

### x_train.txt :

### y_test.txt  :

## R SCRIPT - DOCUMENTATION 

### A REQUIRED ASSUMPTION ABOUT THIS SCRIPT

This script starts with the assumption that the Samsung data is available in the working directory in an unzipped UCI HAR Dataset folder.

### LOCATION OF SCRIPT ON GITHUB: [https://github.com/adekunleadekoya/GetAndCleanData/blob/master/R_Analysis.R](https://github.com/adekunleadekoya/GetAndCleanData/blob/master/R_Analysis.R)
 
### INPUT TO SCRIPT: 

- x_train.txt  (from zip file)
- y_train.txt (from zip file)
- subject_train.txt (from zip file)

- x_test.txt  (from zip file)
- y_test.txt  (from zip file)
- subject_test.txt (from zip file)

- features.txt   (from zip file)
- activity_labels.txt  (from zip file)

Note : above input files to the script are obtained from
   the zip file referenced in section INSTRUCTIONS above.


### OUTPUT FROM SCRIPT : A tidy dataset saved in a file named tidyDT.txt 

### A SNAPSHOT OF the tidy dataset produced with View(dataset)

![](https://reg.run.edu.ng/DS/view_of_tidy_dataset.jpg)

### CODE SNIPPET THAT PRODUCES above SNAPSHOT:

    data <- read.table('tidyDT.txt', header = TRUE)  ##  reads the tidy dataset from disk
    View(data)




### DIAGRAM OF THE SCRIPT's WORKINGS :  
![](http://reg.run.edu.ng/DS/alex_diagram.jpg)
			 
![](http://reg.run.edu.ng/DS/david_hood_diagram.jpg)
			 
## FUNCTIONAL COMPONENTS OF THE SCRIPT

      

- get.tidy.dataset   --  this function is where merges and other cleaning operations , outlined in the 5 instructional steps above , happen
       

- get.activity.names.from_activity_numbers -- this function is where the numeric activity numbers are mapped to the corresponding activity labels/descriptions

- clean.up.column.names  --  this function is where the column labels/names are tidied up
 
 
##  PSEUDOCODE-LIKE ANALYSIS OF SCRIPT
	Main()
	 begin

		1.  DT = get.tidy.dataset() 
			--function call  returns tidy dataset DT
		2.  data <- read.table('tidyDT.txt', header = 	TRUE) 
    		-- function call reads the tidy dataset from disk
		3.  View(data)
			--   views tidy dataset
	end	


    function get.tidy.dataset()
    	begin
           //STEP 1  starts here

            x_train = load_x('x_train.txt')
			y_train = load_y('y_train.txt')
			subject_train = load_subject('subject_train.txt')

			x_test = load_x('x_test.txt')
			y_test = load_y('y_test.txt')
			subject_test =load_subject('subject_test.txt')

            x_DT=rbind(x_train,x_test)
			y_DT=rbind(y_train,y_test)
			subject_DT=rbind(subject_train,subject_test)
			
            colnames(x_DT) =load_features('features.txt') // add column labels
			 
       
		 //STEP 2 starts here  
 
			x_DT = x_DT[,grepl("[Mm]ean\\(\\)|std\\(\\)",colnames(DT))] # extracts mean() and std() columns from DT
            // above line selects mean() and std() columns

		 //STEP 3 starts here  

		y_activity.names = getActivityLabelsGivenNumbers(y_DT)
 
		DT<-cbind(y.activity.names[,1],DT) 
		colnames(DT)[1] = 'activity.name' 
		// above line adds activity column to left of DT

	   //STEP 3 ends here  

		DT<-cbind(subject_DT,DT) 
	    colnames(DT)[1] =  'subject' 
		// the 2 lines above add subject to the left of DT

	   //STEP 4 starts here  

	   colnames(DT) = clean.up.column.names( colnames(DT))

	   //STEP 5 starts here

		DT.2 <- DT %>% group_by(activity.name,subject) %>% summarise_each(funs(mean))
		  // above line computes mean of selected  measures 
          //   per activity,subject pair
		  
		write.table(DT.2,'tidyDT.txt',row.name=FALSE) 
          // above line writes tidy dataset to text file

                
	    DT.2 // this line returns a tidy dataset to the      //caller
    	end 
    
    function get.activity.names.from_activity_numbers(y_DT)
    	begin
    		activity.labels<-read.table('./activity_labels.txt')
                 
			j<-match(y_DT[,1],activity.labels[,1])
                  
			DT.activity.names <- data.frame(activity.labels[c(j),2],nrow=length(j),ncol=1)
                 
			DT.activity.names # returns a data.table that stores the activity names
                  

    	end

    function clean.up.column.names()
    	begin
           // this function tidy(es) up the column labels
		 v=gsub('-','.',v)		  
    	 v=gsub('\\(','',v)
         v=gsub(')','',v)
         v=gsub('BodyBody','Body',v)
         v 
    	end

 

- 
 

## INSTALL SCRIPT


## GETTING SCRIPT


## FOR MORE HELP , CALL :

- ADEKOYA ADEKUNLE ROTIMI
- adekunleadekoya@gmail.com or adekoyaa@run.edu.ng
- 2348130907739


 