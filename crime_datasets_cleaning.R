library(data.table)
library(tidyverse)
library(stringr)
library(lubridate)

setwd("E:/data science")

# Importing CSV files

#oxfordshire data

Crime_2021_01_oxfordshire_  = fread("datasets\\crime\\2021-01\\2021-01-thames-valley-street.csv")
Crime_2021_02_oxfordshire_  = fread("datasets\\crime\\2021-02\\2021-02-thames-valley-street.csv")
Crime_2021_03_oxfordshire_  = fread("datasets\\crime\\2021-03\\2021-03-thames-valley-street.csv")
Crime_2021_04_oxfordshire_  = fread("datasets\\crime\\2021-04\\2021-04-thames-valley-street.csv")
Crime_2021_05_oxfordshire_  = fread("datasets\\crime\\2021-05\\2021-05-thames-valley-street.csv")
Crime_2021_06_oxfordshire_  = fread("datasets\\crime\\2021-06\\2021-06-thames-valley-street.csv")
Crime_2021_07_oxfordshire_  = fread("datasets\\crime\\2021-07\\2021-07-thames-valley-street.csv")
Crime_2021_08_oxfordshire_  = fread("datasets\\crime\\2021-08\\2021-08-thames-valley-street.csv")
Crime_2021_09_oxfordshire_  = fread("datasets\\crime\\2021-09\\2021-09-thames-valley-street.csv")
Crime_2021_10_oxfordshire_  = fread("datasets\\crime\\2021-10\\2021-10-thames-valley-street.csv")
Crime_2021_11_oxfordshire_  = fread("datasets\\crime\\2021-11\\2021-11-thames-valley-street.csv")
Crime_2021_12_oxfordshire_  = fread("datasets\\crime\\2021-12\\2021-12-thames-valley-street.csv")

Crime_2022_01_oxfordshire_  = fread("datasets\\crime\\2022-01\\2022-01-thames-valley-street.csv")
Crime_2022_02_oxfordshire_  = fread("datasets\\crime\\2022-02\\2022-02-thames-valley-street.csv")
Crime_2022_03_oxfordshire_  = fread("datasets\\crime\\2022-03\\2022-03-thames-valley-street.csv")
Crime_2022_04_oxfordshire_  = fread("datasets\\crime\\2022-04\\2022-04-thames-valley-street.csv")
Crime_2022_05_oxfordshire_  = fread("datasets\\crime\\2022-05\\2022-05-thames-valley-street.csv")
Crime_2022_06_oxfordshire_  = fread("datasets\\crime\\2022-06\\2022-06-thames-valley-street.csv")
Crime_2022_07_oxfordshire_  = fread("datasets\\crime\\2022-07\\2022-07-thames-valley-street.csv")
Crime_2022_08_oxfordshire_  = fread("datasets\\crime\\2022-08\\2022-08-thames-valley-street.csv")
Crime_2022_09_oxfordshire_  = fread("datasets\\crime\\2022-09\\2022-09-thames-valley-street.csv")
Crime_2022_10_oxfordshire_  = fread("datasets\\crime\\2022-10\\2022-10-thames-valley-street.csv")
Crime_2022_11_oxfordshire_  = fread("datasets\\crime\\2022-11\\2022-11-thames-valley-street.csv")
Crime_2022_12_oxfordshire_  = fread("datasets\\crime\\2022-12\\2022-12-thames-valley-street.csv")

Crime_2023_01_oxfordshire_  = fread("datasets\\crime\\2023-01\\2023-01-thames-valley-street.csv")
Crime_2023_02_oxfordshire_  = fread("datasets\\crime\\2023-02\\2023-02-thames-valley-street.csv")
Crime_2023_03_oxfordshire_  = fread("datasets\\crime\\2023-03\\2023-03-thames-valley-street.csv")
Crime_2023_04_oxfordshire_  = fread("datasets\\crime\\2023-04\\2023-04-thames-valley-street.csv")
Crime_2023_05_oxfordshire_  = fread("datasets\\crime\\2023-05\\2023-05-thames-valley-street.csv")
Crime_2023_06_oxfordshire_  = fread("datasets\\crime\\2023-06\\2023-06-thames-valley-street.csv")

#north_yorkshire_


Crime_2021_01_north_yorkshire_ = fread("datasets\\crime\\2021-01\\2021-01-north-yorkshire-street.csv")
Crime_2021_02_north_yorkshire_ = fread("datasets\\crime\\2021-02\\2021-02-north-yorkshire-street.csv")
Crime_2021_03_north_yorkshire_ = fread("datasets\\crime\\2021-03\\2021-03-north-yorkshire-street.csv")
Crime_2021_04_north_yorkshire_ = fread("datasets\\crime\\2021-04\\2021-04-north-yorkshire-street.csv")
Crime_2021_05_north_yorkshire_ = fread("datasets\\crime\\2021-05\\2021-05-north-yorkshire-street.csv")
Crime_2021_06_north_yorkshire_ = fread("datasets\\crime\\2021-06\\2021-06-north-yorkshire-street.csv")
Crime_2021_07_north_yorkshire_ = fread("datasets\\crime\\2021-07\\2021-07-north-yorkshire-street.csv")
Crime_2021_08_north_yorkshire_ = fread("datasets\\crime\\2021-08\\2021-08-north-yorkshire-street.csv")
Crime_2021_09_north_yorkshire_ = fread("datasets\\crime\\2021-09\\2021-09-north-yorkshire-street.csv")
Crime_2021_10_north_yorkshire_ = fread("datasets\\crime\\2021-10\\2021-10-north-yorkshire-street.csv")
Crime_2021_11_north_yorkshire_ = fread("datasets\\crime\\2021-11\\2021-11-north-yorkshire-street.csv")
Crime_2021_12_north_yorkshire_ = fread("datasets\\crime\\2021-12\\2021-12-north-yorkshire-street.csv")

Crime_2022_01_north_yorkshire_ = fread("datasets\\crime\\2022-01\\2022-01-north-yorkshire-street.csv")
Crime_2022_02_north_yorkshire_ = fread("datasets\\crime\\2022-02\\2022-02-north-yorkshire-street.csv")
Crime_2022_03_north_yorkshire_ = fread("datasets\\crime\\2022-03\\2022-03-north-yorkshire-street.csv")
Crime_2022_04_north_yorkshire_ = fread("datasets\\crime\\2022-04\\2022-04-north-yorkshire-street.csv")
Crime_2022_05_north_yorkshire_ = fread("datasets\\crime\\2022-05\\2022-05-north-yorkshire-street.csv")
Crime_2022_06_north_yorkshire_ = fread("datasets\\crime\\2022-06\\2022-06-north-yorkshire-street.csv")
Crime_2022_07_north_yorkshire_ = fread("datasets\\crime\\2022-07\\2022-07-north-yorkshire-street.csv")
Crime_2022_08_north_yorkshire_ = fread("datasets\\crime\\2022-08\\2022-08-north-yorkshire-street.csv")
Crime_2022_09_north_yorkshire_ = fread("datasets\\crime\\2022-08\\2022-08-north-yorkshire-street.csv")
Crime_2022_10_north_yorkshire_ = fread("datasets\\crime\\2022-10\\2022-10-north-yorkshire-street.csv")
Crime_2022_11_north_yorkshire_ = fread("datasets\\crime\\2022-11\\2022-11-north-yorkshire-street.csv")
Crime_2022_12_north_yorkshire_ = fread("datasets\\crime\\2022-12\\2022-12-north-yorkshire-street.csv")

Crime_2023_01_north_yorkshire_ = fread("datasets\\crime\\2023-01\\2023-01-north-yorkshire-street.csv")
Crime_2023_02_north_yorkshire_ = fread("datasets\\crime\\2023-02\\2023-02-north-yorkshire-street.csv")
Crime_2023_03_north_yorkshire_ = fread("datasets\\crime\\2023-03\\2023-03-north-yorkshire-street.csv")
Crime_2023_04_north_yorkshire_ = fread("datasets\\crime\\2023-04\\2023-04-north-yorkshire-street.csv")
Crime_2023_05_north_yorkshire_ = fread("datasets\\crime\\2023-05\\2023-05-north-yorkshire-street.csv")
Crime_2023_06_north_yorkshire_ = fread("datasets\\crime\\2023-06\\2023-06-north-yorkshire-street.csv")



#south-yorkshire-street


Crime_2021_01_south_yorkshire_ = fread("datasets\\crime\\2021-01\\2021-01-south-yorkshire-street.csv")
Crime_2021_02_south_yorkshire_ = fread("datasets\\crime\\2021-02\\2021-02-south-yorkshire-street.csv")
Crime_2021_03_south_yorkshire_ = fread("datasets\\crime\\2021-03\\2021-03-south-yorkshire-street.csv")
Crime_2021_04_south_yorkshire_ = fread("datasets\\crime\\2021-04\\2021-04-south-yorkshire-street.csv")
Crime_2021_05_south_yorkshire_ = fread("datasets\\crime\\2021-05\\2021-05-south-yorkshire-street.csv")
Crime_2021_06_south_yorkshire_ = fread("datasets\\crime\\2021-06\\2021-06-south-yorkshire-street.csv")
Crime_2021_07_south_yorkshire_ = fread("datasets\\crime\\2021-07\\2021-07-south-yorkshire-street.csv")
Crime_2021_08_south_yorkshire_ = fread("datasets\\crime\\2021-08\\2021-08-south-yorkshire-street.csv")
Crime_2021_09_south_yorkshire_ = fread("datasets\\crime\\2021-09\\2021-09-south-yorkshire-street.csv")
Crime_2021_10_south_yorkshire_ = fread("datasets\\crime\\2021-10\\2021-10-south-yorkshire-street.csv")
Crime_2021_11_south_yorkshire_ = fread("datasets\\crime\\2021-11\\2021-11-south-yorkshire-street.csv")
Crime_2021_12_south_yorkshire_ = fread("datasets\\crime\\2021-12\\2021-12-south-yorkshire-street.csv")

Crime_2022_01_south_yorkshire_ = fread("datasets\\crime\\2022-01\\2022-01-south-yorkshire-street.csv")
Crime_2022_02_south_yorkshire_ = fread("datasets\\crime\\2022-02\\2022-02-south-yorkshire-street.csv")
Crime_2022_03_south_yorkshire_ = fread("datasets\\crime\\2022-03\\2022-03-south-yorkshire-street.csv")
Crime_2022_04_south_yorkshire_ = fread("datasets\\crime\\2022-04\\2022-04-south-yorkshire-street.csv")
Crime_2022_05_south_yorkshire_ = fread("datasets\\crime\\2022-05\\2022-05-south-yorkshire-street.csv")
Crime_2022_06_south_yorkshire_ = fread("datasets\\crime\\2022-06\\2022-06-south-yorkshire-street.csv")
Crime_2022_07_south_yorkshire_ = fread("datasets\\crime\\2022-07\\2022-07-south-yorkshire-street.csv")
Crime_2022_08_south_yorkshire_ = fread("datasets\\crime\\2022-08\\2022-08-south-yorkshire-street.csv")
Crime_2022_09_south_yorkshire_ = fread("datasets\\crime\\2022-08\\2022-08-south-yorkshire-street.csv")
Crime_2022_10_south_yorkshire_ = fread("datasets\\crime\\2022-10\\2022-10-south-yorkshire-street.csv")
Crime_2022_11_south_yorkshire_ = fread("datasets\\crime\\2022-11\\2022-11-south-yorkshire-street.csv")
Crime_2022_12_south_yorkshire_ = fread("datasets\\crime\\2022-12\\2022-12-south-yorkshire-street.csv")

Crime_2023_01_south_yorkshire_ = fread("datasets\\crime\\2023-01\\2023-01-south-yorkshire-street.csv")
Crime_2023_02_south_yorkshire_ = fread("datasets\\crime\\2023-02\\2023-02-south-yorkshire-street.csv")
Crime_2023_03_south_yorkshire_ = fread("datasets\\crime\\2023-03\\2023-03-south-yorkshire-street.csv")
Crime_2023_04_south_yorkshire_ = fread("datasets\\crime\\2023-04\\2023-04-south-yorkshire-street.csv")
Crime_2023_05_south_yorkshire_ = fread("datasets\\crime\\2023-05\\2023-05-south-yorkshire-street.csv")
Crime_2023_06_south_yorkshire_ = fread("datasets\\crime\\2023-06\\2023-06-south-yorkshire-street.csv")





#West-yorkshire-street

Crime_2021_01_west_yorkshire_ = fread("datasets\\crime\\2021-01\\2021-01-west-yorkshire-street.csv")
Crime_2021_02_west_yorkshire_ = fread("datasets\\crime\\2021-02\\2021-02-west-yorkshire-street.csv")
Crime_2021_03_west_yorkshire_ = fread("datasets\\crime\\2021-03\\2021-03-west-yorkshire-street.csv")
Crime_2021_04_west_yorkshire_ = fread("datasets\\crime\\2021-04\\2021-04-west-yorkshire-street.csv")
Crime_2021_05_west_yorkshire_ = fread("datasets\\crime\\2021-05\\2021-05-west-yorkshire-street.csv")
Crime_2021_06_west_yorkshire_ = fread("datasets\\crime\\2021-06\\2021-06-west-yorkshire-street.csv")
Crime_2021_07_west_yorkshire_ = fread("datasets\\crime\\2021-07\\2021-07-west-yorkshire-street.csv")
Crime_2021_08_west_yorkshire_ = fread("datasets\\crime\\2021-08\\2021-08-west-yorkshire-street.csv")
Crime_2021_09_west_yorkshire_ = fread("datasets\\crime\\2021-09\\2021-09-west-yorkshire-street.csv")
Crime_2021_10_west_yorkshire_ = fread("datasets\\crime\\2021-10\\2021-10-west-yorkshire-street.csv")
Crime_2021_11_west_yorkshire_ = fread("datasets\\crime\\2021-11\\2021-11-west-yorkshire-street.csv")
Crime_2021_12_west_yorkshire_ = fread("datasets\\crime\\2021-12\\2021-12-west-yorkshire-street.csv")

Crime_2022_01_west_yorkshire_ = fread("datasets\\crime\\2022-01\\2022-01-west-yorkshire-street.csv")
Crime_2022_02_west_yorkshire_ = fread("datasets\\crime\\2022-02\\2022-02-west-yorkshire-street.csv")
Crime_2022_03_west_yorkshire_ = fread("datasets\\crime\\2022-03\\2022-03-west-yorkshire-street.csv")
Crime_2022_04_west_yorkshire_ = fread("datasets\\crime\\2022-04\\2022-04-west-yorkshire-street.csv")
Crime_2022_05_west_yorkshire_ = fread("datasets\\crime\\2022-05\\2022-05-west-yorkshire-street.csv")
Crime_2022_06_west_yorkshire_ = fread("datasets\\crime\\2022-06\\2022-06-west-yorkshire-street.csv")
Crime_2022_07_west_yorkshire_ = fread("datasets\\crime\\2022-07\\2022-07-west-yorkshire-street.csv")
Crime_2022_08_west_yorkshire_ = fread("datasets\\crime\\2022-08\\2022-08-west-yorkshire-street.csv")
Crime_2022_09_west_yorkshire_ = fread("datasets\\crime\\2022-08\\2022-08-west-yorkshire-street.csv")
Crime_2022_10_west_yorkshire_ = fread("datasets\\crime\\2022-10\\2022-10-west-yorkshire-street.csv")
Crime_2022_11_west_yorkshire_ = fread("datasets\\crime\\2022-11\\2022-11-west-yorkshire-street.csv")
Crime_2022_12_west_yorkshire_ = fread("datasets\\crime\\2022-12\\2022-12-west-yorkshire-street.csv")

Crime_2023_01_west_yorkshire_ = fread("datasets\\crime\\2023-01\\2023-01-west-yorkshire-street.csv")
Crime_2023_02_west_yorkshire_ = fread("datasets\\crime\\2023-02\\2023-02-west-yorkshire-street.csv")
Crime_2023_03_west_yorkshire_ = fread("datasets\\crime\\2023-03\\2023-03-west-yorkshire-street.csv")
Crime_2023_04_west_yorkshire_ = fread("datasets\\crime\\2023-04\\2023-04-west-yorkshire-street.csv")
Crime_2023_05_west_yorkshire_ = fread("datasets\\crime\\2023-05\\2023-05-west-yorkshire-street.csv")
Crime_2023_06_west_yorkshire_ = fread("datasets\\crime\\2023-06\\2023-06-west-yorkshire-street.csv")




Crime_combined = rbind(
  Crime_2021_01_oxfordshire_,Crime_2021_02_oxfordshire_,Crime_2021_03_oxfordshire_,Crime_2021_04_oxfordshire_,
  Crime_2021_05_oxfordshire_,Crime_2021_06_oxfordshire_,Crime_2021_07_oxfordshire_,Crime_2021_08_oxfordshire_,
  Crime_2021_09_oxfordshire_,Crime_2021_10_oxfordshire_,Crime_2021_11_oxfordshire_,Crime_2021_12_oxfordshire_,
  Crime_2022_01_oxfordshire_,Crime_2022_02_oxfordshire_,Crime_2022_03_oxfordshire_,Crime_2022_04_oxfordshire_,
  Crime_2022_05_oxfordshire_,Crime_2022_06_oxfordshire_,Crime_2022_07_oxfordshire_,Crime_2022_08_oxfordshire_,
  Crime_2022_09_oxfordshire_,Crime_2022_10_oxfordshire_,Crime_2022_11_oxfordshire_,Crime_2022_12_oxfordshire_,
  Crime_2023_01_oxfordshire_,Crime_2023_02_oxfordshire_,Crime_2023_03_oxfordshire_,Crime_2023_04_oxfordshire_,
  Crime_2023_05_oxfordshire_,Crime_2023_06_oxfordshire_,
  
  Crime_2021_01_north_yorkshire_,Crime_2021_02_north_yorkshire_,Crime_2021_02_north_yorkshire_,Crime_2021_04_north_yorkshire_,
  Crime_2021_05_north_yorkshire_,Crime_2021_06_north_yorkshire_,Crime_2021_07_north_yorkshire_,Crime_2021_08_north_yorkshire_,
  Crime_2021_09_north_yorkshire_,Crime_2021_10_north_yorkshire_,Crime_2021_11_north_yorkshire_,Crime_2021_12_north_yorkshire_,
  Crime_2022_01_north_yorkshire_,Crime_2022_02_north_yorkshire_,Crime_2022_03_north_yorkshire_,Crime_2022_04_north_yorkshire_,
  Crime_2022_05_north_yorkshire_,Crime_2022_06_north_yorkshire_,Crime_2022_07_north_yorkshire_,Crime_2022_08_north_yorkshire_,
  Crime_2022_09_north_yorkshire_,Crime_2022_10_north_yorkshire_,Crime_2022_11_north_yorkshire_,Crime_2022_12_north_yorkshire_,
  Crime_2023_01_north_yorkshire_,Crime_2023_02_north_yorkshire_,Crime_2023_03_north_yorkshire_,Crime_2023_04_north_yorkshire_,
  Crime_2023_05_north_yorkshire_,Crime_2023_06_north_yorkshire_,
  
  Crime_2021_01_south_yorkshire_,Crime_2021_02_south_yorkshire_,Crime_2021_03_south_yorkshire_,Crime_2021_04_south_yorkshire_,
  Crime_2021_05_south_yorkshire_,Crime_2021_06_south_yorkshire_,Crime_2021_07_south_yorkshire_,Crime_2021_08_south_yorkshire_,
  Crime_2021_09_south_yorkshire_,Crime_2021_10_south_yorkshire_,Crime_2021_11_south_yorkshire_,Crime_2021_12_south_yorkshire_,
  Crime_2022_01_south_yorkshire_,Crime_2022_02_south_yorkshire_,Crime_2022_03_south_yorkshire_,Crime_2022_04_south_yorkshire_,
  Crime_2022_05_south_yorkshire_,Crime_2022_06_south_yorkshire_,Crime_2022_07_south_yorkshire_,Crime_2022_08_south_yorkshire_,
  Crime_2022_09_south_yorkshire_,Crime_2022_10_south_yorkshire_,Crime_2022_11_south_yorkshire_,Crime_2022_12_south_yorkshire_,
  Crime_2023_01_south_yorkshire_,Crime_2023_02_south_yorkshire_,Crime_2023_03_south_yorkshire_,Crime_2023_04_south_yorkshire_,
  Crime_2023_05_south_yorkshire_,Crime_2023_06_south_yorkshire_,
  
  Crime_2021_01_west_yorkshire_,Crime_2021_02_west_yorkshire_,Crime_2021_03_west_yorkshire_,Crime_2021_04_west_yorkshire_,
  Crime_2021_05_west_yorkshire_,Crime_2021_06_west_yorkshire_,Crime_2021_07_west_yorkshire_,Crime_2021_08_west_yorkshire_,
  Crime_2021_09_west_yorkshire_,Crime_2021_10_west_yorkshire_,Crime_2021_11_west_yorkshire_,Crime_2021_12_west_yorkshire_,
  Crime_2022_01_west_yorkshire_,Crime_2022_02_west_yorkshire_,Crime_2022_03_west_yorkshire_,Crime_2022_04_west_yorkshire_,
  Crime_2022_05_west_yorkshire_,Crime_2022_06_west_yorkshire_,Crime_2022_07_west_yorkshire_,Crime_2022_08_west_yorkshire_,
  Crime_2022_09_west_yorkshire_,Crime_2022_10_west_yorkshire_,Crime_2022_11_west_yorkshire_,Crime_2022_12_west_yorkshire_,
  Crime_2023_01_west_yorkshire_,Crime_2023_02_west_yorkshire_,Crime_2023_03_west_yorkshire_,Crime_2023_04_west_yorkshire_,
  Crime_2023_05_west_yorkshire_,Crime_2023_06_west_yorkshire_
  
)
#Combine crime data sets
Crime_combined<- Crime_combined %>% 
  as_tibble()

View(Crime_combined)
write.csv(Crime_combined,"cleaning/combined datasets/combined_crime_dataset.csv",row.names = FALSE)

#cleaning crime data
crimedata = fread('cleaning/combined datasets/combined_crime_dataset.csv') %>% 
  select(Month, `LSOA code`, `Crime type`)

colnames(crimedata) = c("Year", "LSOA.code", "CrimeType")
pattern = ' .*$'
LsoaToPostcode = fread("cleaning/cleaned datasets/cleaned_LSOA_data.csv")
colnames(LsoaToPostcode)=c("LSOA.code","ShortPostCode","Town","District","County")
View(LsoaToPostcode)

crimedata_cleaned = crimedata %>%
  slice(1:50000) %>% 
  left_join(LsoaToPostcode,by="LSOA.code") %>% 
  mutate(Year = str_trim(substring(Year, 1,4))) %>% 
  group_by(ShortPostCode,CrimeType,Year)%>% 
  select(ShortPostCode, Year, CrimeType ) %>% 
  na.omit() %>% 
  tally() %>% 
  as_tibble()

View(crimedata_cleaned)

crimedata_cleaned = cbind(ID = 1:nrow(crimedata_cleaned), crimedata_cleaned)  
colnames(crimedata_cleaned)= c("ID","ShortPostCode","CrimeType","Year","CrimeCount")
View(crimedata_cleaned)

#Export cleaned crime in csv
write.csv(crimedata_cleaned, "cleaning/cleaned datasets/cleaned_crime_dataset.csv",row.names = FALSE)




