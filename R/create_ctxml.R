#' Creates xml document for upload to clinicaltrials.gov
#' 
#' This function will create an xml document conforming to clinicaltrials.gov requirements for 
#' automatic upload to the registry
#' 
#' @return A xml document
#' 
#' @example 
#' ctxml <- create_ctxml()

#' @export
#' @rdname create_ctxml

create_ctxml <- function(){
  
  xml2::xml_new_root( "study_collection",
                      "xmlns:prs" = "http://clinicaltrials.gov/prs") %>%
    xml2::xml_add_child("clinical_study") %>% 
    xml2::xml_add_child("id_info") %>% 
    xml2::xml_add_child("org_name", orgName) %>% 
    xml2::xml_add_sibling("org_study_id", orgStudyID) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("is_fda_regulated") %>% 
    xml2::xml_add_sibling("is_section_801") %>% 
    xml2::xml_add_sibling("delayed_posting") %>% 
    xml2::xml_add_sibling("is_ind_study") %>% 
    xml2::xml_add_sibling("brief_title", briefTitle) %>% 
    xml2::xml_add_sibling("acronym", studyAcronym) %>% 
    xml2::xml_add_sibling("official_title", officialTitle) %>% 
    xml2::xml_add_sibling("sponsors") %>% 
    xml2::xml_add_child("lead_sponsor") %>% 
    xml2::xml_add_child("agency", agency) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("resp_party") %>% 
    xml2::xml_add_child("resp_party_type", respPartyType) %>% 
    xml2::xml_add_sibling("investigator_username", investigator_username) %>%
    xml2::xml_add_sibling("investigator_title", investigator_title) %>% 
    xml2::xml_add_sibling("investigator_affiliation") %>% 
    xml2::xml_add_sibling("name_title") %>% 
    xml2::xml_add_sibling("organization") %>% 
    xml2::xml_add_sibling("phone") %>% 
    xml2::xml_add_sibling("phone_ext") %>% 
    xml2::xml_add_sibling("email") %>% 
    
    xml2::xml_find_first("..") %>%
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("oversight_info") %>% 
    xml2::xml_add_child("irb_info") %>% 
    xml2::xml_add_child("approval_status") %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("has_dmc") %>% 
    xml2::xml_add_sibling("fda_regulated_drug") %>% 
    xml2::xml_add_sibling("fda_regulated_device") %>% 
    xml2::xml_add_sibling("post_prior_to_approval") %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("brief_summary") %>% 
    xml2::xml_add_child("textblock", briefSummary) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("detailed_description") %>%
    xml2::xml_add_child("textblock") %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("overall_status", overallStatus) %>% 
    xml2::xml_add_sibling("why_stopped") %>% 
    xml2::xml_add_sibling("verification_date") %>% 
    xml2::xml_add_sibling("start_date", startDate) %>% 
    xml2::xml_add_sibling("start_date_type", "Anticipated") %>% 
    xml2::xml_add_sibling("end_date") %>% 
    xml2::xml_add_sibling("last_follow_up_date", studyCompletion) %>% 
    xml2::xml_add_sibling("last_follow_up_date_type", "Anticipated") %>%
    xml2::xml_add_sibling("prim_compl_date", primaryCompletion) %>% 
    xml2::xml_add_sibling("primary_compl_date_type", "Anticipated") %>% 
    xml2::xml_add_sibling("study_design") %>% 
    xml2::xml_add_child("study_type", "Interventional") %>% 
    xml2::xml_add_sibling("interventional_design") %>% 
    xml2::xml_add_child("interventional_subtype", interventionalSubtype) %>% 
    xml2::xml_add_sibling("phase", phase) %>% 
    xml2::xml_add_sibling("assignment", randomAssignment) %>% 
    xml2::xml_add_sibling("model_description") %>%
    xml2::xml_add_child("textblock") %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("allocation", randomAllocation) %>% 
    xml2::xml_add_sibling("masking") %>% 
    xml2::xml_add_sibling("no_masking", noMasking) %>% 
    xml2::xml_add_sibling("masked_subject", maskedSubject) %>% 
    xml2::xml_add_sibling("masked_caregiver", maskedCaregiver) %>% 
    xml2::xml_add_sibling("masked_investigator", maskedInvestigator) %>% 
    xml2::xml_add_sibling("masked_assesor", maskedAssesor) %>% 
    xml2::xml_add_sibling("masking_description") %>% 
    xml2::xml_add_child("textblock") %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("control") %>% 
    xml2::xml_add_sibling("number_of_arms", numberArms) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("primary_outcome") %>% 
    xml2::xml_add_child("outcome_measure", primaryOutcome1) %>% 
    xml2::xml_add_sibling("outcome_time_frame", primaryOutcomeTime1) %>% 
    xml2::xml_add_sibling("outcome_description") %>% 
    xml2::xml_add_child("textblock", primaryOutcomeDescription1) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("secondary_outcome") %>%
    xml2::xml_add_sibling("enrollment", sampleSize) %>% 
    xml2::xml_add_sibling("enrollment_type", "Anticipated") %>% 
    xml2::xml_add_sibling("arm_group") %>% 
    xml2::xml_add_child("arm_group_label", arm_label_1) %>% 
    xml2::xml_add_sibling("arm_type", arm_type_1) %>%
    xml2::xml_add_sibling("arm_group_description") %>% 
    xml2::xml_add_child("textblock", arm_desc_1) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("intervention") %>% 
    xml2::xml_add_child("intervention_type", int_type_1) %>% 
    xml2::xml_add_sibling("intervention_name", int_name_1) %>% 
    xml2::xml_add_sibling("intervention_description") %>% 
    xml2::xml_add_child("textblock", int_desc_1) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("arm_group_label", arm_label_1) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("eligibility") %>% 
    xml2::xml_add_child("study_population") %>% 
    xml2::xml_add_child("textblock") %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("sampling_method") %>% 
    xml2::xml_add_sibling("criteria") %>% 
    xml2::xml_add_child("textblock", criteria) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("healthy_volunteers", healthyVolunteers) %>% 
    xml2::xml_add_sibling("gender", gendersIncluded) %>% 
    xml2::xml_add_sibling("gender_based", genderBased) %>% 
    xml2::xml_add_sibling("gender_description") %>%
    xml2::xml_add_child("textblock") %>% 
    
    xml2::xml_find_first("..") %>%  
    xml2::xml_add_sibling("minimum_age", minAge) %>% 
    xml2::xml_add_sibling("maximum_age", maxAge) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("overall_official") %>% 
    xml2::xml_add_child("first_name", off_firstName) %>% 
    xml2::xml_add_sibling("middle_name") %>% 
    xml2::xml_add_sibling("last_name", off_lastName) %>% 
    xml2::xml_add_sibling("degrees", off_degrees) %>% 
    xml2::xml_add_sibling("role", off_role) %>% 
    xml2::xml_add_sibling("affiliation", off_affiliation) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("overall_contact") %>% 
    xml2::xml_add_child("first_name", firstName) %>% 
    xml2::xml_add_sibling("middle_name") %>% 
    xml2::xml_add_sibling("last_name", lastName) %>% 
    xml2::xml_add_sibling("degrees", degrees) %>% 
    xml2::xml_add_sibling("phone", phoneNo) %>% 
    xml2::xml_add_sibling("phone_ext") %>% 
    xml2::xml_add_sibling("email", email) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("overall_contact_backup") %>% 
    xml2::xml_add_child("first_name") %>% 
    xml2::xml_add_sibling("middle_name") %>% 
    xml2::xml_add_sibling("last_name") %>% 
    xml2::xml_add_sibling("degrees") %>% 
    xml2::xml_add_sibling("phone") %>% 
    xml2::xml_add_sibling("phone_ext") %>% 
    xml2::xml_add_sibling("email") %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("ipd_sharing_statement") %>% 
    xml2::xml_add_child("sharing_ipd", ipdsharing) %>% 
    xml2::xml_add_sibling("ipd_description") %>% 
    xml2::xml_add_child("textblock", ipddescription) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("ipd_info_type_protocol", ipdprotocol) %>% 
    xml2::xml_add_sibling("ipd_info_type_sap", ipdsap) %>% 
    xml2::xml_add_sibling("ipd_info_type_icf", ipdicf) %>% 
    xml2::xml_add_sibling("ipd_info_type_csr", ipdcsr) %>% 
    xml2::xml_add_sibling("ipd_info_type_analytic_code", ipdcode) %>% 
    xml2::xml_add_sibling("ipd_time_frame") %>% 
    xml2::xml_add_child("textblock", ipdtime) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("ipd_access_criteria") %>% 
    xml2::xml_add_child("textblock", ipdcriteria) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("ipd_url", ipdurl) %>% 
    xml2::xml_root()
  
  }
