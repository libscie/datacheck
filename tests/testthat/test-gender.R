expect_true(
  grepl('transwoman', pattern = gender())
)
expect_true(
  grepl('non-binary', pattern = gender())
)
expect_true(
  grepl('nonbinary', pattern = gender())
)

expect_false(
  grepl('female', pattern = gender())
)
