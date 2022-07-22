# check installation and configuration of postGreSQL
Sys.which("psql.exe")
Sys.which("java")

# check installation of the odbc driver of postGreSQL
odbc::odbcListDrivers()




#####################


# required libraries


mf_function_using<-function(...) {
  libs<-unlist(list(...))
  req<-unlist(lapply(libs,require,character.only=TRUE))
  need<-libs[req==FALSE]
  n<-length(need)
  if(n>0){
    libsmsg<-if(n>2) paste(paste(need[1:(n-1)],collapse=", "),",",sep="") else need[1]
    print(libsmsg)
    if(n>1){
      libsmsg<-paste(libsmsg," and ", need[n],sep="")
    }
    libsmsg<-paste("The following packages could not be found: ",libsmsg,"\n\r\n\rInstall missing packages?",collapse="")
    if(winDialog(type = c("yesno"), libsmsg)=="YES"){       
      install.packages(need)
      lapply(need,require,character.only=TRUE)
    }
  }
}

library(DBI)
library(dbplyr)
library(dplyr)
library(dbplot)
library(ggplot2)
library(modeldb)
library(tidypredict)
library(config)
library(RPostgres)
required_libraries<-c(
  
  ############
  
  # A
  # B
  # C
  "config",
  # D
  "DBI","dbplot", "dbplyr", "dplyr",
  # E
  # F
  # G
  # H
  # I
  # J
  # K
  # L
  # M
  "modeldb",
  # N
  # O
  "odbc",
  # P
  "plotly",
  # Q
  # R
  "RJDBC", "RPostgres","RSQLite",
  # S
  "sqldf",
  # T
  "tidypredict"
  # U
  # V
  # W
  # X
  # Y
  # Z
 
  #############
)


mf_function_using(required_libraries)




