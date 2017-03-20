#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)

esoph_proj <- esoph
## replacing in esoph_proj$alcpg "0-39g/day" <- "0-39"
esoph_proj$alcgp <- as.character(esoph_proj$alcgp)
esoph_proj$alcgp[esoph_proj$alcgp == "0-39g/day"] <- "0-39"
head(esoph_proj)

## as.factor(esoph_proj$alcgp)
esoph_proj$alcgp <- as.factor(esoph_proj$alcgp)
head(esoph_proj)

## replacing in esoph_proj$tobgp "0-9g/day" <- "0-9"
esoph_proj$tobgp <- as.character(esoph_proj$tobgp)
esoph_proj$tobgp[esoph_proj$tobgp == "0-9g/day"] <- "0-9"

## as.factor(esoph_proj$alcgp)
esoph_proj$tobgp <- as.factor(esoph_proj$tobgp)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
percentage <- reactive({
  
  ageInput <- input$age
  alcoholInput <- input$alcohol
  tobaccoInput <- input$tobacco

  
  percentageOutput <- esoph_proj %>% 
    filter(agegp == ageInput, alcgp == alcoholInput, tobgp == tobaccoInput) %>%
    mutate(perc = ncases/ncontrols*100)
  percentageOutput$perc

  
}) 
  
output$percentage <- renderText({
 percentage()
})
  
 })
