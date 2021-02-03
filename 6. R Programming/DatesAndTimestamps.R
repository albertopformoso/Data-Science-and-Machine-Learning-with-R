print(
  Sys.Date()
)
today <- Sys.Date()
print(class(today))

c <- '1990-01-01'
print(class(c))

my.date <- as.Date(c)
print(class(my.date))

# print(as.Date('Nov-03-1990')) Error
# %d Day of the month (decimal number)
# %m Month (decimal number)
# %b Month (abbreviated)
# %B Month (full name)
# %y Year (2 digit)
# %Y Year (4 digit)

# lct <- Sys.getlocale('LC_TIME'); Sys.setlocale('LC_TIME', 'C')
my.date <- as.Date('nov-03-90', format='%b-%d-%y')
print(my.date)

print(
  as.Date('June,01,2002', format='%B,%d,%Y')
)

print(
  as.POSIXct('11:02:03', format='%H:%M:%S')
) # To convert strings to date type
print(
  strptime('11:02:03', format='%H:%M:%S')
)