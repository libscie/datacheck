expect_true(
  !is.na(stringr::str_extract('505-76-5015', pattern = ssn()))
)


expect_false(
  !is.na(stringr::str_extract('505-76-5015fdasfds', pattern = ssn()))
)
