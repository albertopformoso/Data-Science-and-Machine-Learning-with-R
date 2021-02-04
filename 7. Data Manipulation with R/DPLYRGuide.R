# install.packages('dplyr')
# install.packages('nycflights13')
library(dplyr)
library(nycflights13)

print(
  head(
    filter(flights, month==11, day==3, carrier=='AA')
  )
)

print(
  head(
    slice(flights, 1:10)
  )
)

print(
  head(
    arrange(flights, year, month, day, desc(arr_time)) # order by
  )
)

print(
  head(
    select(flights, carrier, arr_time, month)
  )
)

print(
  head(rename(flights, airline_carrier = carrier))
)

print(
  distinct(select(flights, carrier))
)

print(
  head(
    mutate(flights, new_col = arr_delay - dep_delay)
  )
)

print(
  head( # Only returns the new_col
    transmute(flights, new_col = arr_delay - dep_delay)
  )
)

print(
  summarise(flights, mean_time = mean(air_time, na.rm = T))
)

print(
  sample_n(flights, 10) # Random N of rows
)

print(
  sample_frac(flights, .1) # Random % of rows
)