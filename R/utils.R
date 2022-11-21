#' Title
#'
#' @param path
#'
#' @return
#' @export
#'
#' @examples
readDir <- function(path) {
  listOfFiles <- list.files(path, recursive = TRUE, pattern = "*\\.csv|*\\.xlsx")
}

#' Title
#'
#' @param file
#'
#' @return
#' @export
#'
#' @examples
readCsv <- function(file) {
  readr::read_csv(file)
}

#' Read an Excel file
#'
#' @param file
#'
#' @return
#'
#' @examples
readExcel <- function(file) {

  readxl::read_excel(file)
}
