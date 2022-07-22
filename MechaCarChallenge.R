library(dplyr)

car_data <- read.csv("MechaCar_mpg.csv")

car_df <- data.frame(car_data)

head(car_df)

#Perform Linear Regression to predict MPG

lr <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance +
     AWD, data=car_df)

summary(lr)


#Summary Statistics on Suspension Coils

coil_data <- read.csv("Suspension_Coil.csv")
head(coil_data)

# Summary stats for PSI column

total_summary <- coil_data %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))
print(total_summary)

# Group by Lot

lot_summary <- coil_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))
print(lot_summary)

#T-Test for all lots

t.test(coil_data$PSI, mu=1500)

#T-Test for each lot to determine if PSI is statistically different from population mean of 1,500
lot1 <- subset(coil_data, Manufacturing_Lot == "Lot1")
t.test(lot1$PSI, mu=1500)

lot2 <- subset(coil_data, Manufacturing_Lot == "Lot2")
t.test(lot2$PSI, mu=1500)

lot3 <- subset(coil_data, Manufacturing_Lot == "Lot3")
t.test(lot3$PSI, mu=1500)

