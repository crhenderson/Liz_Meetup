#install.packages("reshape")
#install.packages("ggplot2")
remove(list=ls())
setwd("C:/Users/liz9189/Desktop/Random Files/R Class")
raw_data_file <- read.csv("Recipe Search Terms.csv")

View(raw_data_file)

#importing a clean file without all the junk at the top or bottom
clean_data_file <-  read.csv("Recipe Search Terms.csv", skip = 4, header = TRUE, nrows = 52)

View(clean_data_file)

#creating z scores so they can be compared to each other
clean_data_file$healthy.recipe <- scale(clean_data_file$healthy.recipe)
clean_data_file$pizza.recipe <-scale(clean_data_file$pizza.recipe)
clean_data_file$bread.recipe <-scale(clean_data_file$bread.recipe)
clean_data_file$pasta.recipe <- scale(clean_data_file$pasta.recipe)
clean_data_file$pumpkin.pie.recipe <- scale(clean_data_file$pumpkin.pie.recipe)

View(clean_data_file)

#adding a new_column that has the start_date of the week but not the rest
#isolating the first date in the field
clean_data_file$start_week <- substring(clean_data_file$Week, 1, 10)
View(clean_data_file)
class(clean_data_file$start_week)

#changing that date to a date format
clean_data_file$start_week <- as.Date(clean_data_file$start_week)
View(clean_data_file)

#removing the Week column which I don't need anymore
clean_data_file$Week <- NULL
View(clean_data_file)

library(reshape)

colnames(clean_data_file)

melted_data <- melt(clean_data_file, id = "start_week")

View(melted_data)

library(ggplot2)

ggplot(melted_data, aes(x=start_week, y=value, group=variable, colour=variable)) +
  geom_line() 

ggplot(melted_data, aes(x=start_week, y=variable, fill=value)) +
  geom_raster() +
  scale_x_date(breaks=seq(min(clean_data_file$start_week), max(clean_data_file$start_week), by = 30)) +
  scale_fill_gradient2(midpoint=1,mid = "yellow", high = "green", low = "red") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  ggtitle("Heat Map of Recipe Search Trends in 2015") +
  labs(x="Week", y="Search Term")
