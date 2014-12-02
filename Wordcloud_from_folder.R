library(tm)
library(wordcloud)


reut21578 <- system.file("texts", "crude", package = "tm")
c <- Corpus(DirSource(reut21578), list(reader = readReut21578XMLasPlain))

c <- tm_map(c, stripWhitespace)
c <- tm_map(c, tolower)
c <- tm_map(c, removeWords, stopwords("english"))

c <- tm_map(c, removeNumbers) 
#c <- tm_map(c, removePunctuation)

c <- tm_map(c, stemDocument)
#c <- tm_map(c, removeWords, "xxxx")

c<-gsub("<.*?>","",c)

wordcloud(c, scale=c(3,0.5), max.words=100, use.r.layout=FALSE, colors=brewer.pal(8,"Dark2"),random.order=FALSE)


c<-unlist(c)
d< -DocumentTermMatrix(c)
inspect(d)
