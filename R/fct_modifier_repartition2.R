#' modifier_repartition2
#'
#' @description Une fonction qui modifie la concentration d'une numérique
#' @param df un dataframe
#' @param slideinput un character
#' @param dimin un bolean
#' @param tx un numeric
#'
#' @return un vecteur de numeric
#' @export
#' @examples modifier_repartition2(grandile,"REV_DISPONIBLE",dimin = FALSE,tx=10)
modifier_repartition2 <- function(df,slideinput,dimin=TRUE,tx){

  x <- df[,slideinput]
  varnum <- sort(x)

  if(dimin==TRUE){

    ecart_varnum <- varnum - mean(varnum,na.rm = TRUE)
    varnum_apresmodif <- varnum - ecart_varnum*(tx/100)
    varnum_apresmodif

  }else if(dimin==FALSE){

    pct_cumx <- cumsum(x)/sum(x)
    y <- data.frame(varnum,pct_cumx) %>%
      filter(pct_cumx <= tx/100) %>%
      mutate(varnum_apres=varnum*(1-tx/100))  #on prélève tx% d'impôt à ceux qui cumulent tx% de la masse
    limite <- max(y$varnum)
    #Création d'une base avec les plus riches
    z <- data.frame(varnum,pct_cumx) %>%
      filter(pct_cumx > tx/100) %>%
      mutate(ecart_varnum = varnum-limite,
             pct_redis = ecart_varnum/sum(ecart_varnum),
             varnum_apres = (1-tx/100)*varnum +pct_redis*(tx/100)*sum(x)
      )
    varnum_apresmodif <- c(y$varnum_apres,z$varnum_apres) #vecteur numérique fusion des deux tables
    varnum_apresmodif
  }
}
