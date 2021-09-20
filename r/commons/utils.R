remove_letters <- function(col) {
  col %>%
    str_remove_all("[[:alpha:]]") %>%
    str_remove_all("[[:punct:]]") %>%
    str_trim()
}

deaccent <- function(string) {
  chartr(
    "ŠŽšžŸÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðñòóôõöùúûüýÿ",
    "SZszYAAAAAACEEEEIIIIDNOOOOOUUUUYaaaaaaceeeeiiiidnooooouuuuyy",
    string
  )
}

my_snake_case <- function(str) {
  str %>%
    deaccent() %>%
    to_snake_case() %>%
    str_trim()
}

trunc <- function(x, ..., prec = 0) base::trunc(x * 10^prec, ...) / 10^prec
