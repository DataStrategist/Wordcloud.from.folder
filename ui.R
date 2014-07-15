.libPaths("C:/Users/kohli/Desktop/Dropbox/R/library")
.libPaths("K:/Dropbox/Dropbox/R/library")
library(shiny)
# library(shinyIncubator)
languages <- c("danish", "dutch", "english", "finnish", 
               "french", "german", "hungarian", "italian",             
               "norwegian", "portuguese", "russian", "spanish", "swedish")

shinyUI(fluidPage(
  # Application title
  headerPanel("Word Cloud by Mamitt"),
  
  # Sidebar with a slider and selection inputs
  sidebarPanel(width = 5,
               fileInput('data', 'Choose file to upload'),
               checkboxInput("update", "Do it"),
               hr(),
               h4("Text manipulation"),
               selectInput('language', 'Language:', choices=languages),
               checkboxInput("lower", "lower", FALSE),
               checkboxInput("stem", "Stem", FALSE),
               hr(),
               h4("Plotting"),
               selectInput('colorScheme', 'Color Scheme:', 
                           choices=c("Accent", "Dark2", "Paired", "Pastel1",
                                     "Pastel2", "Set1", "Set2", "Set3")),
               sliderInput("max", "Maximum Number of Words:", 
                             min = 1,  max = 300,  value = 100)
                
  ),
  
  # Show Word Cloud
  mainPanel(
    plotOutput("plot"),
    textOutput("class"),
    textOutput("class2")
  )
))

