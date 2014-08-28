library(tm)
library(wordcloud)

shinyServer(function(input, output) {
  change <- reactive({
    if(input$update){
      path <- input$data[,4]
      c <- Corpus(VectorSource(readLines(path)))
      
      ## don't ask for:
      ########c <- tm_map(c, stripWhitespace)                ## tm broken on shinyapps.io
      ########c <- tm_map(c, removeNumbers)                  ## tm broken on shinyapps.io
      #c <- tm_map(c, removePunctuation)
      #   c<-gsub("<.*?>","",c)
      
      # ask for:
      if(input$lower) c <- tm_map(c, content_transformer(tolower))
      ########if(input$stem) c <- tm_map(c, stemDocument)    ## tm broken on shinyapps.io
      c <- tm_map(c, removeWords, stopwords(input$language))
      if(input$remove != "") c <- tm_map(c, removeWords, input$remove)
    }
    })
  

## cloud itself
  output$plot <- renderPlot({
    if(input$update){
    wordcloud(change(), scale=c(input$scale1, input$scale2), max.words=input$max, 
                                      use.r.layout=FALSE,
                                      colors=brewer.pal(8,input$colorScheme),
                                      random.order=FALSE)
  }

  })
})