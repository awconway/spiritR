#' Upload an xml object to the clinicaltrials.gov registry
#' 
#' 
#'This function will make a http POST request to upload a XML document to the
#'clinicaltrials.gov registry. 
#' 
#' @param xmlobject A xml document
#' @param orgName The organisation name associated with a clinicaltrials.gov 
#'   account
#' @param userName Username for a clinicaltrials.gov account
#' @param passWord Password for a clinicaltrials.gov account
#' @return A message from a http post request to show that the upload was 
#'   successful or unsuccesful 
#'
#' @example 
#' upload_ct(ct_xml, UHNToronto, aconway, password)
#' 
#' @export
#' @rdname upload_ct
upload_ct <- function(xmlobject, orgName, userName, passWord){
  body  <-  list(orgNAME = orgName, userName = userName, 
                 passWord = passWord,  uploadXML = create_ctxml, 
                 autoRelease = FALSE)
  httr::POST("https://register.clinicaltrials.gov/prs/app/action/ExternalUpload", 
             body = body, encode = 'form')
}