#' select_class_df
#'
#' @description Une fonction qui renvoie un vecteur de caractères avec le type de
#' variable demandée
#' @param df un dataframe
#' @param type un character
#'
#' @return a vecteur de character
#' @importFrom purrr map_chr
#' @export
#' @examples select_class_df(grandile,"numeric")
select_class_df <- function(df,type){
  names(df[, map_chr(.x = df,.f = class)==type])
}
