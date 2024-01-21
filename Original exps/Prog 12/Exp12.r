# Install and load necessary libraries
if (!requireNamespace("writexl", quietly = TRUE)) {
  install.packages("writexl")
}

library(tidyverse)
library(readxl)
library(writexl)

# Load the dataset from Excel
ipl_data <- read_excel("C:/Users/ADMIN/Desktop/R lab/ipl.xlsx")

# Check the structure of the dataset
str(ipl_data)

# Output summary statistics of numerical columns
summary(ipl_data)

# Check for NAs in numeric columns
sapply(ipl_data, function(x) sum(is.na(x) & is.numeric(x)))

# Calculate and display the total number of matches
total_matches <- nrow(ipl_data)
cat("Total Number of Matches:", total_matches, "\n")

# Determine the number of unique teams
unique_teams <- union(unique(ipl_data$Team1), unique(ipl_data$Team2))
num_unique_teams <- length(unique_teams)
cat("Number of Unique Teams:", num_unique_teams, "\n")

# List the unique teams
cat("Unique Teams:", unique_teams, "\n")

# Calculate the number of matches won by each team
matches_won <- table(ipl_data$Winner)
cat("Matches Won by Each Team:\n", matches_won, "\n")

# Compute average total runs scored
if ("Total.Runs" %in% colnames(ipl_data)) {
  avg_runs <- mean(ipl_data$Total.Runs, na.rm = TRUE)
  cat("Average Total Runs Scored:", avg_runs, "\n")
} else {
  cat("Total.Runs column not found in the dataset.\n")
}

# Calculate average total wickets taken
if ("Total.Wickets" %in% colnames(ipl_data)) {
  avg_wickets <- mean(ipl_data$Total.Wickets, na.rm = TRUE)
  cat("Average Total Wickets Taken:", avg_wickets, "\n")
} else {
  cat("Total.Wickets column not found in the dataset.\n")
}

# Identify and display the most frequently used venue for matches
if ("Venue" %in% colnames(ipl_data)) {
  most_frequent_venue <- names(which.max(table(ipl_data$Venue)))
  cat("Most Frequently Used Venue:", most_frequent_venue, "\n")
} else {
  cat("Venue column not found in the dataset.\n")
}

# Create a bar plot to visualize the number of matches won by each team
library(ggplot2)

ggplot(data = data.frame(Team = names(matches_won), Wins = as.numeric(matches_won)),
       aes(x = reorder(Team, -Wins), y = Wins, fill = Team)) +
  geom_bar(stat = "identity") +
  labs(title = "Number of Matches Won by Each Team",
       x = "Team",
       y = "Number of Wins") +
  theme_minimal()



