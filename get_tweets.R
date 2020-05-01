
# Load Packages -----------------------------------------------------------


library(rtweet)
library(tidyverse)


# Liked Tweets ------------------------------------------------------------

dk_liked_tweets <- get_favorites(user = "dgkeyes",
                      n = 3000) %>% 
  mutate(url = str_glue("https://twitter.com/{screen_name}/status/{status_id}")) %>% 
  select(text, url, created_at)

dk_liked_tweets %>% 
  write_rds("data/dk-liked-tweets.rds")


# My Tweets ---------------------------------------------------------------

dk_tweets <- get_timeline(n = 3000,
                          user = "dgkeyes") %>% 
  mutate(url = str_glue("https://twitter.com/{screen_name}/status/{status_id}")) %>% 
  select(text, url, created_at)

dk_tweets %>% 
  write_rds("data/dk-tweets.rds")
