
# Based on "Skeleton file 2 for Assignment 1 in BAN400". 
# -------------------------------------------

# Following the detailed steps to complete Problem 2. 
# Long explanations are removed from this file for readability. 

# Loads tidyverse 
library(tidyverse)

# Using the readLines()-function. Use the
# URL direcly or read the data from the local file that is in the repository.

raw_file <- readLines(con = "suites_dw_Table1.txt")

# Identifying which line contains the separator as the example says: "L is the
# first line in the data file that starts with '--'" 
# Using the substr()-function:

# What do you need to replace the two question marks with in order to extract
# the first two letters?
substr(x = raw_file, start = 1, stop = 2)

# Find out *which* line starts with "--", and pick out the first one. 
# Filling out the question marks and the missing function names:
L <- 
  (substr(x = raw_file, start = ?, stop = ?) == "?") %>% 
  function_that_returns_the_index_of_all_TRUES %>% 
  function_that_picks_out_the_minimum_value

L <- 
  (substr(x = raw_file, start = 1, stop = 2) == "--") %>% 
  which(x, arr.ind=T)) 
   
  #I don't understand, there's just one TRUE in my code, don't know what I'm looking for 
# ??? 

# Saving the variable descriptions in a text-file, using the cat()-function. 
# Replacing the question marks:
cat(x = raw_file[1:12], sep = "\n", file = "var-descr")

# Extract and store the variable names in a vector 
# Replacing the question mark (so it is not there anymore):
variable_names <- 
  str_split(string = raw_file[13], pattern = "\\|") %>% 
  unlist() %>% 
  str_trim()

# Reading the data, the way that they asked. Again, replacing the question mark 

comma_separated_values<-
  raw_file[15:810] %>% 
  gsub("\\|", ",", .) %>% 
  gsub(" ", "", .) %>% 
  na.omit()

#check 
comma_separated_values 
# Okay the na thing is unnecessary but it looks the same without 

# Add variable names (separated with commas) on top, make csv 

comma_separated_values_with_names <- 
  c(paste(variable_names, collapse = ","),
    comma_separated_values)    

# make file  
cat(comma_separated_values_with_names, sep = "\n", file = "comma-names")

# Read file
galaxies <- read_csv("comma-names") 

# checks 
galaxies 
# Looks alright? 

# Contains 796 observations



# Problem 3 #### 
# Okay we already have the package and the data 

# make a plot then 
galaxies %>% 
  ggplot(aes(x = log_lk,
             y = D)) +
  geom_point(aes(size = a_26,
                  colour = count)) +
  
  labs(x      = "Logarithm of the stellar mass in solar units", 
       y      = "Distance to the galaxy in Mpc",
       colour = "Members in the suite of MD", 
       size   = "Diameter in kpc") +
  
  theme_classic()


# The definition of "smaller objects" is somewhat unclear from the 
# assignment text. In this plot, both the diameter and a measure of stellar mass 
# have been included. In the next plot, we will look at luminosity 

# new plot 
galaxies %>% 
  ggplot(aes(x = -m_b,
             y = D)) +
  geom_point(aes(size = a_26,
                 colour = count)) +
  
  labs(x      = "Absolute magnitude invert (Luminosity)", 
       y      = "Distance to the galaxy in Mpc",
       colour = "Members in the suite of MD", 
       size   = "Diameter in kpc") +
  
  theme_classic()

# It seems there may be more objects with a higher luminosity. Especially when 
# there are fewer very bright objects next to them. 
# To be blunt, maybe the brighter objects are easier to see:) 

# When it comes to the very faint objects, they are all less than appr 1 Mpc away 
# Page 8-10 in the 2013 article supplied in the Problem 2 assignment text explains this 
# The faint objects also seem to be fairly small compared to some of the others 
# The tidal indexes are measures of local mass density, but they are not considered very stable 
# Reading the article, the authors express uncertainty concerning most of the measures. 
# The distance as well is uncertain, which does undeniably affect my plot. 
# I inverted the luminosity to make the plot easier to read.  


