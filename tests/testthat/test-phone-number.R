expect_true(
  length(stringr::str_extract('+1 (123) 456 78', pattern = phoneNr())) > 0
)

expect_true(
  grepl('+112345678', pattern = phoneNr())
)

expect_false(
  grepl('123 456 78', pattern = phoneNr())
)
