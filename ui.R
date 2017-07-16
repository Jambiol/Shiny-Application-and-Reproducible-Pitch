library(shiny)
library(markdown)

navbarPage(tags$b("New York Air Quality Measurements"),
           tabPanel("Help",
                    includeMarkdown("information/airquality-info.md")
                    ),

           tabPanel("App",
                    sidebarLayout(
                            sidebarPanel(
                        selectInput("yvar", label = "Select Y variable", 
                                    choices = list('Ozone' = 1, 'Solar.R' = 2, 'Wind' = 3, 
                                                   'Temp' = 4, 'Month' = 5, 'Day' = 6)),
                        selectInput("xvar", label = "Select X variable", 
                                    choices = list('Ozone' = 1, 'Solar.R' = 2, 'Wind' = 3, 
                                                   'Temp' = 4, 'Month' = 5, 'Day' = 6)),
                        submitButton("Submit")
                        ),
                
                mainPanel(
                        plotOutput("plot"), br(),
                        verbatimTextOutput("lmod")
                        )
                )
        )
)

