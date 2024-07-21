library(shiny)
library(shinymaterial)

# Define UI
ui <- material_page(
  title = "Irritability Score Calculation",
  nav_bar_fixed = TRUE,
  material_row(
    material_column(
      width = 7,
      material_card(
        title = "Input Section",
        material_radio_button(
          input_id = "input_type", 
          label = "Choose input type:", 
          choices = c("Free Text" = "text", "File Upload" = "file")
        ),
        conditionalPanel(
          condition = "input.input_type == 'text'",
          textAreaInput(
            inputId = "text",
            label = "Enter text:",
            rows = 10,
            width = "100%"
          )
        ),
        conditionalPanel(
          condition = "input.input_type == 'file'",
          fileInput(
            inputId = "file",
            label = "Browse file",
            multiple = FALSE
          ),
          uiOutput("file_name")  # Display file name
        ),
        material_button(
          input_id = "calc", 
          label = "Calculate Score", 
          color = "blue"
        )
      )
    ),
    material_column(
      width = 5,
      material_card(
        title = "Irritability Score",
        textOutput("score")
      )
    )
  )
)
