#### Preamble ####
# Purpose: Simulates a sample data set.
# Author: Jueun Kang and Tayedza Chikumbirike
# Date: 16 March 2023
# Contact: jueun.kang@mail.utoronto.ca, t.chikumbirike@mail.utoronto.ca
# Pre-requisites: N/A
# Any other information needed? N/A


#### Workspace setup ####
library(haven)
library(janitor)
library(tidyr)
library(tidyverse)
library(dplyr)

#### Simulate data ####
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

sorted_data


