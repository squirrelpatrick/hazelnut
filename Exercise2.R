# load dplyr, dataset
library(dplyr)
data <- read.csv(file.choose())

#1 CLEAN EMBARKED COLUMN
# examine column
unique(data$embarked)

# 4 types, we have to replace blank entries with "S"
data$embarked[data$embarked == ""] <- "S"

# PART 2
# fill age column

data$age[is.na(data$age)] <- mean(data$age, na.rm = TRUE)

# PART 3
# fill boat column
data$boat <- as.character(data$boat)
data$boat[is.na(data$boat)] <- "no lifeboat"
data$boat <- as.factor(data$boat)

# PART 4
# create has_cabin_number column

data <- data %>%
        mutate(has_cabin_number = as.numeric(cabin != ""))

# Save dataset
write.csv(data, file = "titanic_clean")