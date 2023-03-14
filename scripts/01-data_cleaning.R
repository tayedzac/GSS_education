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
  select(
    id,
    educ
  ) |>
  mutate(
    education = case_when(
      educ < 12 ~ "< High School",
      educ == 12 ~ "High School",
      educ < 16 ~ "Some College",
      educ == 16 ~ "4 Years of College",
      educ <= 20 ~ "> 4 years of college",
      TRUE ~ "Other"
    )
  )

clean_data2 <- clean_data |> 
  select(
    id,
    maeduc
  ) |>
  mutate(
    education = case_when(
      maeduc < 12 ~ "< High School",
      maeduc == 12 ~ "High School",
      maeduc < 16 ~ "Some College",
      maeduc == 16 ~ "4 Years of College",
      maeduc <= 20 ~ "> 4 years of college",
      TRUE ~ "Other"
    )
  )

clean_data3 <- clean_data |> 
  select(
    id,
    paeduc
  ) |>
  mutate(
    education = case_when(
      paeduc < 12 ~ "< High School",
      paeduc == 12 ~ "High School",
      paeduc < 16 ~ "Some College",
      paeduc == 16 ~ "4 Years of College",
      paeduc <= 20 ~ "> 4 years of college",
      TRUE ~ "Other"
    )
  )

#### Save data ####
write_csv(clean_data, "~/Documents/GSS_education/inputs/data/clean_data.csv")
write_csv(clean_data1, "~/Documents/GSS_education/inputs/data/clean_data1.csv")
write_csv(clean_data2, "~/Documents/GSS_education/inputs/data/clean_data2.csv")
write_csv(clean_data3, "~/Documents/GSS_education/inputs/data/clean_data3.csv")
