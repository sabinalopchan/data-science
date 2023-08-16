
library(data.table)
library(tidyverse)
library(dplyr)

#Set working directory
setwd("E:/data science")

#import population data set
cleaned_TP = read.csv('cleaning/cleaned datasets/cleaned_population_datasets.csv')
#import LSOA dataset
LSOA = fread("datasets/PostcodeToLSOA.csv")
pattern = ' .*$'
LSOA_Cleaned = LSOA %>%
  select(lsoa11cd,pcds) %>% 
  mutate(ShortPostCode=gsub(pattern,"",pcds)) %>% 
  right_join(cleaned_TP,by="ShortPostCode")  %>% 
  group_by(lsoa11cd) %>% 
  select(lsoa11cd,ShortPostCode,Town,District,County) 

#rename column name 
colnames(LSOA_Cleaned)[1] <- "LSOA code"
view(LSOA_Cleaned)
#extract cleaned LSOA data in csv
write.csv(LSOA_Cleaned,"cleaning/cleaned datasets/cleaned_LSOA.csv",row.names = FALSE)
