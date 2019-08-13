library(spiritR)
library(testthat)
pathctxmltest <- system.file("extdata", "ctxmltest.xml", package = "spiritR",
                             mustWork = TRUE)
pathaddprtest <- system.file("extdata", "addprtest.xml", package = "spiritR",
                             mustWork = TRUE)
ctxmltest <- xml2::read_xml(pathctxmltest)
addprtest <- xml2::read_xml(pathaddprtest)

testthat::test_that("create_ctxml is xml document", {
  expect_equal(create_ctxml(org_name = "UHNToronto",
                            org_study_id = "Foo trial 20190311",
                            brief_title = "Foo trial to test auto upload 20190311",
                            study_acronym = "N/A",
                            official_title = "Foo trial to test auto upload: A randomized trial new 20190311",
                            agency  = "Aaron Conway",
                            resp_party_type = "Sponsor-Investigator",
                            investigator_username = "aconway",
                            investigator_title ="Assistant Professor",
                            brief_summary = "Lay summary here",
                            start_date = "2019-10",
                            primary_compl =  "2020-12",
                            study_compl = "2020-12",
                            int_subtype = "Treatment",
                            phase = "N/A",
                            assignment = "Parallel",
                            allocation = "Randomized",
                            no_masking =  "False",
                            masked_subject = "True",
                            masked_caregiver = "True",
                            masked_investigator = "True",
                            masked_assessor = "True",
                            number_arms = "2",
                            sample_size = "40",
                            eligibility_criteria = "details",
                            healthy_volunteers = "No",
                            genders_included = "Both",
                            gender_based = "No",
                            min_age = "N/A",
                            max_age = "N/A",
                            
                            #Central contact
                            contact_first_name = "Aaron",
                            contact_last_name = "Conway",
                            contact_degrees = "PhD",
                            contact_phone = "649-728-8499",
                            contact_email = "dhsksj@hfhfk.com",
                            
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
                            ipd_time = "detials",
                            ipd_criteria = "details",
                            ipd_url = "http://www.fhkf.com"), ctxmltest)
                                                    }
                    )

testthat::test_that("expect = xml document", {
  expect_is(add_intervention(ctxmltest, 
                             int_type = "Device", 
                             int_name = "test intervention", 
                             int_desc = "description for intervention", 
                             arm_label = "Intervention"), "xml_document")
                                              }
                   )

testthat::test_that("expect = xml document", {
  expect_is(add_arm(ctxmltest, arm_label = "Standard", 
                               arm_type = "Experimental",
                               arm_desc = "Description for arm"),"xml_document")
                                              }
                    )


testthat::test_that("expect = xml document", {
  expect_is(add_pr_outcome(ctxmltest, 
                           name = "measure", 
                           time = "timeframe",
                           description = "description"),"xml_document")
  expect_equal(add_pr_outcome(ctxmltest, 
                           name = "measure", 
                           time = "timeframe",
                           description = "description"), addprtest)
}
)


testthat::test_that("expect = character string of xml document", {
  expect_that(
    print_ctxml(ctxmltest), prints_text(cat(as.character(ctxmltest))))
}
)
