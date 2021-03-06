% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_ctxml.R
\name{create_ctxml}
\alias{create_ctxml}
\title{Creates xml document for upload to clinicaltrials.gov}
\usage{
create_ctxml(org_name, org_study_id, brief_title, study_acronym,
  official_title, agency, resp_party_type, investigator_username,
  investigator_title, brief_summary, start_date, study_compl,
  primary_compl, int_subtype, phase, assignment, allocation, no_masking,
  masked_subject, masked_caregiver, masked_investigator, masked_assessor,
  number_arms, sample_size, eligibility_criteria, healthy_volunteers,
  genders_included, gender_based, min_age, max_age, official_first_name,
  official_last_name, official_degrees, official_role,
  official_affiliation, contact_first_name, contact_last_name,
  contact_degrees, contact_phone, contact_email, ipd_sharing,
  ipd_description, ipd_protocol, ipd_sap, ipd_icf, ipd_csr, ipd_code,
  ipd_time, ipd_criteria, ipd_url)
}
\arguments{
\item{org_name}{The code for the organisation name associated with your PRS
clinicaltrials.gov log-in details.}

\item{org_study_id}{Must be a unique study number from the organization.
Sometimes it is the number associated with the funding received or submission
for institutional approval.}

\item{brief_title}{Brief title for the study with a limit of 300 characters}

\item{study_acronym}{limit to 14 characters or enter n/a}

\item{official_title}{Study title limited to 600 characters}

\item{agency}{Name of the lead sponsor. This would be the name of the
principal investigator if it is a Sponsor-Investigator trial.}

\item{resp_party_type}{Either: Sponsor; Principal Investigator (responsible
party designated by sponsor) or Sponsor-Investigator (individual who
initiates and conducts study).}

\item{investigator_username}{The username associated with your
clinicaltrials.gov log-in}

\item{investigator_title}{Offical title e.g. Assistant Professor}

\item{brief_summary}{A short description of the clinical study, including a
brief statement of the clinical study's hypothesis, written in language
intended for the lay public. Limit is 5000 characters.}

\item{start_date}{Anticipated start date written in yyyy-mm format}

\item{study_compl}{The anticipated date (written in yyyy-mm) that the final
participant was examined or received an intervention for purposes of final
collection of data}

\item{primary_compl}{Anticipated date written in yyyy-mm-dd format. The date
that the final participant was examined or received an intervention for the
purposes of final collection of data for the primary outcome.}

\item{int_subtype}{Either: Treatment; Prevention; Diagnostic;
Supportive Care; Screening; Health Services Research; Basic Science;
Device Feasibility; or Other.}

\item{phase}{Either: N/A (for trials that do not involve drug or biologic
products); Early Phase 1; Phase1/Phase 2; Phase 2; Phase2/Phase 3; Phase 3;
or Phase 4.}

\item{assignment}{Either: Single group; Parallel; Crossover; Factorial; or
Sequential.}

\item{allocation}{Either: Randomized; or Non-randomized.}

\item{no_masking}{True/False}

\item{masked_subject}{True/False}

\item{masked_caregiver}{True/False}

\item{masked_investigator}{True/False}

\item{masked_assessor}{True/False}

\item{number_arms}{Number of arms. "Arm" means a pre-specified group or
subgroup of participant(s) in a clinical trial assigned to receive specific
intervention(s) (or no intervention) according to a protocol.}

\item{sample_size}{Planned sample size}

\item{eligibility_criteria}{Textbox contaiing both inclusion and exclusion
criteria}

\item{healthy_volunteers}{Trial is recruiting healthy volunteers for
participation. Answer is either: Yes; or No.}

\item{genders_included}{Either: Female; Male; or Both.}

\item{gender_based}{If applicable, indicate if eligibility is based on
self-representation of gender identitiy. Answer is either: Yes; or No.}

\item{min_age}{Numeric with years - e.g. 16 years or 'N/A (No Limit)'}

\item{max_age}{Numeric with years - e.g. 80 years or 'N/A (No Limit)'}

\item{official_first_name}{Overall official first name}

\item{official_last_name}{Overall official last name}

\item{official_degrees}{Overall official degrees/qualifications}

\item{official_role}{Either: Study Chair; Study Director or Study Principal
Investigator.}

\item{official_affiliation}{Full name of the official's organization. If
none, specify Unaffiliated.}

\item{contact_first_name}{Central contact first name}

\item{contact_last_name}{Central contact last name}

\item{contact_degrees}{Central contact's degrees/qualifications}

\item{contact_phone}{Central contact phone number}

\item{contact_email}{Central contact email}

\item{ipd_sharing}{Indicate whether there is a plan to make individual
participant data (IPD) collected in this study, including data dictionaries,
available to other researchers (typically after the end of the study).
Either: Yes; No; Undecided.}

\item{ipd_description}{If yes, describe the IPD sharing plan, including what
IPD are to be shared with other researchers.}

\item{ipd_protocol}{Study protocol to be shared: True/False}

\item{ipd_sap}{Statistical analysis plan to be shared: True/False}

\item{ipd_icf}{Information consent form to be shared: True/False}

\item{ipd_csr}{Clinical study report to be shared: True/False}

\item{ipd_code}{Analytic code to be shared: True/False}

\item{ipd_time}{A description of when the IPD and any additional supporting
information will become available and for how long, including the start and
end dates or period of availability. Limit 1000 characters.}

\item{ipd_criteria}{Describe by what access criteria IPD and any additional
supporting information will be shared, including with whom, for what types
of analyses, and by what mechanism. Limit 1000 characters.}

\item{ipd_url}{The web address, if any, used to find additional information
about the plan to share IPD.}
}
\value{
A xml document
}
\description{
This function will create an xml document conforming to clinicaltrials.gov
requirements for automatic upload to the registry
}
\examples{
args_ctxml <- list(
org_name = "UHNToronto",
org_study_id = "Foo trial 20190806",
brief_title = "Foo trial to test auto upload 20190806",
study_acronym = "N/A",
official_title = "Foo trial to test auto upload: A randomized trial new 20190806",
agency  = "Aaron Conway",
resp_party_type = "Sponsor-Investigator",
investigator_username = "aconway",
investigator_title ="Assistant Professor",
brief_summary = "Lay summary here",
start_date = "2019-10",
primary_compl =  "2020-12",
study_compl = "2020-12",
int_subtype = "Health Services Research",
phase = "N/A",
assignment = "Parallel",
allocation = "Randomized",
no_masking =  "False",
masked_subject = "True",
masked_caregiver = "True",
masked_investigator = "True",
masked_assessor = "True",
number_arms = 2,
sample_size = "40",
eligibility_criteria = "Inclusion Criteria
- Adults
Exclusion Criteria
- Children",
healthy_volunteers = "No",
genders_included = "Both",
gender_based = "No",
min_age = "1 years",
max_age = "N/A",
#Central contact
contact_first_name = "Aaron",
contact_last_name = "Conway",
contact_degrees = "PhD",
contact_phone = "649-728-8499",
contact_email = "aaron.conway@utoronto.ca",
#Overall official
official_first_name = "Aaron",
official_last_name ="Conway",
official_degrees = "PhD",
official_affiliation = "UHN",
official_role = "Study Principal Investigator",
#Sharing statements
ipd_sharing = "Yes",
ipd_description = "details",
ipd_protocol =  "True",
ipd_sap = "True",
ipd_icf = "True",
ipd_csr = "True",
ipd_code = "True",
ipd_time = "details",
ipd_criteria = "details",
ipd_url = "http://www.aaronconway.info"
)

ctxml <- do.call(create_ctxml, args_ctxml)
       
}
