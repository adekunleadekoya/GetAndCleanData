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

- 

## R SCRIPT - DOCUMENTATION 

### A REQUIRED ASSUMPTION ABOUT THIS SCRIPT

This script starts with the assumption that the Samsung data is available in the working directory in an unzipped UCI HAR Dataset folder.

### FILE NAME : R_ANALYSIS.R (
 
### INPUT : [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
- x_train.txt
- x_test.txt
- y_train.txt
- y_test.txt
- subject_train.txt
- subject_test.txt
- features.txt
- activity_label.txt


### OUTPUT : A tidy dataset saved in a file named tidyDT.txt 

### SNAPSHOT OF Tidy dataset produced with View(dataset)

![](https://reg.run.edu.ng/DS/view_of_tidy_dataset.jpg)




### DIAGRAM OF THE SCRIPT's WORKINGS :  
![](http://reg.run.edu.ng/DS/alex_diagram.jpg)
			Fig 1
![](http://reg.run.edu.ng/DS/david_hood_diagram.jpg)
			Fig 2
## FUNCTIONAL COMPONENTS OF THE SCRIPT

      

- get.tidy.dataset   --  this function is where merges and other cleaning operations , outlined in the 5 instructional steps above , happen
       

- get.activity.names.from_activity_numbers -- this function is where the numeric activity numbers are mapped to the corresponding activity labels/descriptions

 
    get.tidy.dataset<-**function(s.working_dir ='C:/New   Folder/Data Science/Getting and Cleaning Data/data/UCI HAR Dataset',
            s.output.file='tidyDT.txt')** {	

			setwd(s.working_dir)
  

			x_test<-read.table('./test/x_test.txt')   # loads x_test dataset
			y_test<-read.table('./test/y_test.txt')   # loads y_test dataset			
			subject_test<-read.table('./test/subject_test.txt') # loads subject_test dataset              

            x_train<-read.table('./train/x_train.txt') # loads x_train dataset
			y_train<-read.table('./train/y_train.txt') # loads y_train dataset
			subject_train<-read.table('./train/subject_train.txt')  
                  
            DT<-rbind(data.frame(x_train),data.frame(x_test)) 
            y_DT<-rbind(data.frame(y_train),data.frame(y_test))
                      

			subject_DT<-rbind(data.frame(subject_train),data.frame(subject_test))
                     

			features<-read.table('features.txt',sep=' ') 
			                  
            colnames(DT)<-features[,2]  # loads column names in features.txt into data frame
          

			DT<-DT[,grepl("[Mm]ean\\(\\)|std\\(\\)",colnames(DT))] # extracts mean() and std() columns from DT
 

			y.activity.names<-get.activity.names.from_activity_numbers(y_DT)
                          
			DT<-cbind(y.activity.names[,1],DT) 
                         

			colnames(DT)[1]<- 'activity.name' # labels the new activity column in DT
 

			DT<-cbind(subject_DT,DT)    # adds a subject column to the left of  data frame DT                
                	colnames(DT)[1]<- 'subject'   # labels the new  subject column in DT
 
			DT.2 <- DT %>% group_by(activity.name,subject) %>% summarise_each(funs(mean))
			
			colnames(DT.2)<- clean.up.column.names( colnames(DT.2))

			write.table(DT.2,s.output.file,row.name=FALSE)  # writes tidy dataset to text file

                
			DT.2 #  this line returns the dataset DT after cleaning in line with previous cleaning operations
 
 
		
		}



* **artist** - search for artists by name, description, or attribute, and get back detailed information about any artist including audio, similar artists, blogs, familiarity, hotttnesss, news, reviews, urls and video.
* **song** - search songs by artist, title, description, or attribute (tempo, duration, etc) and get detailed information back about each song, such as hotttnesss, audio_summary, or tracks.
* **track** - upload a track to the Echo Nest and receive summary information about the track including key, duration, mode, tempo, time signature along with detailed track info including timbre, pitch, rhythm and loudness information.

## Install
There are a few different ways you can install pyechonest:

* Use setuptools: `easy_install -U pyechonest`
* Download the zipfile from the [releases](https://github.com/echonest/pyechonest/releases) page and install it. 
* Checkout the source: `git clone git://github.com/echonest/pyechonest.git` and install it yourself.
   
## Getting Started
* Install Pyechonest
* **Get an API key** - to use the Echo Nest API you need an Echo Nest API key.  You can get one for free at [developer.echonest.com](http://developer.echonest.com).
* **Set the API** key - you can do this one of two ways:
* set an environment variable named `ECHO_NEST_API_KEY` to your API key
* Include this snippet of code at the beginning of your python scripts:

```python
    from pyechonest import config
    config.ECHO_NEST_API_KEY="YOUR API KEY"
```

* Check out the [docs](http://echonest.github.com/pyechonest/) and examples below.

## Examples
*All examples assume you have already setup your api key!*

Find artists that are similar to 'Bikini Kill':

```python
from pyechonest import artist
bk = artist.Artist('bikini kill')
print "Artists similar to: %s:" % (bk.name,)
for similar_artist in bk.similar: print "\t%s" % (similar_artist.name,)
```

Search for artist:
```python
from pyechonest import artist
weezer_results = artist.search(name='weezer')
weezer = weezer_results[0]
weezer_blogs = weezer.blogs
print 'Blogs about weezer:', [blog.get('url') for blog in weezer_blogs]
```

Get an artist by name:
```python
from pyechonest import artist
a = artist.Artist('lady gaga')
print a.id
```

Get an artist by Musicbrainz ID:
```python
from pyechonest import artist
a = artist.Artist('musicbrainz:artist:a74b1b7f-71a5-4011-9441-d0b5e4122711')
print a.name
```

Get the top hottt artists:
```python
from pyechonest import artist
for hottt_artist in artist.top_hottt():
print hottt_artist.name, hottt_artist.hotttnesss
```

Search for songs:
```python
from pyechonest import song
rkp_results = song.search(artist='radiohead', title='karma police')
karma_police = rkp_results[0]
print karma_police.artist_location
print 'tempo:',karma_police.audio_summary['tempo'],'duration:',karma_police.audio_summary['duration']
```

Get a song's audio_url and analysis_url:
```python
from pyechonest import song
ss_results = song.search(artist='the national', title='slow show', buckets=['id:7digital-US', 'tracks'], limit=True)
slow_show = ss_results[0]
ss_tracks = slow_show.get_tracks('7digital-US')
print ss_tracks[0].get('preview_url')
```

-![alt text](http://i.imgur.com/WWLYo.gif "Frustrated cat can't believe this is the 12th time he's clicked on an auto-linked README.md URL")
