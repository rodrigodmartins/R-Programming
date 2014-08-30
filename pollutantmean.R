pollutantmean <- function(directory, pollutant, id = 1:332) {
    setwd(paste("/Volumes/Documentos importantes/Coursera/2 - R Programming/Week 2/Assignment/",directory,sep="")) #Set working directory according to 'directory' argument.
    files<-paste(sprintf("%03d",id),".csv",sep="") #Create vector with file names to be used.
    temp1<-lapply(files,read.csv) #Join data from all files.
    bigdata<-do.call(rbind,temp1) #Create data frame will all data.
    bigdata$Date<-NULL #Delete column 'Date', which is not useful.
    bigdata<-bigdata[c("ID","sulfate","nitrate")] #Change column order.
    if(pollutant=="sulfate"){
        round(mean(bigdata$sulfate,na.rm=T),digits=3) #Calculate mean value for 'sulfate', rounded to 3 digits.
    }else{
        if(pollutant=="nitrate"){
            round(mean(bigdata$nitrate,na.rm=T),digits=3) #Calculate mean value for 'nitrate', rounded to 3 digits.
        }else{
            print("Warning, wrong arguments !") #Warning, in case invalid argument is input
        }
        }
    }