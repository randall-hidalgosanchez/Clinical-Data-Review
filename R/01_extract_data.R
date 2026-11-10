# libraries
library(pharmaverseraw)
library(tidyverse)

# load data from pharmaverseraw
data("dm_raw", package = "pharmaverseraw")
data("ae_raw", package = "pharmaverseraw")


# write csv file
readr::write_csv(dm_raw, "data/raw/dm_raw.csv") # demographics
readr::write_csv(ae_raw, "data/raw/ae_raw.csv") # adverse events


# write rds file
readr::write_rds(dm_raw, "data/raw/dm_raw.rds") # demographics
readr::write_rds(ae_raw, "data/raw/ae_raw.rds") # adverse events
