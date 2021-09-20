#!/usr/bin/env Rscript

source("./r/commons/packages.R")
source("./r/commons/utils.R")
source("./r/commons/theme.R")

urls <- read_csv(
  "./input/travessa.csv",
  col_names = TRUE,
  show_col_types = FALSE
) %>%
  as_tibble() %>%
  pluck(1)

fetch <- function(url) {
  print(glue("{url}"))
  html <- read_html(url)

  link <- tibble(link = url)

  categoria <- html %>%
    html_elements(".txtBreadcrumbs") %>%
    html_text() %>%
    as_tibble() %>%
    slice_tail() %>%
    rename(categoria = "value")

  autores <- html %>%
    html_element("#lblNomAutor") %>%
    html_text() %>%
    str_split(": ") %>%
    unlist() %>%
    pluck(2) %>%
    as_tibble() %>%
    rename(autores = "value") %>%
    mutate_at(c("autores"), ~ gsub(" .\\|.", ", ", .x))

  editora <- html %>%
    html_element("#lblNomProdutor") %>%
    html_text() %>%
    str_split(": ") %>%
    unlist() %>%
    pluck(2) %>%
    as_tibble() %>%
    rename(editora = "value")

  sinopse <- html %>%
    html_element("#lblSinopse") %>%
    html_text() %>%
    as_tibble() %>%
    rename(sinopse = "value")

  data <- html %>%
    html_elements("#divDados") %>%
    html_elements("span.txtDescricao") %>%
    html_text() %>%
    as_tibble() %>%
    slice(1:28)

  values <- data %>%
    filter(row_number() %% 2 == 0)
  keys <- data %>%
    filter(row_number() %% 2 == 1)

  book <- bind_cols(c(keys, values)) %>%
    mutate_at(c("value...1"), my_snake_case) %>%
    pivot_wider(names_from = value...1, values_from = value...2) %>%
    bind_cols(c(autores, editora, categoria, sinopse, link)) %>%
    mutate_at(
      c(
        "titulo",
        "titulo_original",
        "segmento_especifico",
        "colecao"
      ),
      str_to_sentence
    ) %>%
    mutate_at(c("titulo"), ~ gsub(" - .+", "", .x))

  return(book)
}

data <- map(urls, fetch) %>%
  bind_rows() %>%
  mutate(across(everything(), str_trim))

write_csv(data, file = "./output/travessa.csv")
