<!-- badges: start -->
[![CRAN status](https://www.r-pkg.org/badges/version/spiritR)](https://CRAN.R-project.org/package=spiritR)
[![Build Status](https://travis-ci.org/awconway/spiritR.svg?branch=master)](https://travis-ci.org/awconway/spiritR)
[![Codecov test coverage](https://codecov.io/gh/awconway/spiritR/branch/master/graph/badge.svg)](https://codecov.io/gh/awconway/spiritR?branch=master)
[![](https://cranlogs.r-pkg.org/badges/spiritR)](https://cran.rstudio.com/web/packages/spiritR/index.html)
[![Lifecycle: maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
<!-- badges: end -->
# spiritR

This package contains an Rmarkdown template for a clinical trial protocol adhering to the [SPIRIT](http://www.spirit-statement.org/) checklist. This package was inspired by the Spirit Electronic Protocol Tool & Resource [SEPTRE](https://www.spirit-statement.org/septre) software program.


Contained within the template is a section for each of the elements that should be adressed in a clinical trial protocol. Links to the SPIRIT statement guidance about what should be addressed in each element are provided.

Functions in this package provide the functionality to  upload information from the protocol developed in your Rmardown file to a new record in the clinicaltrials.gov registry. 


# Installing the package

    install.packages("spiritR")
    
    # For devel version
    devtools::install_github("awconway/spiritR")

  
Once installed, the template will be available within the RStudio IDE by selecing 'New File' > 'R Markdown' > 'From Template'.
