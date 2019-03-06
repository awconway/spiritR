#' Add arms, interventions and outcomes to an xml document
#' 
#' These functions add arms, interventions, primary and secondary outcomes to 
#' the xml document created using the create_ctxml() function. Calls to these
#' functions should not be assigned to an object. 

#' @details 
#' 
#' * `add_arm()`: Adds an xml nodespace containing information about the arm
#' name, type and description.
#' * `add_intervention()`: Adds an xml nodespace containing information about 
#' the intervention name, type, description and arm it is associated with.
#' * `add_pr_outcome()`: Adds an xml nodespace containing information about the
#' outcome name, time frame for measurement and additional descriptive details.
#' * `add_sec_outcome()`: Adds an xml nodespace containing information about the
#' outcome name, time frame for measurement and additional descriptive details.
#' 
#' @return A xml nodespace

#' @examples
#' \dontrun{
#'  add_arm(ctxml = ctxml, 
#'          arm_label = "Standard", 
#'          arm_type =  "Active Comparator", 
#'          arm_desc = "Manual upload to registry")
#' }

#' \dontrun{
#' add_intervention(ctxml = ctxml, 
#'                  int_type =  "Device", 
#'                  int_name = "Registry entry",
#'                  int_desc = "The usual way to enter to the registry",
#'                  arm_label = "Standard")
#'}

#' \dontrun{
#' add_pr_outcome(ctxml = ctxml,
#'                name = "correct upload",
#'                time = "As measured",
#'                description = "Insert description about the measure.")
#' }

#' \dontrun{
#' add_sec_outcome(ctxml = test_ctxml,
#'                 name = "time to upload",
#'                 time = "As measured",
#'                 description = "Insert description about the measure.")
#' }
#' @name add_functions

#' @export
#' @rdname add_functions
add_arm <- function(ctxml, arm_label, arm_type, arm_desc){
    ctxml %>% 
    xml2::xml_find_first(".//arm_group") %>% 
    xml2::xml_add_sibling("arm_group") %>% 
    xml2::xml_add_child("arm_group_label", arm_label) %>% 
    xml2::xml_add_sibling("arm_type", arm_type) %>%
    xml2::xml_add_sibling("arm_group_description") %>% 
    xml2::xml_add_child("textblock", arm_desc) %>% 
    xml2::xml_root()
  }


#' @export
#' @rdname add_functions
add_intervention <- function(ctxml, int_type, int_name, int_desc, 
                             arm_label){
    ctxml %>% 
    xml2::xml_find_first(".//intervention") %>%
    xml2::xml_add_sibling("intervention") %>% 
    xml2::xml_add_child("intervention_type", int_type) %>% 
    xml2::xml_add_sibling("intervention_name", int_name) %>% 
    xml2::xml_add_sibling("intervention_description") %>% 
    xml2::xml_add_child("textblock", int_desc) %>% 
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("arm_group_label", arm_label) %>% 
    xml2::xml_root()
  }


#' @export
#' @rdname add_functions
add_pr_outcome <- function(ctxml, name, time, description){
  ctxml %>% 
    xml2::xml_find_first(".//primary_outcome") %>% 
    xml2::xml_add_sibling("primary_outcome") %>% 
    xml2::xml_add_child("outcome_measure", name) %>% 
    xml2::xml_add_sibling("outcome_time_frame", time) %>% 
    xml2::xml_add_sibling("outcome_description") %>% 
    xml2::xml_add_child("textblock", description) %>% 
    xml2::xml_root()
}


#' @export
#' @rdname add_functions
add_sec_outcome <- function(ctxml, name, time, description){
  ctxml %>% 
    xml2::xml_find_first(".//secondary_outcome") %>% 
    xml2::xml_add_sibling("secondary_outcome") %>% 
    xml2::xml_add_child("outcome_measure", name) %>% 
    xml2::xml_add_sibling("outcome_time_frame", time) %>% 
    xml2::xml_add_sibling("outcome_description") %>% 
    xml2::xml_add_child("textblock", description) %>% 
    xml2::xml_root()
}






