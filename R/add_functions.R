#' Add arms, interventions and outcomes to an existing xml document for upload 
#' to clinicaltrials.gov
#' 
#' These functions add arms, interventions, primary and secondary outcomes as 
#' well as conditions and keywords to an xml document created using the 
#' create_ctxml() function. Calls to these functions should not be assigned to 
#' an object. 

#' @details 
#' 
#' * `add_arm()`: Adds an xml nodespace containing information about the arm
#' name, type and description to the xml document.
#' * `add_intervention()`: Adds an xml nodespace containing information about 
#' the intervention name, type, description and arm it is associated with to the 
#' xml document.
#' * `add_pr_outcome()`: Adds an xml nodespace containing information about the
#' outcome name, time frame for measurement and additional descriptive details 
#' to the xml document.
#' * `add_sec_outcome()`: Adds an xml nodespace containing information about the
#' outcome name, time frame for measurement and additional descriptive details 
#' to the xml document.
#' * `add_condition()`: Adds an xml nodespace containing a MeSH term for the 
#' condition being studied in the trial, or Focus of the Study to the xml 
#' document.
#' * `add_keyword()`: Adds an xml nodespace containing a Words or phrases that 
#' best describe the protocol. Keywords help users find studies in the database 
#' to the xml document.
#' 
#' 
#' @param ctxml A xml document generated from the create_ctxml() function
#' @param arm_label Label assigned to arm of clinical trial. Arm means a 
#' pre-specified group or subgroup of participant(s) in a clinical trial 
#' assigned to receive specific intervention(s) (or no intervention).
#' @param arm_type Either Experimental, Active comparator, Placebo Comparator, 
#' Sham Comparator, No Intervention, or Other.
#' @param arm_desc Description of the arm.
#' @param int_name Name of the intervention. For a drug, it is the generic name.
#' @param int_type Drug, Device, Biological/Vaccine, Procedure/Surgery, 
#' Radiation, Behavioural, Genetic, Dietary Supplement, Combination Product, 
#' Diagnostic Test, or Other.
#' @param int_desc  Other details about the intervention not included in name.
#' @param name Name of outome measure.
#' @param time Time point(s) at which the measurement is assessed.
#' @param description Other details about the outcome measure not included in 
#' the name
#' @param condition MeSH term for condition being studied in the trial, or 
#' Focus of the Study 
#' @param keyword Words or phrases that best describe the protocol. Keywords 
#' help users find studies in the database.
#'   
#' @return A xml document

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
#' add_sec_outcome(ctxml = ctxml,
#'                 name = "time to upload",
#'                 time = "As measured",
#'                 description = "Insert description about the measure.")
#' }
#' 
#' #' \dontrun{
#' add_condition(ctxml = ctxml,
#'               condition = "Cardiac")
#' }
#' 
#' #' \dontrun{
#' add_keyword(ctxml = ctxml,
#'             keyword = "sedation")
#' }
#' 
#' 
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


#' @export
#' @rdname add_functions
add_condition <- function(ctxml, condition){
  ctxml %>% 
    xml2::xml_find_first(".//condition") %>% 
    xml2::xml_add_sibling("condition", condition) %>%
    xml2::xml_root()
}


#' @export
#' @rdname add_functions
add_keyword <- function(ctxml, keyword){
  ctxml %>% 
    xml2::xml_find_first(".//keyword") %>% 
    xml2::xml_add_sibling("keyword", keyword) %>%
    xml2::xml_root()
}



