 # Import data
 train_data <- read.csv("train_Mart.csv")

train_data <- read.csv("train_Mart.csv")

# Take a glimpse of the dataset
glimpse(train_data)

# Import the dlyr library for manipulating the dataset
library(dplyr)

# Remove unnecessary columns that are not needed in creating the model
train_data_removeNA <- train_data_sel %>%
+ na.omit()

# Check the dimensions
dim(train_data_removeNA)

# We then create the model of Item_outlet_sales against all other variables
model <- Item_Outlet_Sales~.

# Create a model regression fit using the lm function
fit_sales <- lm(model, train_data_removeNA)
fit_sales

# Find the summary of the fitted model created
summary(fit_sales)

# Import the caret library to make predictions
library(caret)

# Import the test data
test_data <- read.csv('test_Mart.csv')
head(test_data)

# Remove missing values from the test data
test_data_sel <- test_data %>%
+ na.omit()

# Confirm the dimension
dim(test_data_sel)

# Make predictions on the test data
prediction_mart <- predict(fit_sales, test_data_sel)

# Create a predictin dataframe
prediction_mart <- data.frame(prediction_mart, stringsAsFactors = FALSE)
dim(test_data_sel)

# Column bind the prediction dataframe with the test_data
Prediction_Data <- cbind(test_data_sel, prediction_mart)

# Export the file
write.csv(Prediction_Data, "Prediction_BigMart_Sales.csv")




