#' calculer_indicateurs2
#'
#' @description Une fonction qui calcule des indicateurs de tendance centrale
#' et de dispersion
#' @param num un vecteur numérique
#'
#' @return un vecteur numérique
#' @importFrom stats median quantile sd
#' @export
#' @examples a <- ajouter_valeurs_extremes(mtcars,"disp",nb=1)
#' calculer_indicateurs2(a)
calculer_indicateurs2 <- function(num){
  moy <- mean(num,na.rm=FALSE)
  med <- median(num,na.rm=FALSE)
  sd <- sd(num,na.rm=FALSE)
  cv <- sd/moy*100
  c("Moyenne"=moy,"Médiane"=med,"Ecart-type" = sd,"Coeff de variation (en %)"=cv)
}
