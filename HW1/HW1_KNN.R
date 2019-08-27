#calling the related library which is KNN 
library(kknn)
set.seed(1)
#It is necessary to import the credit card data with the header to be able to 
#apply the following procedure.

#The following function check the accuracy of the KNN for each selected
# X which is a number of K nearest neighbour

check_accuracy=function(X){
  predicted<-rep(0,nrow(ccdata))
  for(i in 1:nrow(ccdata)){
    model=kknn(R1~.,ccdata[-i,],ccdata[i,],k=X,scale = TRUE)
    predicted[i]<-as.integer(fitted(model)+0.5)
  }
  acc_level=sum(predicted==ccdata[,11])/nrow(ccdata)
  return(acc_level)
}

#The following piece of code is going to test the accuracy of the 
#check_accuracy function

Test_accuracy<-rep(0,20)
for(i in 1:20){
  Test_accuracy[i]<-check_accuracy(i)
}

max(Test_accuracy)











