
########ABM Assignment Sunday 02 February 2025#####

############################################################
### ABM AND SIMULATION OF DEATH REGISTRATION IN UGANDA###  
############################################################

# European Doctoral School of Demography (EDSD) 2024/2025
# Agent-based Modelling and Simulation Course 
# Assignment
# Write a Research proposal in which you plan to implement an agent-based model.
# Lecturer: Francisco (Pancho) Villavicencio
# Email: villavicencio@ub.edu
# Student Name: Gilbert HABAASA
# Date: Sunday 02 February 2025
# 
# Topic: Implementing an Agent-Based Model and Simulation to understand the causes of Low death Registration in Uganda: A Micro-Macro Level Perspective.


# 1.3 Research Objectives
# 1.3.1 Main Objective
# To propose an agent-based model approach and simulation to understand the causes of low death registration in Uganda through a micro-macro level perspective.
# 1.3.2 Specific Objectives
# i.	To identify key factors influencing low death registration rates in Uganda.
# ii.	To develop an agent-based model that simulates individual and institutional interactions affecting death registration in Uganda.
# iii.	To analyse potential policy interventions on death registration in Uganda using the Agent-based model framework.
# iv.	To propose recommendations for improving death registration in Uganda based on the agent-based model results.
# 
# 1.4 Research Hypotheses
# i.	There is no significant difference in the observed and simulated death registration rates in Uganda for the past 5 years.
# ii.	The perceived cost of death registration influences individuals from registering deaths that have occurred in their households with the civil registration Office.
# iii.	Cultural beliefs and traditions influence household decisions on whether to register a death that has occurred in their households.
# iv.	A simulated increase in public awareness campaigns will lead to a higher probability of death registration at the household level.


# Load necessary libraries
library(ggplot2)
library(dplyr)

# Create the data frame
data <- data.frame(
  Year = c(2020, 2021, 2022, 2023, 2024),
  Observed_Rate = c(1.0, 4.3, 11.9, 14.4, 6.0),  # Given observed death registration rates
  Simulated_Rate = c(1.5, 5.0, 12.5, 16.0, 7.5)  # Hypothetical simulated trend
)

# Plot the data
ggplot(data, aes(x = Year)) +
  geom_line(aes(y = Observed_Rate, color = "Observed"), size = 1.2) +
  geom_point(aes(y = Observed_Rate, color = "Observed"), size = 3) +
  geom_line(aes(y = Simulated_Rate, color = "Simulated"), linetype = "dashed", size = 1.2) +
  geom_point(aes(y = Simulated_Rate, color = "Simulated"), size = 3) +
  scale_color_manual(values = c("Observed" = "blue", "Simulated" = "red")) +
  labs(
    title = "Death Registration Rate in Uganda (2020-2024)",
    x = "Year",
    y = "Death Registration Rate (%)",
    color = "Legend"
  ) +
  theme_minimal()


####Policy shifts

# Define historical data (Observed from 2020-2024)
years <- c(2020, 2021, 2022, 2023, 2024)
observed_rate <- c(1.0, 4.3, 11.9, 14.4, 6.0)  # Observed registration rates (%)

# Future projection years (repeat each year 3 times for different scenarios)
future_years <- rep(c(2030, 2040, 2050), each = 1)

# Define projected registration rates for different scenarios
conservative <- c(25, 50, 65)  # Slow Growth Scenario
moderate <- c(45, 70, 85)  # Policy Improvement Scenario
optimistic <- c(60, 85, 95)  # Strong Interventions Scenario

# Create a data frame for future projections
future_df <- data.frame(
  Year = rep(future_years, 3),  # Repeat years for each scenario
  Rate = c(conservative, moderate, optimistic),
  Scenario = rep(c("Conservative", "Moderate", "Optimistic"), each = length(future_years))
)

# Create a data frame for observed data
observed_df <- data.frame(
  Year = years,
  Rate = observed_rate,
  Scenario = "Observed"
)

# Combine both data frames
df <- bind_rows(observed_df, future_df)

# Plot the data
ggplot(df, aes(x = Year, y = Rate, color = Scenario, linetype = Scenario)) +
  geom_line(size = 1.2) +
  geom_point(size = 3) +
  scale_color_manual(values = c("Observed" = "black", "Conservative" = "red", 
                                "Moderate" = "blue", "Optimistic" = "green")) +
  labs(
    title = "Projected Death Registration Rate in Uganda (2020-2050)",
    x = "Year",
    y = "Death Registration Rate (%)",
    color = "Scenario",
    linetype = "Scenario"
  ) +
  theme_minimal()



