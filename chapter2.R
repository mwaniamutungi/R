library(dplyr)
library(rattle)
library(rattle.data)
library(magrittr)
glimpse(weatherAUS)

l<- library(rattle)
print(l)

weatherAUS %>%
  select(MinTemp, MaxTemp, Rainfall, Sunshine)%>%
  summary()

rainy_days <- 
  weatherAUS%>%
  select(MinTemp, MaxTemp, Rainfall, Sunshine)%>%
  filter(Rainfall >=1)
print(rainy_days)

weatherAUS %>%
  filter(Rainfall==0) %T>%
  {head(.) %>% print}->
  no_rain

library(ggplot2)

cities <- c("Canberra", "Darwin", "Melbourne", "Sydney")
weatherAUS%>%
  filter(Location %in% cities) %>%
  filter(Temp3pm %>% is.na()%>% not())%>%
  ggplot(aes(x=Temp3pm, colour=Location, fill=Location))+
  geom_density(alpha=0.55)+
  labs(title='A',
       subtitle="B",
       x="Temp 3 pm",
       y="Density")














