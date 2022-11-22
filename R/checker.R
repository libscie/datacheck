datacheck <- function (path, folder = FALSE) {
  if (folder) {
    datacheckFolder(path)
  } else {
    datacheckFile(path)
  }

}

checker <- function (df, regex) {
  return(length(unique(stringr::str_extract(tolower(unlist(df)),
                          pattern = regex))) > 1)
}

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

  } else {
    stop(sprintf("File extension %s not supported", extension))
  }


  return(
    data.frame(file = path,
      email = checker(path, email()),
      ipv4 = checker(path, ip(version = 4)),
      ipv6 = checker(path, ip(version = 6)),
      macAddress = checker(path, macAddress()),
      browserUA = checker(path, browserUA()),
      phoneNr = checker(path, phoneNr()),
      latitudeLongitude = checker(path, latitudeLongitude()),
      gender = checker(path, gender()),
      ssn = checker(path, ssn()),
      birthday = checker(path, birthday()),
      bloodType = checker(path, bloodType()),
      iban = checker(path, iban()),
      creditcard = checker(path, creditcard()),
      mturk = checker(path, mturk())
    )
  )
}



datacheckFolder <- function(path) {
  # print(path)
  matchedFiles <- list.files(path, pattern = "*.csv|*.xlsx", recursive = TRUE)
  for (i in 1:length(matchedFiles)) {
    iterPath <- sprintf('%s%s', path, matchedFiles[i])
    if (i == 1) {
      res <- datacheckFile(iterPath)
    } else {
      res <- rbind(res, datacheckFile(iterPath))
    }
  }

  return(res)
}
