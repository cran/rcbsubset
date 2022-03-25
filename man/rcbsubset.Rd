\name{rcbsubset}
\alias{rcbsubset}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Optimal Matching with Refined Covariate Balance
}
\description{
This function computes an optimal match with refined covariate balance.
}
\usage{
rcbsubset(distance.structure, near.exact = NULL, fb.list = NULL, 
treated.info = NULL, control.info = NULL, exclude.penalty = NULL, 
penalty = 2, tol = 1e-3, solver = 'rlemon')
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{distance.structure}{
 A distance matrix, a sparse distance matrix of class InfinitySparseMatrix (produced by various functions in the \code{optmatch} package), or a
 a list of vectors that encodes information about covariate distances between treated and control units (produced by the \code{build.dist.struct} function in the \code{rcbalance} package).  If a matrix is given, rows should correspond to treated units and columns to control units.  Distances of \code{Inf} should be used to indicate that the units in question must never be matched to each other.
 }

\item{near.exact}{ 
an optional character vector specifying names of covariates for near-exact matching.  This argument takes precedence over any refined covariate balance constraints, so the match will produce the best refined covariate balance subject to matching exactly on this variable wherever possible.  If multiple covariates are named, near-exact matching will be done on their interaction.
}
  \item{fb.list}{
an optional list of character vectors specifying covariates to be used for refined balance.  Each element of the list corresponds to a level of refined covariate balance, and the levels are assumed to be in decreasing order of priority.  Each character vector should contain one or more names of categorical covariates on which the user would like to enforce near fine balance.  If multiple covariates are specified, an interaction is created between the categories of the covariates and near fine balance is enforced on the interaction.  IMPORTANT: covariates or interactions coming later in the list must be nested within covariates coming earlier in the list; if this is not the case the function will stop with an error.  An easy way to ensure that this occurs is to include in each character vector all the variables named in earlier list elements.  If the \code{fb.list} argument is specified, the \code{treated.info} and \code{control.info} arguments must also be specified.
}
  \item{treated.info}{
an optional data frame containing covariate information for the treated units in the problem.  The row count of this data frame must be equal to the length of the \code{distance.structure} argument, and it is assumed that row \code{i} contains covariate information for the treated unit described by element \code{i} of \code{distance.structure}.  In addition, the column count and column names must be identical to those of the \code{control.info} argument, and the column names must include all of the covariate names mentioned in the \code{near.exact} and \code{fb.list} arguments.
}
  \item{control.info}{
an optional data frame containing covariate information for the control units in the problem.  The row count of this data frame must be no smaller than the maximum control index in the \code{distance.structure} argument, and it is assumed that row \code{i} contains the covariate information for the control indexed by \code{i} in distance.structure.  In addition, the column count and column names must be identical to those of the \code{treated.info} argument.
}

\item{exclude.penalty}{
	A parameter that gives the cost of excluding a treated unit.  If left NULL it will be set to a very large value designed to ensure treated units are never excluded if they can be matched.  Lower values may result in subsets of treated units being excluded.
}


  \item{penalty}{
a nonnegative value.  This is a tuning parameter that helps ensure the different levels of refined covariate balance are prioritized correctly.   Setting the penalty higher tends to improve the guarantee of match optimality up to a point, but penalties above a certain level cause integer overflows and throw errors.  It is not recommended that the user change this parameter from its default value.
}


\item{tol}{
	edge cost tolerance.  This is the smallest tolerated difference between matching costs; cost differences smaller than this will be considered zero.  Match distances will be scaled by inverse tolerance, so when matching with large edge costs or penalties the tolerance may need to be increased.
}


\item{solver}{
the name of the package used to solve the network flow optimization problem underlying the match, one of 'rlemon' (which uses the Lemon Optimization Library) and 'rrelaxiv' (which uses the RELAX-IV algorithm). 
}

}

\details{
To use the option \code{solver = 'rrelaxiv'}, the user must install the
\code{rrelaxiv} manually; it is not hosted on CRAN because it carries an academic
license.  
}
\value{
A list with the following components:
%%  If it is a LIST, use
 \item{matches}{a nt by k matrix containing the matched sets produced by the algorithm (where nt is the number of treated units).  The rownames of this matrix are the numbers of the treated units (indexed by their position in distance.structure), and the elements of each row contain the indices of the control units to which this treated unit has been matched.}
  \item{fb.tables}{a list of matrices, equal in length to the fb.list argument.  Each matrix is a contingency table giving the counts among treated units and matched controls for each level of the categorical variable specified by the corresponding element of fb.list. }
%% ...
}
\references{
  
Pimentel, S.D., Kelz, R.R., Silber, J.H., and Rosenbaum, P.R. (2015) Large, sparse optimal matching with refined covariate balance in an observational study of the health outcomes produced by new surgeons, JASA 110 (510), 515-527.	

 Pimentel, S.D., and Kelz, R.R. (2020). Optimal tradeoffs in matched designs comparing US-trained and internationally trained surgeons. JASA 115 (532), 1675-1688.
	
  Rosenbaum, P.R. (2012) Optimal matching of an optimally chosen subset in observational studies, JCGS 21.1: 57-71.  
}
\author{
Samuel D. Pimentel
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
\examples{

\dontrun{
library(optmatch)	
data(nuclearplants)

#match exactly on 3 binaries
exact.mask <- exactMatch(pr ~ pt + ct + bw, data = nuclearplants)
my.dist.matrix <- match_on(pr ~ date + t1 + t2 + cap + ne + cum.n,
	within = exact.mask, data = nuclearplants)

#one treated unit out of 10 is excluded
rcbsubset(my.dist.matrix)

#repeat under a refined balance constraint
rcbsubset(my.dist.matrix, fb.list = list('ne'), 
 treated.info = nuclearplants[which(nuclearplants$pr ==1),],
 control.info = nuclearplants[which(nuclearplants$pr == 0),])

#specifying a low exclude.penalty leads to more individuals excluded
rcbsubset(my.dist.matrix, fb.list = list('ne'), 
 treated.info = nuclearplants[which(nuclearplants$pr ==1),],
 control.info = nuclearplants[which(nuclearplants$pr == 0),], exclude.penalty = 1.5)


#match using distance objects created by rcbalance package
library(rcbalance)

my.dist.struct <- build.dist.struct(z = nuclearplants$pr, 
	X = subset(nuclearplants[c('date','t1','t2','cap','ne','cum.n')]),
	exact = paste(nuclearplants$pt, nuclearplants$ct, nuclearplants$bw, sep = '.'))
	
rcbsubset(my.dist.struct, fb.list = list('ne'), 
 treated.info = nuclearplants[which(nuclearplants$pr ==1),],
 control.info = nuclearplants[which(nuclearplants$pr == 0),], exclude.penalty = 15)	

}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
