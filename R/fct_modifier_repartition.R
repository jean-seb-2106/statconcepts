#' modifier_repartition
#'
#' @description Une fonction qui modifie la concentration d'une numérique
#' @param df un dataframe
#' @param slideinput un character
#' @param dimin un bolean
#' @param tx un numeric
#'
#' @return un vecteur de numeric
#' @export
#' @examples modifier_repartition(grandile,"REV_DISPONIBLE",dimin = FALSE,tx=99)
modifier_repartition <- function(df,slideinput,dimin=TRUE,tx){
  x <- df[,slideinput]
  varnum <- sort(x)
  if(dimin==TRUE){
    ecart_varnum <- varnum - mean(varnum,na.rm = TRUE)
    varnum_apresmodif <- varnum - ecart_varnum*(tx/100)
    varnum_apresmodif
  }else{
    n <- length(varnum)
    a <- varnum[1:n-1] #Les n-1 ménages les plus pauvres dont le revenu va être amputé
    b <- varnum[n] #Le ménage le plus riche qui prélève le revenu des autres
    varnum_apresmodif <- (1 - tx/100)*a #revenu des plus pauvres après augmentation des inégalités
    b <- b + sum(a)-sum(varnum_apresmodif) #augmentation du revenu du plus riche qui prend tous les prélèvements
    varnum_apresmodif[n] <- b
    varnum_apresmodif
  }
}

