  [![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
  <!-- badges: start -->
[![CRAN status](https://www.r-pkg.org/badges/version/spiritR)](https://CRAN.R-project.org/package=spiritR)
<!-- badges: end -->
# spiritR

This package contains an Rmarkdown template for a clinical trial protocol adhering to the [SPIRIT](http://www.spirit-statement.org/) checklist. This package was inspired by the Spirit Electronic Protocol Tool & Resource [SEPTRE](https://www.spirit-statement.org/septre) software program.


Contained within the template is a section for each of the elements that should be adressed in a clinical trial protocol. Links to the SPIRIT statement guidance about what should be addressed in each element are provided.

Functions in this package provide the functionality to  upload information from the protocol developed in your Rmardown file to a new record in the clinicaltrials.gov registry. 


# Installing the package

Enter the following in your console for installation (uncomment the first line if devtools is not already installed):

    # install.packages("devtools")
    devtools::install_github("awconway/spiritR")

  
Once installed, the template will be available within the RStudio IDE by selecing 'New File' > 'R Markdown' > 'From Template'.
