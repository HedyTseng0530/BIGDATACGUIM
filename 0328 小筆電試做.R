if (!require('jsonlite')){
    install.packages("jsonlite")
    library(jsonlite)
}
if (!require('RCurl')){
    install.packages("RCurl")
    library(RCurl)
}

WaterData<-fromJSON(getURL("http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=190796c8-7c56-42e0-8068-39242b8ec927"))
names(WaterData)

names(WaterData$result)
WaterDataFrame<-WaterData$result$results
WaterDataFrame$longitude<-as.numeric(WaterDataFrame$longitude)
WaterDataFrame$latitude<-as.numeric(WaterDataFrame$latitude)
WaterDataFrame$qua_cntu<-as.numeric(WaterDataFrame$qua_cntu)
WaterDataFrame

if (!require('httr')){
    install.packages("httr")
    library(httr)
}


token<-"EAAFVaZBB5eAsBAHSToJaGKiSH0efU1JH8sYTgLqE0U7BEf5a9lnMEKNmaEt3IMbV6pjadWIjan9RSuPkTUMeatx8wf7yKqd5gurWHteMdBI9R2QiruifEFcGmHvjYhxtfpf0EtD545tifCAbslSQCqNxlWalWtRNswjmSXQZDZD"
FBData = GET(
    paste0("https://graph.facebook.com/v2.5/tsaiingwen?fields=posts.limit(10)%7Bcomments%2Cmessage%7D&access_token=EAAFVaZBB5eAsBAHSToJaGKiSH0efU1JH8sYTgLqE0U7BEf5a9lnMEKNmaEt3IMbV6pjadWIjan9RSuPkTUMeatx8wf7yKqd5gurWHteMdBI9R2QiruifEFcGmHvjYhxtfpf0EtD545tifCAbslSQCqNxlWalWtRNswjmSXQZDZD",
           token))
names(FBData)

json1 = content(FBData)
names(json1)


if (!require('Rfacebook')){
    install.packages("Rfacebook")
    library(Rfacebook)}

getPage("tsaiingwen", token,n = 10)
totalPage<-NULL
DateVectorStr<-as.character(seq(as.Date("2016-01-01"),as.Date("2016-04-06"),by="2 days"))
for(i in 1:(length(DateVectorStr)-1)){
  tempPage<-getPage("tsaiingwen", token,
                    since = DateVectorStr[i],until = DateVectorStr[i+1])
  totalPage<-rbind(totalPage,tempPage)
}
post_id<-totalPage$id 
post_id
getPost(post_id,n = 500,token)

install.packages("devtools")
library(devtools)
build_github_devtools()

#### Restart R before continuing ####
install.packages("devtools.zip", repos = NULL, type = "source")

# Remove the package after installation
unlink("devtools.zip")


totalPage<-NULL
lastDate<-Sys.Date()
numberOfPost<-30
DateVector<-seq(as.Date("2016-01-01"),lastDate,by="5 days")
DateVectorStr<-as.character(DateVector)
DateVectorStr
for(i in 1:(length(DateVectorStr)-1)){
    tempPage<-getPage("tsaiingwen", token,
                      since = DateVectorStr[i],until = DateVectorStr[i+1])
    totalPage<-rbind(totalPage,tempPage)
}
nrow(totalPage)
