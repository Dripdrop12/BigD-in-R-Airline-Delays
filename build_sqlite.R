require(RSQLite); require(readr); require(dplyr)

# Create/Connect to SQLite
mydb <- dbConnect(RSQLite::SQLite(), "airline.sqlite")

# List csv files
airlineDelays <- list.files("AirlineDelays", full.names = T)

# Loop over each file and append the SQLite db table
for (file in airlineDelays) {
  df <- read_csv(file)
  dbWriteTable(mydb, "airlinedelays", df, append = TRUE)
  rm(df)
}

# Save
dbDisconnect(mydb)