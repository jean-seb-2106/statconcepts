#' afficher_courbe_lorenz
#'
#' @description Une fonction qui affiche la courbe de Lorenz dans une appli Shiny
#' @param df un dataframe
#' @param varnum un character
#' @param col un character
#' @param lwd un numeric
#' @param xlab un character
#' @param ylab un character
#' @param main un character
#'
#' @return a graph de type plot
#' @importFrom ineq Lc
#' @export
#' @examples afficher_courbe_lorenz(grandile,"PATRIMOINE")
afficher_courbe_lorenz <- function(df,
                                   varnum,
                                   col="darkred",
                                   lwd=4,xlab = "Part cumulée des individus (en %)",
                                   ylab = paste("Part cumulée de",varnum,"(en %)"),
                                   main = " "){

  plot(Lc(df[,varnum]),col=col,lwd=lwd,xlab=xlab,ylab=ylab,main=main)

}

