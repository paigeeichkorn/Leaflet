#Map with ggplot2
#list of packages we need
install.packages("ggplot2")
install.packages("ggmap")
install.packages("maps")
install.packages("mapdata")

#Call out the packages
library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)

#get data for the base map
usa <- map_data("usa")
states <- map_data("state")
counties <- map_data("county")

small <- filter(stops, subject_age > 70)

#filter Philadelphia, PA
library(tidyverse)
library(dplyr)
philly <- filter(counties, region =="pennsylvania", subregion=="philadelphia")

#create the map
library(ggplot2)
m <- ggplot(philly) + geom_polygon(aes(x=long, y=lat, group=group))+
  coord_fixed(1.3)+
  geom_point(data=small, aes(x=lng, y=lat, color=subject_race), size=1)+ facet_wrap(~subject_race)


m
