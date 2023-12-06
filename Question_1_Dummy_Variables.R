data_1 <- read.csv("smk.csv")
data_1
model <- lm(SBP ~ QUET * as.factor(SMK), data = data_1)
summary(model)

# Plot the data points
plot(data_1$QUET, data_1$SBP, col = ifelse(data_1$SMK == 1, "red", "blue"), pch = 16, xlab = "QUET", ylab = "SBP")

# Add regression lines
abline(model$coefficients[1], model$coefficients[2], col = "blue", lty = 1)  # Nonsmokers
abline(model$coefficients[1] + model$coefficients[3], model$coefficients[2] + model$coefficients[4], col = "red", lty = 1)  # Smokers

# Add legend
legend("topright", legend = c("Nonsmokers", "Smokers"), col = c("blue", "red"), pch = 16)

#Now with the summary of the model and the graphical representation we have enough proof that the slope 
#of Non-smokers is greater than that of Smokers hence we can reject the null Hypothesis which is H0: The slope are
#the same for the populations of smokers and non-smokers being sampled. We fail to reject H1: Non smokers have a larger
#slope. As The slope of non smokers is 26.303 and smokers is 26.303 - 6.185 = 20.118.
