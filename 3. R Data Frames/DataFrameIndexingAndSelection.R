days <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri')
temp <- c(22.2, 21, 23, 24.3, 25)
rain <- c(T, T, F, F, T)

df <- data.frame(days, temp, rain)

print(df[1,]) # Get first row

print(df[,1]) # Get first column

print(df[,'rain'])

print(df[1:5, c('days', 'temp')])

print(df$days)
print(df['days'])

print(
  subset(df, subset = rain==T)
)

print(
  subset(df, subset = temp > 23)
)

sorted.temp <- order(df['temp'])
print(sorted.temp)
print(df[sorted.temp,])

desc.temp <- order(-df['temp'])
print(df[desc.temp,])

desc.temp <- order(-df$temp)
print(df[desc.temp,])

