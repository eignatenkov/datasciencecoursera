# reading data
x_test<-read.table("d:/egor/r/data/UCI HAR Dataset/test/x_test.txt")
x_train<-read.table("D:\\Egor\\R\\Data\\UCI HAR Dataset\\train\\X_train.txt" )

#merging
mergeddata<-merge(x_test,x_train,all=TRUE)

#let's create a vector that will contain numbers of columns that we need
index<-vector()
for (i in (0:4)) {
    index<-append(index,((i*40+1):(i*40+6)))
}

for (i in (0:4)){
    index<-append(index,((200+i*13+1):(200+i*13+2)))
}

for (i in (0:2)){
    index<-append(index,((265+i*79+1):(265+i*79+6)))
}

for (i in (0:3)){
    index<-append(index,((502+i*13+1):(502+i*13+2)))
}

#leave only the columns that we need
neatdata<-mergeddata[,index]

#let's name our columns
names<-read.table("D:\\Egor\\R\\Data\\UCI HAR Dataset\\features.txt")

neatnames<-names[index,]

colnames(neatdata)<-neatnames[,2]

#let's add a column with corresponding activity. First, read the data

y_train<-read.table("D:\\Egor\\R\\Data\\UCI HAR Dataset\\train\\y_train.txt" )
y_test<-read.table("d:/egor/r/data/UCI HAR Dataset/test/y_test.txt")

#creating the vector with all the activities in the right order
row_index<-append(y_test$V1,y_train$V1)

#let's go from numbers to words
for (i in seq(row_index)){
    if (row_index[i]==1) {
        row_index[i]<-"WALKING"
    }
    if (row_index[i]==2) {
        row_index[i]<-"WALKING_UPSTAIRS"
    }
    if (row_index[i]==3) {
        row_index[i]<-"WALKING_DOWNSTAIRS"
    }
    if (row_index[i]==4) {
        row_index[i]<-"SITTING"
    }
    if (row_index[i]==5) {
        row_index[i]<-"STANDING"
    }
    if (row_index[i]==6) {
        row_index[i]<-"LAYING"
    }
}
#adding new column to the dataset
neatdata$Activity<-row_index

#let's move this column to the left (make it first).
col_idx <- grep("Activity", names(neatdata))

neatdata <- neatdata[, c(col_idx, (1:ncol(neatdata))[-col_idx])]

#now same thing for subject's IDs

subject_train<-read.table("D:\\Egor\\R\\Data\\UCI HAR Dataset\\train\\subject_train.txt" )
subject_test<-read.table("d:/egor/r/data/UCI HAR Dataset/test/subject_test.txt")
subject<-append(subject_test$V1,subject_train$V1)
neatdata$Subject<-subject
col_idx <- grep("Subject", names(neatdata))
neatdata <- neatdata[, c(col_idx, (1:ncol(neatdata))[-col_idx])]

#from neat to tidy