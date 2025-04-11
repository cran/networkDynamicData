\name{manufacturingEmails}
\alias{manufacturingEmails}
\alias{manufacturingReportsTo}
\docType{data}
\title{
Internal Emails from a Polish Manufacturing Company
}
\description{
The source is a longitudinal network describing the history of internal e-mail communication (sender, recipient, datetime)
between 167 employees of a mid-sized manufacturing company located in Poland. Multiple recipients
of the same e-mail (To, CC, BCC) are represented as separate rows without distinguishing the recipient type. The period covered are nine full months of 2010 starting from 2010-01-01 to 2010-09-30 (event dates in local time). Apart from the communication, information about who in the company reports to whom is included . Node #86 is the CEO (the only loop in the graph).

}
\usage{data("manufacturingEmails")}
\format{
  a \code{\link[networkDynamic]{networkDynamic}} object
}
\details{
This dataset consists of two network objects:

The \code{manufacturingEmails} network is a \code{networkDynamic} object with 82614 edge spells (emails communications) between 176 employees. The network is represented as a continuous time event temporal model (onset=terminus). Edge timing is coded as numeric POSIX time (seconds) with event dates in local time ranging from 1262482810 (2010-01-01) until 1285909692 (2010-09-30).   The network contains self-loops.  Duplicate rows in the input data (email to the same recipient at the same second using TO, CC, BCC etc) have been collapsed but this information is preserved in the \code{numEmailTypes} dynamic edge attribute. The networks included here have a much larger vertex set and so do not correspond exactly to the description in the paper (below). 

The \code{manufacturingReportsTo} network a static \code{network} object which includes the organizational hierarchy.  Note that vertices 4, 10, 21, 23, 24, 26 and 46 are technical email accounts not used by employees, and vertices 51, 75, 87, 93, 111 and 139 are email accounts corresponding to former employees and so appear as isolates in the \code{manufacturingReportsTo} network. 

Description from paper:

... company is a manufacturing company located in Poland.
The company employs 300 persons, whereas 1/3 are clerical workers, the rest -
laborers. The period analyzed was half a year. The type of organizational structure is
functional [3]. However, due to organization operating model and its consequences to
organizational structure clarity as well as logs interpretation possibility, only a subset
of organization have been chosen for current analysis: 49 clerical employees not
directly related to manufacturing process. Three-level management structure exists
in the selected company part: management board (2 persons), managers (11 persons)
and regular employees (36 persons) and they work in twelve different departments.
There were no organizational changes during the analyzed period.
Email logs were source data used to build social network . Because of email logs
structure, there was no distinction between To, CC and BCC recipients. The resulting
set of data contained 11,816 emails in total.
}
\source{
\code{radoslaw.michalski <at> pwr.edu.pl} \url{https://www.ii.pwr.wroc.pl/~michalski/index.php?content=datasets} and 

}
\references{
When using this dataset, please cite:

Michalski, R., Kajdanowicz, T., Brodka, P., Kazienko, P.: Seed Selection for Spread of Influence in Social Networks: Temporal vs. Static Approach. New Generation Computing (JCR-listed journal), Vol. 32, Issue 3-4, pp. 213-235. Ohmsha-Japan and Springer (2014))

\preformatted{
@article{michalski2014seed,
  title={Seed Selection for Spread of Influence in Social Networks: Temporal vs. Static Approach},
  author={Michalski, Rados{\l}aw and Kajdanowicz, Tomasz and Br{\'o}dka, Piotr and Kazienko, Przemys{\l}aw},
  journal={New Generation Computing},
  volume={32},
  number={3-4},
  pages={213--235},
  year={2014},
  publisher={Springer}
}
}

Michalski, R., Palus, S., Kazienko, P.: Matching Organizational Structure and Social Network Extracted from Email Communication. Lecture Notes in Business Information Processing LNBIP, vol. 87, pp. 197-206, Springer, Berlin Heidelberg (2011) 


}
\section{License}{
The data are distributed to the public under a Creative Commons
Attribution-NonCommercial-ShareAlike license
http://creativecommons.org/licenses/by-nc-sa/3.0/.
}
\examples{
data(manufacturingEmails)
\dontrun{
# plot the organizational hierarchy
plot(manufacturingReportsTo,displaylabels=TRUE,
     vertex.cex=0.6,label.cex=0.6,edge.col='gray')
     
# plot the first two days of emails
plot(network.extract(manufacturingEmails,
     onset=1262482810,length=60*60*24*2))
     
# plot email density over time
plot(density(as.data.frame(manufacturingEmails)$onset))

# convert date string to POSIX seconds
as.numeric(as.POSIXct('2010-09-30',format='\%Y-\%m-\%d'))

# convert POSIX seconds to date string
as.POSIXct(1285830000,origin='1970-01-01',tz = 'PL')
}

}
\keyword{datasets}
