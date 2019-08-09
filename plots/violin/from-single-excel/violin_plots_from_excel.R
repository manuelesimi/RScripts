if (!require("readxl"))
install.packages("readxl")

if (!require("ggplot2"))
install.packages("ggplot2")

if (!require("dplyr"))
install.packages("dplyr")


library(dplyr)
library(ggplot2)
library(readxl)

data <- read_excel("data.xlsx")
head(data)

#add fake column for grouping purposes on the X axis
data$Group = "-1"
data$Group[endsWith(data$WellName ,'02')] = 'G2'
data$Group[endsWith(data$WellName ,'03')] = 'G3'
data$Group[endsWith(data$WellName ,'04')] = 'G4'
data$Group[endsWith(data$WellName ,'05')] = 'G5'
data$Group[endsWith(data$WellName ,'06')] = 'G6'
data$Group[endsWith(data$WellName ,'07')] = 'G7'
data$Group[endsWith(data$WellName ,'08')] = 'G8'
data$Group[endsWith(data$WellName ,'09')] = 'G9'


View(data)
p <- ggplot(data, aes(x=Group, y=Centroid_Z_Sum, fill=Group)) + geom_violin(trim=FALSE)

# Rotate the violin plot
p + coord_flip()

p + stat_summary(fun.y=median, geom="point", size=2, color="red")

p
