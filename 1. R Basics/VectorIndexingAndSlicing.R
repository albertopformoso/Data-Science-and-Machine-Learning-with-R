# Vector Indexing and Slicing
v1 <- c(100, 200, 300)
v2 <- c('a', 'b', 'c')

print(v1[2])
print(v2[3])

print(v1[c(1, 2)])
print(v2[c(1, 3)])

v <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
print(v[2:4])
print(v[7:10])

# Indexing with names
v <- c(1, 2, 3, 4)
names(v) <- c('a', 'b', 'c', 'd')

print(v['b'])
print(v[c('c', 'd', 'a')])

print(v[v>2]) # Return elements that satisfies the condition

my.filter <- v > 2
print(v[my.filter])