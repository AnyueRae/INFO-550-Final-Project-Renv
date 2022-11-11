library(labelled)
library(gtsummary)
library(knitr)
library(kableExtra)
library(ggplot2)
library(expss)


here::i_am(
  "code/02_make_regression.R"
)

data <- readRDS(file = here::here("output/cleaned_data.rds"))

AgeDistribution <- 
  ggplot(data, aes(x=AGE)) + 
  geom_histogram(aes(y=..density..),
                 binwidth=.5,
                 colour="black", fill="white") +
  geom_density(alpha=.2, fill="#FF6666") +
  labs(x =  "age of patient") +
  ggtitle('Age distribution among patients') 


#plot two by two table
twobytwo <- table(data$SMOKING, data$LUNG_CANCER)
twobytwo

two <- data %>% 
  select("SMOKING" , "LUNG_CANCER") %>%
  tbl_summary(by = SMOKING) %>% 
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Patients with habbit of smoking**") %>%
  add_overall() %>%
  add_p()


ggsave(
  here::here("output/Age_Distribution.png"),
  plot = AgeDistribution,
  device = "png"
)

saveRDS(
  two,
  file = here::here("output/plot.rds")
)


