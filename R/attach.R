# Code is taken from Hadley Wickham's tidyverse package.
core <- c("tidyverse","ggplot2","matrixStats","rARPACK","edge",
          "broom","MASS","jackstraw","lars","glmnetUtils","splines",
          "lmtest","car","BSDA","gapminder","gganimate","rvest","babynames",
          "datasets","magrittr","devtools","moments","mgcv", "qvalue")

.onAttach <- function(...) {
  needed <- core[!is_attached(core)]
  if (length(needed) == 0)
    return()
  fastats_attach()
  
  if (!"package:conflicted" %in% search()) {
    #x <- fastats_conflicts()
    NULL
   # msg(fastats_conflict_message(x), startup = TRUE)
  }
  
}

is_attached <- function(x) {
  paste0("package:", x) %in% search()
}

fastats_packages <- function(include_self = TRUE) {
  raw <- utils::packageDescription("fastats")$Imports
  imports <- strsplit(raw, ",")[[1]]
  parsed <- gsub("^\\s+|\\s+$", "", imports)
  names <- vapply(strsplit(parsed, "\\s+"), "[[", 1, FUN.VALUE = character(1))
  
  if (include_self) {
    names <- c(names, "fstats")
  }
  names
}
core_loaded <- function() {
  search <- paste0("package:", core)
  core[search %in% search()]
}
core_unloaded <- function() {
  search <- paste0("package:", core)
  core[!search %in% search()]
}


fastats_attach <- function() {
  to_load <- core_unloaded()
  if (length(to_load) == 0)
    return(invisible())
  suppressPackageStartupMessages(
    lapply(to_load, library, character.only = TRUE, warn.conflicts = FALSE, quietly = TRUE)
  )
  invisible()
}

