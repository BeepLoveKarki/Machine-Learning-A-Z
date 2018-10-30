#Simple Regression

#Data preprocessing

#read data
dataset = read.csv('Salary_Data.csv')
#dataset=datset[,2:3]

#split test and training set
#install.packages('caTools')
library(caTools)
set.seed(123)
split=sample.split(dataset$Salary,SplitRatio=2/3)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)

#feature scaling
#training_set[,2:3]=scale(training_set[,2:3])
#test_set[,2:3]=scale(test_set[,2:3])

#fit it
regressor=lm(formula=Salary~YearsExperience,data=training_set)

#predict it
y_pred=predict(regressor,newdata=test_set)

#graph it
#install.packages('ggplot2')
library(ggplot2)
ggplot()+
  geom_point(aes(x=training_set$YearsExperience,y=training_set$Salary),
             colour='red')+
  geom_line(aes(x=training_set$YearsExperience,y=predict(regressor,newdata=training_set)),
            colour='blue')+
  ggtitle('Salary vs experience(Training set)')+
  xlab('Years of experience')+
  ylab('Salary')

ggplot()+
  geom_point(aes(x=training_set$YearsExperience,y=training_set$Salary),
             colour='red')+
  geom_line(aes(x=training_set$YearsExperience,y=predict(regressor,newdata=training_set)),
            colour='blue')+
  ggtitle('Salary vs experience(Test set)')+
  xlab('Years of experience')+
  ylab('Salary')
























