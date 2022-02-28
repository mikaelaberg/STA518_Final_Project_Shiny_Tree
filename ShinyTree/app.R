library(shiny)
library(bslib)

ui <- fluidPage(
    theme = bs_theme(version = 5, bootswatch = "cosmo"),
    
    navbarPage( "Project Shiny Tree",
        tabPanel("Home", 
            #Side Bar for Home Page
                sidebarLayout(
                    # Sidebar panel for inputs ----
                    sidebarPanel(
                        # Input: Select a file ----
                        fileInput("file1", "Choose CSV File",
                                  multiple = TRUE,
                                  accept = c("text/csv",
                                             "text/comma-separated-values,text/plain",
                                             ".csv")),
                        # Horizontal line ----
                        tags$hr(),
                        # Input: Checkbox if file has header ----
                        checkboxInput("header", "Header", TRUE),
                        # Input: Choose dataset ----
                        selectInput("dataset", "Choose a dataset:",
                                    choices = c("rock", "pressure", "cars")),
                        # Button
                        downloadButton("downloadData", "Download")
                    ),
                ),
            # Main panel for displaying outputs ----
            mainPanel(
                # Output: Data file ----
                tableOutput("contents"),
                
                tableOutput("table"),
                
                textInput("text", label = h3("Text input"), value = "Enter text..."),
                hr(),
                fluidRow(column(3, verbatimTextOutput("value"))),
            )
        ),
        tabPanel("About"),
        tabPanel("Resoutces")
    ), 
)
    

server <- function(input, output) {
    # Reactive value for selected dataset ----
    datasetInput <- reactive({
        switch(input$dataset,
               "rock" = rock,
               "pressure" = pressure,
               "cars" = cars)
    })
    
    # Table of selected dataset ----
    output$table <- renderTable({
        datasetInput()
    })
    
    # Downloadable csv of selected dataset ----
    output$downloadData <- downloadHandler(
        filename = function() {
            paste(input$dataset, ".csv", sep = "")
        },
        content = function(file) {
            write.csv(datasetInput(), file, row.names = FALSE)
        }
    )
    
    output$contents <- renderTable({
        
        # input$file1 will be NULL initially. After the user selects
        # and uploads a file, head of that data file by default,
        # or all rows if selected, will be shown.
        
        req(input$file1)
        
        # when reading semicolon separated files,
        # having a comma separator causes `read.csv` to error
        tryCatch(
            {
                df <- read.csv(input$file1$datapath,
                               header = input$header,
                               sep = input$sep,
                               quote = input$quote)
            },
            error = function(e) {
                # return a safeError if a parsing error occurs
                stop(safeError(e))
            }
        )
        
        if(input$disp == "head") {
            return(head(df))
        }
        else {
            return(df)
        }
        
    })
}

shinyApp(ui, server)

