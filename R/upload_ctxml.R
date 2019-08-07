#' Upload an xml object to the clinicaltrials.gov registry
#' 
#' 
#'This function will make a http POST request to upload a XML document to the
#'clinicaltrials.gov registry. 
#' 
#' @param ctxml A xml document created using  create_ctxml() and updated with 
#' any add_arms(), add_interventions(), add_pr_outcomes() and add_sec_outcomes()
#' that may be required.
#' @param org_name The organisation name associated with a clinicaltrials.gov 
#'   account
#' @param user_name Username for a clinicaltrials.gov account
#' @param password Password for a clinicaltrials.gov account
#' 
#' @return A message from a http post request to show that the upload was 
#'   successful or unsuccesful 
#'   
#' @examples
#' \dontrun{
#' upload_ctxml(ctxml = ctxml, org_name ="UHNToronto", user_name = "aconway",
#'  password = "password")
#' }
#' 
#' @export
#' @rdname upload_ctxml
upload_ctxml <- function(ctxml, org_name, user_name, password){
  body  <-  list(orgNAME = org_name, userName = user_name, 
                 passWord = password,  uploadXML = ctxml, 
                 autoRelease = FALSE)
  resp <- httr::POST("https://register.clinicaltrials.gov/prs/app/action/ExternalUpload", 
             body = body, encode = 'form')

  parsed <- xml2::read_xml(resp)
  if (httr::http_error(resp)) {
    stop(
      sprintf(
        "Upload API request failed [%s]\n%s",
        httr::status_code(resp),
        xml2::xml_text(parsed)
      ),
      call. = FALSE
    )
  }
  
  if (xml2::xml_text(xml2::xml_find_first(parsed, "uploadStatus"))=="ERROR") {
    stop(
      sprintf(
        "Upload API request failed [%s]",
        xml2::xml_text(xml2::xml_find_first(parsed, "failureMessage"))
      ),
      call. = FALSE
    )
  }
  
  structure(
    list(
      content = xml2::as_list(parsed),
      response = resp
    ),
    class = "prs_clinicaltrials_api"
  )
}
