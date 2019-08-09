## Test environments
* local OS X install, R 3.6.1
* ubuntu 14.04 (on travis-ci), R 3.6.1
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.

## Responses to CRAN submission 2019.08.09

Thank you for reviewing the submission. 

- I have changed the title to TitleCase.
- I have inserted the link to clinicaltrials.gov using <> in teh Description 
field.
- I have inserted more information to describe key terms (SPIRIT) in the 
Description field.
- The example included in the `upload_ctxml` function is still wrapped in 
\dontrun because it requires a username and password for an API upload.
- The \dontrun wrappers have been removed from the other examples with further 
code added so that they can be run to produce the xml elements as per the 
intended use of the functions.

