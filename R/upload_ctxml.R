#' Upload an xml object to the clinicaltrials.gov registry
#' 
#' 
#'This function will make a http POST request to upload a XML document to the
#'clinicaltrials.gov registry. 
#' 
#' @param ctxml A xml document created using  create_ctxml() and updated with 
#' any add_arms(), add_interventions(), add_pr_outcomes() and add_sec_outcomes()
#' that may be required.
#' @param orgName The organisation name associated with a clinicaltrials.gov 
#'   account
#' @param userName Username for a clinicaltrials.gov account
#' @param passWord Password for a clinicaltrials.gov account
#' @return A message from a http post request to show that the upload was 
#'   successful or unsuccesful 
#'
#' 
#' @export
#' @rdname upload_ctxml
upload_ctxml <- function(ctxml, org_name, user_name, password){
  body  <-  list(orgNAME = org_name, userName = user_name, 
                 passWord = password,  uploadXML = ctxml, 
                 autoRelease = FALSE)
  httr::POST("https://register.clinicaltrials.gov/prs/app/action/ExternalUpload", 
             body = body, encode = 'form')
}