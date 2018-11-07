# Random Forest Regression Model

#read data
dataset = read.csv('Position_Salaries.csv')
dataset=dataset[,2:3]

#split test and training set
# install.packages('caTools')
# library(caTools)
# set.seed(123)
# split=sample.split(dataset$Purchased,SplitRatio=0.8)
# training_set=subset(dataset,split==TRUE)
# test_set=subset(dataset,split==FALSE)

#feature scaling
#training_set[,2:3]=scale(training_set[,2:3])
#test_set[,2:3]=scale(test_set[,2:3])

#Fitting random forest regression model to dataset
#install.packages('randomForest')
library(randomForest)
set.seed(1234)
regressor=randomForest(x=dataset[1],y=dataset$Salary,ntree=1500)

#predict data using random forest regression
y_pred=predict(regressor,data.frame(Level=6.5))


#visualize random forest regression model more smooth
library(ggplot2)
X_grid=seq(min(dataset$Level),max(dataset$Level),0.01)
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),
             colour='red')+
  geom_line(aes(x=X_grid,y=predict(regressor,newdata=data.frame(Level=X_grid))),
            colour='blue')+
  ggtitle('True vs bluff ( Random Forest Regression model)')+
  xlab('Level')+
  ylab('Salary')























