# 1. Load packages and cleaned data

install.packages("tidyverse")
library(tidyverse)
library(data.table)

install.packages("viridis")
library(viridisLite)

if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/ggpubr")
library(ggpubr)

install.packages("ggpubr")
library("ggpubr")

install.packages("ggplot2")
library(ggplot2)

install.packages("viridis")
library(viridis)

install.packages("leaflet")
library(leaflet)

install.packages("htmlwidgets")
library(htmlwidgets)
library(htmltools)

# Load cleaned dataset
all_trips_cleaned <- fread("all_trips_clean_data.csv")


# check the structure of the dataset
head(all_trips_cleaned)
str(all_trips_cleaned)
colnames(all_trips_cleaned)
# the above code shows that our data has lost the header names


# change column names to appropriate header names
all_trips_cleaned_2 <- all_trips_cleaned %>%
  rename(
    ride_id = V1,
    rideable_type = V2,
    started_at = V3,
    ended_at = V4,
    start_station_name = V5,
    start_station_id = V6,
    end_station_name = V7,
    end_station_id = V8,
    start_lat = V9,
    start_lng = V10,
    end_lat = V11,
    end_lng = V12,
    member_casual = V13,
    year = V14,
    month = V15,
    week = V16,
    day_of_week = V17,
    day = V18,
    YMD = V19,
    ToD = V20,
    duration_in_min = V21
  )




#1. Most popular stations
# create a data frame which groups number of trips by station name and includes latitude coordinates for each station 
map_data <- all_trips_cleaned_2 %>%
  select(
    start_station_name,
    start_lat,
    start_lng
  ) %>%
  
  group_by(
    start_station_name
  ) %>%
  
  mutate(
    numtrips = n()
  ) %>%
  
  distinct(
    start_station_name,
    .keep_all = TRUE
  )


# create a sequence of values which will act as the key shown on the leaflet map
seq_num <- seq(5000, 55000, by = 5000)



# Assign the viridis colour palette to visually show how popular a station is 
mypalette <- colorBin(
  palette ="viridis",
  domain = map_data$numtrips,
  na.color = "transparent", 
  bins = seq_num
)


# Prepare text to be used in a tooltip so that users can interact with the coloured markers on the map
map_label <- paste(
  "Station name: ", map_data$start_station_name, "<br/>",
  "Number of trips: ", map_data$numtrips
) %>%
  lapply(htmltools::HTML)



# Create an interactive html leaflet widget to show the most popular stations
p1 <- leaflet(map_data) %>% 
  addTiles() %>%  
  
  # Set coordinates over the city of Chicago
  setView(
    lng = -87.6298, lat = 41.8781, zoom = 12.5
  ) %>% 
  
  # Set map style 
  addProviderTiles("Esri.WorldGrayCanvas") %>%
  
  # Add circle markers to represent each station 
  addCircleMarkers(
    ~ start_lng, ~ start_lat, 
    fillColor = ~ mypalette(numtrips), 
    fillOpacity = 0.7, 
    color = "white", 
    radius = 8, 
    stroke = FALSE,
    label = map_label
  ) %>%
  
  # Add a legend 
  addLegend( 
    pal = mypalette, 
    values = ~ numtrips, 
    opacity = 0.9,
    title = "Number of trips", 
    position = "bottomright"
  )


# Build p1 plot 
p1 



# 2. Most popular time of the year
# check the structure of the data frame. Note that day_of_week is int and need to be converted to char as follows
# 1=Sunday, 2=Monday, 3=Tuesday, 4=Wednesday, 5=Thursday, 6=Friday, 7=Saturday
str(all_trips_cleaned_2)

all_trips_cleaned_3 <- all_trips_cleaned_2

all_trips_cleaned_3$day_of_week <- format(
  all_trips_cleaned_3$started_at, 
  "%A"
)

str(all_trips_cleaned_3)

# order the weekdays - note do not order it alphabitically 
all_trips_cleaned_3$day_of_week <- ordered(
  all_trips_cleaned_3$day_of_week, 
  levels = c(
    "Monday", "Tuesday", "Wednesday", "Thursday",
    "Friday", "Saturday", "Sunday"
  )
)


# Create data frame that summarises the number of trips by date 
heat_map_data <- all_trips_cleaned_3 %>%
  
  select(
    YMD, 
    day_of_week, 
    week, 
    year
  ) %>%
  
  group_by(
    YMD
  ) %>%
  
  mutate(
    numtrips = n()
  ) %>%
  
  distinct(
    YMD, 
    .keep_all = TRUE
  )


# Create a heat map to show most popular time of year 
p2 <- ggplot(
  heat_map_data,
  aes(
    x = week, 
    y = day_of_week, 
    fill = numtrips
  )
) + 
  
  # Use the viridis colour scheme to show the popularity of each day
  scale_fill_viridis(
    option = "D",
    direction = 1,
    name = "Number of trips"
  ) +
  
  # Create a rectangular heat map
  geom_tile(
    colour = "white", 
    na.rm = FALSE
  ) + 
  
  # Separate the heat maps by year
  facet_wrap(
    "year", 
    ncol = 1
  ) + 
  
  # Reverse the y-axis so that the weekdays read vertically Monday to Sunday 
  scale_y_discrete(
    limits = rev
  ) +
  
  # Add x-axis labels to show the months of the year
  scale_x_continuous(
    expand = c(0, 0),
    breaks = seq(1, 52, length = 12),
    labels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", 
               "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
  ) +
  
  # Set the light theme 
  theme_light() +
  
  # Remove any unnecessary labels 
  theme(
    axis.title = element_blank()
  )

# Build P2 plot
p2




# the above code shows an issue with member_casual. there is an extra "\r" at the end of word member & casual.
all_trips_cleaned_3$member_casual[all_trips_cleaned_3$member_casual == "member\r"] <- "member"
all_trips_cleaned_3$member_casual[all_trips_cleaned_3$member_casual == "casual\r"] <- "casual"


# Create a data frame that summarises the number of trips by date and the rider membership
heat_map_data_mem_cas <- all_trips_cleaned_3 %>%
  
  select(
    YMD, 
    day_of_week, 
    week, 
    year, 
    member_casual,
  ) %>%
  
  group_by(
    member_casual, 
    YMD
  ) %>%
  
  mutate(
    numtrips = n()
  ) %>%
  
  distinct(
    YMD, 
    member_casual,
    .keep_all = TRUE
  )


# Create a data frame for member riders only 
mem_filter_heat_map <- heat_map_data_mem_cas %>%
  filter(member_casual == "member")

#Create a data frame for casual riders only
cas_filter_heat_map <- heat_map_data_mem_cas %>%
  filter(member_casual == "casual")


# Create a heat map to show most popular time of year for members  
p2a_member <- ggplot(
  mem_filter_heat_map,
  aes(
    x = week, 
    y = day_of_week, 
    fill = numtrips
  )
) + 
  
  # Use the viridis colour scheme to show the popularity of each day
  scale_fill_viridis(
    option = "D",
    direction = 1,
    name = "Number of trips"
  ) +
  
  # Create a rectangular heat map
  geom_tile(
    colour = "white", 
    na.rm = FALSE
  ) + 
  
  # Separate the heat maps by year
  facet_wrap(
    "year", 
    ncol = 1
  ) + 
  
  # Reverse the y-axis so that the weekdays read vertically Monday to Sunday 
  scale_y_discrete(
    limits = rev
  ) +
  
  # Add x-axis labels to show the months of the year
  scale_x_continuous(
    expand = c(0, 0),
    breaks = seq(1, 52, length = 12),
    labels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", 
               "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
  ) +
  
  # Set the light theme 
  theme_light() +
  
  # Remove any unnecessary labels 
  theme(
    axis.title = element_blank()
  ) +
  
  # Add a title 
  labs(title = "Member Riders") 


# Create a heat map to show most popular time of year for casual riders  
p2a_casual <- ggplot(
  cas_filter_heat_map,
  aes(
    x = week, 
    y = day_of_week, 
    fill = numtrips
  )
) + 
  
  # Use the viridis colour scheme to show the popularity of each day
  scale_fill_viridis(
    option = "D",
    direction = 1,
    name = "Number of trips"
  ) +
  
  # Create a rectangular heat map
  geom_tile(
    colour = "white", 
    na.rm = FALSE
  ) + 
  
  # Separate the heat maps by year
  facet_wrap(
    "year", 
    ncol = 1
  ) + 
  
  # Reverse the y-axis so that the weekdays read vertically Monday to Sunday 
  scale_y_discrete(
    limits = rev
  ) +
  
  # Add x-axis labels to show the months of the year
  scale_x_continuous(
    expand = c(0, 0),
    breaks = seq(1, 52, length = 12),
    labels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", 
               "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
  ) +
  
  # Set the light theme 
  theme_light() +
  
  # Remove any unnecessary labels 
  theme(
    axis.title = element_blank()
  ) +
  
  # Add a title 
  labs(title = "Casual Riders") 


# Combine the members only and casual riders only heat maps into one with one common legend 
p2a <- ggarrange(
  p2a_member, 
  p2a_casual, 
  ncol = 1, 
  nrow = 2,
  common.legend = TRUE, 
  legend = "right"
)


# Build P2a plot
p2a



# 3. Most of popular time of day
# Convert the time of day variable to a date format
all_trips_cleaned_3$ToD <- as.POSIXct(all_trips_cleaned_3$ToD, format = "%H:%M:%S")

head(all_trips_cleaned_3)

# Group the time variable by hours
all_trips_cleaned_3$by60 <- cut(
  all_trips_cleaned_3$ToD, 
  breaks = "60 mins"
)

# Create data frame which counts the number of trips per hour for casual and member riders
circular_bar_chart_data <- all_trips_cleaned_3 %>%
  
  group_by(
    by60,
    member_casual
  ) %>%
  
  mutate(
    numtrips_0000s = (n()/1000)
  ) %>%
  
  distinct(
    by60, 
    member_casual, 
    numtrips_0000s
  )


# Create a circular bar chart to show the popularity of each hour
p3 <- ggplot(circular_bar_chart_data) +
  
  # Make custom panel grid 
  geom_hline(
    aes(yintercept = y), 
    data.frame(y = c(0:4) * 125),
    color = "lightgrey"
  ) + 
  
  # Create a stacked bar char
  geom_bar(
    aes(
      x = by60,
      y = numtrips_0000s,
      fill = member_casual
    ), 
    stat="identity"
  ) +
  
  # Create circular shape which starts in the mid-line  
  coord_polar(start = -0.135, direction = 1) + 
  ylim(-600, 500) +
  
  # Add x-axis labels 
  annotate(
    x = 1,
    y = -50,
    label = "00:00",
    geom = "text",
    size = 2,
  ) +
  annotate(
    x = 2,
    y = -50,
    label = "01:00", 
    geom = "text",
    size = 2,
  ) +
  annotate(
    x = 3,
    y = -50,
    label = "02:00", 
    geom = "text", 
    size = 2,
  ) +
  annotate(
    x = 4,
    y = -50,
    label = "03:00", 
    geom = "text", 
    size = 2,
  ) +
  annotate(
    x = 5,
    y = -50,
    label = "04:00", 
    geom = "text", 
    size = 2,
  ) +
  annotate(
    x= 6,
    y=-50,
    label = "05:00", 
    geom = "text", 
    size = 2,
  ) +
  annotate(
    x = 7,
    y = -50,
    label = "06:00", 
    geom = "text", 
    size = 2,
  ) +
  annotate(
    x = 8,
    y = -50,
    label = "07:00", 
    geom = "text", 
    size = 2,
  ) +
  annotate(
    x = 9,
    y = -50,
    label = "08:00", 
    geom = "text", 
    size = 2,
  ) +
  annotate(
    x = 10,
    y = -50,
    label = "09:00", 
    geom = "text", 
    size = 2,
  ) +
  annotate(
    x = 11,
    y = -50,
    label = "10:00", 
    geom = "text", 
    size = 2,
  ) +
  annotate(
    x = 12,
    y = -50,
    label = "11:00", 
    geom = "text", 
    size = 2,
  ) +
  annotate(
    x = 13,
    y = -50,
    label = "12:00", 
    geom = "text", 
    size = 2,
  ) +
  annotate(
    x = 14,
    y = -50,
    label = "13:00", 
    geom = "text", 
    size = 2,
  ) +
  annotate(
    x = 15,
    y = -50,
    label = "14:00", 
    geom = "text", 
    size = 2,
  ) +
  annotate(
    x = 16,
    y = -50,
    label = "15:00", 
    geom = "text", 
    size = 2,
  ) +
  annotate(
    x = 17,
    y = -50,
    label = "16:00", 
    geom = "text", 
    size = 2,
  ) +
  annotate(
    x = 18,
    y = -50,
    label = "17:00", 
    geom = "text", 
    size = 2,
  ) +
  annotate(
    x = 19,
    y = -50,
    label = "18:00", 
    geom = "text", 
    size = 2,
  ) +
  annotate(
    x = 20,
    y = -50,
    label = "19:00", 
    geom = "text", 
    size = 2,
  ) +
  annotate(
    x = 21,
    y = -50,
    label = "20:00", 
    geom = "text", 
    size = 2,
  ) +
  annotate(
    x = 22,
    y = -50,
    label = "21:00", 
    geom = "text", 
    size = 2,
  ) +
  annotate(
    x = 23,
    y = -50,
    label = "22:00", 
    geom = "text", 
    size = 2,
  ) +
  annotate(
    x = 24,
    y = -50,
    label = "23:00", 
    geom = "text", 
    size = 2,
  ) +
  
  # Annotate y-axis scaling labels 
  annotate(
    x = 24,
    y = 125,
    label = "125,000",
    geom = "text",
    size = 2.5, 
    angle = 15
  ) +
  annotate(
    x = 24,
    y = 250,
    label = "250,000",
    geom = "text",
    size = 2.5, 
    angle = 15
  ) +
  annotate(
    x = 24,
    y = 375,
    label = "375,000",
    geom = "text",
    size = 2.5, 
    angle = 15
  ) +
  annotate(
    x = 24,
    y = 500,
    label = "500,000 trips",
    geom = "text",
    size = 2.5, 
    angle = 15
  ) +
  
  # Use viridis colour scheme 
  scale_fill_viridis_d() +
  
  # Set light theme 
  theme_light() +
  
  # Remove unnecessary labels 
  theme(
    axis.title = element_blank(),
    axis.ticks = element_blank(),
    axis.text = element_blank(),
    legend.position = "bottom",
    legend.title = element_blank(),
  )

# Build p3 plot
p3


# separate time from date
all_trips_cleaned_3$ride_length_second <- difftime(
  all_trips_cleaned_3$ended_at, 
  all_trips_cleaned_3$started_at,
  units = "secs"
) 

# convert the date to integer
all_trips_cleaned_3$ride_length_second <- as.numeric(
  as.character(all_trips_cleaned_3$ride_length_second)
)

# aggregate the data based on month and membership type
ride_length_date <- all_trips_cleaned_3 %>%
  select(
    month,
    member_casual,
    ride_length_second
  ) %>%
  
  group_by(
    month,
    member_casual
  ) %>%
  
  summarize(
    ave_ride_length_mins = (mean(ride_length_second, na.rm = TRUE))/60
  )


# 4. create a plot that shows the average ride length between casual riders and member riders
p4 <- ggplot(ride_length_date, aes(x=month, y=ave_ride_length_mins, group=member_casual)) +
  
  scale_x_continuous(
    breaks = seq(12),
    labels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", 
               "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
  ) +
  
  scale_y_continuous(
    breaks = seq(50)
  ) +
  
  theme_light() +
  
  geom_line(aes(color = member_casual), size = 2) +
  
  labs(title = "Average Ride Length")+
  xlab("Month")+
  ylab("Average Ride Length in Minutes") 

#Build p4 plot
p4


# 5. Statistic summary
# Create function which calculates mode 
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}


# Create a data frame which summarises the all_trips_cleaned dataset by important variables 
statistic_summary <- all_trips_cleaned_3 %>%
  
  group_by(
    member_casual
  ) %>%
  
  summarize(
    ave_ride_length_mins = (mean(duration_in_min, na.rm = TRUE))/60, 
    mode_day_of_week = getmode(day_of_week),
    mode_month = getmode(month),
    mode_time_of_day = getmode(ToD), 
    ave_time_of_day = format(mean(ToD, na.rm = TRUE), "%H:%M:%S")
  ) 

