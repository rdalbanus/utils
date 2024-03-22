library(knitr)
library(ggplot2)
library(RColorBrewer)
library(dplyr)
library(tidyr)
library(scales)
library(glue)

# Setup chunk options
knitr::opts_chunk$set(fig.width = 4, fig.height = 4, fig.show = "hold")
knitr::opts_chunk$set(dev = "CairoPNG")

# Disable `summarise()` has grouped output by 'foo'
options(dplyr.summarise.inform = FALSE)

# ggplot theme setup
theme_set(theme_bw(base_size = 12) + theme(axis.text = element_text(colour = "black")))

# shortcut for axis labels
.axis_label_orient <- function(orient = "d", ...) {
  if (orient == "v") {
    element_text(angle = 90, vjust = .5, hjust = 1, ...)
  } else if (orient == "d") {
    element_text(angle = 45, vjust = 1, hjust = 1, ...)
  }
}
