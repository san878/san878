setwd("/Users/sanketrana/Desktop/VIU STUDY/491/Assay3/")
library(ggplot2)

Growth_curve<-read.csv(file = "VibrioControlData1.csv")
head(Growth_curve)

Gcurve1<-ggplot(Growth_curve) + geom_smooth(aes(x= Time.min., y = Growth, colour= Treatment)) + theme_bw() + facet_wrap(~Vibrio, ncol = 1)

table(Growth_curve$Vibrio)


#To rename the treatment




# Set working directory
setwd("/Users/sanketrana/Desktop/VIU STUDY/491/Assay3/")

# Load necessary libraries
library(ggplot2)
library(dplyr)

# Read the data
Growth_curve <- read.csv(file = "VibrioControlData1.csv")
head(Growth_curve)

# Rename the Treatment column
Growth_curve <- Growth_curve %>%
  mutate(Treatment = case_when(
    Treatment == "No_Metabolites_High" ~ "TSB+2% NaCl + V. aestuarianus (High Nutrient Broth)",
    Treatment == "No_Metabolites_Low" ~ "TSB+2% NaCl + 1xPBS + V. aestuarianus (Low Nutrient Broth)",
    TRUE ~ as.character(Treatment)  # Keep other treatments unchanged
  ))

# Verify the renaming
table(Growth_curve$Treatment)

# Create the plot
Gcurve1 <- ggplot(Growth_curve) +
  geom_smooth(aes(x = Time.min., y = Growth, colour = Treatment)) +
  theme_bw() +
  facet_wrap(~Vibrio, ncol = 1) +
  labs(
    x = "Time (minutes)",
    y = "Vibrio aestuarianus Growth (OD600)",
    colour = "Treatment"
  ) +
  theme(legend.position = "bottom")  # Adjust legend position if needed

# Display the plot
print(Gcurve1)