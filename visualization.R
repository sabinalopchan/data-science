library(tidyverse)
library(dplyr)
library(scales)
library(ggrepel)
library(ggplot2)

#Set working directory
setwd("E:/data science")


euro <- dollar_format(prefix = "\u20ac", big.mark = ",")
# House Pricing

town_population = read_csv("cleaning/cleaned datasets/cleaned_population_datasets.csv", show_col_types = FALSE) %>%
  select(-Year)
house_pricing = read_csv("cleaning/cleaned datasets/cleaned_house_pricing_2019-2022.csv")

house_pricing_clean <- house_pricing %>%
  select(-Postcode) %>%
  left_join(town_population, by ="ShortPostCode")

house_pricing_clean$County[house_pricing_clean$County == "YORK"] <- "YORKSHIRE"

house_pricing_clean$County[house_pricing_clean$County == "WEST YORKSHIRE"] <- "YORKSHIRE"
house_pricing_clean$County[house_pricing_clean$County == "NORTH YORKSHIRE"] <- "YORKSHIRE"
house_pricing_clean$County[house_pricing_clean$County == "SOUTH YORKSHIRE"] <- "YORKSHIRE"

filter_house_town = house_pricing_clean %>%
  filter(County == "OXFORDSHIRE" |County=="YORKSHIRE") %>%
  group_by(Town,District,County,Year) %>%
  summarise(AveragePrice = mean(Price)) %>%
  ungroup(Town,District,County,Year) %>%
  na.omit()

#Boxplot of Average House Prices 2022
filter_house_town %>%
  filter(Year==2022) %>%
  group_by(District) %>%
  ggplot(aes(x=District, y=AveragePrice, fill=District)) +
  scale_y_continuous(limits=c(0,2000000), breaks = seq(0,2000000,200000), 
                     label = euro) +
  geom_boxplot() +
  coord_flip() +
  labs(title = " House price by district (2022)")



#BarChart of Average house Prices 2022

house_pricing_clean %>%
  filter(Year==2022) %>%
  group_by(District) %>%
  summarise(AveragePrice = mean(Price)) %>%
  ggplot(aes(x = District, y = AveragePrice)) +
  geom_bar(position = "stack",stat = "identity", fill = "skyblue") +
  scale_y_continuous(limits=c(0,5000000),breaks = seq(0, 5000000, 500000), 
                     label = euro) +
  geom_text(aes(label = euro(AveragePrice)), 
            vjust = -0.25) +
  coord_flip()+
  labs(title = "2022 house price by District") 

#Linegraph of Average house prices (2019-2022)

house_pricing_clean %>%
  #filter(Year==2019 | Year==2020 | Year==2021 | Year==2022) %>%
  group_by(Year) %>%
  summarise(AveragePrice = mean(Price)) %>%
  ggplot(aes(x = Year, y = AveragePrice)) +
  geom_line(size = 1.5, color = "lightgray") +
  geom_text(aes(label = euro(AveragePrice)), vjust = -0.85) +
  scale_y_continuous(breaks = seq(0, 500000, 50000), 
                     label = euro) +
  scale_x_continuous(breaks = 2019:2022) +
  geom_point(size = 2, color = "darkblue") +
  labs(title = "2019-2022 average house prices")


#---------------------------End-----------------------



#---------Broadband Speed------------------
#- Sub heading (Broadband Speed) [Explain chart]
#- Boxplot = Average download speed [x label = download speed, y label = district's name of both counties]
#- Barchart (2 different chart)
#-- oxfordshire 
#--yorkshire 

town_population = read_csv("cleaning/cleaned datasets/cleaned_population_datasets.csv", show_col_types = FALSE) %>%
  select(ShortPostCode, Town, District, County)
broadband_data = read_csv("cleaning/cleaned datasets/cleaned_broadband_speed_dataset.csv")



broadband = town_population %>%
  left_join(broadband_data, by="ShortPostCode")

broadband$County[broadband$County == "YORK"] <- "YORKSHIRE"
broadband$County[broadband$County == "WEST YORKSHIRE"] <- "YORKSHIRE"
broadband$County[broadband$County == "NORTH YORKSHIRE"] <- "YORKSHIRE"
broadband$County[broadband$County == "SOUTH YORKSHIRE"] <- "YORKSHIRE"


View(broadband)

#-----------------------Boxplot of Average Download Speed ------
broadband %>%
group_by(District) %>% 
  ggplot(aes(x = District, y = `Avgdownload`, fill=District)) +
  scale_y_continuous(breaks = seq(0,1000,50)) +
  geom_boxplot() +
  labs(title = "Average download speed (Mbit/s) by district", x = "District",
       y = "Average Download Speed (Mbit/s)")+
  coord_flip()

#-----------Barchart of  Broadband speed (Oxfordshire)-----------------------

ggplot(broadband,aes(y=District)) +
  labs(x="Speeds (Mbits/s)",y="District",title=" OXfordshire Broadband Speeds")+
  geom_bar(data=filter(broadband,County=="OXFORDSHIRE"),aes(x=Avgdownload,fill="Average"),stat="Identity")+
  guides(fill=guide_legend("Download Speeds"))

#-----------Barchart of  Broadband speed (Yorkshire)-----------------------

ggplot(broadband,aes(y=District)) +
  labs(x="Speeds (Mbits/s)",y="District",title=" Yorkshire Broadband Speeds")+
  geom_bar(data=filter(broadband,County=="YORKSHIRE"),aes(x=Avgdownload,fill="Average"),stat="Identity")+
  guides(fill=guide_legend("Download Speeds"))





#-----------------------END------------------



#---------------------------Crime---------------------

town_population = read_csv("cleaning/cleaned datasets/cleaned_population_datasets.csv", show_col_types = FALSE) %>%
  select(-Year)
crime_data = read_csv("cleaning/cleaned datasets/cleaned_crime_dataset.csv")



crime_data = crime_data %>% 
  left_join(town_population, by = "ShortPostCode") %>% 
  na.omit()


crime_data$County[crime_data$County == "WEST YORKSHIRE" ] <- "YORKSHIRE"
crime_data$County[crime_data$County == "NORTH YORKSHIRE" ] <- "YORKSHIRE"
crime_data$County[crime_data$County == "SOUTH YORKSHIRE" ] <- "YORKSHIRE"

view(crime_data)

#-------------Boxplot of Drug Offense Rate 2021-2022-----------------

filtered_crime_data <- crime_data %>%
  filter((County %in% c("OXFORDSHIRE", "YORKSHIRE")) & (Year %in% c(2021, 2022))) %>% 
  filter(CrimeType == "Drugs") %>% 
  mutate(DrugOffenceRate = (CrimeCount / (Population2021+Population2022)) * 10000) %>% 
  as_tibble()

ggplot(data = filtered_crime_data, aes(x = District, y = CrimeCount, fill = CrimeType)) +
  scale_y_continuous(limits=c(0,200000), breaks = seq(0,200000,20000)) +
  geom_boxplot() +
  labs(title = "Drug Offence Rate per 10000 in 2021-2022") +
  coord_flip()

#-------------Radar chart of Vehicle crime from 2021-2022

filtered_crime_data <- crime_data %>%
  filter(Year %in% c(2021, 2022) & CrimeType == "Vehicle crime")

crime_totals <- filtered_crime_data %>%
  group_by(District, Year) %>%
  summarise(TotalCrime = sum(CrimeCount))

pivot_data <- crime_totals %>%
  pivot_wider(names_from = Year, values_from = TotalCrime)
print(pivot_data)

library(fmsb)
library(plotly)
radar_chart <- plot_ly() %>%
  add_trace(type = "scatterpolar",
            r = crime_totals$TotalCrime,
            theta = crime_totals$District,
            mode = "lines",
            line = list(color = "rgba(0, 128, 255, 1)"),
            fill = "toself",
            fillcolor = "rgba(0, 128, 255, 0.5)",
            text = crime_totals$TotalCrime) %>%
  layout(
    polar = list(radialaxis = list(visible = TRUE, range = c(0, max(crime_totals$TotalCrime)),tickformat = 'd')),
    showlegend = FALSE,
    title = "Vehicle Crime Rate 2021"
  )
print(radar_chart)


#-----------Robbery Rate(2021-2022)---------------------------
#--------Pie chart of Robbery Rate (District of both counties)

robbery_data <- crime_data %>% 
  filter(Year %in% c(2021, 2022) & CrimeType == "Robbery") %>%
  group_by(District) %>% 
  mutate(sumCount = sum(CrimeCount)) %>% 
  ungroup() %>%
  mutate(perc =sumCount / sum(CrimeCount)) %>% 
  arrange(perc) %>%
  mutate(labels = scales::percent(perc)) %>% 
  distinct(District, sumCount, perc, labels) %>% 
  select(District, sumCount, perc, labels)


robbery_data %>% 
  ggplot(aes(x = "", y = perc, fill = District)) +
  geom_col(color = "gray") +
  geom_label(aes(label = labels),color="black",
             position = position_stack(vjust = 0.8),
             show.legend = TRUE) +
  coord_polar(theta = "y") +
  theme_void()+
  labs(title="Robbery Rate by District in 2021-2022 ")


#-----Line Graph (Drug Offense Rate per 10000 people of both counties) [x axis = year, y axis = rate] - both in 1 diagram--


drugs_rate <- crime_data %>%
  filter((County %in% c("OXFORDSHIRE", "YORKSHIRE")) & (Year %in% c(2021, 2022))) %>% 
  filter(CrimeType == "Drugs") %>% 
  mutate(DrugOffenceRate = (CrimeCount / (Population2021+Population2022)) * 10000) %>% 
  as_tibble()

drugs_rate$Year <- as.character(drugs_rate$Year)

# Create a line chart
ggplot(drugs_rate, aes(x = Year, y = DrugOffenceRate, color = County)) +
  geom_line(size = 1.5, color = "lightgray") +
  geom_point(size = 2, color = "darkblue") +
  labs(x = "Year", y = "Drug Offense Rate per 10000 People", title = "Drug Offense Rate per 10000 People from 2021-2022", color = "County")+
  scale_x_discrete(labels = c("2021", "2022"))







#--------------------School-----------------------
school_data =read_csv("cleaning/cleaned datasets/cleaned_school_dataset.csv")

oxfordshire_schooldata = read_csv("cleaning/cleaned datasets/cleaned_oxfordshire_school_dataset.csv")

yorkshire_schooldata=read_csv("cleaning/cleaned datasets/cleaned_yorkshire_school_dataset.csv")

town_population = read_csv("cleaning/cleaned datasets/cleaned_population_datasets.csv", show_col_types = FALSE) %>%
  select(ShortPostCode, District)

View(town_population)
View(school_data)
View(oxfordshire_schooldata)
view(group_by(oxfordshire_schooldata,ShortPostCode))
View(yorkshire_schooldata)

school_data <- school_data %>%
  left_join(town_population, by="ShortPostCode") %>%
  na.omit()

#Average attainment 8 score [2022] (Boxplot) 
school_data %>%
  group_by(District) %>%
  summarise(AverageAttainment = mean(Attainment8Score)) %>%
  ggplot(aes(x = factor(District), y = AverageAttainment)) +
  geom_boxplot(color = "purple", fill = "skyblue") +  
  geom_text(aes(label = AverageAttainment), vjust = -0.85) +
  scale_x_discrete() +
  labs(title = "Average Attainment8Score by district")

# Linechart of avg attainment 8 score (2021-2022) filter by district(Oxfordshire)


oxfordshire_data <- oxfordshire_schooldata %>%
  inner_join(town_population, by="ShortPostCode") %>%
  na.omit()
View(oxfordshire_data)

filtered_oxfordshire <- oxfordshire_data %>%
  filter(Year==2021 | Year ==2022) %>%
  group_by(District, Year) %>%
  summarise(AverageAttainment = mean(Attainment8Score))
View(filtered_oxfordshire)

ggplot(filtered_oxfordshire, aes(x = Year, y = AverageAttainment, group = District)) +
  geom_line(size = 4, color = "green") +
  geom_text(aes(label = AverageAttainment), vjust = -0.85) +
  geom_point(size = 2, color = "steelblue") +
  labs(title = " Average Attainment Score from 2020-2022 Filter by Oxfordshire District")


# Linechart of avg attainment 8 score (2021-2022) filter by district (Yorkshire)


yorkshire_data <- yorkshire_schooldata %>%
  inner_join(town_population, by="ShortPostCode") %>%
  na.omit()
View(yorkshire_data)

filtered_yorkshire <- yorkshire_data %>%
  filter(Year==2021 | Year ==2022) %>%
  group_by(District, Year) %>%
  summarise(AverageAttainment = mean(Attainment8Score))
View(filtered_yorkshire)

ggplot(filtered_yorkshire, aes(x = Year, y = AverageAttainment, group = District)) +
  geom_line(size = 4, color = "green") +
  geom_text(aes(label = AverageAttainment), vjust = -0.85) +
  geom_point(size = 2, color = "steelblue") +
  labs(title = " Average Attainment Score from 2020-2022 Filter by District (YorkShire)") 

#----------------END------------------------


#------------------Linear Regression--------------------------


town_population = read_csv("cleaning/cleaned datasets/cleaned_population_datasets.csv", show_col_types = FALSE) %>%
  select(ShortPostCode, Town, District, County)


prices = read_csv("cleaning/cleaned datasets/cleaned_house_pricing_2019-2022.csv")

speed = read_csv("cleaning/cleaned datasets/cleaned_broadband_speed_dataset.csv") %>% 
  na.omit()

crime = read_csv("cleaning/cleaned datasets/cleaned_crime_dataset.csv")

school = read.csv("cleaning/cleaned datasets/cleaned_school_dataset.csv")


#---------House Prices Vs Download Speed------
options(scipen=999)

HousePrices = prices %>%
  filter(Year=="2021" | Year=="2022") %>%
  left_join(town_population,by="ShortPostCode") %>%  
  group_by(Town,County) %>%
  summarise(Price=mean(Price))


BroardbandSpeeds = speed %>%
  left_join(town_population,by="ShortPostCode") %>%
  group_by(Town,County) %>%
  summarise(AverageDownload=mean(Avgdownload))

liner_modeling = HousePrices %>% left_join(BroardbandSpeeds,by="Town")
model = lm(data= liner_modeling, Price~AverageDownload)
summary(model)

color= c("OXFORDSHIRE" = "purple", "YORKSHIRE" = "green")

ggplot(liner_modeling,aes(x=AverageDownload,y=Price)) +
  geom_point(data = filter(liner_modeling,County.x=="YORKSHIRE"),aes(color="YORKSHIRE"))+
  geom_point(data = filter(liner_modeling,County.x=="OXFORDSHIRE"), aes(color="OXFORDSHIRE")) +
  geom_smooth(method=lm,se=FALSE,color="yellow")+
  labs(x="Download Speed (Mbit/s)",y="Price",title="House Prices vs Download Speed",color="County")


#-------------------- House prices VS Drug Rates [both counties - scatter graph] (x axis = drug rate(per 10000 people), y axis = price)
HousePrices = prices %>%
  filter(Year=="2021" | Year=="2022" ) %>%
  left_join(town_population,by="ShortPostCode") %>%  
  group_by(Town,County) %>%
  summarise(Price=mean(Price))

Drugs = crime %>%
  left_join(town_population,by="ShortPostCode") %>%
  group_by(Town,County) %>%
  filter(CrimeType=="Drugs") %>% 
  na.omit()

linear_modeling1 = HousePrices %>% left_join(Drugs ,by="Town") %>% 
  na.omit()
model1 = lm(data= linear_modeling1, Price~CrimeCount)
summary(model1)

color= c("OXFORDSHIRE" = "brown", "YORKSHIRE" = "gray")

ggplot(linear_modeling1,aes(x=CrimeCount,y=Price)) +
  geom_point(data = filter(linear_modeling1,County.x=="YORKSHIRE"),aes(color="YORKSHIRE"))+
  geom_point(data = filter(linear_modeling1,County.x=="OXFORDSHIRE"), aes(color="OXFORDSHIRE")) +
  geom_smooth(method=lm,se=FALSE,color="purple")+
  labs(x="Drugs Crime Countnt",y="House Price",title="House Prices Vs Drug Rate",color="County")



#-------------------Average attaainment8 Vs House Prices-----

attainment= school %>%
  left_join(town_population,by="ShortPostCode") %>%  
  group_by(Town,County) %>%
  summarise(meanAttainment=mean(Attainment8Score))

attainment

HousePrices = prices %>%
  left_join(town_population,by="ShortPostCode") %>%  
  group_by(Town,County) %>%
  summarise(Price=mean(Price))

linear_modeling2 = HousePrices %>% left_join(attainment ,by="Town") %>% 
  na.omit()
linear_modeling2
model1 = lm(data= linear_modeling2, Price~meanAttainment)
summary(model1)

color= c("OXFORDSHIRE" = "orange", "YORKSHIRE" = "brown")

ggplot(linear_modeling2,aes(x=meanAttainment,y=Price)) +
  geom_point(data = filter(linear_modeling2,County.x=="YORKSHIRE"),aes(color="YORKSHIRE"))+
  geom_point(data = filter(linear_modeling2,County.x=="OXFORDSHIRE"), aes(color="OXFORDSHIRE")) +
  geom_smooth(method=lm,se=FALSE,color="gray")+
  labs(x="Attainment8",y="Prices",title="average attainment  Vs house prices",color="County")




#--------------Average downloadspeed Vs Drug offense rate----
BroardbandSpeeds = speed %>%
  left_join(town_population,by="ShortPostCode") %>%
  group_by(Town,County) %>%
  summarise(AverageDownload=mean(Avgdownload))

Drugs = crime %>%
  left_join(town_population,by="ShortPostCode") %>%
  group_by(Town,County) %>%
  filter(CrimeType=="Drugs") %>% 
  na.omit()

linear_modeling3 = BroardbandSpeeds %>% left_join(Drugs ,by="Town") %>% 
  na.omit()
model3 = lm(data= linear_modeling3, AverageDownload~CrimeCount)
summary(model3)

colors1= c("OXFORDSHIRE" = "brown", "YORKSHIRE" = "skyblue")

ggplot(linear_modeling3,aes(x=CrimeCount,y=AverageDownload)) +
  geom_point(data = filter(linear_modeling3,County.x=="OXFORDSHIRE"),aes(color="OXFORDSHIRE"))+
  geom_point(data = filter(linear_modeling3,County.x=="YORKSHIRE"), aes(color="YORKSHIRE")) +
  geom_smooth(method=lm,se=FALSE,color="orange")+
  labs(x="Drugs Rate",y="Average Download",title="Average Download Speed Vs Drug Offense",color="County")



#----------------- Average attainment 8 scores VS Average download speed-------

# Calculate mean attainment score per town and county
attainment <- school %>%
  left_join(town_population, by = "ShortPostCode") %>%  
  group_by(Town, County) %>%
  summarise(meanAttainment = mean(Attainment8Score))


# Calculate average download speed per town and county
download_speeds <- speed %>%
  left_join(town_population, by = "ShortPostCode") %>% 
  group_by(Town, County) %>%
  summarise(meanDownloadSpeed = mean(Avgdownload)) %>%
  na.omit()

# Merge the data frames and remove rows with missing values
linear_modeling4 <- attainment %>%
  left_join(download_speeds, by = "Town") %>% 
  na.omit()

model <- lm(meanDownloadSpeed ~ meanAttainment, data = linear_modeling4)

summary(model)

# Create a scatter plot
color <- c("OXFORDSHIRE" = "red", "YORKSHIRE" = "black")

ggplot(linear_modeling4, aes(x = meanAttainment, y = meanDownloadSpeed)) +
  geom_point(data = filter(linear_modeling4, County.x == "YORKSHIRE"), aes(color = "YORKSHIRE")) +
  geom_point(data = filter(linear_modeling4, County.x == "OXFORDSHIRE"), aes(color = "OXFORDSHIRE")) +
  geom_smooth(method = lm, se = FALSE, color = "blue") +
  labs(x = "Average Attainment8 Score", y = "Average Download Speed", title = "Average Attainment Score vs Average Download Speed", color = "County")


