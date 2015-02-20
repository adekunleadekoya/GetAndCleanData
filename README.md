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

### SCRIPT ON GITHUB: [https://github.com/adekunleadekoya/GetAndCleanData/blob/master/R_Analysis.R](https://github.com/adekunleadekoya/GetAndCleanData/blob/master/R_Analysis.R)
 
### INPUT : 

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

- clean.up.column.names  --  this function is where the column labels/names are tidied up
 
 
##  HIGH LEVEL ANALYSIS OF SCRIPT
1.  DT<-get.tidy.dataset() 
	--function call  returns tidy dataset DT
2.  data <- read.table('tidyDT.txt', header = TRUE) 
    -- function call reads the tidy dataset from disk
3.  View(data)
	--   views tidy dataset


    function get.tidy.dataset()
    	begin
    
    	end 
    
    function get.activity.names.from_activity_numbers()
    	begin
    
    	end

    function clean.up.column.names()
    	begin
    
    	end

 

- 

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
