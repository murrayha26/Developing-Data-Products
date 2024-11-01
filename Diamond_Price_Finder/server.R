## This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
# 
# The server logic will use a linear model for predicting diamond price based on 
# user provided inputs: carat, cut, color, and clarity
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(tidyverse)

# Define server logic required to generate a model and predict diamond price

shinyServer (function(input, output) {
  model1 <- lm(price ~ carat + cut + color + clarity, data = diamonds)
  
  model1pred <- reactive ({
    caratInput <- input$sliderCARAT
    cutInput <- input$chooseCUT
    colorInput <- input$chooseCOLOR
    clarityInput <- input$chooseCLARITY
    
    predict(model1, newdata = data.frame(carat = caratInput, cut = cutInput, color = colorInput, clarity = clarityInput))
  })
  
  output$pricePlot <- renderPlot({
    caratInput <- input$sliderCARAT
    cutInput <- input$chooseCUT
    colorInput <- input$chooseCOLOR
    clarityInput <- input$chooseCLARITY
    
    plot(diamonds$carat, diamonds$price, xlab = "Carat Weight", ylab = "Price (USD)", bty = "n",
         pch = 1, col = "steelblue", xlim = c(0, 5.0), ylim = c(300, 45000))
    
    abline(model1, col = "black", lwd = 2)
    points(caratInput, model1pred(), col = "red", pch = 16, cex = 2)
  })
  
  output$pred1 <- renderText({
    model1pred()
  })
})
  