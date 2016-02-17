\name{rcbsubset-package}
\alias{rcbsubset-package}
\docType{package}
\title{
Optimal Subset Matching with Refined Covariate Balance
}
\description{
This package computes matches that are optimal under a set of refined covariate balance constraints.  These constraints, provided by the user, are a set of nested categorical variables of decreasing imporance which must be marginally balanced as closely as possible in the resulting treated and matched control populations.  In addition, treated units may be excluded in an optimal manner (using a penalty parameter) to improve the quality of the match.  For more detail see the references.}
\details{
\tabular{ll}{
Package: \tab rcbsubset\cr
Type: \tab Package\cr
Version: \tab 1.1\cr
Date: \tab 2016-02-10\cr
License: \tab MIT + file LICENSE\cr
}
The main function is \code{rcbsubset}, which takes a distance/sparsity matrix or matrix-like object containing information about matchability of the treated and control units and a list of fine balance variables and produces a match. The other functions are largely for internal use and should not be needed by the large majority of users.  The syntax and code structure is very similar in the closely related antecedent package rcbalance, which provides more helper functions for constructing matches but does not support optimal subset matching.

IMPORTANT NOTE: the functionality of this package is greatly reduced if the \code{optmatch} package (v >= 0.9-1) is also loaded.  When attempting to run the \code{rcbalance} command without having loaded \code{optmatch}, the users will receive an error message.  The second reference below gives background on \code{optmatch}.
  %In the event that \code{optmatch} is unavailable as a direct download from CRAN, it can be obtained in source form at http://cran.r-project.org/src/contrib/Archive/optmatch/.
}
\author{
Samuel D. Pimentel <spi@wharton.upenn.edu>
}
\references{

 Hansen, B.B. and Klopfer, S.O. (2006) Optimal full matching and
  related designs via network flows, JCGS 15 609-627.

Pimentel, S.D., Kelz, R.R., Silber, J.H., and Rosenbaum, P.R. (2015) Large, sparse optimal matching with refined covariate balance in an observational study of the health outcomes produced by new surgeons, JASA 110 (510), 515-527.
	   
  Rosenbaum, P.R. (2012) Optimal matching of an optimally chosen subset in observational studies, JCGS 21.1: 57-71.
}
%\keyword{ package }
%\seealso{
%~~ Optional links to other man pages, e.g. ~~
%~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
%\code{\link{optmatch}}
%}

%\examples{
%~~ simple examples of the most important functions ~~
%}
