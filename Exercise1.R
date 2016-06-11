# load dplyr
library("dplyr")

#import dataset
data <- read.csv(file.choose())

#PART 1 CLEAN COMPANY NAME
#looks like we can do it from the first letter
data$company <- data$company %>%
                substr(1,1) %>%
                tolower()

#check out first letters
print(unique(data$company))

#create lookup table to match first letters
templookup <- c("philips","adzo","philips","van houten","unilever")
names(templookup) <- unique(data$company)

#clean the company
data$company <- templookup[data$company]

#PART 2 SEPARATE PRODUCT CODE AND NUMBER
data <- data %>%
        mutate(product_code = substr(Product.code...number,1,1),
               product_number = substr(Product.code...number,3,4)
               )

#PART 3 ADD PRODUCT CATEGORY
lookup = c("Smartphone", "TV", "Laptop", "Tablet")
names(lookup) = c("p","v","x","q")

data <- data %>%
        mutate(product_category = lookup[product_code])

#PART 4 CREATE FULL ADDRESS COLUMN
data <- data %>%
        mutate(full_address = paste(address, city, country, sep = ","))

#PART 5 CREATE DUMMY VARIABLES
#1 companies
data <- data %>%
        mutate(company_philips = as.numeric(company == "philips"),
               company_adzo = as.numeric(company == "adzo"),
               company_van_houten = as.numeric(company == "van houten"),
               company_unilever = as.numeric(company == "unilever")
        )

# 2 products
# base R method

data$product_smartphone <- as.numeric(data$product_category == "Smartphone")
data$product_tv <- as.numeric(data$product_category == "TV")
data$product_laptop <- as.numeric(data$product_category == "Laptop")
data$product_tablet <- as.numeric(data$product_category == "Tablet")

# reconciliation check on binary variables

data %>%
  select(company_philips:product_tablet) %>%
  sum

# returns 50 - good :-)
