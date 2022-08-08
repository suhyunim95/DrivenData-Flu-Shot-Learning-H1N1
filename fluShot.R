### Flu Shot Learning H1N1
### DrivenData Project
### July 9th, 2022

## Data Setup ##

# Set working directory
setwd("~/Desktop/DrivenData Project/Flu Shot Learning H1N1")

# Import data
train_features <- read.csv("training_set_features.csv")
train_labels <- read.csv("training_set_labels.csv")
test_features <- read.csv("test_set_features.csv")

# train_features looks like...
dim(train_features)
head(train_features)
str(train_features)

# train_labels looks like...
dim(train_labels)
head(train_labels)
str(train_labels)

## EDA ##

# Barplot of train_labels
library(ggplot2)
p1 <- ggplot(train_labels, aes(x=h1n1_vaccine)) +
  geom_bar() + 
  ggtitle("Boxplot of H1N1 Vaccine") +
  xlab("H1N1 Vaccine") + ylab("Count")
p2 <- ggplot(train_labels, aes(x=seasonal_vaccine)) +
  geom_bar() + 
  ggtitle("Boxplot of Seasonal Vaccine") +
  xlab("Seasonal Vaccine") + ylab("Count")

library(patchwork)
p1+p2

# Check the correlation between h1n1_vaccine & seasonal_vaccine
cor(train_labels$h1n1_vaccine, train_labels$seasonal_vaccine)

# See how features are correlated with the target variables
df1 <- data.frame(train_features$h1n1_concern, train_labels$h1n1_vaccine)
colnames(df1) <- c("concern","vaccine")

df1$concern <- as.factor(df1$concern)
df1$vaccine <- as.factor(df1$vaccine)

ggplot(df1, 
       aes(x = concern, 
           fill = vaccine)) + 
  geom_bar(position = "stack")
