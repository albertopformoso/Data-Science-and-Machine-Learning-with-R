# Creating Data Frames ----------------------
empty <- data.frame()
c1 <- 1:10
c2 <- letters[1:10]

df <- data.frame(
  col.name.1 = c1, 
  col.name.2 = c2
)

# Importing and Exporting Data --------------
write.csv(df, file = 'saved_df.csv')
df2 <- read.csv('saved_df.csv')

# Getting Information about Data Frame ------
nrow(df) # How many rows
ncol(df) # How many columns
colnames(df) # Returns column names
rownames(df)

str(df) # Structure of the DF

summary(df) # Statistical summary of the DF

# Referencing Cells --------------------------
print(df[[5,2]])
print(df[[5, 'col.name.2']])

df[[2, 'col.name.1']] <- 9999

# Referencing Rows ---------------------------
df[1,]

df3 <- mtcars

df3$mpg
df3[,'mpg']
df3[,1]
df3[['mpg']]

df3['mpg']

df3[c('mpg', 'cyl')]

# Adding Rows --------------------------------
df4 <- data.frame(col.name.1 = 2000, col.name.2 = 'new')

dfnew <- rbind(df, df4)

# Adding Columns -----------------------------
df$newcol <- 2*df$col.name.1

df$newcol.copy <- df$newcol

df[,'newcol.copy2'] <- df$newcol

# Setting Column Names -----------------------
colnames(df)

colnames(df) <- c('1', '2', '3', '4', '5')

colnames(df)[1] <- 'NEW COL NAME'

# Selecting Multiple Rows --------------------
df[1:10,]
head(df, 10)

df[-2,] # Select everything except the second row

mtcars[mtcars$mpg > 20,]

mtcars[(mtcars$mpg > 20) & (mtcars$cyl == 6),]

mtcars[(mtcars$mpg > 20) & (mtcars$cyl == 6), c('mpg', 'cyl', 'hp')]

subset(mtcars, mpg > 20 & cyl == 6)

# Selecting Multiple Columns -----------------
mtcars[,c(1, 2, 3)]
mtcars[,c('mpg', 'cyl', 'disp')]

# Dealing with Missing Data -----------------
is.na(mtcars)
any(is.na(df))

any(is.na(mtcars$mpg))

df[is.na(df)] <- 0 # Replace all null values with 0

mtcars$mpg[is.na(mtcars$mpg)] <- mean(mtcar$mpg) # Replace null values with the mean
