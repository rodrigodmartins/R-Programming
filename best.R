best <- function(state, illness) {
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
        }else{
            if(illness=="heart failure"){
                df3<-df2[order(df2$heartfailure,df2$hospital_name, na.last=T),]
            }else{
                if(illness=="pneumonia"){
                    df3<-df2[order(df2$pneumonia,df2$hospital_name, na.last=T),]
                }else{
                    stop("invalid outcome")
                }
            }
        }
    }
                ## Return hospital name in that state with lowest 30-day death
                ## rate
                df3[1,2]
            }