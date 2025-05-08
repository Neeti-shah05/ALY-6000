# Reset Environment
rm(list=ls())
cat("\014")

# ------------------- PART 1: 2015 Happiness Dataset -------------------

# Read 2015 data
data_2015 <- read_csv("2015.csv")

# View column names
names(data_2015)

# View structure of dataset
glimpse(data_2015)

# Clean column names
data_2015 <- clean_names(data_2015)

# Select relevant columns
happy_df <- data_2015 %>%
  select(country, region, happiness_score, freedom)

# Top 10 countries
top_ten_df <- happy_df %>%
  slice(1:10)

# Filter freedom < 0.20
no_freedom_df <- happy_df %>%
  filter(freedom < 0.20)

# Arrange by freedom descending
best_freedom_df <- happy_df %>%
  arrange(desc(freedom))

# Add gff_stat = family + freedom + generosity
data_2015 <- data_2015 %>%
  mutate(gff_stat = family + freedom + generosity)

# Group by region and summarize
regional_stats_df <- happy_df %>%
  group_by(region) %>%
  summarise(
    country_count = n(),
    mean_happiness = mean(happiness_score, na.rm = TRUE),
    mean_freedom = mean(freedom, na.rm = TRUE)
  )

# ------------------- PART 2: Baseball Dataset -------------------

# Read baseball data
baseball <- read_csv("baseball.csv")

# Filter AB > 0
baseball <- baseball %>%
  filter(AB > 0)

# Add Batting Average (BA)
baseball <- baseball %>%
  mutate(BA = H / AB)

# Add On-base Percentage (OBP)
baseball <- baseball %>%
  mutate(OBP = (H + BB) / (AB + BB))

# Top 10 players with most strikeouts
strikeout_artist <- baseball %>%
  arrange(desc(SO)) %>%
  slice(1:10)

# Filter eligible players (AB ≥ 300 or G ≥ 100)
eligible_df <- baseball %>%
  filter(AB >= 300 | G >= 100)

# Histogram of Batting Average
ggplot(eligible_df, aes(x = BA)) +
  geom_histogram(binwidth = 0.02, fill = "blue", color = "white") +
  labs(title = "Batting Average of Eligible Players", x = "Batting Average", y = "Frequency")

# MVP Analysis
# We consider high OBP, HR, and RBI as key metrics

# Top candidates sorted by OBP, HR, and RBI
top_mvp_candidates <- eligible_df %>%
  arrange(desc(OBP + HR/10 + RBI/10)) %>%
  select(Last, First, OBP, HR, RBI, BA) %>%
  slice(1:5)

print("Top MVP Candidates based on OBP, HR, and RBI:")
print(top_mvp_candidates)

# Suggested MVP
suggested_mvp <- top_mvp_candidates[1, ]
print("Suggested MVP:")
print(suggested_mvp)


