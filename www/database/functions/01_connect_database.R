dbname_temp<-"dvdrental"
user_temp<-"postgres"
password_temp<-"password"
host_temp<-"localhost"
port_temp<-"5432"

mf_database_connect_odbc<-function(user_temp="postgres",password_temp="password",dbname_temp="dvdrental"
                              ,host_temp="localhost",port_temp="5432") {
  
  cat(paste("\n function started:",match.call()[[1]],"\n ",Sys.time(),"\n"))
  on.exit({
    cat(paste("\n function finished:",match.call()[[1]],"\n ",Sys.time(),"\n"))
  })
  con <- tryCatch({
    
    
    odbc::dbConnect(RPostgres::Postgres()
                    ,user=user_temp,           #"postgres"
                    password=password_temp,    #"password"
                    dbname=dbname_temp         #"dvdrental"
                    ,host  = host_temp        #"localhost"
                    ,port=port_temp            #"5432"
    )
    
    #summary(con)
    #cat("Database Connected!")
    #print("Database Connected!")
  },
  error=function(cond) {
    #con <-FALSE
    
    print("Unable to connect to Database.\n")
    message(paste("\n ", cond))
    
  })
  
  return(con)
  
}
con<-mf_database_connect_odbc(password="1111")
dbDisconnect(con)


mf_database_connect_odbc<-function(user_temp="postgres",password_temp="password",dbname_temp="dvdrental"
                                   ,host_temp="localhost",port_temp="5432") {
  con <-tryCatch({
    
    
    #DBI::dbConnect(RMySQL::MySQL()
    #RPostgres::dbConnect(RPostgres::Postgres()
    odbc::dbConnect(RPostgres::Postgres()
                    ,user=user_temp,           #"postgres"
                    password=password_temp,    #"password"
                    dbname=dbname_temp         #"dvdrental"
                    ,host  = host_temp        #"localhost"
                    ,port=port_temp            #"5432"
    )
    
    summary(con)
    
    print("Database Connected!")
  },
  error=function(cond) {
    print("Unable to connect to Database.\n")
    message(paste("\n ", cond))
    
  })
  
  return(con)
  
}


## help
#There are six settings needed to make a connection:
  
##  * Driver - See the Drivers section for setup information
##  * Server - A network path to the database server
##  * Database - The name of the schema
##  * UID - The user’s network ID or server local account
##  * PWD - The account’s password
##  * Port - Should be set to 5432
#con <- DBI::dbConnect(odbc::odbc(),
#                      Driver   = "[your driver's name]",
#                      Server   = "[your server's path]",
#                      Database = "[your database's name]",
#                      UID      = rstudioapi::askForPassword("Database user"),
#                      PWD      = rstudioapi::askForPassword("Database password"),
#                      Port     = 5432)


