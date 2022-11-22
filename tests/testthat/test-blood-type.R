expect_true(
  grepl('a+', pattern = bloodType())
)

expect_false(
  grepl('+a', pattern = bloodType())
)
