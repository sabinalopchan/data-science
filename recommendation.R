library(dplyr)
library(readr)
library(tidyr)

library(caret)

setwd("E:/data science")

town_population = read_csv("cleaning/cleaned datasets/cleaned_population_datasets.csv", show_col_types = FALSE)%>%
  select(ShortPostCode, Town, District, County)
house_price = read_csv("cleaning/cleaned datasets/cleaned_house_pricing_2019-2022.csv")
school_data = read_csv("cleaning/cleaned datasets/cleaned_school_dataset.csv")
crime = read_csv("cleaning/cleaned datasets/cleaned_crime_dataset.csv")
broadband = read_csv("cleaning/cleaned datasets/cleaned_broadband_speed_dataset.csv")
postcode_LSOA =read_csv("cleaning/cleaned datasets/cleaned_LSOA.csv")


#---House Price score----
house_pricing= house_price %>%
  left_join(town_population,by="ShortPostCode") %>% 
  na.omit()
housePrices=house_pricing  %>% 
  filter(Year=="2022") %>% 
  group_by(Town) %>% 
  summarise(Price=mean(Price)) %>% 
  arrange(Price) %>% 
  mutate(HouseScore=10-(Price/120000)) %>% 
  select(Town, HouseScore)

housePrices
view(housePrices)

#-------Download Score-------
broadband_speed =broadband %>%
  left_join(town_population,by="ShortPostCode") %>% 
  na.omit()

download_speed=broadband_speed%>% 
  group_by(Town) %>% 
  summarise(downloadSpeed=Avgdownload) %>% 
  arrange(downloadSpeed) %>% 
  mutate(DownloadScore=10-(downloadSpeed/120000)) %>% 
  select(Town,DownloadScore) %>% 
  distinct()
download_speed
view(download_speed)

#-------- Crime score---
crime_data =crime %>%
  left_join(town_population,by="ShortPostCode") %>% 
  na.omit()
crime_rank=crime_data%>% 
  group_by(Town) %>% 
  summarise(crime_score=mean(CrimeCount)) %>% 
  arrange(desc(crime_score)) %>% 
  mutate(crime_score=10-(crime_score/1200)) %>% 
  select(Town,crime_score)
crime_rank
view(crime_rank)




#------School score-----
school_score = school_data %>%
  left_join(town_population,by="ShortPostCode") %>% 
  na.omit()

school_score=school_score%>% 
  group_by(Town) %>% 
  summarise(school_score=mean(Attainment8Score)) %>% 
  arrange(school_score) %>% 
  mutate(school_score=10-(school_score/1800)) %>% 
  select(Town,school_score) %>% 
  distinct()
school_score
view(school_score)

# Merge all score data
merged_scores <- town_population %>%
  left_join(housePrices, by = "Town") %>%
  left_join(download_speed, by = "Town") %>%
  left_join(crime_rank, by = "Town") %>%
  left_join(school_score, by = "Town")

# Print the merged score data
print(merged_scores)

positive_scores_data <- merged_scores %>%
  filter(HouseScore > 0, DownloadScore > 0, crime_score > 0, school_score > 0)

# Print the filtered data
View(positive_scores_data)

unique_positive_scores_data <- positive_scores_data %>%
  distinct(ShortPostCode, .keep_all = TRUE)

# Print the data with unique 
print(unique_positive_scores_data)

# Select top 3 rows with highest total scores
top_scores_data <- unique_positive_scores_data %>%
  mutate(TotalScore = HouseScore + DownloadScore + crime_score + school_score) %>%
  arrange(desc(TotalScore)) %>%
  head(3)

# Print the top 3 rows of data with highest scores
print(top_scores_data)
View(top_scores_data)
