library(tm)
library(wordcloud)

c<-Corpus(DirSource("C:/Folder_to_load"))

c <- tm_map(c, stripWhitespace)
c <- tm_map(c, tolower)
c <- tm_map(c, removeWords, stopwords("english"))

c <- tm_map(c, removeNumbers) 
#c <- tm_map(c, removePunctuation)

c <- tm_map(c, stemDocument)
#c <- tm_map(c, removeWords, "xxxx")

c<-gsub("<.*?>","",c)

wordcloud(c, scale=c(3,0.5), max.words=100, use.r.layout=FALSE, colors=brewer.pal(8,"Dark2"),random.order=FALSE)