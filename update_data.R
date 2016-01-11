library(ggplot2)
library(dplyr)

testvals <- read.csv("activity.csv", header = TRUE, stringsAsFactors = FALSE, na.strings = "NA")
testvals1 <- testvals

testNumberPerDay <- tapply(testvals$steps, testvals$date, sum)
averageReplaceNAs <- (sum(testNumberPerDay, na.rm = TRUE) / 61) / 288

# Replace all missing Steps measurements with the average
testvals1[is.na(testvals1$steps),1] <- averageReplaceNAs

# Compute the number per day
newNumberPerDay <- tapply(testvals1$steps, testvals1$date, sum)
hist(testNumberPerDay)
