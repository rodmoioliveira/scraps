#!/usr/bin/env Rscript

load_packages <- function() {
  if (!require("pacman")) {
    install.packages("pacman", repos = "http://cran.us.r-project.org")
  }

  pacman::p_install_gh("REditorSupport/languageserver")
  pacman::p_load(
    pacman, GGally, ggplot2, ggthemes, rvest, ggvis, httr, plotly, rio,
    rmarkdown, shiny, tidyverse, gcookbook, languageserver, ggrepel, snakecase,
    patchwork, devtools, viridis, hrbrthemes, nakedpipe, ggTimeSeries,
    data.table, igraph, tidygraph, ggraph, ggradar, scales, lubridate, glue,
    stringr, ggcorrplot, reshape2, readr, fs
  )
}

load_packages()
