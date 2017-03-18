require(dplyr)

# Create a dplyr database source
ad <- tbl(src_sqlite("airline.sqlite"), "airlinedelays")

ans <- ad %>% group_by(DayOfWeek) %>% summarise(n = count()) %>% collect()

ans