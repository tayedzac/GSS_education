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
    paeduc,
    maeduc
  ) |>
  drop_na(
    id,
    educ,
    paeduc,
    maeduc
  )

#### Save data ####
write_csv(clean_data, "~/Documents/GSS_education/inputs/data/clean_data.csv")

