
# MLBteams

<!-- badges: start -->
<!-- badges: end -->

The MLBteams package creates a small 30-row dataset of information on the stadium each Major League Baseball team plays in. The information is taken from the Wikipedia page on the current stadiums.

## Installation

You can install MLBteams from Github with:

``` r
devtools::install_github("seantoconnor/MLBteams")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(MLBteams)
## load the data
stadiums = MLBteams::stadiums()
```

