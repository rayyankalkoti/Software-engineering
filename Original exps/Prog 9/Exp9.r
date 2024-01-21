# Load necessary libraries
library(ggplot2)
library(gridExtra)
# Prepare example data
set.seed(123) # for reproducibility
num_students <- 50
students <- data.frame(
  Name = paste0("Student", 1:num_students),
  Score = sample(60:100, num_students, replace = TRUE),
  Attendance = sample(50:100, num_students, replace = TRUE)
)
# Scatter plot: Relationship between scores and attendance percentages
scatter_plot <- ggplot(students, aes(x = Attendance, y = Score)) +
  geom_point(color = "red", size = 3) +
  labs(title = "Scatter Plot of Scores vs Attendance",
       x = "Attendance Percentage", y = "Score")
# Bar plot: Distribution of scores among different students
bar_plot <- ggplot(students, aes(x = Name, y = Score)) +
  geom_bar(stat = "identity", fill = "yellow", width = 0.7) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Distribution of Scores Among Students",
       x = "Student Name", y = "Score")
# Line plot: Trend of scores over time
students$Time <- seq(1, num_students)
line_plot <- ggplot(students, aes(x = Time, y = Score, group = 1)) +
  geom_line(color = "violet", size = 1) +
  labs(title = "Trend of Scores Over Time",
       x = "Time", y = "Score")
# Histogram: Distribution of scores
hist_plot <- ggplot(students, aes(x = Score, fill = after_stat(count))) +
  geom_histogram(binwidth = 5, color = "purple", fill = "purple", alpha = 0.7) +
  labs(title = "Distribution of Scores",
       x = "Score", y = "Frequency")
# Arrange plots in a grid
grid.arrange(scatter_plot, bar_plot, line_plot, hist_plot, ncol = 2)

