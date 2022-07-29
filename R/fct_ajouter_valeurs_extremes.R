#' ajouter_valeurs_extremes
#'
#' @description Une fonction qui ajout des valeurs extremes supérieures
#' ou inférieures à un vecteur numérique
#' @param df un dataframe
#' @param num un character
#' @param sup un booléan
#' @param nb une valeur numérique
#'
#' @return un vecteur numérique
#' @importFrom stats rnorm
#' @export
#' @examples ajouter_valeurs_extremes(mtcars,"disp",nb=10)
ajouter_valeurs_extremes <- function(df,num,sup=TRUE,nb){
  a <- df[,num] #vecteur numérique
  #Calcul des seuils supérieurs et inférieurs
  q3 <- quantile(a,0.75)
  q1 <- quantile(a,0.25)
  seuil_sup <- q3 + 1.5*(q3-q1)
  seuil_inf <- q1 - 1.5*(q3-q1)
  n <- nb #nombre de valeurs extrêmes à générer
  #génération de valeurs extrêmes supérieures et inférieures
  if (sup){

    b <- rnorm(n,4*seuil_sup,seuil_sup)
  }else{
    b <- rnorm(n,4*seuil_inf,abs(seuil_inf))
  }

  #Nouveau vecteur après ajout de valeurs extrêmes
  return(c(a,b))

}
