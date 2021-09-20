viridis_options <- c("magma", "inferno", "plasma", "viridis", "cividis")
discrete_palette <- "Set1"
current_viridis <- viridis_options[1]
dpi <- 120
main_color <- "#222222"

my_theme <-
  theme(
    text = element_text(
      family = "Arial",
      size = 16
    ),
    legend.position = "bottom",
    legend.title = element_text(
      colour = main_color,
      size = 16,
      face = "bold"
    ),
    strip.text.x = element_text(
      colour = main_color,
    ),
    strip.text.y = element_text(
      colour = main_color,
    ),
    strip.background = element_rect(
      fill = "#eeeeee",
      linetype = "solid",
      color = "#eeeeee"
    ),
    axis.title.x = element_text(vjust = -1),
    axis.title.y = element_text(vjust = 4),
    plot.title = element_text(
      colour = main_color,
      size = 22,
      hjust = 0.5,
      vjust = 3,
      face = "bold"
    ),
    plot.subtitle = element_text(
      colour = main_color,
      size = 15,
      hjust = 0.5,
      vjust = 3,
    ),
    plot.caption = element_text(
      colour = "gray",
      size = 10
    ),
    plot.margin = unit(c(1, 1, 1, 1), "cm"),
    panel.grid.major = element_line(
      size = 0.3,
      linetype = "dashed",
      colour = "lightgray"
    ),
    panel.grid.minor = element_line(
      size = 0.3,
      linetype = "dashed",
      colour = "lightgray"
    ),
    panel.background = element_blank(),
    axis.line = element_line(color = main_color),
    axis.title = element_text(
      colour = main_color,
      face = "bold",
      size = 20
    ),
  )

