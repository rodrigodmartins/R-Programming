rankhospital <- function(state,illness,num="best") {
    ## Read outcome data
    df<-data.frame(outcome[,c(7,2,11,17,23)])
    names(df)<-c("st","hospital_name","heartattack","heartfailure","pneumonia")
    df$st<-suppressWarnings(as.character(df$st))
    df$heartattack<-suppressWarnings(as.numeric(df$heartattack))
    df$heartfailure<-suppressWarnings(as.numeric(df$heartfailure))
    df$pneumonia<-suppressWarnings(as.numeric(df$pneumonia))
    
    ## Check that state and outcome are valid
    
    if(sum(as.vector(grepl(state,df$st)))==0){
        stop("invalid state")
    }else{
        factor<-df$st==state
        df2<-df[factor,]
        if(illness=="heart attack"){
            df3<-df2[order(df2$heartattack,df2$hospital_name, na.last=T),]
            df3$Rank<-(1:nrow(df3))
            df3$heartfailure<-NULL
            df3$pneumonia<-NULL
            df3<-na.omit(df3)
        }else{
            if(illness=="heart failure"){
                df3<-df2[order(df2$heartfailure,df2$hospital_name, na.last=T),]
                df3$Rank<-(1:nrow(df3))
                df3$heartattack<-NULL
                df3$pneumonia<-NULL
                df3<-na.omit(df3)
            }else{
                if(illness=="pneumonia"){
                    df3<-df2[order(df2$pneumonia,df2$hospital_name, na.last=T),]
                    df3$Rank<-(1:nrow(df3))
                    df3$heartattack<-NULL
                    df3$heartfailure<-NULL
                    df3<-na.omit(df3)
                }else{
                    stop("invalid outcome")
                }
            }
        }
    }
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    
    if(num>nrow(df3)){
        na<-NA
        na
    }else{
    if(num=="best"){
        df3[which.min(df3[,4]),2]
    }else{
        if(num=="worst"){
            df3[which.max(df3[,4]),2]
    }else{
        df4<-split(df3,df3$Rank==num)
        #sapply(df4, `[[`, i = 2)
        df4[[c(2, 2)]]
        
        }
            
            }
}
}