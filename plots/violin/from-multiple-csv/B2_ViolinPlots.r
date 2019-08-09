
if (!require("ggplot2")) 
  install.packages("ggplot2")

if (!require("dplyr")) 
  install.packages("dplyr")



library(dplyr)
library(ggplot2)
library(easyGgplot2)

day0 <-read.csv(file="Day0_B2_XYZ3DColor.csv", header=TRUE, sep=",")
day0$Day="Day0"
day2 <-read.csv(file="Day2_B2_XYZ3DColor.csv", header=TRUE, sep=",")
day2$Day="Day2"
day4 <-read.csv(file="Day4_B2_XYZ3DColor.csv", header=TRUE, sep=",")
day4$Day="Day4"
day7 <-read.csv(file="Day7_B2_XYZ3DColor.csv", header=TRUE, sep=",")
day7$Day="Day7"

merged_df <- rbind(day0, day2, day4, day7)

p <- ggplot(merged_df, aes(x=Day, y=Position_Z)) + geom_violin(fill='#FCE4D6', trim=FALSE) + ggtitle("B2") + xlab("Day") + ylab("HUVEC Distance from Z Plane (Microns)")
p + labs(fill="Day")

# Rotate the violin plot
p + coord_flip()
p

