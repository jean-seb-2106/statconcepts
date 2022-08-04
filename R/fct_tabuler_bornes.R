#' tabuler_bornes
#'
#' @description Une fonction qui renvoie un tableau avec les classes à partir du vecteur
#' numérique des classes
#' @param num un vecteur numérique
#' @param nbclass une valeur numerique
#' @param type_decoup un character
#'
#' @return un dataframe
#' @import ggplot2
#' @export
#' @examples df <- grandile
#'x <- "REV_DISPONIBLE"
#'y <- 5
#'z <- "quantiles"
#'a <- calculer_bornes(df,x,y,z)
#'b <- tabuler_bornes(a,y,z)
tabuler_bornes <- function(num,nbclass,type_decoup){

  if (type_decoup == "largeur_fixe") {
    tab <- data.frame(cbind(
      seq(1, nbclass,1),
      num[1:nbclass],
      num[2:(nbclass+1)]
    ))
    colnames(tab) <- c("tranche","borne inf","borne sup")
  }else if (type_decoup == "quantiles"){
    tab <- data.frame(cbind(
      seq(0, 1, 1 / nbclass),
      num
    ))
    colnames(tab) <- c("quantile","borne")
    rownames(tab) <- NULL
  }
  return(tab)
}
