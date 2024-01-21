# Install and load necessary libraries
if (!require(readxl)) {
  install.packages("readxl")
}
if (!require(dplyr)) {
  install.packages("dplyr")
}
library(readxl)
library(dplyr)

# Specify the correct path to your Excel file
excel_file_path <- "D:/Rayyan College Work/5th Sem Notes/R Lab (Data Analytics)/Original exps/Prog 11/customer_purchases.xlsx"

# Read the Excel file into a data frame
purchase_data <- read_excel(excel_file_path)

# Data Summary
total_records <- nrow(purchase_data)
total_unique_customers <- n_distinct(purchase_data$`Customer ID`)

cat("Data Summary\n")
cat("Total Number of Records:", total_records, "\n")
cat("Total Number of Unique Customers:", total_unique_customers, "\n\n")

# Calculate Statistical Measures
mean_purchase_amount <- mean(purchase_data$`Purchase Amount`)
median_purchase_amount <- median(purchase_data$`Purchase Amount`)
std_dev_purchase_amount <- sd(purchase_data$`Purchase Amount`)

cat("Calculate Statistical Measures\n")
cat("Mean Purchase Amount:", mean_purchase_amount, "\n")
cat("Median Purchase Amount:", median_purchase_amount, "\n")
cat("Standard Deviation of Purchase Amounts:", std_dev_purchase_amount, "\n\n")

# Customer Segmentation
purchase_data <- purchase_data %>%
  mutate(Segment = ifelse(`Purchase Amount` < median_purchase_amount, "Low Spender", "High Spender"))

cat("Customer Segmentation\n")
print(head(purchase_data))

# Visualize Data (Histogram)
hist(purchase_data$`Purchase Amount`, main = "Distribution of Purchase Amounts", xlab = "Purchase Amount", col = "skyblue", border = "black")

