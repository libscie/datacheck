expect_true(
  grepl('test@example.com', pattern = email())
  )

expect_false(
  grepl('test@example', pattern = email())
  )

expect_false(
  grepl('@example', pattern = email())
  )
