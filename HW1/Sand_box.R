library(kknn)
#Setting seed to produce reproducible results
set.seed(1)

check_accuracy = function(X){
  predicted <- rep(0,(nrow(ccdata))) # predictions: start with a vector of all zeros
  # for each row, estimate its response based on the other rows
  
  for (i in 1:nrow(ccdata)){
    
    # data[-i] means we remove row i of the data when finding nearest neighbors...
    #...otherwise, it'll be its own nearest neighbor!
    
    model=kknn(R1~.,ccdata[-i,],ccdata[i,],k=X, scale = TRUE) # use scaled data

    # record whether the prediction is at least 0.5 (round to one) or less than 0.5 (round to zero)
    
    predicted[i] <- as.integer(fitted(model)+0.5) # round off to 0 or 1
  }
  
  # calculate fraction of correct predictions
  
  acc = sum(predicted == ccdata[,11]) / nrow(ccdata)
  return(acc)
}

#
# Now call the function for values of k from 1 to 20 (you could try higher values of k too)
#

accurracy=rep(0,40) # set up a vector of 20 zeros to start
for (X in 1:40){
  accurracy[X] = check_accuracy(X) # test knn with X neighbors
}
#
# report accuracies
#

plot(accurracy)


