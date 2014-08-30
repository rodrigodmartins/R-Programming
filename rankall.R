rankall <- function(illness,num="best") {
    ## Read outcome data
    df<-data.frame(outcome[,c(2,7,11,17,23)])
    names(df)<-c("hospital","state","heartattack","heartfailure","pneumonia")
    df$state<-suppressWarnings(as.character(df$state))
    df$heartattack<-suppressWarnings(as.numeric(df$heartattack))
    df$heartfailure<-suppressWarnings(as.numeric(df$heartfailure))
    df$pneumonia<-suppressWarnings(as.numeric(df$pneumonia))
    df<-df[order(df$state,df$hospital),]
    
    ## Check that state and outcome are valid
    ## For each state, find the hospital of the given rank
    
    if(num=="best"){index<-1}
    if(num=="worst"){index<-"which.max(st[,n]),1"}
    if(num>0 & num<55){index<-num}
    
    rk<-data.frame(hospital="",state="")
    
    if(illness=="heart attack"){
        n<-3
        df2<-split(df,df$state)
        lvls<-names(df2)
        for(i in lvls){
            st<-eval(parse(text=paste("df2$", i, sep = "")))
            st<-st[order(st$heartattack,st$hospital),]
            if(num=="worst"){
            st<-eval(parse(text=paste("st[", index, "]",sep = "")))
            }else{
            st<-st[index,]
            st<-st[,1]
            }
            st_temp<-cbind(hospital=st,state=i)
            rk<-rbind(rk,st_temp)
        }
        rk<-rk[-1,]
        rownames(rk)<-lvls
    
    }else{
        if(illness=="heart failure"){
            n<-4
            df2<-split(df,df$state)
            lvls<-names(df2)
            for(i in lvls){
                st<-eval(parse(text=paste("df2$", i, sep = "")))
                st<-st[order(st$heartfailure,st$hospital),]
                if(num=="worst"){
                st<-eval(parse(text=paste("st[", index, "]",sep = "")))
                }else{
                st<-st[index,]
                st<-st[,1]
                }
                st_temp<-cbind(hospital=st,state=i)
                rk<-rbind(rk,st_temp)
            }
            rk<-rk[-1,]
            rownames(rk)<-lvls
        }else{
            if(illness=="pneumonia"){
                n<-5
                df2<-split(df,df$state)
                lvls<-names(df2)
                for(i in lvls){
                    st<-eval(parse(text=paste("df2$", i, sep = "")))
                    st<-st[order(st$pneumonia,st$hospital),]
                    if(num=="worst"){
                        st<-eval(parse(text=paste("st[", index, "]",sep = "")))
                    }else{
                        st<-st[index,]
                        st<-st[,1]
                    }
                    st_temp<-cbind(hospital=st,state=i)
                    rk<-rbind(rk,st_temp)
                }
                rk<-rk[-1,]
                rownames(rk)<-lvls
            }else{stop("invalid outcome")}
        }
    }
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    rk
}