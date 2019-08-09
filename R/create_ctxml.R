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
#' for institutional approval.
#' @param brief_title Brief title for the study with a limit of 300 characters
#' @param study_acronym limit to 14 characters or enter n/a
#' @param official_title Study title limited to 600 characters
#' @param agency Name of the lead sponsor. This would be the name of the 
#' principal investigator if it is a Sponsor-Investigator trial.
#' @param resp_party_type Either: Sponsor; Principal Investigator (responsible 
#' party designated by sponsor) or Sponsor-Investigator (individual who 
#' initiates and conducts study).
#' @param investigator_username The username associated with your 
#' clinicaltrials.gov log-in
#' @param investigator_title Offical title e.g. Assistant Professor
#' @param brief_summary A short description of the clinical study, including a 
#' brief statement of the clinical study's hypothesis, written in language 
#' intended for the lay public. Limit is 5000 characters.
#' @param start_date Anticipated start date written in yyyy-mm format
#' @param primary_compl Anticipated date written in yyyy-mm-dd format. The date 
#' that the final participant was examined or received an intervention for the 
#' purposes of final collection of data for the primary outcome.
#' @param study_compl The anticipated date (written in yyyy-mm) that the final 
#' participant was examined or received an intervention for purposes of final 
#' collection of data
#' @param int_subtype Either: Treatment; Prevention; Diagnostic; 
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
#' @param masked_assessor True/False
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
#' @examples
#' args_ctxml <- list(
#' org_name = "UHNToronto",
#' org_study_id = "Foo trial 20190806",
#' brief_title = "Foo trial to test auto upload 20190806",
#' study_acronym = "N/A",
#' official_title = "Foo trial to test auto upload: A randomized trial new 20190806",
#' agency  = "Aaron Conway",
#' resp_party_type = "Sponsor-Investigator",
#' investigator_username = "aconway",
#' investigator_title ="Assistant Professor",
#' brief_summary = "Lay summary here",
#' start_date = "2019-10",
#' primary_compl =  "2020-12",
#' study_compl = "2020-12",
#' int_subtype = "Health Services Research",
#' phase = "N/A",
#' assignment = "Parallel",
#' allocation = "Randomized",
#' no_masking =  "False",
#' masked_subject = "True",
#' masked_caregiver = "True",
#' masked_investigator = "True",
#' masked_assessor = "True",
#' number_arms = 2,
#' sample_size = "40",
#' eligibility_criteria = "Inclusion Criteria
#' - Adults

#' Exclusion Criteria

#' - Children",
#' healthy_volunteers = "No",
#' genders_included = "Both",
#' gender_based = "No",
#' min_age = "1 years",
#' max_age = "N/A",

#' #Central contact
#' contact_first_name = "Aaron",
#' contact_last_name = "Conway",
#' contact_degrees = "PhD",
#' contact_phone = "649-728-8499",
#' contact_email = "aaron.conway@utoronto.ca",

#' #Overall official
#' official_first_name = "Aaron",
#' official_last_name ="Conway",
#' official_degrees = "PhD",
#' official_affiliation = "UHN",
#' official_role = "Study Principal Investigator",

#' #Sharing statements
#' ipd_sharing = "Yes",
#' ipd_description = "details",
#' ipd_protocol =  "True",
#' ipd_sap = "True",
#' ipd_icf = "True",
#' ipd_csr = "True",
#' ipd_code = "True",
#' ipd_time = "details",
#' ipd_criteria = "details",
#' ipd_url = "http://www.aaronconway.info"
#' )
#' 
#' ctxml <- do.call(create_ctxml, args_ctxml)
#'        
#' @export
#' @rdname create_ctxml

create_ctxml <- function(org_name, org_study_id, brief_title, study_acronym,
                         official_title, agency, resp_party_type, 
                         investigator_username, investigator_title, 
                         brief_summary, start_date, 
                         study_compl, primary_compl, int_subtype,
                         phase, assignment, allocation, no_masking, 
                         masked_subject, masked_caregiver, masked_investigator,
                         masked_assessor, number_arms, sample_size, 
                         eligibility_criteria, healthy_volunteers, 
                         genders_included, gender_based, min_age, max_age,
                         official_first_name, official_last_name,
                         official_degrees, official_role, official_affiliation,
                         contact_first_name, contact_last_name, 
                         contact_degrees, contact_phone, contact_email, 
                         ipd_sharing, ipd_description, 
                         ipd_protocol, ipd_sap, ipd_icf, ipd_csr, ipd_code,
                         ipd_time, ipd_criteria, ipd_url){
  
  if (nchar(brief_title)>=300){
    stop("brief_title must be less than 300 characters")
  }
  
  if (nchar(study_acronym)>=14){
    stop("study_acronym is limited to 14 characters")
  }
  
  if (nchar(official_title)>=600){
    stop("official_title is limited to 600 characters")
  }
  
  if (!grepl("Sponsor|Principal Investigator| Sponsor-Investigator", resp_party_type)){
    stop("resp_party_type must be either Sponsor, Principal Investigator or Sponsor-Investigator")
  }
  
  if (nchar(brief_summary)>=5000){
    stop("brief_summary is limited to 5000 characters")
  }
  
  if (!grepl("[0-9]{4}-[0-9]{2}", start_date)){
    stop("start_date must be in yyyy-mm format")
  }
  
  if (!grepl("[0-9]{4}-[0-9]{2}", study_compl)){
    stop("study_compl must be in yyyy-mm format")
  }
  
  if (!grepl("[0-9]{4}-[0-9]{2}", primary_compl)){
    stop("primary_compl must be in yyyy-mm format")
  }
  
  if (!grepl("Treatment|Prevention|Diagnostic|Supportive Care|Screening|Health Services Research|Basic Science|Device Feasibility|Other", 
             int_subtype)){
    stop("int_subtype must be either Treatment; Prevention; Diagnostic; 
         Supportive Care; Screening; Health Services Research; Basic Science; 
         Device Feasibility; or Other")
  }
  
  if (!grepl("N/A|Early Phase 1|Phase1/Phase 2|Phase 2|Phase2/Phase 3|Phase 3|Phase 4", 
             phase)){
    stop("phase must be either N/A; Early Phase 1; Phase1/Phase 2; Phase 2; Phase2/Phase 3; Phase 3; or Phase 4")
  }
  
  if (!grepl("Single group|Parallel|Crossover|Factorial|Sequential", 
             assignment)){
    stop("assignment must be either Single group; Parallel; Crossover; Factorial; or Sequential")
  }
  
  if (!grepl("Randomized|Non-randomized", 
             allocation)){
    stop("allocation must be either Randomized; or Non-randomized")
  }
  
  if (!grepl("True|False", 
             no_masking)){
    stop("no_masking must be either True or False")
  }
  
  if (!grepl("True|False", 
             masked_subject)){
    stop("masked_subject must be either True or False")
  }
  
  if (!grepl("True|False", 
             masked_caregiver)){
    stop("masked_caregiver must be either True or False")
  }
  
  if (!grepl("True|False", 
             masked_investigator)){
    stop("masked_investigator must be either True or False")
  }
  
  if (!grepl("True|False", 
             masked_assessor)){
    stop("masked_assessor must be either True or False")
  }
  
  if (nchar(eligibility_criteria)>=15000){
    stop("eligibility criteria is limited to 15000 characters")
  }
  
  if (!grepl("Yes|No", 
             healthy_volunteers)){
    stop("healthy_volunteers must be either Yes or No")
  }
  
  if (!grepl("Female|Male|Both", 
             genders_included)){
    stop("genders_included must be either Female, Male or Both")
  }
  
  if (!grepl("Yes|No", 
             gender_based)){
    stop("gender_based must be either Yes or No")
  }
  
  if (!grepl("[0-9]{1} years|[0-9]{2} years|N/A", 
             min_age)){
    stop("min_age must be either a number with year (e.g. 16 years) or N/A if
         there is no limit")
  }
  
  if (!grepl("[0-9]{1} years|[0-9]{2} years|N/A", 
             max_age)){
    stop("max_age must be either a number with year (e.g. 16 years) or N/A if
         there is no limit")
  }
  
  if (!grepl("Study Chair|Study Director|Study Principal Investigator", 
             official_role)){
    stop("official_role must be either Study Chair; Study Director or Study Principal Investigator.")
  }
  
  if (!grepl("Yes|No|Undecided", 
             ipd_sharing)){
    stop("ipd_sharing must be either Yes, No or Undecided")
  }
  
  if (!grepl("Yes|No|Undecided", 
             ipd_sharing)){
    stop("ipd_sharing must be either Yes, No or Undecided")
  }
  
  if (nchar(ipd_description)>=1000){
    stop("ipd_description is limited to 1000 characters")
  }
  
  if (nchar(ipd_time)>=1000){
    stop("ipd_time is limited to 1000 characters")
  }
  
  if (!grepl("True|False", ipd_protocol)){
    stop("ipd_protocol must be either True or False")
  }
  
  if (!grepl("True|False", ipd_sap)){
    stop("ipd_sap must be either True or False")
  }
  
  if (!grepl("True|False", ipd_icf)){
    stop("ipd_icf must be either True or False")
  }
  
  if (!grepl("True|False", ipd_csr)){
    stop("ipd_csr must be either True or False")
  }
  
  if (!grepl("True|False", ipd_code)){
    stop("ipd_code must be either True or False")
  }
  
  if (nchar(ipd_criteria)>=1000){
    stop("ipd_criteria is limited to 1000 characters")
  }
  
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
    xml2::xml_add_sibling("last_follow_up_date", study_compl) %>% 
    xml2::xml_add_sibling("last_follow_up_date_type", "Anticipated") %>%
    xml2::xml_add_sibling("prim_compl_date", primary_compl) %>% 
    xml2::xml_add_sibling("primary_compl_date_type", "Anticipated") %>% 
    xml2::xml_add_sibling("study_design") %>% 
    xml2::xml_add_child("study_type", "Interventional") %>% 
    xml2::xml_add_sibling("interventional_design") %>% 
    xml2::xml_add_child("interventional_subtype", int_subtype) %>% 
    xml2::xml_add_sibling("phase", phase) %>% 
    xml2::xml_add_sibling("assignment", assignment) %>% 
    xml2::xml_add_sibling("model_description") %>%
    xml2::xml_add_child("textblock") %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("allocation", allocation) %>% 
    xml2::xml_add_sibling("masking") %>% 
    xml2::xml_add_sibling("no_masking", no_masking) %>% 
    xml2::xml_add_sibling("masked_subject", masked_subject) %>% 
    xml2::xml_add_sibling("masked_caregiver", masked_caregiver) %>% 
    xml2::xml_add_sibling("masked_investigator", masked_investigator) %>% 
    xml2::xml_add_sibling("masked_assesor", masked_assessor) %>% 
    xml2::xml_add_sibling("masking_description") %>% 
    xml2::xml_add_child("textblock") %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("control") %>% 
    xml2::xml_add_sibling("number_of_arms", number_arms) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("primary_outcome") %>% 
    xml2::xml_add_sibling("secondary_outcome") %>%
    xml2::xml_add_sibling("enrollment", sample_size) %>% 
    xml2::xml_add_sibling("enrollment_type", "Anticipated") %>%
    xml2::xml_add_sibling("condition") %>%
    xml2::xml_add_sibling("keyword") %>%
    xml2::xml_add_sibling("arm_group") %>% 
    xml2::xml_add_sibling("intervention")  %>% 
    xml2::xml_add_sibling("eligibility") %>% 
    xml2::xml_add_child("study_population") %>% 
    xml2::xml_add_child("textblock") %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("sampling_method") %>% 
    xml2::xml_add_sibling("criteria") %>% 
    xml2::xml_add_child("textblock", eligibility_criteria) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("healthy_volunteers", healthy_volunteers) %>% 
    xml2::xml_add_sibling("gender", genders_included) %>% 
    xml2::xml_add_sibling("gender_based", gender_based) %>% 
    xml2::xml_add_sibling("gender_description") %>%
    xml2::xml_add_child("textblock") %>% 
    
    xml2::xml_find_first("..") %>%  
    xml2::xml_add_sibling("minimum_age", min_age) %>% 
    xml2::xml_add_sibling("maximum_age", max_age) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("overall_official") %>% 
    xml2::xml_add_child("first_name", official_first_name) %>% 
    xml2::xml_add_sibling("middle_name") %>% 
    xml2::xml_add_sibling("last_name", official_last_name) %>% 
    xml2::xml_add_sibling("degrees", official_degrees) %>% 
    xml2::xml_add_sibling("role", official_role) %>% 
    xml2::xml_add_sibling("affiliation", official_affiliation) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("overall_contact") %>% 
    xml2::xml_add_child("first_name", contact_first_name) %>% 
    xml2::xml_add_sibling("middle_name") %>% 
    xml2::xml_add_sibling("last_name", contact_last_name) %>% 
    xml2::xml_add_sibling("degrees", contact_degrees) %>% 
    xml2::xml_add_sibling("phone", contact_phone) %>% 
    xml2::xml_add_sibling("phone_ext") %>% 
    xml2::xml_add_sibling("email", contact_email) %>% 
    
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
    xml2::xml_add_child("sharing_ipd", ipd_sharing) %>% 
    xml2::xml_add_sibling("ipd_description") %>% 
    xml2::xml_add_child("textblock", ipd_description) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("ipd_info_type_protocol", ipd_protocol) %>% 
    xml2::xml_add_sibling("ipd_info_type_sap", ipd_sap) %>% 
    xml2::xml_add_sibling("ipd_info_type_icf", ipd_icf) %>% 
    xml2::xml_add_sibling("ipd_info_type_csr", ipd_csr) %>% 
    xml2::xml_add_sibling("ipd_info_type_analytic_code", ipd_code) %>% 
    xml2::xml_add_sibling("ipd_time_frame") %>% 
    xml2::xml_add_child("textblock", ipd_time) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("ipd_access_criteria") %>% 
    xml2::xml_add_child("textblock", ipd_criteria) %>% 
    
    xml2::xml_find_first("..") %>% 
    xml2::xml_add_sibling("ipd_url", ipd_url) %>% 
    xml2::xml_root()
  
  }
