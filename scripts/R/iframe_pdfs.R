library(knitr)
# library(tidyverse)
knit_hooks$set(plot = function(x, options) {
  # Check if output format is pdf
  if (options$dev == "cairo_pdf") {
    gsub("embed", "iframe", hook_plot_html(x, options))
  } else {
    # Default behavior for other output formats
    hook_plot_html(x, options)
  }
})
