# Load Packages
# install.packages("tidyverse")
# in
library(tidyverse)
library(knitr)
# Load Data
body_data <- read_table("body.dat.txt", col_names = FALSE, show_col_types = FALSE)

body_names <- c( "biacromial_diameter", "biiliac_diameter",
                 "bitrochanteric_diameter", "chest_depth", "chest_diameter",
                 "elbow_diameter", "wrist_diameter", "knee_diameter",
                 "ankle_diameter", "shoulder_girth", "chest_girth", "waist_girth",
                 "navel_girth", "hip_girth", "thigh_girth", "bicep_girth",
                 "forearm_girth", "knee_girth", "calf_girth", "ankle_girth",
                 "wrist_girth", "age", "weight", "height", "gender"
)
colnames(body_data) <- body_names

eda_data <- body_data %>%
  filter(age >= 21, age <= 31) %>%
  select("shoulder_girth":"gender") %>%
  mutate(gender = factor(gender, levels = c(0, 1), labels = c("Female", "Male")))

body_dimensions_dictionary <- tibble(
  Variable = c(
    "shoulder_girth", "chest_girth", "waist_girth", "navel_girth", 
    "hip_girth", "thigh_girth", "bicep_girth", "forearm_girth", 
    "knee_girth", "calf_girth", "ankle_girth", "wrist_girth",
    "age", "weight", "height", "gender"
  ),
  Description = c(
    "Shoulder girth over deltoid muscles",
    "Chest girth at nipple line in males and just above breast tissue in females, mid-expiration",
    "Waist girth, narrowest part of torso below the rib cage, (avg. of contracted/relaxed)",
    "Abdominal girth at umbilicus using iliac crest as landmark",
    "Hip girth at level of bitrochanteric diameter",
    "Thigh girth below gluteal fold, (average of right and left sides)",
    "Bicep girth, flexed, (average of right and left sides)",
    "Forearm girth, extended, palm up, (average of right and left)",
    "Knee girth over patella, slightly flexed position, (average of right and left)",
    "Calf maximum girth, (average of right and left)",
    "Ankle minimum girth, (average of right and left)",
    "Wrist minimum girth, (average of right and left)",
    "Age",
    "Weight",
    "Height",
    "Gender (0 = Female, 1 = Male)"
  ),
  Units = c(rep("cm", 12), "years", "kg", "cm", "Factor"),
  R_Type = c(rep("double", 15), "factor")
)
