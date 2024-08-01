# Number of Asian elephants
# Source: IUCN / Our World in Data
# URL: https://ourworldindata.org/elephant-populations

library(tidyverse)

df <- read_csv("african-elephants.csv") |> 
  filter(Year == max(Year), !str_detect(Entity, "Africa")) |>
  select(country = Entity, n = 4)

ggplot(df) +
  geom_col(aes(x = n, y = fct_reorder(country, n)), 
               fill = "#949699") +
  scale_x_continuous(expand = expansion(), labels = scales::comma) +
  labs(x = "Number of elephants", y = NULL,
       title = "A third of African elephants live in Botswana",
       subtitle = "Estimated number of elephants, 2015",
       caption = "Source: IUCN; Our World in Data") +
  theme_minimal(base_size = 12) +
  theme(
    plot.margin = unit(rep(0.5, 4), "cm"),
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank(),
    axis.line.y = element_line(),
    plot.title = element_text(size = rel(1.4), face = "bold"),
    plot.caption = element_text(size = rel(1), margin = margin(t = 2)),
    axis.text = element_text(size = rel(1)),
    axis.title.x = element_text(face = "bold", hjust = 0, margin = margin(t = 10)),
    legend.position = "none"
  )
