library(shiny)
library(ggplot2)
data("airquality")
data <- airquality

data$Month <- as.factor(data$Month)
levels(data$Month) <- c('May', 'June', 'July', 'August', 'September')

function(input, output) {
        
        xvar <- reactive({as.numeric(input$xvar)}) 
        yvar <- reactive({as.numeric(input$yvar)})

        output$plot <- renderPlot({
                
                xvar <- xvar()
                yvar <- yvar()
                
                vars <- c('Ozone (ppb)', 'Solar Radiation (lang)', 'Wind (mph)', 
                          'Temperature (degrees F)', 'Month', 'Day of month')

                qplot(x = data[,xvar], y = data[,yvar], geom = c("point", "smooth"), method="lm", 
                      xlab = vars[xvar], ylab = vars[yvar])
        })
        
        output$lmod <- renderPrint({
                
                xvar <- xvar()
                yvar <- yvar()
                
                lmod <- lm(data[,yvar] ~ data[,xvar])
                
                summary(lmod)
        })
}
