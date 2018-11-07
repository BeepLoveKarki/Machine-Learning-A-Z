#Decision Tree Regression

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

#Fitting decision tree regression model to dataset
library(rpart)
regressor=rpart(formula=Salary~.,data=dataset,control=rpart.control(minsplit=1))

#predict data using decision tree regression
y_pred=predict(regessor,data.frame(Level=6.5))


#visualize decision tre regression model more smooth
library(ggplot2)
X_grid=seq(min(dataset$Level),max(dataset$Level),0.1)
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),
             colour='red')+
  geom_line(aes(x=x_grid,y=predict(regessor,newdata=data.frame(Level=X_grid))),
            colour='blue')+
  ggtitle('True vs bluff (Decision Tree Regression model)')+
  xlab('Level')+
  ylab('Salary')























