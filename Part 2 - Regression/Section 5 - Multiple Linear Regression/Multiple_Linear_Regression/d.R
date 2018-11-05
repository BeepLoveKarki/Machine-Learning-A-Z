#Multiple linear regression

#read data
dataset = read.csv('50_Startups.csv')
#dataset=datset[,2:3]


# Encoding categorical data
dataset$State = factor(dataset$State,
                         levels = c('New York', 'California', 'Florida'),
                         labels = c(1, 2, 3))

#split test and training set
#install.packages('caTools')
library(caTools)
set.seed(123)
split=sample.split(dataset$Profit,SplitRatio=0.8)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)

#feature scaling
#training_set[,2:3]=scale(training_set[,2:3])
#test_set[,2:3]=scale(test_set[,2:3])

#Fitting multiple linear regression to training set
regressor=lm(formula=Profit~.,data=training_set)

#Predict
y_pred=predict(regressor,newdata = test_set)


#Backward elimination
regressor=lm(formula=Profit~R.D.Spend+Administration+Marketing.Spend+State,
             data=training_set)
summary(regressor)


regressor=lm(formula=Profit~R.D.Spend+Administration+Marketing.Spend,
             data=training_set)
summary(regressor)

regressor=lm(formula=Profit~R.D.Spend+Marketing.Spend,
             data=training_set)
summary(regressor)

regressor=lm(formula=Profit~R.D.Spend,
             data=training_set)
summary(regressor)

y_pred1=predict(regressor,newdata = test_set)



