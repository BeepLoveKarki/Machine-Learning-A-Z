#polynomial regression

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:, 1:2].values
Y = dataset.iloc[:, 2].values

# Splitting the dataset into the Training set and Test set
"""from sklearn.model_selection import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = 0.2, random_state = 0)"""

# Feature Scaling
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)
sc_Y = StandardScaler()
Y_train = sc_Y.fit_transform(Y_train)"""


#Fitting regression model to dataset
#Create regressor here

#Predict with polynomial regression
regressor.predict(6.5)

#Visualizing regression results
X_grid=np.arange(min(X),max(X),0.1)
X_grid=X_grid.reshape((len(X),1))
plt.scatter(X,Y,color='red')
plt.plot(X_grid,regressor.predict(X_grid),color='blue')
plt.title('Truth or bluff (regression model)')
plt.xlabel('Position level')
plt.ylabel('Salary')
plt.show()