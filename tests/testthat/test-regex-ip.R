########
# IPv4 #
########

# Without port
expect_true(
  grepl('100.64.0.0', pattern = ip(version = 4))
)

# With port
expect_true(
  grepl('100.64.0.0:22', pattern = ip(version = 4))
)

# Too few digits
expect_false(
  grepl('111.111.11', pattern = ip(version = 4))
)

########
# IPv6 #
########

# Without port
expect_true(
  grepl('2001:0db8:0000:0000:0000:8a2e:0370:7334', pattern = ip(version = 6))
)
expect_true(
  grepl('2001:db8::8a2e:370:7334', pattern = ip(version = 6))
)


# With port
expect_true(
  grepl('[2001:db8:4006:812::200e]:8080', pattern = ip(version = 6))
)

# No square brackets with port
expect_false(
  grepl(':db8:4006:812::', pattern = ip(version = 6))
)
