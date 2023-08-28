#' Episode Information
#'
#' This [tibble][tibble::tibble-package] contains information about each of
#' the episodes. Information was sourced from Wikipedia and IMDb on
#' June 26th, 2022.
#'
#' @format A [tibble][tibble::tibble-package] with `r nrow(gilmoregirls_info)`
#' rows and `r ncol(gilmoregirls_info)` variables:
#' \code{index}, \code{season}, \code{episode}, \code{title},
#' \code{directed_by}, \code{written_by}, \code{air_date},
#' \code{us_views_millions}, \code{imdb_rating} and \code{description},
#' \code{collected_date}.
#'
#' @source \url{https://pt.wikipedia.org/wiki/Gilmore_Girls}
#' @source \url{https://www.imdb.com/title/tt0238784/}
"gilmoregirls_info"
