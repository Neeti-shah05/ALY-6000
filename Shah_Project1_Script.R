# Name: Neeti Shah
# Date: 2025-04-15
# Class: ALY 6000 - R Practice

# Reset environment
rm(list=ls())
cat("\014")

# Problem 1 - Calculations
# Multiply 123 by 453 = 55719 
123 * 453
# Square of 5 multiplied by 40 = 1000
5^2 * 40
# Logical AND of TRUE and FALSE = FALSE 
TRUE & FALSE
# Logical OR of TRUE and FALSE = TRUE
TRUE | FALSE
# Modulus (remainder) of 75 divided by 10 = 5
75 %% 10
# Division of 75 by 10 = 7.5
75 / 10

# Problem 2
first_vector <- c(17, 12, -33, 5)

# Problem 3
counting_by_fives <- c(5, 10, 15, 20, 25, 30, 35)

# Problem 4
second_vector <- 20:1

# Problem 5
counting_vector <- 5:15

# Problem 6
grades <- c(96, 100, 85, 92, 81, 72)

# Problem 7
bonus_points_added <- grades + 3

# Problem 8
one_to_one_hundred <- 1:100

# Problem 9
# Add 20 to each element in second_vector
second_vector + 20

# Multiply each element in second_vector by 20
second_vector * 20

# Check which values in second_vector are greater than or equal to 20
second_vector >= 20

# Check which values in second_vector are not equal to 20
second_vector != 20

# Problem 10
total <- sum(one_to_one_hundred)

# Problem 11
average_value <- mean(one_to_one_hundred)

# Problem 12
median_value <- median(one_to_one_hundred)

# Problem 13
max_value <- max(one_to_one_hundred)

# Problem 14
min_value <- min(one_to_one_hundred)

# Problem 15
first_value <- second_vector[1]

# Problem 16
first_three_values <- second_vector[1:3]

# Problem 17
vector_from_brackets <- second_vector[c(1, 5, 10, 11)]

# Problem 18
vector_from_boolean_brackets <- first_vector[c(FALSE, TRUE, FALSE, TRUE)]
# This selects the 2nd and 4th elements of first_vector (12 and 5)

# Problem 19
# This returns a TRUE/FALSE vector: which values in second_vector are >= 10
second_vector >= 10

# Problem 20
# This filters one_to_one_hundred to only include values >= 20
one_to_one_hundred[one_to_one_hundred >= 20]

# Problem 21
lowest_grades_removed <- grades[grades > 85]

# Problem 22
middle_grades_removed <- grades[-c(3, 4)]

# Problem 23
fifth_vector <- second_vector[-c(5, 10)]

# Problem 24
set.seed(5)
random_vector <- runif(n = 10, min = 0, max = 1000)

# Problem 25
sum_vector <- sum(random_vector)

# Problem 26
cumsum_vector <- cumsum(random_vector)

# Problem 27
mean_vector <- mean(random_vector)

# Problem 28
sd_vector <- sd(random_vector)

# Problem 29
round_vector <- round(random_vector)

# Problem 30
sort_vector <- sort(random_vector)

# Problem 31
# This step reads the dataset into a dataframe
first_dataframe <- read.csv("ds_salaries.csv")

# Problem 32
# The data was already read in Problem 31, so this line is already complete

# Problem 33
# Show summary statistics of the dataframe
summary(first_dataframe)

