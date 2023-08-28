## code to prepare `gilmoregirls_info` dataset goes here


# download wikipedia table ------------------------------------------------

wikitable_raw <-
  rvest::read_html("https://en.wikipedia.org/wiki/List_of_Gilmore_Girls_episodes") |>
  rvest::html_nodes('table[class="wikitable plainrowheaders wikiepisodetable"]') |>
  rvest::html_table() |>
  purrr::map2(
    seq_len(7),
    ~ dplyr::select(
      .x,
      index = `No.overall`,
      episode = `No. inseason`,
      title = Title,
      directed_by = `Directed by`,
      written_by = `Written by`,
      air_date = `Original air date`,
      us_views_millions = `US viewers(millions)`
    ) |>
      dplyr::mutate(season = .y)
  ) |>
  dplyr::bind_rows()


# download imdb ratings ---------------------------------------------------


## season 1 ---------------------------------------------------------------

rating_s1 <-
  rvest::read_html(
    "https://www.imdb.com/title/tt0238784/episodes?season=1"
  ) |>
  rvest::html_nodes(
    'div[class="list detail eplist"]
     div[class="ipl-rating-star small"]
     span[class="ipl-rating-star__rating"]'
  ) |>
  rvest::html_text()


ggr_s1 <- tibble::tibble(
  season = 1,
  episode = seq_along(rating_s1),
  imdb_rating = as.numeric(rating_s1)
) |>
  dplyr::slice(-c(1)) |>
  dplyr::mutate(
    episode = dplyr::case_when(
      episode == 2 ~ 1,
      episode == 3 ~ 2,
      episode == 4 ~ 3,
      episode == 5 ~ 4,
      episode == 6 ~ 5,
      episode == 7 ~ 6,
      episode == 8 ~ 7,
      episode == 9 ~ 8,
      episode == 10 ~ 9,
      episode == 11 ~ 10,
      episode == 12 ~ 11,
      episode == 13 ~ 12,
      episode == 14 ~ 13,
      episode == 15 ~ 14,
      episode == 16 ~ 15,
      episode == 17 ~ 16,
      episode == 18 ~ 17,
      episode == 19 ~ 18,
      episode == 20 ~ 19,
      episode == 21 ~ 20,
      episode == 22 ~ 21,
    )
  )


## season 2 ---------------------------------------------------------------

rating_s2 <-
  rvest::read_html(
    "https://www.imdb.com/title/tt0238784/episodes?season=2"
  ) |>
  rvest::html_nodes(
    'div[class="list detail eplist"]
     div[class="ipl-rating-star small"]
     span[class="ipl-rating-star__rating"]'
  ) |>
  rvest::html_text()

ggr_s2 <- tibble::tibble(
  season = 2,
  episode = seq_along(rating_s2),
  imdb_rating = as.numeric(rating_s2)
)


## season 3 ---------------------------------------------------------------

rating_s3 <-
  rvest::read_html(
    "https://www.imdb.com/title/tt0238784/episodes?season=3"
  ) |>
  rvest::html_nodes(
    'div[class="list detail eplist"]
     div[class="ipl-rating-star small"]
     span[class="ipl-rating-star__rating"]'
  ) |>
  rvest::html_text()


ggr_s3 <- tibble::tibble(
  season = 3,
  episode = seq_along(rating_s3),
  imdb_rating = as.numeric(rating_s3)
)


## season 4 ---------------------------------------------------------------

rating_s4 <-
  rvest::read_html(
    "https://www.imdb.com/title/tt0238784/episodes?season=4"
  ) |>
  rvest::html_nodes(
    'div[class="list detail eplist"]
     div[class="ipl-rating-star small"]
     span[class="ipl-rating-star__rating"]'
  ) |>
  rvest::html_text()


ggr_s4 <- tibble::tibble(
  season = 4,
  episode = seq_along(rating_s4),
  imdb_rating = as.numeric(rating_s4)
)


## season 5 ---------------------------------------------------------------

rating_s5 <-
  rvest::read_html(
    "https://www.imdb.com/title/tt0238784/episodes?season=5"
  ) |>
  rvest::html_nodes(
    'div[class="list detail eplist"]
     div[class="ipl-rating-star small"]
     span[class="ipl-rating-star__rating"]'
  ) |>
  rvest::html_text()


ggr_s5 <- tibble::tibble(
  season = 5,
  episode = seq_along(rating_s5),
  imdb_rating = as.numeric(rating_s5)
)


## season 6 ---------------------------------------------------------------

rating_s6 <-
  rvest::read_html(
    "https://www.imdb.com/title/tt0238784/episodes?season=6"
  ) |>
  rvest::html_nodes(
    'div[class="list detail eplist"]
     div[class="ipl-rating-star small"]
     span[class="ipl-rating-star__rating"]'
  ) |>
  rvest::html_text()


ggr_s6 <- tibble::tibble(
  season = 6,
  episode = seq_along(rating_s6),
  imdb_rating = as.numeric(rating_s6)
)


## season 7 ---------------------------------------------------------------

rating_s7 <-
  rvest::read_html(
    "https://www.imdb.com/title/tt0238784/episodes?season=7"
  ) |>
  rvest::html_nodes(
    'div[class="list detail eplist"]
     div[class="ipl-rating-star small"]
     span[class="ipl-rating-star__rating"]'
  ) |>
  rvest::html_text()


ggr_s7 <- tibble::tibble(
  season = 7,
  episode = seq_along(rating_s7),
  imdb_rating = as.numeric(rating_s7)
)


## season 1-7 -------------------------------------------------------------

imdb_ratings <-
  dplyr::bind_rows(ggr_s1, ggr_s2, ggr_s3, ggr_s4, ggr_s5, ggr_s6, ggr_s7) |>
  dplyr::mutate(index = 1:153) |>
  dplyr::select(index, imdb_rating)


# download imdb description -----------------------------------------------


## season 1 ---------------------------------------------------------------

description_s1 <-
  rvest::read_html(
    "https://www.imdb.com/title/tt0238784/episodes?season=1"
  ) |>
  rvest::html_nodes('div[class="item_description"]') |>
  rvest::html_text()


ggd_s1 <- tibble::tibble(
  season = 1,
  episode = seq_along(description_s1),
  description = description_s1
) |>
  dplyr::slice(-c(1)) |>
  dplyr::mutate(
    episode = dplyr::case_when(
      episode == 2 ~ 1,
      episode == 3 ~ 2,
      episode == 4 ~ 3,
      episode == 5 ~ 4,
      episode == 6 ~ 5,
      episode == 7 ~ 6,
      episode == 8 ~ 7,
      episode == 9 ~ 8,
      episode == 10 ~ 9,
      episode == 11 ~ 10,
      episode == 12 ~ 11,
      episode == 13 ~ 12,
      episode == 14 ~ 13,
      episode == 15 ~ 14,
      episode == 16 ~ 15,
      episode == 17 ~ 16,
      episode == 18 ~ 17,
      episode == 19 ~ 18,
      episode == 20 ~ 19,
      episode == 21 ~ 20,
      episode == 22 ~ 21,
    )
  )


## season 2 ---------------------------------------------------------------

description_s2 <-
  rvest::read_html(
    "https://www.imdb.com/title/tt0238784/episodes?season=2"
  ) |>
  rvest::html_nodes('div[class="item_description"]') |>
  rvest::html_text()


ggd_s2 <- tibble::tibble(
  season = 2,
  episode = seq_along(description_s2),
  description = description_s2
)


## season 3 ---------------------------------------------------------------

description_s3 <-
  rvest::read_html(
    "https://www.imdb.com/title/tt0238784/episodes?season=3"
  ) |>
  rvest::html_nodes('div[class="item_description"]') |>
  rvest::html_text()


ggd_s3 <- tibble::tibble(
  season = 3,
  episode = seq_along(description_s3),
  description = description_s3
)


## season 4 ---------------------------------------------------------------

description_s4 <-
  rvest::read_html(
    "https://www.imdb.com/title/tt0238784/episodes?season=4"
  ) |>
  rvest::html_nodes('div[class="item_description"]') |>
  rvest::html_text()


ggd_s4 <- tibble::tibble(
  season = 4,
  episode = seq_along(description_s4),
  description = description_s4
)


## season 5 ---------------------------------------------------------------

description_s5 <-
  rvest::read_html(
    "https://www.imdb.com/title/tt0238784/episodes?season=5"
  ) |>
  rvest::html_nodes('div[class="item_description"]') |>
  rvest::html_text()


ggd_s5 <- tibble::tibble(
  season = 5,
  episode = seq_along(description_s5),
  description = description_s5
)


## season 6 ---------------------------------------------------------------

description_s6 <-
  rvest::read_html(
    "https://www.imdb.com/title/tt0238784/episodes?season=6"
  ) |>
  rvest::html_nodes('div[class="item_description"]') |>
  rvest::html_text()


ggd_s6 <- tibble::tibble(
  season = 6,
  episode = seq_along(description_s6),
  description = description_s6
)


## season 7 ---------------------------------------------------------------

description_s7 <-
  rvest::read_html(
    "https://www.imdb.com/title/tt0238784/episodes?season=7"
  ) |>
  rvest::html_nodes('div[class="item_description"]') |>
  rvest::html_text()


ggd_s7 <- tibble::tibble(
  season = 7,
  episode = seq_along(description_s7),
  description = description_s7
)


## season 1-7 -------------------------------------------------------------

imdb_descriptions <-
  dplyr::bind_rows(ggd_s1, ggd_s2, ggd_s3, ggd_s4, ggd_s5, ggd_s6, ggd_s7) |>
  dplyr::mutate(index = 1:153) |>
  dplyr::select(index, description)




gilmoregirls_info <- wikitable_raw |>
  dplyr::left_join(imdb_ratings, by = "index") |>
  dplyr::left_join(imdb_descriptions, by = "index") |>
  dplyr::relocate(season, .after = index) |>
  dplyr::mutate(
    title = stringr::str_remove(title, '"'),
    title = stringr::str_remove(title, '".*'),
    air_date = stringr::str_remove(air_date, "\\(.*"),
    air_date = stringr::str_trim(air_date),
    air_date = lubridate::mdy(air_date),
    us_views_millions = stringr::str_remove(us_views_millions, "\\[.*"),
    us_views_millions = as.numeric(us_views_millions),
    description = stringr::str_trim(description, side = "both"),
    collected_date = Sys.Date()
  )


usethis::use_data(gilmoregirls_info, overwrite = TRUE)
