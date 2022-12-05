here::i_am(
  "code/00_make_data.R"
)


survey <- read.csv(here::here("data/survey_lung_cancer.csv"))

var_label(survey) <- list(
  GENDER = "Gender of the Patient",
  AGE = "Age of the Patient",
  SMOKING = "Smoking status",
  YELLOW_FINGERS = "Yellow Fingers",
  ANXIETY = "Anxiety",
  PEER_PRESSURE = "Peer Pressure",
  CHRONIC_DISEASE = "Chronic Disease",
  FATIGUE = "Fatigue",
  ALLERGY  = "Allergy",
  WHEEZING = "Wheezing",
  ALCOHOL_CONSUMING = "Drinking Alcohol",
  COUGHING = "Coughing",
  SHORTNESS_OF_BREATH = "Shortness of Breath",
  SWALLOWING_DIFFICULTY = "Swallowing Difficulty",
  CHEST_PAIN = "Chest pain",
  LUNG_CANCER = "Lung Cancer"
  
)

saveRDS(
  survey,
  file = here::here("output/cleaned_data.rds")
)
