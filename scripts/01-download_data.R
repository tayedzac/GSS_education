#### Preamble ####
# Purpose: Downloads data for GSS
# Author: Jueun Kang and Tayedza Chikumbirike
# Data: 4 March 2023
# Contact: jueun.kang@mail.utoronto.ca, t.chikumbirike@mail.utoronto.ca
# Pre-requisites: N/A
# Any other information needed? N/A

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(dplyr)
library(tidyr)
library(haven)

#### Download data ####
raw_data <- read_dta("~/Documents/GSS_education/inputs/data/GSS2021.dta")

#### Save raw data ####
write_csv(raw_data, "~/Documents/GSS_education/inputs/data/raw_data.csv")
