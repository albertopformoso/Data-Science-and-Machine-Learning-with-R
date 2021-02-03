# grepl -> returns logical value
# grep -> returns position

text <- "Hi there, do you know who you are voting for?"

print(grepl('voting', text))
print(grepl('dog', text))

v <- c('a', 'b', 'c', 'd', 'd')
print(grepl('b', v))
print(grep('d', v))