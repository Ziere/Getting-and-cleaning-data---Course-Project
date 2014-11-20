CODEBOOK
========

Estructure of dtTidy
--------------------
```
str(dtTidy)
```

```
Classes 'data.table' and 'data.frame':    11880 obs. of  11 variables:
 $ subject_Number: int  1 1 1 1 1 1 1 1 1 1 ...
 $ activity      : int  1 1 1 1 1 1 1 1 1 1 ...
 $ domain        : Factor w/ 2 levels "Time","Frequency": 1 1 1 1 1 1 1 1 1 1 ...
 $ instrument    : Factor w/ 2 levels "Accelerometer",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ acceleration  : Factor w/ 3 levels NA,"Body","Gravity": 2 2 2 2 2 2 2 2 2 2 ...
 $ jerk          : Factor w/ 2 levels NA,"Jerk": 1 1 1 1 1 1 1 1 2 2 ...
 $ magnitude     : Factor w/ 2 levels NA,"Magnitude": 1 1 1 1 1 1 2 2 1 1 ...
 $ axis          : Factor w/ 4 levels NA,"X","Y","Z": 2 2 3 3 4 4 1 1 2 2 ...
 $ variable      : Factor w/ 2 levels "Mean","SD": 1 2 1 2 1 2 1 2 1 2 ...
 $ count         : int  95 95 95 95 95 95 95 95 95 95 ...
 $ average       : num  0.2773 -0.2837 -0.0174 0.1145 -0.1111 ...
 - attr(*, "sorted")= chr  "subject_Number" "activity" "domain" "instrument" ...
 - attr(*, ".internal.selfref")=<externalptr>
```

Variable list and descriptions from dtTidy
------------------------------------------

```
Variable name     Description
-------------     -----------
subject_Number    ID the subject who performed the activity for each window sample. Its range is from 1 to 30.
activity          Activity number
domain            Time signal or frequency signal (Time or Freq)
instrument        Measuring instrument (Accelerometer or Gyroscope)
acceleration      Acceleration signal (Body or Gravity)
jerk              Jerk signal
magnitude         Magnitude of the signals calculated using the Euclidean norm
axis              3-axial signals in the X, Y and Z directions (X, Y, or Z)
variable          Indicate if the variable is mean of standard desviation (SD)
count             Count the number of data in the same group to calculate the average
average           Average of each variable for each activity and each subject
```