#**********Make sure that the folder (UCI HAR Dataset ) *****
#**********where data files are stored is the current working directory ***
#********** else there may be problems loading the data files from this script/prgram


#get.tidy.dataset   --  this function is where merges and other cleaning operations happen
#get.activity.names.from_activity_numbers -- this function is where the numeric activity numbers are mapped to the corresponding activity labels/descriptions
#clean.up.column.names  --  this function is where the activity numbers are mapped to the activity labels

get.tidy.dataset<-function(s.working_dir=getwd(),
                           s.output.file='tidyDT.txt')
		{
 			 library(dplyr)

			setwd(s.working_dir)
				
                  #    **************BEGIN STEP 1 :  Merges the training and the test sets to create one data set***

			#  next block of code loads the test dataset into RAM

			x_test<-read.table('./test/x_test.txt')   # loads x_test dataset
			y_test<-read.table('./test/y_test.txt')   # loads y_test dataset			
			subject_test<-read.table('./test/subject_test.txt') # loads subject_test dataset			                
                  
                 
			#  next block of code loads the training dataset into RAM                  

                  x_train<-read.table('./train/x_train.txt') # loads x_train dataset
			y_train<-read.table('./train/y_train.txt') # loads y_train dataset
			subject_train<-read.table('./train/subject_train.txt') # loads subject_train dataset	

                  
			#  next block of code merges train and test datasets ...
			#  ... into a data frame  DT and then ...
			#  ... y_train and y_test are merged into y_DT
			#  ... subject_train and subject_test are merged into...
			#  ... a data frame called  subject_DT			
			#  ... change the column names of DT to names in features.txt
                
                  DT<-rbind(data.frame(x_train),data.frame(x_test)) 
                      # above line merges training and test datasets ...
		          # ... and stores result in data frame DT 

                  y_DT<-rbind(data.frame(y_train),data.frame(y_test))
                      # above line merges y_train with y_test and...
			    # ...stores result in data frame y_DT

			subject_DT<-rbind(data.frame(subject_train),data.frame(subject_test))
                      # above line merges subject_train with subject_test ...
			    # ... and stores result in data frame subject_DT

			features<-read.table('features.txt',sep=' ') 
			    # above line loads the features into data frame features                 
                  
                  colnames(DT)<-features[,2]  # loads column names in features.txt into data frame
                  
			

			 
                  #    *********END STEP 1*******************************************
			
			#

                  #    *******BEGIN STEP 2 :  Extracts only the measurements on the mean and standard deviation 
							    # for each measurement.*****************

			DT<-DT[,grepl("[Mm]ean\\(\\)|std\\(\\)",colnames(DT))] # extracts mean() and std() columns from DT


                  #    *********END STEP 2*********************************************

			#

		      #    *******BEGIN STEP 3 :  Uses descriptive activity names to name the activities in the data set
                                              #           *******************************************


			y.activity.names<-get.activity.names.from_activity_numbers(y_DT)
                           # above line gets the activity names given the activity numbers
			DT<-cbind(y.activity.names[,1],DT) 
                           # above line adds the activity column to the left of data frame DT

			colnames(DT)[1]<- 'activity.name' # labels the new activity column in DT

			#    *********END STEP 3********************************************



			DT<-cbind(subject_DT,DT)    # adds a subject column to the left of  data frame DT                
                	colnames(DT)[1]<- 'subject'   # labels the new  subject column in DT

                  #    *******BEGIN STEP 4 : Appropriately labels the data set with descriptive variable names *******  

			   ####  column labels are descriptive enough... no further processing would be done at this step

		      #    *******END STEP 4*********************************************


			#    *******BEGIN STEP 5 : From the data set in step 4, creates a second, independent ...
							   # ... tidy data set with the average of each variable for each activity ...
							   # ... and each subject.
			DT.2 <- DT %>% group_by(activity.name,subject) %>% summarise_each(funs(mean))
			
			colnames(DT.2)<- clean.up.column.names( colnames(DT.2))

			write.table(DT.2,s.output.file,row.name=FALSE)  # writes tidy dataset to text file

                
			DT.2 #  this line returns the dataset DT after cleaning in line with previous cleaning operations

			#    *******END STEP 5*********************************************


 
		
		}

 get.activity.names.from_activity_numbers<-function(y_DT)
		{
			 
			activity.labels<-read.table('./activity_labels.txt')
                 
			j<-match(y_DT[,1],activity.labels[,1])
                  
                  DT.activity.names <- data.frame(activity.labels[c(j),2],nrow=length(j),ncol=1)
                 
                  DT.activity.names # returns a data.table that stores the activity names
                  
			 
			  
		}
 

clean.up.column.names<-function(v)
	  	{
              
		  v=gsub('-','.',v)		  
		  v=gsub('\\(','',v)
		  v=gsub(')','',v)
		  v=gsub('BodyBody','Body',v)
		  v             
		}




DT=get.tidy.dataset(s.output.file='tidyDT.txt') 
       # above line invokes the main function that generates the tidy dataset
	 # the input files(x_train.txt,x_test.txt etc are to be found in getwd() )
       # the second parameter to the function tells about the name of the file..
	 # ... that would be used to save the output tidy dataset


 

 
data <- read.table('tidyDT.txt', header = TRUE)  ##  reads the tidy dataset from disk
View(data)                                        ## Views tidy dataset      
