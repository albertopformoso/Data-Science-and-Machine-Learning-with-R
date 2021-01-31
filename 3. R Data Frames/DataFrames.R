print(head(state.x77))
print(tail(state.x77))

# Look for the structure of the data set
print(str(state.x77))

# summary of each column (statistics description)
print(summary(state.x77))

# Create a DF
days <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri')
temp <- c(22.2, 21, 23, 24.3, 25)
rain <- c(T, T, F, F, T)

df <- data.frame(days, temp, rain)
print(df)

print(str(df))

print(summary(df))