expect_true(
  grepl('00-b0-d0-63-c2-26', pattern = macAddress())
)

expect_true(
  grepl('00:b0:d0:63:c2:26', pattern = macAddress())
)

expect_false(
  grepl('00-b0-d0-', pattern = macAddress())
)

expect_false(
  grepl('00-b0:d0:63:c2:26', pattern = macAddress())
)
