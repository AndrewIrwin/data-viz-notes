# helpful hints

# To preview quarto document from terminal

## quarto preview

# to compile and make available using github pages

## quarto publish gh-pages

# to find all the libraries needed
## find in files library()
## or R snippet (to be written)


# untested for completeness
library(autoharp)
getLessons <- function(directory = "lessons", all=TRUE) {
  fl_qmd <- list.files(here::here(directory), "\\.[Rq]md$", full.names=TRUE, recursive = TRUE)
  lessons <- lapply(fl_qmd, get_libraries) |> unlist() 
  have <- installed.packages()[, "Package"]
  if (!all) { lessons <- setdiff(lessons, have) }
  lessons |> unique() |> sort()
}

pkgs  <- getLessons(all=FALSE)
pkgs <- pkgs[!stringr::str_detect(pkgs, "quietly")]
# install.packages(pkgs)

# install.packages(c("vegan", "tidymodels", "statebins", "sf", "dlookr", "equatiomatic", "fields", "gapminder", "geojsonio", "caret", "leaflet", "ggvegan"))

## ggheatmap not available in R 4.5

## count words

# extract_non_chunks("lessons/101-introduction.Rmd") |> paste(collapse= " ") |> text_stats_chr()

library(tidyverse)

# devtools::install_github("benmarwick/wordcountaddin", type = "source", dependencies = TRUE)
library(wordcountaddin)

getWordCount <- function(directory = "lessons") {
  fl_qmd <- list.files(here::here(directory), ".Rmd", full.names=TRUE)
  map_dfr(fl_qmd, function(fn) {
       extract_non_chunks(fn) |> paste(collapse= " ") |> 
       text_stats_fn_() |> as_tibble() |>
       mutate(source = fn)
  })
}
# getWordCount() |> summarize(sumwords = sum(n_words_korp))
# 49916 words (korp) as at 2022-09-03
# 57477 words as at 2026-01-02

# write a function to read all Rmd files in this directory and list all libraries needed to run the code


