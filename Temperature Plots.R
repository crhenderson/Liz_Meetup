#install.packages("ggthemes")

#reading in the temperature data
nmmaps<-read.csv("chicago-nmmaps.csv", as.is=T)

#casting the date field as a date
nmmaps$date<-as.Date(nmmaps$date, format = '%m/%d/%Y')

#subsetting the data to be only those dates after 1996
nmmaps<-nmmaps[nmmaps$date>as.Date("1996-12-31"),]

#creating a column with just the year
nmmaps$year<-substring(nmmaps$date,1,4)

View(nmmaps)

library(ggthemes)

#economist theme
ggplot(nmmaps, aes(date, temp, color=factor(season)))+
  geom_point()+ggtitle("Super Pretty Plot!")+
  theme_economist()+scale_colour_economist()

#wsj theme
ggplot(nmmaps, aes(date, temp, color=factor(season)))+
  geom_point()+ggtitle("Super Pretty Plot!")+
  theme_wsj()+scale_colour_wsj()

#dark theme
ggplot(nmmaps, aes(date, temp, color=factor(season)))+
  geom_point()+ggtitle("Super Pretty Plot!")+
  theme_solarized(light = FALSE)+
  scale_colour_discrete(name = "Season")

#violin graph
ggplot(nmmaps, aes(x=season, y=temp)) +
  geom_violin(alpha=0.5, color="gray") #+coord_flip()

#adding in the actual data points
ggplot(nmmaps, aes(x=season, y=temp))+
  geom_violin(alpha=0.5, color="gray")+
  #geom_point(alpha=0.5, aes(color=season)) 
  #using jitter offsets the dots so you can see the density a little better
  geom_jitter(alpha=0.5, aes(color=season),position = position_jitter(width = 0.1))

