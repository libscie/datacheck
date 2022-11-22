expect_true(
  grepl('01/01/2000', pattern = birthday())
)

expect_true(
  grepl('jan 1, 2000', pattern = birthday())
)

expect_false(
  grepl('1 jan, 2000', pattern = birthday())
)

expect_false(
  grepl('44/44/1800', pattern = birthday())
)
