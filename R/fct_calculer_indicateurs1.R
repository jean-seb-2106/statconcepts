#' calculer_indicateurs1
#'
#' @description Une fonction qui calcule des indicateurs de tendance centrale
#' et de dispersion
#' @param df un dataframe
#' @param var un character
#'
#' @return un vecteur numérique
#' @importFrom stats median quantile sd
#' @export
#' @examples calculer_indicateurs1(mtcars,"mpg")
calculer_indicateurs1 <- function(df,var){
  moy <- mean(df[,var],na.rm=FALSE)
  med <- median(df[,var],na.rm=FALSE)
  sd <- sd(df[,var],na.rm=FALSE)
  cv <- sd/moy*100
  c("Moyenne"=moy,"Médiane"=med,"Ecart-type" = sd,"Coeff de variation (en %)"=cv)
}
