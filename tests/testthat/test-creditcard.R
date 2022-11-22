expect_true(
  grepl('4242424242424242', pattern = creditcard())
)

expect_false(
  grepl('4242', pattern = creditcard())
)
