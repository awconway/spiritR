context("Adds xml nodespace")
library(spiritR)
path <- system.file("extdata", "ctxmltest.xml", package = "spiritR",
                    mustWork = TRUE)
ctxmltest <- xml2::read_xml(path)

testthat::test_that("create_ctxml is xml document", {
  expect_equal(create_ctxml(), ctxmltest)
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
