library(ggplot2)
library(forecast)

testvals <- read.csv("activity.csv", header = TRUE, stringsAsFactors = FALSE, na.strings = "NA")

testmsts <- msts(tvals1$steps, seasonal.periods = 24*12)
applymsts <- tapply(testmsts, cycle(testmsts), mean, na.rm = TRUE)
plot(applymsts, type = "l", xlab = "Time interval number (1 = midnight, 288 = 11:55pm)", ylab = "Average number of steps")
dev.copy(png,"5mintimeseries.png")
dev.off()
print(max(applymsts))
print(which.max(applymsts))
