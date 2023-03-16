#### Preamble ####
# Purpose: Tests the properties of our data set.
# Author: Jueun Kang and Tayedza Chikumbirike
# Data: 16 March 2023
# Contact: jueun.kang@mail.utoronto.ca, t.chikumbirike@mail.utoronto.ca
# Pre-requisites: N/A
# Any other information needed? N/A


#### Workspace setup ####
library(haven)
library(janitor)
library(tidyr)
library(tidyverse)
library(dplyr)

#### Test data ####
# Data set up
simulated_data <- 
  tibble(
    educ = runif(n = 100, min = 1, 25) |> round(0)
  )

sorted_data <- 
  simulated_data |> 
  mutate(
    education = case_when(
      educ < 12 ~ "< High School",
      educ == 12 ~ "High School",
      educ < 16 ~ "Some College",
      educ == 16 ~ "4 Years of College",
      educ <= 20 ~ "> 4 Years of College",
      TRUE ~ "Other"
    )
  )

# Tests
sorted_data$educ |> 
  min() == 1

sorted_data$educ |> 
  max() == 25

sorted_data$educ |>
  class() == "numeric"

sorted_data$education |>
  class() == "character"