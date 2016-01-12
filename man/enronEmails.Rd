\name{enronEmails}
\alias{enronEmails}
\docType{data}
\title{
Enron Emails
}
\description{
A version of the "Enron Email Network" formatted as a networkDynamic object with edge spells corresponding to individual emails and vertices as email addresses.  Data was downloaded form \url{http://www.cis.jhu.edu/~parky/Enron/}, with the presumed upstream source of \url{http://www.cs.cmu.edu/~enron/}
}
\usage{data("enronEmails")}
\format{
A \code{\link[networkDynamic]{networkDynamic}} object.
}
\details{

The edge spells in this network correspond to individual emails sent between 184 addresses in the Enron email corpus.  The network is represented as a continuous time event temporal model (onset=terminus). Edge timing is coded as numeric posix time (seconds). The time range is from 315522000 (1979-12-31) to 1024688419 (2002-06-21) but some email timestamps are invalid and most analsyes use the range 1998 (883612800) to 2002. No email content or attachments are included in this version of the dataset. 


The vertex ides have been incremented by 1 (compared to the Y. Park version) to follow R's convention of avoid 0-based indices.

Vertex attributes have been attached as follows:
\itemize{
\item \code{email_id}  the non-redundant part of the email (i.e. with \code{@enron.com} removed) used as the id in constructing the networks
\item \code{role} A 'role' associated with the email address (i.e. "Vice President", "Director") (missing and/or redacted for some vertices)
\item \code{name} The name of the person associated with the email address (missing and/or redacted for some vertices)
\item \code{dept} A name of the individual's department or subsidiary where known (missing and/or redacted for many vertices)
}
}
\section{Original sources}{
From \url{http://www.cs.cmu.edu/~enron/}

"[the Enron email corpus] was collected and prepared by the CALO Project (A Cognitive Assistant that Learns and Organizes). It contains data from about 150 users, mostly senior management of Enron, organized into folders. The corpus contains a total of about 0.5M messages. This data was originally made public, and posted to the web, by the Federal Energy Regulatory Commission during its investigation."

"The email dataset was later purchased by Leslie Kaelbling at MIT, and turned out to have a number of integrity problems. A number of folks at SRI, notably Melinda Gervasio, worked hard to correct these problems, and it is thanks to them (not me [William W. Cohen]) that the dataset is available. The dataset here does not include attachments, and some messages have been deleted "as part of a redaction effort due to requests from affected employees". Invalid email addresses were converted to something of the form user@enron.com whenever possible (i.e., recipient is specified in some parseable format like "Doe, John" or "Mary K. Smith") and to no_address@enron.com when no recipient was specified."

From C.E. Priebe, et al:

"The data are collected from "about 150 users" -- mostly Enron executives, but also some
energy traders, executive assistants, etc. However, our graphs are based on 184 users, which
is the number of unique addresses we obtain from the 'From' line of emails in the 'Sent'
boxes after manually removing some addresses which are clearly not associated with the
150 users. [...] In addition, some of the time stamps in the original data are clearly invalid, occurring before Enron existed, so we restrict our attention to a period of 189 weeks, from 1998 through 2002"


}
\section{License}{
Creative Commons Attribution Share-Alike license 4.0
https://creativecommons.org/licenses/by-sa/4.0/
}

\source{
downloaded from \url{http://www.cis.jhu.edu/~parky/Enron/}
upstream source: \url{http://www.cs.cmu.edu/~enron/}
}
\references{
C.E. Priebe, J.M. Conroy, D.J. Marchette, and Y. Park, "Scan Statistics on Enron Graphs," Computational and Mathematical Organization Theory, Volume 11, Number 3, p229 - 247, October 2005, Springer Science+Business Media B.V.. \url{http://www.cis.jhu.edu/~parky/CEP-Publications/PCMP-CMOT2005.pdf}
}
\examples{
data(enronEmails)
enronKnownDates<-network.extract(enronEmails,onset=883612800,terminus=1024688419)
}
\keyword{datasets}
