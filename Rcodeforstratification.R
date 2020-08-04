# Loading the libraries
library(haven)
library(strat)
library(purrr)

# Importing the datasets
df2002 <- read_dta('E:/STUFF/3-2/ECON F266 PROJECT/wealth_data_2002R.dta')
df2013 <- read_dta('E:/STUFF/3-2/ECON F266 PROJECT/wealth_data_2013R.dta')

# Social group
s02_social = with(df2002, strat(pc_hh_net_wealth, B3_q6,weights = Weight))
s13_social = with(df2013, strat(pc_hh_net_wealth, b3q7,weights = Weight_SC))
print(s02_social, digits = 3)
print(s02_social$strata_info, digits = 3)
print(s13_social, digits = 3)
print(s13_social$strata_info, digits = 3)

# Religion
s02_religion = with(df2002, strat(pc_hh_net_wealth, B3_q5,weights = Weight))
s13_religion = with(df2013, strat(pc_hh_net_wealth, b3q6,weights = Weight_SC))
print(s02_religion, digits = 3)
print(s02_religion$strata_info, digits = 3)
print(s13_religion, digits = 3)
print(s13_religion$strata_info, digits = 3)

# Rural-Urban
s02_sector = with(df2002, strat(pc_hh_net_wealth, Sector,weights = Weight))
s13_sector = with(df2013, strat(pc_hh_net_wealth, Sector,weights = Weight_SC))
print(s02_sector, digits = 3)
print(s02_sector$strata_info, digits = 3)
print(s13_sector, digits = 3)
print(s13_sector$strata_info, digits = 3)

# State-wise Rural/Urban
dat_list_02 = split(df2002, df2002$State)
dat_list_13 = split(df2013, df2013$State)
sru1 = map(dat_list_02, ~with(.x, strat(pc_hh_net_wealth, Sector, weights = Weight)))
sru2 = map(dat_list_13, ~with(.x, strat(pc_hh_net_wealth, Sector, weights = Weight_SC)))
sru1
sru2