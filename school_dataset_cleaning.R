library(tidyverse)
library(dplyr)
library(stringi)
library(scales)
library(data.table)

setwd("E:/data science")
school_2018_2019 = fread("datasets/school/2018-2019/england_ks4final.csv",fill=TRUE) %>%
  mutate(Year = 2018) %>% 
  select( Year,PCODE,SCHNAME, ATT8SCR,) %>%  
  na.omit() %>% 
  distinct()

school_2019_2020 = fread("datasets/school/2018-2019/england_ks4final.csv",fill=TRUE) %>%
  mutate(Year = 2019) %>% 
  select( Year,PCODE,SCHNAME, ATT8SCR,) %>%  
  na.omit() %>% 
  distinct()

school_2021_2022 = fread("datasets/school/2021-2022/england_ks4final.csv",fill=TRUE) %>%
  mutate(Year = 2021) %>% 
  select( Year,PCODE,SCHNAME, ATT8SCR,) %>%  
  na.omit() %>% 
  distinct()

school_2022_2023 = fread("datasets/school/2021-2022/england_ks4final.csv",fill=TRUE) %>%
  mutate(Year = 2023) %>% 
  select( Year,PCODE,SCHNAME, ATT8SCR,) %>%  
  na.omit() %>% 
  distinct()

school_data = rbind(school_2018_2019,school_2019_2020,school_2021_2022,school_2022_2023)

write.csv(school_data, "cleaning/combined datasets/combined_school_dataset.csv", row.names = FALSE)

pattern = ' .*$'
cleaned_schooldata = school_data %>%
  mutate(ID = row_number()) %>%
  mutate(ShortPostCode = gsub(pattern,"",PCODE)) %>%
  filter(ATT8SCR != "NE" & ATT8SCR != "SUPP") %>%
  filter(ATT8SCR !="" & ShortPostCode!="" & PCODE!="") %>%
  select(ID,Year,PCODE,ShortPostCode,SCHNAME,ATT8SCR) %>%
  na.omit() %>%
  distinct()
View(cleaned_schooldata)

colnames(cleaned_schooldata) = c("ID", "Year", "PostCode", "ShortPostCode", "SchoolName", "Attainment8Score")

write.csv(cleaned_schooldata, "cleaning/cleaned datasets/cleaned_school_dataset.csv",row.names = FALSE)

house_pricing = read.csv("cleaning/combined datasets/combined_house_pricing_2019-2022.csv") %>%
  select(Postcode,County) %>%
  mutate(ShortPostCode=gsub(pattern,"",Postcode)) %>%
  select(ShortPostCode,County)

# Oxfordshire school data cleaning
oxfordshire_schooldata = cleaned_schooldata %>%
  left_join(house_pricing,by="ShortPostCode") %>%
  select(Year, PostCode, ShortPostCode,SchoolName,Attainment8Score, County) %>%
  filter(County == "OXFORDSHIRE") %>%
  na.omit() %>%
  distinct() %>%
  mutate(ID = row_number()) %>%
  select(ID,Year, PostCode,ShortPostCode,SchoolName,Attainment8Score,County)

write.csv(oxfordshire_schooldata, "cleaning/cleaned datasets/cleaned_oxfordshire_school_dataset.csv",row.names = FALSE)

#Yorkshire school data cleaning
yorkshire_schooldata = cleaned_schooldata %>%
  left_join(house_pricing,by="ShortPostCode") %>%
  select(Year, PostCode, ShortPostCode,SchoolName,Attainment8Score, County) %>%
  filter(County=="YORK" | County=="WEST YORKSHIRE" | County=="SOUTH YORKSHIRE" | County=="NORTH YORKSHIRE") %>%
  na.omit() %>%
  distinct() %>%
  mutate(ID = row_number()) %>%
  select(ID,Year, PostCode,ShortPostCode,SchoolName,Attainment8Score,County)

write.csv(yorkshire_schooldata, "cleaning/cleaned datasets/cleaned_yorkshire_school_dataset.csv",row.names = FALSE)


