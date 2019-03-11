#' Creates xml document for upload to clinicaltrials.gov
#' 
#' This function will create an xml document conforming to clinicaltrials.gov 
#' requirements for automatic upload to the registry
#' 
#' @return A xml document
#' 
#' @param org_name The code for the organisation name associated with your PRS 
#' clinicaltrials.gov log-in details.
#' @param org_study_id Must be a unique study number from the organization. 
#' Sometimes it is the number associated with the funding received or submission 
#' for insstitutional approval.
#' @param brief_title Brief title for the study with a limit of 300 characters
#' @param study_acronym limit to 14 characters or enter n/a
#' @param official_title Study title limited to 600 characters
#' @param agency Name of the lead sponsor. This would be the name of the 
#' principal investigator if it is a Sponsor-Investigator trial.
#' @param resp_party_type Either: Sponsor; Principal Investigator (responsible 
#' party designated by sponsor) or Sponsor-Investigator (individual who 
#' initiates and conducts study).
#' @param investigator_username Format is First Name Last Name [[username]] 
#' eg. Aaron Conway [[aconway]]. This is associated with your prs log-in
#' @param investigator_title Offical title e.g. Assistant Professor
#' @param brief_summary A short description of the clinical study, including a 
#' brief statement of the clinical study's hypothesis, written in language 
#' intended for the lay public. Limit is 5000 characters.
#' @param start_date Anticipated start date written in yyyy-mm format
#' @param primary_compl Anticipated date written in yyyy-mm format. The date 
#' that the final participant was examined or received an intervention for the 
#' purposes of final collection of data for the primary outcome.
#' @param study_compl The anticipated date (written in yyyy-mm) that the final 
#' participant was examined or received an intervention for purposes of final 
#' collection of data
#' @param int_sybtype Either: Treatment; Prevention; Diagnostic; 
#' Supportive Care; Screening; Health Services Research; Basic Science; 
#' Device Feasibility; or Other.
#' @param phase Either: N/A (for trials that do not involve drug or biologic 
#' products); Early Phase 1; Phase1/Phase 2; Phase 2; Phase2/Phase 3; Phase 3; 
#' or Phase 4.
#' @param assignment Either: Single group; Parallel; Crossover; Factorial; or
#' Sequential.
#' @param allocation Either: Randomized; or Non-randomized.
#' @param no_masking True/False
#' @param masked_subject True/False
#' @param masked_caregiver True/False
#' @param masked_investigator True/False
#' @param masked_assesor True/False
#' @param sample_size Planned sample size
#' @param number_arms Number of arms. "Arm" means a pre-specified group or 
#' subgroup of participant(s) in a clinical trial assigned to receive specific 
#' intervention(s) (or no intervention) according to a protocol. 
#' @param eligibility_criteria Textbox contaiing both inclusion and exclusion 
#' criteria
#' @param healthy_volunteers Trial is recruiting healthy volunteers for 
#' participation. Answer is either: Yes; or No.
#' @param genders_included Either: Female; Male; or Both.
#' @param gender_based If applicable, indicate if eligibility is based on 
#' self-representation of gender identitiy. Answer is either: Yes; or No.
#' @param min_age Numeric with years - e.g. 16 years or 'N/A (No Limit)'
#' @param max_age Numeric with years - e.g. 80 years or 'N/A (No Limit)'
#' @param contact_first_name Central contact first name
#' @param contact_last_name Central contact last name
#' @param contact_degrees Central contact's degrees/qualifications
#' @param contact_phone Central contact phone number
#' @param contact_email Central contact email
#' @param official_first_name Overall official first name
#' @param official_last_name Overall official last name
#' @param official_degrees Overall official degrees/qualifications
#' @param official_affiliation Full name of the official's organization. If 
#' none, specify Unaffiliated.
#' @param official_role Either: Study Chair; Study Director or Study Principal 
#' Investigator.
#' @param ipd_sharing Indicate whether there is a plan to make individual 
#' participant data (IPD) collected in this study, including data dictionaries, 
#' available to other researchers (typically after the end of the study). 
#' Either: Yes; No; Undecided.
#' @param ipd_description If yes, describe the IPD sharing plan, including what 
#' IPD are to be shared with other researchers.
#' @param ipd_protocol Study protocol to be shared: True/False
#' @param ipd_sap Statistical analysis plan to be shared: True/False
#' @param ipd_icf Information consent form to be shared: True/False
#' @param ipd_csr Clinical study report to be shared: True/False
#' @param ipd_code Analytic code to be shared: True/False
#' @param ipd_time A description of when the IPD and any additional supporting 
#' information will become available and for how long, including the start and 
#' end dates or period of availability. Limit 1000 characters.
#' @param ipd_criteria Describe by what access criteria IPD and any additional 
#' supporting information will be shared, including with whom, for what types 
#' of analyses, and by what mechanism. Limit 1000 characters.
#' @param ipd_url The web address, if any, used to find additional information 
#' about the plan to share IPD.
#'  
#' 
#' 
#' @example 
#' ctxml <- create_ctxml(org_name,)

#' @export
#' @rdname create_ctxml

create_ctxml <- function(org_name, org_study_id, brief_title, official_title,
                         agency, resp_party_type, investigator_username,
                         investigator_title, brief_summary, overall_status,
                         start_date){
  
  xml2::xml_new_root( "study_collection",
                      "xmlns:prs" = "http://clinicaltrials.gov/prs") %>%
    xml2::xml_add_child("clinical_study") %>% 
    xml2::xml_add_child("id_info") %>% 
    xml2::xml_add_child("org_name", org_name) %>% 
    xml2::xml_add_sibling("org_study_id", org_study_id) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("is_fda_regulated") %>% 
    xml2::xml_add_sibling("is_section_801") %>% 
    xml2::xml_add_sibling("delayed_posting") %>% 
    xml2::xml_add_sibling("is_ind_study") %>% 
    xml2::xml_add_sibling("brief_title", brief_title) %>% 
    xml2::xml_add_sibling("acronym", study_acronym) %>% 
    xml2::xml_add_sibling("official_title", official_title) %>% 
    xml2::xml_add_sibling("sponsors") %>% 
    xml2::xml_add_child("lead_sponsor") %>% 
    xml2::xml_add_child("agency", agency) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("resp_party") %>% 
    xml2::xml_add_child("resp_party_type", resp_party_type) %>% 
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
    xml2::xml_add_child("textblock", brief_summary) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("detailed_description") %>%
    xml2::xml_add_child("textblock") %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("overall_status", "Not yet recruiting") %>% 
    xml2::xml_add_sibling("why_stopped") %>% 
    xml2::xml_add_sibling("verification_date") %>% 
    xml2::xml_add_sibling("start_date", start_date) %>% 
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
    xml2::xml_add_sibling("secondary_outcome") %>%
    xml2::xml_add_sibling("enrollment", sampleSize) %>% 
    xml2::xml_add_sibling("enrollment_type", "Anticipated") %>%
    xml2::xml_add_sibling("arm_group")
    xml2::xml_add_sibling("intervention") 
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
