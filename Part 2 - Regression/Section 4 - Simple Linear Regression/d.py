#simple regression

#importing libraries
import numpy as py
import matplotlib.pyplot as plt
import pandas as pd

#importing dataset
dataset=pd.read_csv('Salary_Data.csv')
X=dataset.iloc[:,:-1].values
Y=dataset.iloc[:,1].values

#split into training and test set
from sklearn.model_selection import train_test_split
X_train,X_test,Y_train,Y_test=train_test_split(X,Y,test_size=1/3,random_state=0)

#Feature scaling
"""from sklearn.preprocessing import StandardScaler
sc_X=StandardScaler()
X_train=sc_X.fit_transform(X_train)
X_test=sc_X.transform(X_test)"""

#Fitting simple linear regression to training set
from sklearn.linear_model import LinearRegression
regression=LinearRegression() #regressor
regression.fit(X_train,Y_train)

#Predicting the test set result
Y_pred=regression.predict(X_test)
#Y_pred1=regression.predict([[15]])
#print(round(Y_pred1[0],2))

#Visualizing training set results
plt.scatter(X_train,Y_train,color='red')
plt.plot(X_train,regression.predict(X_train),color='blue')
plt.title('Salary vs Experience (Training Set)')
plt.xlabel('Years of experience')
plt.ylabel('Salary')
plt.plot()

#Visualizing test set results
plt.scatter(X_test,Y_test,color='red')
plt.plot(X_train,regression.predict(X_train),color='blue')
plt.title('Salary vs Experience (Test Set)')
plt.xlabel('Years of experience')
plt.ylabel('Salary')
plt.plot()