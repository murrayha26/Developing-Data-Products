## This is the user-interface definition of a Shiny web application.
# This application generates the estimated price of a diamond given the carat, cut, color,
# and clarity of the gem.
#
# The user interface serves as a means of collecting the inputs for the diamond whose price is being estimated.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)


# Define UI for application that predicts the price of a diamond based on carat, cut, color, clarity
shinyUI (fluidPage(

    # Application title
    titlePanel("Diamond Price Finder"),

    # Sidebar with a slider input for carat weight of the diamond
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderCARAT", "Number of carats:", min = 0.25, max = 5, value = 1, step = .25),
            selectInput("chooseCUT", "Select cut of diamond:", c("Fair", "Good", "Very Good", "Premium", "Ideal")),
            selectInput("chooseCOLOR", "Select color of diamond:", c("D", "E", "F","G", "H", "I", "J")),
            selectInput("chooseCLARITY", "Select clarity of diamond:", c("SI1", "VS2", "SI2", "VS1", "VVS2", "VVS1"))
            
        ),

        # Show a plot of the Price of the diamond vs. carat
        mainPanel(
            plotOutput("pricePlot"),
            h3("Estimated price of the diamond in USD ($):"),
            textOutput("pred1")
        )
    )
))
