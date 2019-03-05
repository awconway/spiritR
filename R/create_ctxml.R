#' Creates xml document for upload to clinicaltrials.gov
#' 
#' This function will create an xml document conforming to clinicaltrials.gov requirements for 
#' automatic upload to the registry
#' 
#' @return A xml document
#' 
#' @example 
#' create_ctxml()

#' @export
#' @rdname create_ctxml

create_ctxml <- function(){
  
  create_ctxml <- xml2::xml_new_root( "study_collection",
                                   "xmlns:prs" = "http://clinicaltrials.gov/prs") %>%
  xml_root()

create_ctxml %>% 
  xml_add_child("clinical_study") %>% 
    xml_add_child("id_info") %>% 
      xml_add_child("org_name", orgName) %>% 
      xml_add_sibling("org_study_id", orgStudyID) %>% 
xml_root()

create_ctxml %>% 
  xml_find_first(".//id_info") %>% 
  xml_add_sibling("is_fda_regulated") %>% 
  xml_add_sibling("is_section_801") %>% 
  xml_add_sibling("delayed_posting") %>% 
  xml_add_sibling("is_ind_study") %>% 
  xml_add_sibling("brief_title", briefTitle) %>% 
  xml_add_sibling("acronym", studyAcronym) %>% 
  xml_add_sibling("official_title", officialTitle) %>% 
  xml_add_sibling("sponsors") %>% 
  xml_add_child("lead_sponsor") %>% 
  xml_add_child("agency", agency) %>% 
  xml_root()

create_ctxml %>% 
  xml_find_first(".//lead_sponsor") %>%
  xml_add_sibling("resp_party") %>% 
  xml_add_child("resp_party_type", respPartyType) %>% 
  xml_add_sibling("investigator_username", "None") %>%
  xml_add_sibling("investigator_title") %>% 
  xml_add_sibling("investigator_affiliation") %>% 
  xml_add_sibling("name_titlke") %>% 
  xml_add_sibling("organization") %>% 
  xml_add_sibling("phone") %>% 
  xml_add_sibling("phone_ext") %>% 
  xml_add_sibling("email") %>% 
  xml_root()

create_ctxml %>% 
  xml_find_first(".//sponsors") %>%
  xml_add_sibling("oversight_info") %>% 
  xml_add_child("irb_info") %>% 
  xml_add_child("approval_status") %>% 
  xml_root()

create_ctxml %>% 
  xml_find_first(".//irb_info") %>%
  xml_add_sibling("has_dmc") %>% 
  xml_add_sibling("fda_regulated_drug") %>% 
  xml_add_sibling("fda_regulated_device") %>% 
  xml_add_sibling("post_prior_to_approval") %>% 
  xml_root()

create_ctxml %>% 
  xml_find_first(".//oversight_info") %>%
  xml_add_sibling("brief_summary") %>% 
  xml_add_child("textblock") %>% 
  xml_root()

create_ctxml %>% 
  xml_find_first(".//brief_summary") %>%
  xml_add_sibling("detailed_description") %>%
  xml_add_child("textblock") %>% 
  xml_root()
  

create_ctxml %>% 
  xml_find_first(".//detailed_description") %>%
  xml_add_sibling("overall_status", overallStatus) %>% 
  xml_add_sibling("why_stopped") %>% 
  xml_add_sibling("verification_date") %>% 
  xml_add_sibling("start_date", startDate) %>% 
  xml_add_sibling("start_date_type", "Anticipated") %>% 
  xml_add_sibling("end_date") %>% 
  xml_add_sibling("last_follow_up_date") %>% 
  xml_add_sibling("last_follow_up_date_type") %>%
  xml_add_sibling("prim_compl_date") %>% 
  xml_add_sibling("primary_compl_date_type") %>% 
  xml_add_sibling("study_design") %>% 
  xml_add_child("study_type", "Interventional") %>% 
  xml_add_sibling("interventional_design") %>% 
  xml_add_child("interventional_subtype", interventionalSubtype) %>% 
  xml_add_sibling("phase", phase) %>% 
  xml_add_sibling("assignment", randomAssignment) %>% 
  xml_add_sibling("model_description") %>%
  xml_add_child("textblock") %>% 
  xml_root()
  
create_ctxml %>% 
  xml_find_first(".//model_description") %>%  
  xml_add_sibling("allocation", randomAllocation) %>% 
  xml_add_sibling("masking") %>% 
  xml_add_sibling("no_masking", noMasking) %>% 
  xml_add_sibling("masked_subject", maskedSubject) %>% 
  xml_add_sibling("masked_caregiver", maskedCaregiver) %>% 
  xml_add_sibling("masked_investigator", maskedInvestigator) %>% 
  xml_add_sibling("masked_assesor", maskedAssesor) %>% 
  xml_add_sibling("masking_description") %>% 
  xml_add_child("textblock") %>% 
  xml_root()
  
create_ctxml %>% 
  xml_find_first(".//masking_description") %>%  
  xml_add_sibling("control") %>% 
  xml_add_sibling("number_of_arms", numberArms) %>% 
  xml_root()


create_ctxml %>% 
  xml_find_first(".//study_design") %>%
  xml_add_sibling("primary_outcome") %>% 
  xml_add_child("outcome_measure", primaryOutcome1) %>% 
  xml_add_sibling("outcome_time_frame", primaryOutcomeTime1) %>% 
  xml_add_sibling("outcome_description") %>% 
  xml_add_child("textblock", primaryOutcomeDescription1) %>% 
  xml_root()

create_ctxml %>% 
  xml_find_first(".//primary_outcome") %>%
  xml_add_sibling("secondary_outcome") %>%
  xml_add_sibling("enrollment", sampleSize) %>% 
  xml_add_sibling("enrollment_type", "Anticipated") %>% 
  xml_add_sibling("arm_group") %>% 
  xml_add_child("arm_group_label", arm1) %>% 
  xml_add_sibling("arm_type", armType1) %>%
  xml_add_sibling("arm_group_description") %>% 
  xml_add_child("textblock", armDescription1) %>% 
  xml_root()


###only include one outcome, arm and intervention for the template then add extras with the function
create_ctxml %>% 
  xml_find_first(".//arm_group") %>%
  xml_add_sibling("intervention") %>% 
  xml_add_child("intervention_type", interventionType1) %>% 
  xml_add_sibling("intervention_name", interventionName1) %>% 
  xml_add_sibling("intervention_description") %>% 
  xml_add_child("textblock", interventionDescription1) %>% 
  xml_root()

create_ctxml %>% 
  xml_find_first(".//intervention_description") %>% 
  xml_add_sibling("arm_group_label", arm1) %>% 
  xml_root()

create_ctxml %>% 
  xml_find_first(".//intervention") %>%
  xml_add_sibling("eligibility") %>% 
  xml_add_child("study_population") %>% 
  xml_add_child("textblock") %>% 
  xml_root()
  
create_ctxml %>% 
  xml_find_first(".//study_population") %>% 
  xml_add_sibling("sampling_method") %>% 
  xml_add_sibling("criteria") %>% 
  xml_add_child("textblock", criteria) %>% 
  xml_root()

create_ctxml %>% 
  xml_find_first(".//criteria") %>%
  xml_add_sibling("healthy_volunteers", healthyVolunteers) %>% 
  xml_add_sibling("gender", gendersIncluded) %>% 
  xml_add_sibling("gender_based", genderBased) %>% 
  xml_add_sibling("gender_description") %>%
  xml_add_child("textblock") %>% 
  xml_root

create_ctxml %>% 
  xml_find_first(".//gender_description") %>%  
  xml_add_sibling("minimum_age", minAge) %>% 
  xml_add_sibling("maximum_age", maxAge) %>% 
  xml_root()

create_ctxml %>% 
  xml_find_first(".//eligibility") %>%
  xml_add_sibling("overall_official") %>% 
  xml_add_child("first_name", firstName) %>% 
  xml_add_sibling("middle_name") %>% 
  xml_add_sibling("last_name", lastName) %>% 
  xml_add_sibling("degrees", degrees) %>% 
  xml_add_sibling("role") %>% 
  xml_add_sibling("affiliation") %>% 
  xml_root()
  
create_ctxml %>% 
  xml_find_first(".//overall_official") %>% 
  xml_add_sibling("overall_contact") %>% 
  xml_add_child("first_name", firstName) %>% 
  xml_add_sibling("middle_name") %>% 
  xml_add_sibling("last_name", lastName) %>% 
  xml_add_sibling("degrees", degrees) %>% 
  xml_add_sibling("phone", phoneNo) %>% 
  xml_add_sibling("phone_ext") %>% 
  xml_add_sibling("email", email) %>% 
  xml_root()

create_ctxml %>% 
  xml_find_first(".//overall_contact") %>% 
  xml_add_sibling("overall_contact_backup") %>% 
  xml_add_child("first_name") %>% 
  xml_add_sibling("middle_name") %>% 
  xml_add_sibling("last_name") %>% 
  xml_add_sibling("degrees") %>% 
  xml_add_sibling("phone") %>% 
  xml_add_sibling("phone_ext") %>% 
  xml_add_sibling("email") %>% 
  xml_root()

create_ctxml %>% 
  xml_find_first(".//overall_contact_backup") %>%
  xml_add_sibling("ipd_sharing_statement") %>% 
  xml_add_child("sharing_ipd", ipdsharing) %>% 
  xml_add_sibling("ipd_description") %>% 
  xml_add_child("textblock", ipddescription) %>% 
  xml_root()

create_ctxml %>% 
  xml_find_first(".//ipd_description") %>%
  xml_add_sibling("ipd_info_type_protocol", ipdprotocol) %>% 
  xml_add_sibling("ipd_info_type_sap", ipdsap) %>% 
  xml_add_sibling("ipd_info_type_icf", ipdicf) %>% 
  xml_add_sibling("ipd_info_type_csr", ipdcsr) %>% 
  xml_add_sibling("ipd_info_type_analytic_code", ipdcode) %>% 
  xml_add_sibling("ipd_time_frame") %>% 
  xml_add_child("textblock", ipdtime) %>% 
  xml_root()

create_ctxml %>% 
  xml_find_first(".//ipd_time_frame") %>%
  xml_add_sibling("ipd_access_criteria") %>% 
  xml_add_child("textblock", ipdcriteria) %>% 
  xml_root()

create_ctxml %>% 
  xml_find_first(".//ipd_access_criteria") %>%
  xml_add_sibling("ipd_url", ipdurl) %>% 
  xml_root()
  }
