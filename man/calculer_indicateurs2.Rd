% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fct_calculer_indicateurs2.R
\name{calculer_indicateurs2}
\alias{calculer_indicateurs2}
\title{calculer_indicateurs2}
\usage{
calculer_indicateurs2(num)
}
\arguments{
\item{num}{un vecteur numérique}
}
\value{
un vecteur numérique
}
\description{
Une fonction qui calcule des indicateurs de tendance centrale
et de dispersion
}
\examples{
a <- ajouter_valeurs_extremes(mtcars,"disp",nb=1)
calculer_indicateurs2(a)
}
