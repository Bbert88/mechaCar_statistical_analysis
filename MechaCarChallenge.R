library(dplyr)

car_data <- read.csv("MechaCar_mpg.csv")

car_df <- data.frame(car_data)

head(car_df)

#Perform Linear Regression
lr <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance +
     AWD, data=car_df)

summary(lr)
