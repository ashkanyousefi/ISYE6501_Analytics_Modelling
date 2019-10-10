set.seed(1656)

# Step 1: 
read.table("uscrime.txt",header=TRUE)
library(randomForest)





install.packages('randomForest')
library(randomForest)


data <- read.table("http://www.statsci.org/data/general/uscrime.txt", header=TRUE, sep="\t")
# split data to train and test
model <- randomForest(as.factor(Survived) ~ Pclass + Sex + Age + SibSp + Parch + Fare +
                                            Embarked + Title + FamilySize + FamilyID2,
                      data=??, 
                      importance=TRUE, 
                      ntree=2000)

Prediction <- predict(model, test)
submit <- data.frame(PassengerId = test$PassengerId, Survived = Prediction)
write.csv(submit, file = "firstforest.csv", row.names = FALSE)      

#%%


