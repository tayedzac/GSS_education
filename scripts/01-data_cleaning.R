#### Preamble ####
# Purpose: Cleans the GSS raw data
# Author: Jueun Kang and Tayedza Chikumbirike
# Data: 4 March 2023
# Contact: jueun.kang@mail.utoronto.ca, t.chikumbirike@mail.utoronto.ca
# Pre-requisites: Download the raw data from the GSS website
# Any other information needed? N/A


#### Workspace setup ####
library(tidyverse)
library(janitor)
library(dplyr)
library(tidyr)
library(haven)

#### Clean data ####
raw_data <- read_dta("~/Documents/GSS_education/inputs/data/GSS2021.dta")

clean_data <- clean_names(raw_data) |>
  select(
    id, 
    educ,
    maeduc,
    paeduc
  ) |>
  drop_na(
    id,
    educ,
    maeduc,
    paeduc
  )

clean_data1 <- clean_data |> 
  mutate(
    education = case_when(
      educ < 8 ~ "< High School",
      educ < 12 ~ "High School",
      educ < 15 ~ "Some College",
      educ < 16 ~ "College",
      TRUE ~ "Advanced Degree"
    )
  )

clean_data2 <- clean_data |> 
  mutate(
    education = case_when(
      maeduc < 8 ~ "< High School",
      maeduc < 12 ~ "High School",
      maeduc < 15 ~ "Some College",
      maeduc < 16 ~ "College",
      TRUE ~ "Advanced Degree"
    )
  )

clean_data3 <- clean_data |> 
  mutate(
    education = case_when(
      paeduc < 8 ~ "< High School",
      paeduc < 12 ~ "High School",
      paeduc < 15 ~ "Some College",
      paeduc < 16 ~ "College",
      TRUE ~ "Advanced Degree"
    )
  )

#### Save data ####
write_csv(clean_data, "~/Documents/GSS_education/inputs/data/clean_data.csv")
write_csv(clean_data1, "~/Documents/GSS_education/inputs/data/clean_data1.csv")
write_csv(clean_data2, "~/Documents/GSS_education/inputs/data/clean_data2.csv")
write_csv(clean_data3, "~/Documents/GSS_education/inputs/data/clean_data3.csv")
