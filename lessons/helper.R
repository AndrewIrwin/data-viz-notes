# helper.R

# call this function at the bottom of every document to record packages in use
writePackages <- function(erase=FALSE) {
  if (erase) unlink(here::here("attached-packages"))
  n <- names(sessionInfo()$otherPkgs)
  if (!is.null(n)) writeLines(names(sessionInfo()$otherPkgs),
                              file(here::here("attached-packages"), open = "a" ))
}

