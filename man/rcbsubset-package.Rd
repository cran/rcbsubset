\name{rcbsubset-package}
\alias{rcbsubset-package}
\docType{package}
\title{
\packageTitle{rcbsubset}
}
\description{
\packageDescription{rcbsubset}
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{rcbsubset}
\packageIndices{rcbsubset}
This package computes matches that are optimal under a set of refined covariate balance constraints.  These constraints, provided by the user, are a set of nested categorical variables of decreasing imporance which must be marginally balanced as closely as possible in the resulting treated and matched control populations.  In addition, treated units may be excluded in an optimal manner (using a penalty parameter) to improve the quality of the match.  For more detail see the references.

The main function is \code{rcbsubset}, which takes a distance/sparsity matrix or matrix-like object containing information about matchability of the treated and control units and a list of fine balance variables and produces a match. The other functions are largely for internal use and should not be needed by the large majority of users.  The syntax and code structure is very similar in the closely related antecedent package \code{rcbalance}, which provides more helper functions for constructing matches but does not support optimal subset matching.

By default the package uses the R package \code{rlemon} to solve the minimum-cost network flow optimization problems by which matches are computed. Alternatively, users may specify that the \code{rrelaxiv} package
should be used instead. However, this package carries an academic license
and is not available on CRAN so users must install it themselves.
}
\author{
\packageAuthor{rcbsubset}

Maintainer: \packageMaintainer{rcbsubset}
}
\references{

Pimentel, S.D., Kelz, R.R., Silber, J.H., and Rosenbaum, P.R. (2015) Large, sparse optimal matching with refined covariate balance in an observational study of the health outcomes produced by new surgeons, JASA 110 (510), 515-527.
	   
 Pimentel, S.D., and Kelz, R.R. (2020). Optimal tradeoffs in matched designs comparing US-trained and internationally trained surgeons. JASA 115 (532), 1675-1688.
 
Rosenbaum, P.R. (2012) Optimal matching of an optimally chosen subset in observational studies, JCGS 21.1: 57-71.  
}
%~~ Optionally other standard keywords, one per ~~
%~~ line, from file KEYWORDS in the R ~~
%~~ documentation directory ~~
%\keyword{ package }
%\seealso{
%~~ Optional links to other man pages, e.g. ~~
%~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
%}
%\examples{
%~~ simple examples of the most important functions ~~
%}
