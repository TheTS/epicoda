#' Create columns headings for after the transformation.
#'
#' @inheritParams transform_comp
#' @export
transf_labels <- function(comp_labels, transformation_type, comparison_part = NULL, part_1 = NULL){
  if (!(transformation_type %in% c("ilr", "alr", "clr"))){
    stop("transformation_type should be \"ilr\", \"alr\" or \"clr\"")
  }
  if (length(comp_labels)<2){
    stop("comp_labels should label at least two compositional parts of the data.")
  }
  if (transformation_type == "ilr"){
    if (!is.null(part_1)){
      comp_labels <- alter_order_comp_labels(comp_labels, part_1)
    }
    l <- (length(comp_labels)-1)
    transf <- comp_labels[1:l]
    first_labels_transf <- paste0(1:l) #, "_", transf)
    transf_with_labels <- paste0("ilr_", first_labels_transf)# , "_vs_remaining", sep = "")
  }
  if (transformation_type == "alr"){
    if (is.null(comparison_part)){
      stop("comparison_part must be specified for alr transformation. See alr_trans.")
    }
    comp_labels_without_cc <- comp_labels[comp_labels != comparison_part]
    transf_with_labels <- paste0("alr_",comp_labels_without_cc, "_", comparison_part)
  }
  if (transformation_type == "clr"){
    transf_with_labels <- paste0("clr_", comp_labels)
  }
  return(transf_with_labels)
}


#' Create sum from a vector
#'
#' @param vector Vector to be turned into a sum.
#' @return Sum of elements of vector.
#' @export
vector_to_sum <- function(vector){
  sum_to_return <- paste(vector, collapse = "+")
  return(sum_to_return)
}
