#' calculer_indicateurs_redistrib_vect
#'
#' @description Une fonction qui calcule des indicateurs de concentration
#' @param varnum un vecteur numeric
#'
#' @return un vecteur numeric
#' @export
#' @examples x <- modifier_repartition(grandile,"REV_DISPONIBLE",dimin = FALSE,tx=10)
#'calculer_indicateurs_redistrib_vect(x)
calculer_indicateurs_redistrib_vect <- function(varnum){

  gini <- ineq(varnum,type="Gini")
  min <- min(varnum,na.rm = TRUE)
  max <- max(varnum,na.rm = TRUE)
  rid <- quantile(varnum,0.9,na.rm = TRUE)/quantile(varnum,0.1,na.rm = TRUE)
  names(rid) <- ""
  median <- median(varnum,na.rm = TRUE)
  c("Indice de Gini" = gini,"Minimum" = min,"Maximum" = max,"Rapport inter-décile" = rid,"Médiane" = median)


}

