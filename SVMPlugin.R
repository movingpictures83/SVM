library(e1071)
set.seed(10111)

input <- function(inputfile) {
  parameters <- read.table(inputfile, as.is=T);
  rownames(parameters) <- parameters[,1]
  observation_csv <- toString(parameters["observations", 2])
  class_csv <- toString(parameters["classes", 2])
  x <<- read.csv(observation_csv)
y <<- read.csv(class_csv)
x <<- x[,-1]
y <<- y[,-1]
y <<- as.vector(y)
}

run <- function() {
dat = data.frame(x, y=as.factor(y))
svmfit <<- svm(y ~ ., data = dat, kernel = "linear", cost = 10, scale = FALSE)
}

output <- function(outputfile) {
write.csv(svmfit$SV, outputfile)
}
