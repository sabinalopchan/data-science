
###########
library(tidyverse)
library(dplyr)
library(stringi)
library(scales)

setwd("E:/data science")
#Load the house pricing data set
hp2019 = read_csv("datasets/housePricing/House Price-2019.csv",show_col_types = FALSE)
hp2020 = read_csv("datasets/housePricing/House Price-2020.csv",show_col_types = FALSE)
hp2021 = read_csv("datasets/housePricing/House Price-2021.csv",show_col_types = FALSE)
hp2022 = read_csv("datasets/housePricing/House Price-2022.csv",show_col_types = FALSE)

#Rename the columns of data set
colnames(hp2019) = c("HouseId" , "Price", "Year", "Postcode" , "PAON", "SAON", "FL", "House Num", "Flat", "Street Name",
                     "Locality", "Town" , "District", "County", "Type1", "Type2" )
colnames(hp2020) = c("HouseId" , "Price", "Year", "Postcode" , "PAON", "SAON", "FL", "House Num", "Flat", "Street Name",
                     "Locality", "Town" , "District", "County", "Type1", "Type2" )
colnames(hp2021) =c("HouseId" , "Price", "Year", "Postcode" , "PAON", "SAON", "FL", "House Num", "Flat", "Street Name",
                    "Locality", "Town" , "District", "County", "Type1", "Type2" )
colnames(hp2022) =c("HouseId" , "Price", "Year", "Postcode" , "PAON", "SAON", "FL", "House Num", "Flat", "Street Name",
                    "Locality", "Town" , "District", "County", "Type1", "Type2" )
#Combine house pricing data set from 2019-2022
HousePrices = rbind(hp2019,hp2020,hp2021,hp2022) %>% 
  na.omit() %>% 
  distinct() %>% 
  as_tibble()
View(HousePrices)
#Export combined data set
write.csv(HousePrices, "cleaning/combined datasets/combined_house_pricing_2019-2022.csv")
#Filter data set from county
FilteredHousePrices = filter(HousePrices, County == 'OXFORDSHIRE' | County == 'YORK' | County == 'WEST YORKSHIRE' | County == 'NORTH YORKSHIRE' | County == 'SOUTH YORKSHIRE' )

# Replace "YORK" with "YORKSHIRE" in the COUNTY column
FilteredHousePrices$County[FilteredHousePrices$County == "YORK"] <- "YORKSHIRE"
view(FilteredHousePrices)
pattern = ' .*$'

FilteredHousePrices = FilteredHousePrices %>% 
  mutate(ShortPostCode=gsub(pattern,"",Postcode)) %>%
  mutate(Year = str_trim(substring(Year, 1,4))) %>% 
  select(Postcode,ShortPostCode,Year,PAON,Price) %>% 
  na.omit() %>% 
  distinct() %>% 
  as_tibble()
View(FilteredHousePrices)

# exporting filtered house prices data set to  csv
write.csv(FilteredHousePrices, "cleaning/cleaned datasets/cleaned_house_pricing_2019-2022.csv",row.names = FALSE)







