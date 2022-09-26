#' calculer_indicateurs_redistrib
#'
#' @description Une fonction qui affiche un vecteur numérique
#' @param df un dataframe
#' @param var un character
#'
#' @return un vecteur de character
#' @importFrom ineq ineq
#' @export
#' @examples calculer_indicateurs_redistrib(grandile,"REV_DISPONIBLE")
calculer_indicateurs_redistrib <- function(df,var){

  gini <- ineq(df[,var],type="Gini")
  min <- min(df[,var],na.rm = TRUE)
  max <- max(df[,var],na.rm = TRUE)
  rid <- quantile(df[,var],0.9,na.rm = TRUE)/quantile(df[,var],0.1,na.rm = TRUE)
  names(rid) <- ""
  median <- median(df[,var],na.rm = TRUE)
  c("Indice de Gini" = gini,"Minimum" = min,"Maximum" = max,"Rapport inter-décile" = rid,"Médiane" = median)


}

