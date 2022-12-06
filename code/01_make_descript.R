

here::i_am(
  "code/01_make_descript.R"
)

library(dplyr)
library(gtsummary)

data <- readRDS(file = here::here("output/cleaned_data.rds"))

tableA <- data %>% 
  select("GENDER", "AGE", "SMOKING", "ALCOHOL_CONSUMING", "CHEST_PAIN", "LUNG_CANCER") %>%
  tbl_summary(by = GENDER) %>% 
  add_overall() %>%
  add_p()

saveRDS(
  tableA,
  file = here::here("output", "Table_Basic.rds")
)

