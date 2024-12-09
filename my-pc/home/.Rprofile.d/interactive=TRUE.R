library(magrittr)


.env <- new.env()
.env$all_equal  <- function (x) all(x %in% x[1])

.env$not_na     <- function (x) not(is.na(x))

.env$not_in     <- function (x, y_set) not(x %in% y_set)

.env$not_exists <- function (file) not(file.exists(file))

.env$classes    <- function (a_df) {
    its_classes_df <- tibble(
        name  = names(a_df),
        class = map_chr(a_df, ~(class(.x)[1])))
    return (its_classes_df)}

attach(.env)



setup_data_dir <- function (the_dir) {
    if (the_dir %>% not_exists()) {
        dir.create(the_dir)
        gitignore_contents(the_dir)
        dir.create(the_dir %>% file.path("cache"))
    }
}

gitignore_contents <- function (the_dir) {
    ignore_file <- file.path(the_dir, ".gitignore")
    if (ignore_file %>% not_exists()) {
        file.create(ignore_file)
    } else {
        warning(".gitignore exists in dir: %s" %>% sprintf(the_dir))
    }
    lines_for_file <- c("*", "!.gitignore")
    writeLines(lines_for_file, ignore_file)
}

