#Polynomial regression

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

#Fitting linear regression to dataset
lin_reg=lm(formula=Salary~.,data=dataset)

#Fitting polynomial regression to dataset
dataset$Level2=dataset$Level^2
dataset$Level3=dataset$Level^3
dataset$Level4=dataset$Level^4
poly_reg=lm(formula=Salary~.,data=dataset)

#visualize linear regression model
library(ggplot2)
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),
             colour='red')+
  geom_line(aes(x=dataset$Level,y=predict(lin_reg,newdata=dataset)),
            colour='blue')+
  ggtitle('True vs bluff (Linear regression)')+
  xlab('Level')+
  ylab('Salary')

#visualize polynomial regression model
library(ggplot2)
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),
             colour='red')+
  geom_line(aes(x=dataset$Level,y=predict(poly_reg,newdata=dataset)),
            colour='blue')+
  ggtitle('True vs bluff (Polynomial regression)')+
  xlab('Level')+
  ylab('Salary')

#predict data using linear
y_pred=predict(lin_reg,data.frame(Level=6.5))

#predict data using polynomial
y_pred1=predict(poly_reg,data.frame(Level=6.5,Level2=6.5^2,Level3=6.5^3,Level4=6.5^4))























