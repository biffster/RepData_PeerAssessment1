library(timeDate)
library(forecast)

testvals <- read.csv("activity.csv", header = TRUE, stringsAsFactors = FALSE, na.strings = "NA")
testvals1 <- testvals
testNumberPerDay <- tapply(testvals$steps, testvals$date, sum)
averageReplaceNAs <- (sum(testNumberPerDay, na.rm = TRUE) / 61) / 288

# Replace all missing Steps measurements with the average
testvals1[is.na(testvals1$steps),1] <- averageReplaceNAs
testvals1$date <- as.Date(testvals1$date)

# Create the factor variables
weekdaysFact <- c('Monday','Tuesday','Wednesday','Thursday','Friday')

# I got this snippet of code from an answer on Stack Overflow, the URL is:
# http://stackoverflow.com/questions/28893193/creating-factor-variables-weekend-and-weekday-from-date
testvals1$wDay <- c('weekend', 'weekday')[(weekdays(testvals1$date) %in% weekdaysFact)+1L]

# Compute weekend data and chart
weekendData <- testvals1[testvals1$wDay == "weekend",]
weekendMsts <- msts(weekendData$steps, seasonal.periods = 24*12)
applyWeekendMsts <- tapply(weekendMsts, cycle(weekendMsts), mean, na.rm = TRUE)

# Compute weekday data and chart
weekdayData <- testvals1[testvals1$wDay == "weekday",]
weekdayMsts <- msts(weekdayData$steps, seasonal.periods = 24*12)
applyWeekdayMsts <- tapply(weekdayMsts, cycle(weekdayMsts), mean, na.rm = TRUE)


