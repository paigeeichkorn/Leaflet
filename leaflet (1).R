# Create interactive maps with Leaflet
#1.Install and load the needed libraries
#install.packages("httpuv")
#install.packages("leaflet")
library(httpuv)
library(leaflet)
#2.Create a simple map of Philadelphia, PA
m <- leaflet() %>% 
  addTiles() %>% 
  setView(lng= -75.172347, lat= 39.952150, zoom=16) %>% 
  addMarkers(lng= -75.172347, lat= 39.952150, popup="Philadelphia, PA")

m
#3. It's your turn to create a simple map of Manhattan, KS and Kedzie Hall
m2 <- leaflet() %>% 
  addTiles() %>% 
  setView(lng= 39.188086, lat= -96.581392, zoom=16) %>% 
  addMarkers(lng= -96.581392, lat=  39.188086, popup="Kedzie Hall") %>% 
  addMarkers(lng= -96.581392, lat= 39.18357, popup="Manhattan, KS")

m2

#4. Map all your favorite restaurants in Manhattan, KS
m3 <- leaflet() %>% 
  addTiles() %>% 
  setView(lng= -96.571671, lat= 39.183609, zoom=16) %>% 
  addMarkers(lng= -96.575747, lat= 39.185850, popup="Bluestem Bistro") %>% 
  addMarkers(lng=  -96.575886, lat= 39.186848, popup="Coco Bolos") %>% 
  addMarkers(lng=  -96.579412, lat= 39.185954, popup="Coco Bolos") %>% 


m3

#5. Let's do real things

#Step 1. Create a color palette based on the races of people who got stopped by the police in Philadelphia, PA.
race <- colorFactor(c("pink", "black", "yellow", "red", "blue"),
                    domain=c("white", "black", "asian/pacific islander", "hispanic", "other/unknown"),
                    ordered=TRUE)

#Step 2. Prepare the set of data. I filtered the original dataset to just people who aged 40 and got stopped in 2018.
philly <- read_csv("https://datajournalism.tech/wp-content/uploads/2019/10/philly.csv")

#Step 3. Drop missing data values
f <- philly %>% drop_na(lat, lng)

#Step 4. Map the data set.
map <- leaflet(f) %>%
  addProviderTiles(providers$CartoDB) %>% 
  setView(lng= -75.172347, lat= 39.952150, zoom=16) %>% 
  addCircleMarkers(~lng,
                   ~lat,
                   popup=paste("This is a/an", f$subject_race, "and", f$subject_sex, "driver."),
                   weight= 3, 
                   radius=4, 
                   color=~race(subject_race),
                   stroke=F,
                   fillOpacity = 1)

map

#6. It's your turn. Write the codes to map a dataset that contains information about people who aged 60 and got stopped in 2018.
#Here's the link to the new dataset: <https://datajournalism.tech/wp-content/uploads/2019/10/senior.csv>

#Step 1. Create a color palette of your choice.
race <- colorFactor(c("tan", "black", "red", "green"),
                    domain=c("white", "black", "hispanic", "other/unknown"),
                    ordered=TRUE)


#Step 2. Prepare the dataset.
paige <- read_csv("https://datajournalism.tech/wp-content/uploads/2019/10/senior.csv")
  


#Step 3. Drop missing data values.


#Step 4. Map the data set.
map <- leaflet(f) %>%
  addProviderTiles(providers$CartoDB) %>% 
  setView(lng= -75.172347, lat= 39.952150, zoom=16) %>% 
  addCircleMarkers(~lng,
                   ~lat,
                   popup=paste("This is a/an", f$subject_race, "and", f$subject_sex, "driver."),
                   weight= 3, 
                   radius=4, 
                   color=~race(subject_race),
                   stroke=F,
                   fillOpacity = 1)

