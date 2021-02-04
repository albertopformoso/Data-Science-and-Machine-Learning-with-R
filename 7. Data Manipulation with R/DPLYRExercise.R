library(dplyr)

print(
  filter(mtcars, mpg >20, cyl == 6)
)

print(
  arrange(mtcars, cyl, desc(wt))
)

print(
  select(mtcars, mpg, hp)
)

# mtcars %>% select(gear) %>% distinct()
print(
  distinct(select(mtcars, gear))
)

print(
  mutate(mtcars, performance = hp / wt)
)

print(
  summarise(mtcars, avg_mpg = mean(mpg))
)

print(
  mtcars %>% filter(cyl==6) %>% summarise(avg_hp = mean(hp))
)
