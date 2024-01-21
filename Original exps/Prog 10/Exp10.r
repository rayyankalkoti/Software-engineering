# Install and load the dplyr package
if (!require(dplyr)) {
  install.packages("dplyr")
  library(dplyr)
}

# Create a simple dataset
students <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David", "Emily"),
  Age = c(22, 21, 23, 22, 24),
  Grade = c(85, 92, 78, 95, 89),
  Subject = c("Math", "English", "Math", "Physics", "Physics")
)

# Display the original dataset
cat("Original Dataset:\n")
print(students)

# Filter and Select: Extract students who are studying Math
math_students <- students %>%
  filter(Subject == "Math") %>%
  select(Name, Age)

cat("\nFiltered and Selected Data (Math Students):\n")
print(math_students)

# Mutate: Add a new column 'Pass' based on the Grade
students <- students %>%
  mutate(Pass = ifelse(Grade >= 80, "Pass", "Fail"))

cat("\nDataset with Mutated Column (Pass):\n")
print(students)

# Group and Summarize: Compute average grade per subject
subject_summary <- students %>%
  group_by(Subject) %>%
  summarize(Avg_Grade = mean(Grade))

cat("\nSubject-wise Summary:\n")
print(subject_summary)

# Arrange: Sort the dataset by Age in descending order
sorted_students <- students %>%
  arrange(desc(Age))

cat("\nDataset Sorted by Age (Descending Order):\n")
print(sorted_students)

# Join: Create another dataset for student attendance
attendance <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David", "Emily"),
  Attendance = c(90, 85, 92, 88, 95)
)

# Merge datasets based on the 'Name' column
merged_data <- merge(students, attendance, by = "Name")

cat("\nMerged Dataset (Based on Name):\n")
print(merged_data)
