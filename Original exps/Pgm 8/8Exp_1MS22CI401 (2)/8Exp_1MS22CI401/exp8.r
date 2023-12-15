library(ggplot2)


# Task i: Create two matrices of the same dimension (A & B) matrix_A <- matrix(1:9, nrow = 3, ncol = 3)
matrix_B <- matrix(9:1, nrow = 3, ncol = 3)


# Task ii: Add the two matrices and display the result matrix_sum <- matrix_A + matrix_B
cat("Matrix Sum:\n", matrix_sum, "\n\n")


# Task iii: Scale a matrix by multiplying with a scalar and display result scalar <- 2
scaled_matrix <- matrix_A * scalar cat("Scaled Matrix:\n", scaled_matrix, "\n\n")

# Task iv: Find the transpose of the matrix and display transpose_matrix_A <- t(matrix_A)
cat("Transpose of Matrix A:\n", transpose_matrix_A, "\n\n")


# Task v: Hadamard product (Element-wise product) of the two matrices hadamard_product <- matrix_A * matrix_B
cat("Hadamard Product:\n", hadamard_product, "\n\n")


# Task vi: Matrix multiplication matrix_multiply <- matrix_A %*% matrix_B
cat("Matrix Multiplication:\n", matrix_multiply, "\n\n")


# Task vii: Generate statistics - Sum, mean, and standard deviation of elements of A sum_A <- sum(matrix_A)
mean_A <- mean(matrix_A) sd_A <- sd(matrix_A)

cat("Statistics of Matrix A:\n") cat("Sum:", sum_A, "\n")
cat("Mean:", mean_A, "\n") cat("Standard Deviation:", sd_A, "\n\n")

# Task viii: Plot a heatmap of matrix A
heatmap(matrix_A, main = "Heatmap of Matrix A", xlab = "Columns", ylab = "Rows")


# Task ix: Plot the bar plot to compare sums of the rows of matrix A row_sums <- rowSums(matrix_A)
barplot(row_sums, names.arg = 1:nrow(matrix_A), col = "skyblue", main = "Sum of Rows in Matrix A", xlab = "Rows", ylab = "Sum")
