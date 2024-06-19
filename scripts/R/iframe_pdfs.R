library(knitr)
# library(tidyverse)
knit_hooks$set(plot = function(x, options) {
  # Check if output format is pdf
  if (options$dev == "cairo_pdf") {
    # Add the out.height, otherwise not included (default = 300 px)
    options$out.height <- options$fig.height * 96
    # Replace all the iframes with ember
    gsub("embed", "iframe", hook_plot_html(x, options))
  } else {
    # Default behavior for other output formats
    hook_plot_html(x, options)
  }
})
