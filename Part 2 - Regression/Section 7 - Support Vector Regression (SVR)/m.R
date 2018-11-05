#SVR

#Regression template

#read data
dataset = read.csv('Position_Salaries.csv')
dataset=dataset[,2:3]
dataset$Level2=dataset$Level^2
dataset$Level3=dataset$Level^3
dataset$Level4=dataset$Level^4

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

#Fitting SVR model to dataset
#install.packages('e1071')
library(e1071)
regressor=svm(formula=Salary~.,data=dataset,type='eps-regression')

#predict data using SVR
y_pred=predict(regressor,data.frame(Level=6.5,
                                    Level2=6.5^2,
                                    Level3=6.5^3,
                                    Level4=6.5^4))


#visualize SVR model
library(ggplot2)
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),
             colour='red')+
  geom_line(aes(x=dataset$Level,y=predict(regessor,newdata=dataset)),
            colour='blue')+
  ggtitle('True vs bluff (SVR model)')+
  xlab('Level')+
  ylab('Salary')
  























