library(shiny)

# Define server logic
server <- function(input, output, session) {
  
  output$file_name <- renderUI({
    req(input$file)
    tags$div(
      tags$strong("Selected file:"),
      tags$p(input$file$name)
    )
  })
  
  observeEvent(input$calc, {
    # Placeholder for score calculation logic
    # In a real application, you would include the code to process the inputs and calculate the score here
    
    # For this example, we'll just return a dummy score
    score <- 100
    
    if (input$input_type == "text" && !is.null(input$text)) {
      # If user entered text, consider it for score calculation
      score <- nchar(input$text) # Dummy score calculation based on text length
    }
    
    if (input$input_type == "file" && !is.null(input$file)) {
      # If a file is uploaded, handle the file input here
      file_ext <- tools::file_ext(input$file$name)
      if (file_ext %in% c("docx", "xlsx", "xls", "csv")) {
        # Example of setting a dummy score based on file type
        score <- switch(file_ext,
                        "docx" = 200,
                        "xlsx" = 300,
                        "xls" = 300,
                        "csv" = 400,
                        100) # Default score
      }
    }
    
    output$score <- renderText({
      paste("Calculated Score:", score)
    })
  })
}
