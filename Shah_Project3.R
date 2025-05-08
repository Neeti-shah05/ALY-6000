
# Neeti Shah
# April 30, 2025
# ALY 6000 - Project 3

# Environment Reset
rm(list = ls())

# Load Libraries
library(tidyverse)
library(janitor)
library(lubridate)

# 1. Load Dataset
books <- read_csv("books.csv")

# 2. Clean Names
books <- clean_names(books)

# 3. Convert first_publish_date to Date
books$first_publish_date <- mdy(books$first_publish_date)

# 4. Extract Year
books$year <- year(books$first_publish_date)

# 5. Filter Years 1990-2020
books <- books %>% 
  filter(year >= 1990, year <= 2020)

# 6. Remove Unnecessary Columns
books <- books %>% 
  select(-c(publish_date, edition, characters, price, genres, setting, isbn))

# 7. Keep Books < 700 Pages
books <- books %>% 
  filter(pages < 700)

# 8. Remove Rows with NA
books <- na.omit(books)

# 9. Glimpse Dataset
glimpse(books)

# 10. Summary Statistics
summary(books)

# 11. Rating Histogram
ggplot(books, aes(x = rating)) +
  geom_histogram(binwidth = 0.25, fill = "red", color = "black") +
  labs(title = "Histogram of Book Ratings", x = "Rating", y = "Number of Books")

ggsave("histogram_rating.png")

# 12. Boxplot of Pages
ggplot(books, aes(x = pages)) +
  geom_boxplot(fill = "red") +
  coord_flip() +
  labs(title = "Box Plot of Page Counts", x = "Pages")

ggsave("boxplot_pages.png")

# 13. Books by Year
by_year <- books %>%
  group_by(year) %>%
  summarise(total_books = n())

# Line Plot
ggplot(by_year, aes(x = year, y = total_books)) +
  geom_line() +
  geom_point() +
  labs(title = "Total Number of Books Rated Per Year", x = "Year", y = "Total Books")

ggsave("lineplot_books_year.png")

# 14. Book Publisher DataFrame
book_publisher <- books %>%
  group_by(publisher) %>%
  summarise(book_count = n())

# 15-16. Filter Publishers with >= 125 Books & Order Descending
book_publisher <- book_publisher %>%
  filter(book_count >= 125) %>%
  arrange(desc(book_count))

# 17. Cumulative Sum
book_publisher <- book_publisher %>%
  mutate(cum_counts = cumsum(book_count))

# 18. Relative Frequency
book_publisher <- book_publisher %>%
  mutate(rel_freq = book_count / sum(book_count))

# 19. Cumulative Frequency
book_publisher <- book_publisher %>%
  mutate(cum_freq = cumsum(rel_freq))

# 20. Make Publisher a Factor
book_publisher$publisher <- factor(book_publisher$publisher, levels = book_publisher$publisher)

# 21. Pareto Chart
ggplot(book_publisher, aes(x = publisher, y = book_count)) +
  geom_bar(stat = "identity", fill = "cyan") +
  geom_line(aes(y = cum_counts/10), group = 1, color = "red") +
  geom_point(aes(y = cum_counts/10), color = "red") +
  labs(title = "Book Counts (1990 - 2020)", x = "Publisher", y = "Number of Books") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave("pareto_chart_publishers.png")

# 22. Additional Visualization: Average Rating per Publisher
avg_rating_publisher <- books %>%
  group_by(publisher) %>%
  summarise(avg_rating = mean(rating)) %>%
  filter(publisher %in% book_publisher$publisher)

ggplot(avg_rating_publisher, aes(x = publisher, y = avg_rating)) +
  geom_bar(stat = "identity", fill = "purple") +
  labs(title = "Average Book Rating by Publisher", x = "Publisher", y = "Average Rating") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave("avg_rating_publisher.png")

