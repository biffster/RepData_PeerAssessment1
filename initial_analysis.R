library(ggplot2)

testvals <- read.csv("activity.csv", header = TRUE, stringsAsFactors = FALSE, na.strings = "NA")

# Mean per day
# Total per day
testNumberPerDay <- tapply(testvals$steps, testvals$date, sum)
hist(testNumberPerDay)
abline(v = mean(testNumberPerDay, na.rm = TRUE), col = "blue", lwd = 1)
abline(v = median(testNumberPerDay, na.rm = TRUE), col = "green", lwd = 1)
# testAvgPerDay <- tapply(testvals$steps, testvals$date, mean)
# testAvgPerDaydf <- as.data.frame(testAvgPerDay)
# AvgNames <- names(testAvgPerDay)
# testAvgPerDaydf$date <- as.Date(AvgNames)
# testAvgDayNoNA <- testAvgPerDaydf[complete.cases(testAvgPerDaydf$testAvgPerDay),]
#Output graphic
#ggplot(data=testAvgDayNoNA, aes(testAvgDayNoNA$date, testAvgDayNoNA$testAvgPerDay)) + geom_histogram(stat = "identity")
#ggplot(data=testNumberPerDay, aes(testNumberPerDay[date], testAvgDayNoNA$testAvgPerDay)) + geom_histogram(stat = "identity")
#dev.copy(png,"averageHist.png")
#dev.off()

# Median per day
#testMedianPerDay <- tapply(testvals$steps, testvals$date, median)
#testMedianPerDaydf <- as.data.frame(testMedianPerDay)
#MedianNames <- names(testMedianPerDay)
#testMedianPerDaydf$date <- as.Date(MedianNames)
#testMedianDayNoNA <- testMedianPerDaydf[complete.cases(testMedianPerDaydf$testMedianPerDay),]
# Output graphic
#ggplot(data=testMedianDayNoNA, aes(testMedianDayNoNA$date, testMedianDayNoNA$testMedianPerDay)) + geom_histogram(stat = "identity")
dev.copy(png,"totalDayHist.png")
dev.off()
medianPerDay <- median(testNumberPerDay, na.rm = TRUE)
medianPerDay
meanPerDay <- mean(testNumberPerDay, na.rm = TRUE)
meanPerDay

