# Building a Prod-Ready, Robust Shiny Application.
#
# README: each step of the dev files is optional, and you don't have to
# fill every dev scripts before getting started.
# 01_start.R should be filled at start.
# 02_dev.R should be used to keep track of your development during the project.
# 03_deploy.R should be used once you need to deploy your app.
#
#
###################################
#### CURRENT FILE: DEV SCRIPT #####
###################################

# Engineering

## Dependencies ----
## Amend DESCRIPTION with dependencies read from package code parsing
attachment::att_amend_desc()
#super

## Add modules ----
## Create a module infrastructure in R/
golem::add_module(name = "valeurs_extremes", with_test = TRUE) # Name of the module
golem::add_module(name = "effet_structure", with_test = TRUE) # Name of the module
golem::add_module(name = "redistribution", with_test = TRUE) # Name of the module
golem::add_module(name = "classes", with_test = TRUE) # Name of the module
golem::add_module(name = "classes_biv", with_test = TRUE) # Name of the module


## Add helper functions ----

## Creates fct_* and utils_*

#Fonctions utilisées plusieurs modules
golem::add_fct("formater_indicateurs1", with_test = TRUE)

#Fonctions du module de valeurs extrêmes
golem::add_fct("afficher_boxplot1", with_test = TRUE)
golem::add_fct("afficher_histo1", with_test = TRUE)
golem::add_fct("calculer_indicateurs1", with_test = TRUE)
golem::add_fct("ajouter_valeurs_extremes", with_test = TRUE)
golem::add_fct("calculer_indicateurs2", with_test = TRUE)
golem::add_fct("afficher_boxplot2", with_test = TRUE)
golem::add_fct("afficher_histo2", with_test = TRUE)
golem::add_fct("select_class_df", with_test = TRUE)

#Fonctions du module sur les classes
golem::add_fct("calculer_bornes", with_test = TRUE)
golem::add_fct("tabuler_bornes", with_test = TRUE)
golem::add_fct("afficher_histo3", with_test = TRUE)

#Fonctions du module de redistribution
golem::add_fct("afficher_courbe_lorenz", with_test = TRUE)
golem::add_fct("calculer_indicateurs_redistrib", with_test = TRUE)
golem::add_fct("modifier_repartition", with_test = TRUE)
golem::add_fct("calculer_indicateurs_redistrib_vect", with_test = TRUE)
golem::add_fct("modifier_repartition2", with_test = TRUE)
golem::add_fct("afficher_courbe_lorenz2", with_test = TRUE)

golem::add_utils("helpers", with_test = TRUE)

## External resources
## Creates .js and .css files at inst/app/www
golem::add_js_file("script")
golem::add_js_handler("handlers")
golem::add_css_file("custom")
golem::add_sass_file("custom")

## Add internal datasets ----
## If you have data in your package
usethis::use_data_raw(name = "packages_a_installer_onyxia", open = FALSE)
usethis::use_data_raw(name = "petitile", open = FALSE)


## Tests ----
## Add one line by test you want to create
usethis::use_test("app")

# Documentation

## Vignette ----
usethis::use_vignette("valeurs_extrêmes")
usethis::use_vignette("decoupage_classe_uni")
usethis::use_vignette("redistribution")
devtools::build_vignettes()

## Code Coverage----
## Set the code coverage service ("codecov" or "coveralls")
usethis::use_coverage()

# Create a summary readme for the testthat subdirectory
covrpage::covrpage()

## CI ----
## Use this part of the script if you need to set up a CI
## service for your application
##
## (You'll need GitHub there)
usethis::use_github()

# GitHub Actions
usethis::use_github_action()
# Chose one of the three
# See https://usethis.r-lib.org/reference/use_github_action.html
usethis::use_github_action_check_release()
usethis::use_github_action_check_standard()
usethis::use_github_action_check_full()
# Add action for PR
usethis::use_github_action_pr_commands()

# Travis CI
usethis::use_travis()
usethis::use_travis_badge()

# AppVeyor
usethis::use_appveyor()
usethis::use_appveyor_badge()

# Circle CI
usethis::use_circleci()
usethis::use_circleci_badge()

# Jenkins
usethis::use_jenkins()

# GitLab CI
usethis::use_gitlab_ci()

# You're now set! ----
# go to dev/03_deploy.R
rstudioapi::navigateToFile("dev/03_deploy.R")
