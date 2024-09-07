# Load the dataset
df <- read.csv("C:/Users/Saurav Tripathi/Desktop/Case Study R Prog/player_performance.csv")

# Check structure and summary of data
str(df)
summary(df)

# Check for missing values
missing_values <- colSums(is.na(df))
print(missing_values)

# Handle missing values (e.g., replace with mean, remove rows)
df <- na.omit(df)  # Remove rows with missing values

# Convert necessary columns to appropriate data types (if needed)
df$Player <- as.factor(df$Player)
df$Country <- as.factor(df$Country)

# Save the cleaned data (for Tableau)
dir.create("C:/Users/Saurav Tripathi/Desktop/Case Study R Prog/Cleaned Data", recursive = TRUE)
write.csv(df, "C:/Users/Saurav Tripathi/Desktop/Case Study R Prog/Cleaned Data/cleaned_player_performance.csv", row.names = FALSE)


# Summary statistics for numerical columns
summary(df)

# Load ggplot2 for visualization
library(ggplot2)

# Histogram of Performance Rating
ggplot(df, aes(x = Performance_Rating)) +
  geom_histogram(binwidth = 0.05, fill = "blue", color = "black") +
  labs(title = "Distribution of Player Performance Ratings", x = "Performance Rating", y = "Frequency")

# Bar plot of Wins by Country
ggplot(df, aes(x = Country, y = Wins, fill = Country)) +
  geom_bar(stat = "identity") +
  labs(title = "Wins by Country", x = "Country", y = "Total Wins") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Generate correlation matrix for numeric columns
numeric_columns <- df[, sapply(df, is.numeric)]
correlation_matrix <- cor(numeric_columns)

# Display the correlation matrix
print(correlation_matrix)

# Visualize the correlation matrix using corrplot
install.packages("corrplot")
library(corrplot)

# Correlation plot
corrplot(correlation_matrix, method = "circle")


# Scatter plot of Wins vs Performance Rating
ggplot(df, aes(x = Wins, y = Performance_Rating)) +
  geom_point(color = "red") +
  geom_smooth(method = "lm", color = "blue", se = FALSE) +
  labs(title = "Wins vs Performance Rating", x = "Wins", y = "Performance Rating")

# Boxplot of Player Performance Rating by Country
ggplot(df, aes(x = Country, y = Performance_Rating, fill = Country)) +
  geom_boxplot() +
  labs(title = "Performance Rating by Country", x = "Country", y = "Performance Rating")

