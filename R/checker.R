#' Check a path for identifying information.
#'
#' @param path    A system path (file or folder).
#' @param folder  Boolean, indicate whether the path is a folder (defaults to FALSE).
#'
#' @return Data frame, rows (files), columns (Boolean; presence of identifier).
#' @export
#'

datacheck <- function (path, folder = FALSE) {
  if (folder) {
    datacheckFolder(path)
  } else {
    datacheckFile(path)
  }

}

#' Check a dataframe for presence of a regular expression.
#'
#' @param df      Data frame.
#' @param regex   Regular expression in string object.
#'
#' @return Boolean.
#' @export
#'

checker <- function (df, regex) {
  return(length(unique(stringr::str_extract(tolower(unlist(df)),
                          pattern = regex))) > 1)
}

#' Check a data frame for identifying information.
#'
#' @param df  Data frame.
#'
#' @return Data frame, with columns for each type of identifier (Boolean).
#' @export
#'
#' @examples
#' datacheckDf(cars)
#'

datacheckDf <- function(df){
  data.frame(email = checker(df, email()),
             ipv4 = checker(df, ip(version = 4)),
             ipv6 = checker(df, ip(version = 6)),
             macAddress = checker(df, macAddress()),
             browserUA = checker(df, browserUA()),
             phoneNr = checker(df, phoneNr()),
             latitudeLongitude = checker(df, latitudeLongitude()),
             gender = checker(df, gender()),
             ssn = checker(df, ssn()),
             birthday = checker(df, birthday()),
             bloodType = checker(df, bloodType()),
             iban = checker(df, iban()),
             creditcard = checker(df, creditcard()),
             mturk = checker(df, mturk())
  )
}


#' Check a data file for identifying information.
#'
#' @param path   System path (file only).
#'
#' @return  Data frame, with columns for each type of identifier (Boolean).
#' @export
#'

datacheckFile <- function(path) {
  extension <- tools::file_ext(path)

  if (extension == "csv") {
    L <- readLines(path, n = 1)
    if (grepl(";", L)) {
      dat <- read.csv2(path)
    } else {
      dat <- read.csv(path)
    }
  } else if (extension == "xls" | extension == "xlsx") {
    dat <- readxl::read_excel(path)
    # Add per sheet
  } else {
    stop(sprintf("File extension %s not supported", extension))
  }

  out_df <- datacheckDf(dat)
  out_df$file <- path

  # Bring the file path in front and output
  out_df[union("file", names(out_df))]

}



#' Check a folder for identifying information.
#'
#' @param path   System path (folder only).
#'
#' @return  Data frame, rows (files), columns (Boolean; presence of identifier).
#' @export
#'
datacheckFolder <- function(path) {
  matchedFiles <- list.files(path, pattern = "*.csv|*.xlsx", recursive = TRUE)
  for (i in 1:length(matchedFiles)) {
    iterPath <- sprintf('%s%s', ifelse(
        endsWith(x = path, '/'),
        path,
        paste0(path, '/')
      ),
      matchedFiles[i])
    if (i == 1) {
      res <- datacheckFile(iterPath)
    } else {
      res <- rbind(res, datacheckFile(iterPath))
    }
  }

  return(res)
}
