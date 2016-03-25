#install.packages("plot3D")

library("plot3D")

#loading in some free data
data(iris)

#setting up the variables
x <- sep.l <- iris$Sepal.Length
y <- pet.l <- iris$Petal.Length
z <- sep.w <- iris$Sepal.Width

#the plot
#phi changes the viewing angle
#bty is the type of box 
scatter3D(x, y, z, phi = 0, bty ="bl2")
scatter3D(x, y, z, phi = 20, bty ="g", xlab = "sepal length",  ylab = "petal length", zlab = "sepal width")
