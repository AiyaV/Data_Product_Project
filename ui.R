#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("(O)Esophageal Cancer Percentage"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       selectInput("age",
                   "Select your age:",
                   c("25-34", "35-44", "45-54", "55-64", "65-74", "75+")),
       selectInput("alcohol",
                   "Select your alcohol consumption, gm/day",
                   c("0-39", "40-79", "80-119", "120+")),
       selectInput("tobacco",
                   "Select your tobacco consumption, gm/day",
                   c("0-9", "10-19", "20-29", "30+")) ,
       submitButton("Update")
                   
    ),
    mainPanel(
      h3("Chances of getting (O)Esophageal Cancer, given your age, alcohol and tobacco consumption:"),
      textOutput("percentage"), h3("%")
    )    
    )))
