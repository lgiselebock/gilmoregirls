
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gilmoregirls

<!-- badges: start -->
<!-- badges: end -->

The goal of gilmoregirls is to provide the complete script transcription
of the Gilmore Girls (*work in progress*) and information about the
episodes of the TV Show.

## Installation

You can install the development version of gilmoregirls from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("lgiselebock/gilmoregirls")
```

## Example

The `gilmoregirls` package comes with one dataset, that contains the
information about all the episodes in the show.

``` r
library(gilmoregirls)

dplyr::glimpse(gilmoregirls_info)
#> Rows: 153
#> Columns: 11
#> $ index             <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 1…
#> $ season            <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
#> $ episode           <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 1…
#> $ title             <chr> "Pilot", "The Lorelais' First Day at Chilton", "Kill…
#> $ directed_by       <chr> "Lesli Linka Glatter", "Arlene Sanford", "Adam Nimoy…
#> $ written_by        <chr> "Amy Sherman-Palladino", "Amy Sherman-Palladino", "J…
#> $ air_date          <date> 2000-10-05, 2000-10-12, 2000-10-19, 2000-10-26, 200…
#> $ us_views_millions <dbl> 5.03, 3.40, 2.89, 3.93, 3.88, 3.73, 3.45, 3.80, 3.62…
#> $ imdb_rating       <dbl> 8.1, 8.0, 7.8, 7.9, 7.8, 8.5, 8.4, 8.0, 8.7, 8.3, 7.…
#> $ description       <chr> "Rory is accepted into the elite Chilton prep school…
#> $ collected_date    <date> 2023-08-28, 2023-08-28, 2023-08-28, 2023-08-28, 202…
```

### Audience (in millions) in the USA

``` r


gilmoregirls_info |> 
  dplyr::mutate(season = as.factor(season)) |> 
  ggplot2::ggplot() +
  ggplot2::aes(
    x = index,
    y = us_views_millions,
    fill = season,
    width = 0.5
  ) +
  ggplot2::geom_col() +
  ggplot2::labs(
    x = "Episodes",
    y = "Audience (millions) in the USA",
    fill = "Season"
  ) +
  ggplot2::scale_x_continuous(breaks = seq(0, 153, 20)) +
  ggplot2::scale_y_continuous(
    limits = c(0, 8), 
    breaks = seq(0, 8, 2)
  ) +
  ggplot2::scale_fill_manual(
    values = c(
      "#d4b9a9",
      "#5271ff",
      "#52c5c7",
      "#c131e8",
      "#fc9b5e",
      "#ffdd49",
      "#cd570f"
    )
  ) +
  ggplot2::theme_minimal() +
  ggplot2::theme(
    panel.grid.major.x = ggplot2::element_blank(),
    panel.grid.minor = ggplot2::element_blank(),
    legend.position = c(1.06, 1.06),
    legend.justification = c("right", "top"),
    legend.box.just = "right",
    plot.margin = ggplot2::unit(c(1, 1, 1, 1), "cm"),
    text = ggplot2::element_text(size = 10)
  )
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
