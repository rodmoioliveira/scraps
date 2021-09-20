#!/usr/bin/env Rscript

source("./r/commons/packages.R")
source("./r/commons/utils.R")
source("./r/commons/theme.R")

data <- read_csv(
  "./output/travessa.csv",
  col_names = TRUE,
  show_col_types = FALSE
  ) %>%
  as_tibble() %>%
  arrange(titulo, autores)

write_csv(data, file = "./output/travessa.csv")
