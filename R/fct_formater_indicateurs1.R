#' formater_indicateurs1
#'
#' @description Une fonction qui formate les éléments d'un vecteur numérique
#' @param vec un vecteur numérique
#' @import dplyr
#' @importFrom purrr map
#'
#' @return a vecteur de character
#' @export
#' @examples a <- calculer_indicateurs1(mtcars,"mpg")
#' formater_indicateurs1(a)
formater_indicateurs1 <-function(vec){
  vec %>% round(1) %>% format(big.mark = " ",decimal.mark = ",",nsmall=1) %>%
    map_chr(gsub,pattern="^\\s+|\\s+$",replacement="") #enlève les blancs au début et à la fin
}
