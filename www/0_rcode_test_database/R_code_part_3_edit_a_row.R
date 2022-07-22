con <- DBI::dbConnect(RPostgres::Postgres(),
                      user="postgres",
                      #user=rstudioapi::askForPassword("Database user")
                      password="password",
                      #password=rstudioapi::askForPassword("Database password")
                      dbname="dvdrental")



query <- DBI::dbSendQuery(con, "UPDATE film SET description='A Amazing Documentary of a Secret Agent And a Astronaut who must Vanquish a Hunter in A Shark Tank2'  
WHERE film_id=130 AND title= 'Celebrity Horn';")
summary(query)
## S4 method for signature 'PqResult'
DBI::dbColumnInfo(query)

## S4 method for signature 'PqResult'
DBI::dbGetRowCount(query)

## S4 method for signature 'PqResult'
DBI::dbGetRowsAffected(query)

## S4 method for signature 'PqResult'
DBI::dbGetStatement(query)




#SET description='A Amazing Documentary of a Secret Agent And a Astronaut who must Vanquish a Hunter in A Shark Tank2'  
#WHERE film_id=130 AND title= 'Celebrity Horn';


dbSendQuery(con, 'INSERT INTO table1 (MARKS, ROLLNUM, NAME) VALUES (?, ?, ?);', list(1, 16, 'Big fellow'))


dbSendQuery(con, 'INSERT INTO table1 (MARKS, ROLLNUM, NAME) VALUES (:mark, :roll, :name);', df)

dbBegin(con)
res <- dbSendQuery(con, 'INSERT INTO table1 (MARKS, ROLLNUM, NAME) VALUES (?, ?, ?);', list(1, 16, 'Big fellow'))
dbClearResult(res)
dbCommit(con)

DBI::dbDisconnect(con)
