#' afficher_courbe_lorenz2
#'
#' @description Une fonction qui affiche la courbe de Lorenz dans une appli Shiny
#' @param varnum un vecteur numérique
#' @param varnumlib un character
#' @param col un character
#' @param lwd un numeric
#' @param xlab un character
#' @param ylab un character
#' @param main un character
#'
#' @return un graphique de type plot
#' @importFrom ineq Lc
#' @export
#' @examples x <- modifier_repartition2(grandile,"PATRIMOINE",dimin = FALSE,tx=80)
#' afficher_courbe_lorenz2(x,"PATRIMOINE")
afficher_courbe_lorenz2 <- function(varnum, # vecteur numérique
                                    varnumlib, # valeur character
                                    col="darkblue",
                                    lwd=4,
                                    xlab = "Part cumulée des individus (en %)",
                                    ylab = paste("Part cumulée de",varnumlib,"(en %)"),
                                    main = " "){

  plot(Lc(varnum),col=col,lwd=lwd,xlab=xlab,ylab=ylab,main=main)

}
