dat <- read.csv("data/data.csv")
country <- c("None", unique(unlist(strsplit(dat$Country, ", "))))
genre <- c("Any", unique(unlist(strsplit(dat$Genre, ", "))))