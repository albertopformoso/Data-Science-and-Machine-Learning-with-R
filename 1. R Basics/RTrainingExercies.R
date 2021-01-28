# R Training Exercise

cat('What is two to the power of five?\n')
cat(2^5)

cat('\n\nCreate a vector called stock.prices with the following data points: 23, 27, 23, 21, 34\n')
cat('Assign names to the price data points relating to the day of the week, starting with Monday\n\n')
stock.prices <- c(23, 27, 23, 21, 34)
names(stock.prices) <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri')
print(stock.prices)

cat('\n')
print('What was the average (mean) stock price for the week?')
print(mean(stock.prices))
cat('\n')

print('Correspond to the days where the stock price was more than $23')
over.23 <- stock.prices > 23
print(over.23)
cat('\n')

print('Filter out the stock.prices vector above 23 and only return the day and prices where the price was over $23')
print(stock.prices[over.23])

cat('\n')
print('Find the day the price was the highest')
max.stock <- max(stock.prices)
print(
  stock.prices[stock.prices == max.stock]
  )