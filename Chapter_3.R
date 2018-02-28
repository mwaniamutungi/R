
# Start of Chapter Three: Data Wrangling.

library(dplyr)
library(ggplot2)
library(lubridate)
library(randomForest)
library(rattle)
library(rattle.data)
library(readr)
library(scales)
library(stringi)
library(stringr)
library(tibble)
library(tidyr)
library(magrittr)
library(FSelector)

#Data path
dspath <- "http://rattle.togaware.com/weatherAUS.csv"
weatherAUS <- read_csv(file=dspath)

#Making a copy.
ds <- weatherAUS

dsname <- "weatherAUS"
ds <- get(dsname)

#Understanding the data
ds #prints the dataset

#Getting the dimensions.
dim(ds) %>% comcat()  #comcat formats numbers with commas to have commas *sic
nrow(ds) %>% comcat()
ncol(ds)  %>% comcat()

#taking a sneek preview -- similar to head and tail in Python.
glimpse(ds)

#Identifying the list of columns and their names.
names(ds)

#Changing case(normalising)
names(ds) %<>% normVarNames()

head(ds)

#DATA CLEANING

#identifying number of a variable
ds$location %>%
  unique()

#makes them to be identifiable as individual factors, not characters
ds$location %<>% as.factor()

#viewing how many observaions per location?
table(ds$location)

#Reviewing distribution of an observation such as rain
ds %>%
  select(starts_with("rain_")) %>%
  sapply(table)

#changing the observations from characters 'yes' and 'no' to factors.
ds %>%
  select(starts_with("rain_")) %>%
  names() %T>%
  print() ->
  vnames

#Confirming the conversion
ds[vnames]%>% sapply(class)


#Convert to characters, and confirm
ds[vnames] %<>%
  lapply(factor)%>%
  data.frame() %>%
  tbl_df() %T>%    #ensures that
  {sapply(., class)%>% print()}


#Doing the same for wind direction
ds %>%
  select(contains("_dir")) %>%
  sapply(table)


# List of wind directions, clockwise
compass <- c("N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE",
             "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW")

# Names of wind direction vatriables
ds %>% 
  select(contains("_dir")) %>%
  names() %T>%
  print() ->
  vnames

# confirm wether they are characters
ds[vnames] %>% sapply(class)
             
# convert back to character and confirm
ds[vnames] %>%
  lapply(factor)





