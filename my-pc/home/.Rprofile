local({
    w_repos  <- getOption("repos")
    w_repos["CRAN"] <- "https://cran.itam.mx"
    options(repos = w_repos)
})


tryCatch(startup::startup(),
    error=function(ex) message(".Rprofile error: ", conditionMessage(ex)) )

if (interactive()) {
    fortunes::fortune()
} else {
    options(readr.num_columns=0)
}

