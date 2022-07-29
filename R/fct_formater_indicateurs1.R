#' formater_indicateurs1
#'
#' @description Une fonction qui formate les éléments d'un vecteur numérique
#' @param vec un vecteur numérique
#'
#' @return a vecteur de character
#' @export
#' @examples calculer_indicateurs1(mtcars,"mpg") %>% formater_indicateurs1()
formater_indicateurs1 <-function(vec){
  vec %>% round(1) %>% format(big.mark = " ",decimal.mark = ",",nsmall=1)
}
