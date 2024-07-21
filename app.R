library(shiny)

# Install shiny.material
if (!requireNamespace("shiny.material", quietly = TRUE)) {
  devtools::install_github("ericrayanderson/shiny.material")
}

# Source the UI and server files
source("ui.R")
source("server.R")

# Run the application 
shinyApp(ui = ui, server = server)
