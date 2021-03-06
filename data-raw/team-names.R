## code to prepare `team-names` dataset goes here

usethis::use_data(team-names, overwrite = TRUE)

# data-raw/mydataset.R
# Data import and processing pipeline

# install/load pacman
if(!require('pacman')) install.packages('pacman')

# load other packages
p_load(dplyr,    # functions for manipulating the data, writing files
       rvest,    # getting mlb team names from wikipedia
       janitor,  # making better column names
       stringr
       )

# read the mlb stadium data from wiki -------------------------------------
mlb = read_html("https://en.wikipedia.org/wiki/List_of_current_Major_League_Baseball_stadiums")

# recover the table with the team names using the browser inspector tool
mlb = mlb %>%
  html_nodes("#mw-content-text > div.mw-parser-output > table:nth-child(8)") %>%
  html_table(fill = TRUE)

# convert to dataframe
mlb = as_tibble(mlb[[1]]) %>%
  # clean up column names
  clean_names() %>%
  # select columns
  select(-c(image, distance_to_center_field)) %>%
  # remove the citations
  mutate(capacity = gsub('\\[[^]]*\\]', '', capacity),
         team = gsub('\\[[^]]*\\]', '', team),
         opened = gsub('\\[[^]]*\\]', '', opened),
         type = gsub('\\[[^]]*\\]', '', type),
         # remove commas in capacity
         capacity = as.numeric(str_remove(capacity, "[,]")))


# This should be the last line.
# Note that names are unquoted.
# I like using overwrite = T so everytime I run the script the
# updated objects are saved, but the default is overwrite = F
usethis::use_data(mlb, overwrite = T)
