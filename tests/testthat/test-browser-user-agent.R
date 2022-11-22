expect_true(
  !is.na(stringr::str_extract('applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/80.0.3987.119 mobile safari/537.36', pattern = browserUA()))
)

expect_true(
  !is.na(
    stringr::str_extract(
      'mozilla/5.0 (windows nt 6.1; wow64; rv:12.0) gecko/20100101 firefox/12.0',
                              pattern = browserUA()))
)


expect_false(
  !is.na(stringr::str_extract(
    'potato',
    pattern = browserUA()))
)


