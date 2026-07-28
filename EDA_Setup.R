my_data <- c(
  shoulder_girth = 102.2 , chest_girth = 85.2, waist_girth = 79.5, navel_girth = 80.5,
  hip_girth = 86.3, thigh_girth = 50.0, bicep_girth = 31.0, forearm_girth = 22.3,
  knee_girth = 33.0, calf_girth = 31.75, ankle_girth = 20.3, wrist_girth = 15.5,
  age = 26, weight = 58.35, height = 175, gender = "Male"
)

my_row <- as_tibble_row(my_data) %>%
  select(-gender) %>%
  mutate(across(everything(), as.numeric)) %>%
  mutate(Group = "Me") %>%
  select(Group, everything())

group_males <- eda_data %>% filter(gender == "Male", age >= 21, age <= 31)
group_females <- eda_data %>% filter(gender == "Female", age >= 21, age <= 31)
group_combined <- eda_data %>% filter(age >= 21, age <= 31)

all_group_summary <- bind_rows(
  my_row,
  group_males %>% summarise(Group = "Males", across(1:15, mean)),
  group_females %>% summarise(Group = "Females", across(1:15, mean)),
  group_combined %>% summarise(Group = "Combined", across(1:15, mean)),
)

print(all_group_summary %>% kable(digits = 2, caption = "Average Measurements (Ages 21-31)"))

source("EDA_Histograms.R")