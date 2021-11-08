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

The main function is \code{rcbsubset}, which takes a distance/sparsity matrix or matrix-like object containing information about matchability of the treated and control units and a list of fine balance variables and produces a match. The other functions are largely for internal use and should not be needed by the large majority of users.  The syntax and code structure is very similar in the closely related antecedent package rcbalance, which provides more helper functions for constructing matches but does not support optimal subset matching.

IMPORTANT NOTE: the functionality of this package is greatly reduced unless the \code{optmatch} package (v >= 0.9-1) is also loaded.  When attempting to run the \code{rcbalance} command without having loaded \code{optmatch}, the users will receive an error message.  The first reference below gives background on \code{optmatch}.
}
\author{
\packageAuthor{rcbsubset}

Maintainer: \packageMaintainer{rcbsubset}
}
\references{
 Hansen, B.B. and Klopfer, S.O. (2006) Optimal full matching and
  related designs via network flows, JCGS 15 609-627.

Pimentel, S.D., Kelz, R.R., Silber, J.H., and Rosenbaum, P.R. (2015) Large, sparse optimal matching with refined covariate balance in an observational study of the health outcomes produced by new surgeons, JASA 110 (510), 515-527.
	   
 Pimentel, S.D., and Kelz, R.R. (2020). Optimal tradeoffs in matched designs comparing US-trained and internationally trained surgeons. JASA 115 (532), 1675-1688.
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
