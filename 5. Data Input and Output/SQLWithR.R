install.packages('RODBC')
library(RODBC)

myconn <- odbcConnect('Database_Name', uid='User_ID', pwd='password')
dat <- sqlFetch(myconn, 'Table_Name')
querydat <- sqlQuery(myconn, 'SELECT * FROM table')
close(myconn)
