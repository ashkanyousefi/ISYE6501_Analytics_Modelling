#calling the related library which is KNN 

library(kknn)


check_accuracy=function(X){
  predicted<- rep(0,(nrow(data)))
  
  for (i in 1:nrow(data)){
    model=kknn(data$V11,data[-i,],data[i,],k=X,scale=TRUE)
    predicted[i]<-as.integer(fitted(model)+.5)
  }
  
  Accuracy = sum(predicted == data[,11]) / nrow(data)
  return(Accuracy)
}



  accurracy[4] = check_accuracy(4)

plot(accurracy[4])









