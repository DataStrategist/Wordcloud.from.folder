.libPaths("C:/Users/kohli/Desktop/Dropbox/R/library")
.libPaths("K:/Dropbox/Dropbox/R/library")
library(shiny)
# library(shinyIncubator)
languages <- c("english", "danish", "dutch", "finnish", 
               "french", "german", "hungarian", "italian",             
               "norwegian", "portuguese", "russian", "spanish", "swedish")

shinyUI(fluidPage(
  # Application title
  headerPanel("Word Cloud generator!"),
  
  # Sidebar with a slider and selection inputs
  sidebarPanel(width = 5,
               fileInput('data', h3('Choose file to upload')),
               checkboxInput("update", h4("SHOW ME!")),
               hr(),
               hr(),
               h4("Text manipulation"),
               selectInput('language', 'Language:', choices=languages),
               checkboxInput("lower", "lower", FALSE),
               checkboxInput("stem", "Stem", FALSE),
               textInput("remove", label = "Remove word:", 
                         value = "word to remove"),
               hr(),
               h4("Plotting"),
               selectInput('colorScheme', 'Color Scheme:', 
                           choices=c("Dark2", "Accent", "Paired", "Pastel1",
                                     "Pastel2", "Set1", "Set2", "Set3")),
               sliderInput("max", "Maximum Number of Words:", 
                             min = 1,  max = 300,  value = 100),
               sliderInput("scale1", "Max word size:", 
                           min = 1,  max = 10,  value = 3),
               sliderInput("scale2", "Word size scale:", 
                           min = 0.1,  max = 2,  value = 0.5)
                
  ),
  
  # Show Word Cloud
  mainPanel(
    h4("Select your *.txt file using the top button on left menu. Then click SHOW ME"),
    h4("once you're done, save your wordcloud by rightclicking image and saying 'save image'."),
    h5("(by Matt and Amit)"), 
    a("Sourcecode here... Help out if u can improve!", href = "https://github.com/mexindian/Wordcloud.from.folder"),
    plotOutput("plot"),
    textOutput("class2")
  )
))

