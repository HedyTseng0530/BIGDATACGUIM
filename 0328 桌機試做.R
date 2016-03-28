#apply家族- 把函數功能當成參數
mat1 <- data.frame(1:4,5:8,9:12,13:16) #4個Columns，執行4次
mat1
sapply(mat1, function(x, y) {sum(x) + y}, y = 5)

library(jsonlite)
library(RCurl)
WaterData<-fromJSON(getURL("http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=190796c8-7c56-42e0-8068-39242b8ec927"))
names(WaterData)
