% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fct_afficher_histo2.R
\name{afficher_histo2}
\alias{afficher_histo2}
\title{afficher_histo2}
\usage{
afficher_histo2(inputselect, num)
}
\arguments{
\item{inputselect}{un character}

\item{num}{un vecteur numérique}
}
\value{
un graph ggplot
}
\description{
Une fonction qui affiche un histogramme
à partir d'un vecteur numérique
}
\examples{
b <- ajouter_valeurs_extremes(grandile,"REV_DISPONIBLE",nb=10)
afficher_boxplot2("REV_DISPONIBLE",b)
}
