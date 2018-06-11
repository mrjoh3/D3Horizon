D3 Horizon Charts
================

Introduction
------------

Simple D3 Horizon Chart widget based on <http://kmandov.github.io/d3-horizon-chart/>.

``` r
library(D3Horizon)

n = 1500
data = cos(1:n / 100) + (rnorm(n) - 0.5) / 10
```

Simple Example
--------------

``` r
D3Horizon(data, title = 'Testing', horizon_height = 120)
```

![](README_files/figure-markdown_github/simple-1.png)
