#' Principal Component Analysis
#'
#' Implements the Principal Component Analysis (PCA) algorithm
#'
#' @param x An n x p matrix.
#' @param space Specifies which space to do the projections. Either "row" or "column", default is "row".
#' @param nsv Optional. An integer specifying the number of PCs.
#' @param center If TRUE then matrix will be mean centered. Default is TRUE.
#' @param scale If TRUE then matrix will be normalized. Default is FALSE
#'
#' @return
#' A list of object type "pca" containing:
#' \item{pc}{A matrix containing the principal components.}
#' \item{loading}{A matrix containing the loadings.}
#' \item{pve}{A vector containing the percent variation explained by each PC.}
#'
#' @examples
#' # import data
#' X <- matrix(rnorm(100 * 10), ncol = 10)
#'
#' out_pca <- pca(X)
#'
#' scree_plot(out_pca)
#'
#' @export
pca <- function (x, space = c("rows", "columns"), nsv = NULL, center = TRUE,
                 scale = FALSE) {
  UseMethod("pca", x)
}

#' @export
pca.data.frame <- function(x, space = c("rows", "columns"), nsv = NULL, center = TRUE,
                       scale = FALSE) {
  x <- as.matrix(x)
  if (any(!is.finite(x)))
    stop("infinite or missing values in 'x'")
  pca(x, space = space, nsv = nsv, center = center,
      scale = scale)
}

#' @export
pca.matrix <- function(x, space = c("rows", "columns"), nsv = NULL, center = TRUE,
                       scale = FALSE) {
  if (any(!is.finite(x)))
    stop("infinite or missing values in 'x'")
  space <- match.arg(space)
  if (space=="columns") {
    x <- colScale(x,
                  center = center,
                  scale = scale)
  } else {
    x <-  rowScale(x,
                   center = center,
                   scale = scale)
  }

  if (is.null(nsv)) {
    s = svd(x)
  } else {
    s <- rARPACK::svds(x, k = nsv)
  }
  loading <- s$u
  colnames(loading) <- paste0("Loading", 1:ncol(loading))
  rownames(loading) <- rownames(x)
  pc <- t(s$v) * s$d
  pve <- s$d ^ 2 / sum(s$d ^ 2)
  rownames(pc) <- names(pve) <- paste0("PC", 1:nrow(pc))
  colnames(pc) <- colnames(x)
  if (space == "columns") {
    pc <- t(pc)
    loading <- t(loading)
  }
  out <- list(pc = pc, loading = loading, pve = pve)
  class(out) <- "pca"
  out
}

#' Scree plot for PCA object
#'
#' @param x pca object
#' @param npcs An integer specifying the number of PCs to plot.
#'
#' @import ggplot2
#' @export scree_plot
scree_plot <- function(x, npcs = length(x$pve)) {
  df1 <- data.frame(pve = x$pve[1:npcs], nFactors = 1:npcs)
  p <- ggplot(df1, aes_string(x = 'nFactors', y = 'pve')) +
    geom_point() +
    geom_line() +
    xlab("Number of factors") +
    ylab("Percent variance explained") +
    theme_bw()
  p
}
