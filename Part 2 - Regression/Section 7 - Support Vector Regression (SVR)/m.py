#SVR 

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:, 1:2].values
Y = dataset.iloc[:, 2:3].values

# Splitting the dataset into the Training set and Test set
"""from sklearn.model_selection import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = 0.2, random_state = 0)"""

# Feature Scaling
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X = sc_X.fit_transform(X)
sc_Y = StandardScaler()
Y = sc_Y.fit_transform(Y)

#Fitting SVR to dataset
from sklearn.svm import SVR
regressor=SVR(kernel='rbf')
regressor.fit(X,Y)

#Predict with SVR
y_pred=regressor.predict(sc_X.transform([[6.5]]))
y_pred=sc_Y.inverse_transform(y_pred)

#Visualizing SVR results
plt.scatter(X,Y,color='red')
plt.plot(X,regressor.predict(X),color='blue')
plt.title('Truth or bluff (SVR model)')
plt.xlabel('Position level')
plt.ylabel('Salary')
plt.show()