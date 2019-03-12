  [![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
  
# spiritR

This repository contains an Rmarkdown template for a clinical trial protocol adhering to the [SPIRIT](http://www.spirit-statement.org/) checklist.

Contained within the template is a section for each of the elements that should be adressed in a clinical trial protocol. Links to the SPIRIT statement guidance about what should be addressed in each element are provided.

Using this Rmarkdown template for clinical trial protocol will also allow you to use of the clinicaltrials.gov API to  uploading information from your protocol developed in your Rmardown file to a new record in the registry. 


# Installing the package

Enter the following in your console for installation (uncomment the first line if devtools is not already installed):

    # install.packages("devtools")
    devtools::install_github("awconway/spiritR")

  
Once installed, the template will be available within the RStudio IDE by selecing 'New File' > 'R Markdown' > "From Template" as shown below:
  
  
  ![](Screen-Recording.gif)
  
  
Instructions for how to upload the protocol elements to clinicaltrials.gov are incuded in this vignette.
  