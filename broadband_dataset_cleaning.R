library(tidyverse)
library(dplyr)
library(stringi)
library(scales)
Ss
setwd("E:/data science")

broadband = read_csv("datasets/broadband/201805_fixed_pc_performance_r03.csv")

pattern = ' .*$'
broadband = broadband %>%
  mutate(ShortPostCode = gsub(pattern,"",postcode_space)) %>%
  mutate(ID = row_number()) %>%
  select(`ID`, `postcode area`, ShortPostCode, `Average download speed (Mbit/s)`,
         `Average upload speed (Mbit/s)`, `Minimum download speed (Mbit/s)`,
         `Minimum upload speed (Mbit/s)`) %>% 
  na.omit()
colnames(broadband) = c( "ID","Postcode Area", "ShortPostCode", "Avgdownload",
                             "Average upload speed (Mbit/s)", "Mindownload",
                             "Minimum upload speed (Mbit/s)")
write.csv(broadband,"cleaning/cleaned datasets/cleaned_broadband_speed_dataset.csv",row.names = FALSE )
