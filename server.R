library(tm)
library(wordcloud)

## mat code: runApp("/home/matifou/Dropbox/Matt-Amit/try2",display.mode = "showcase")
myTxt <- "This is our 3rd edition of most of these plays.  See the index.
Copyright laws are changing all over the world, be sure to check
the copyright laws for your country before posting these files!!
  rther information is included below.  We need your donations."


shinyServer(function(input, output) {
  observe({
    # Run whenever button is pressed, then stay reactive.
    if (input$update){
      ## Start reactive statement
      output$plot <- renderPlot({
        ## Get data and clean a bit
        path <- input$data[1,4]
        c <- Corpus(VectorSource(readLines(path)))
    
        ## ask for this
        if(input$lower) c <- tm_map(c, content_transformer(tolower))
        if(input$stem) c <- tm_map(c, stemDocument)
        
        ## don't ask for that:
        c <- tm_map(c, stripWhitespace)
        c <- tm_map(c, removeNumbers)
        c <- tm_map(c, removeWords, stopwords(input$language))
        #c <- tm_map(c, removePunctuation)
        #c <- tm_map(c, removeWords, "xxxx")
        #       c<-gsub("<.*?>","",c)
                
        ## cloud itself
        wordcloud(c, scale=c(3,0.5), max.words=input$max, 
                                          use.r.layout=FALSE,
                                          colors=brewer.pal(8,input$colorScheme),
                                          random.order=FALSE)
      
      })
    }
  })
})