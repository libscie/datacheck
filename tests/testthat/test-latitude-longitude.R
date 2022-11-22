expect_true(
  grepl('-59.4,33.3', pattern = latitudeLongitude())
)


expect_false(
  grepl('10000', pattern = latitudeLongitude())
)
