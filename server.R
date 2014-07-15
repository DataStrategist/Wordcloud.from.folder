library(tm)
library(wordcloud)

## mat code: runApp("/home/matifou/Dropbox/Matt-Amit/try2",display.mode = "showcase")
myTxt <- "This is our 3rd edition of most of these plays.  See the index.
Copyright laws are changing all over the world, be sure to check
the copyright laws for your country before posting these files!!
  rther information is included below.  We need your donations."


shinyServer(function(input, output) {
  
  reut21578 <- system.file("texts", "crude", package = "tm")
  c <- VCorpus(DirSource(reut21578), list(reader = readReut21578XMLasPlain))
#   e <- reactive({input$data})
  e <- reactive({input$data[1,4]})
  
  ## don't ask for that:
  c <- tm_map(c, stripWhitespace)
  c <- tm_map(c, removeNumbers)
  #c <- tm_map(c, removePunctuation)
  #c <- tm_map(c, removeWords, "xxxx")
  #   c<-gsub("<.*?>","",c)
  
  # ask for this

  change <- reactive({
    if(input$update){
      path <- input$data[1,4]
      c <- Corpus(VectorSource(readLines(path)))
      if(input$lower) c <- tm_map(c, content_transformer(tolower))
      if(input$stem) c <- tm_map(c, stemDocument)
      c <- tm_map(c, removeWords, stopwords(input$language))
    }
    })


## cloud itself
  output$plot <- renderPlot({
    if(input$update){
    wordcloud(change(), scale=c(3,0.5), max.words=input$max, 
                                      use.r.layout=FALSE,
                                      colors=brewer.pal(8,input$colorScheme),
                                      random.order=FALSE)
  }
  })
 output$class <- renderText({input$data[1,4]})
output$class2 <- renderText("hello")

})