\name{onlineNet}
\alias{onlineNet}
\alias{onlineNetwork}
\docType{data}
\title{
UCI Facebook-like Social Network
}
\description{
The Facebook-like Social Network originated from an online community for students at University of California, Irvine. The dataset includes the users that sent or received at least one message (1,899). A total number of 59,835 online messages were sent over 20,296 directed ties among these users over a period of six months.
}
\usage{data(onlineNet)}
\format{
The format is is a \link{networkDynamic} object.The \code{net.obs.period} network attribute describes an observation range from timestamp 1080101515 to 1098777142. The original dates and times were converted to POSIXct timestamps during import. The original time range is "2004-03-23 20:11:55" to "2004-10-26 00:52:22" 
}
\author{
Tore Opsahl; http://toreopsahl.com
}
\details{
This network is described in Patterns and Dynamics of Users' Behaviour and Interaction: Network Analysis of an Online Community and used in a number of articles including Prominence and control: The weighted rich-club effect and Clustering in weighted networks. Although this dataset contains many nodal attributes (e.g., gender, age, and course attended), these are not made available as it would be possible to reverse engineer the anonymisation procedure of users. Self-loops in the original longitudinal edgelist signal the time that users registered on the site, these have been converted into vertex onset times and removed.

As this dataset excludes isolated vertices, for analyses involving degree distributions it may be desirable to add them back in. There were a total of 2595 users that logged in at least once -- and 2995 users that filled in the registration form (might not have validated their email etc). 

This dataset is also included in the CRAN package \code{tnet}.
}
\source{
\url{http://toreopsahl.com/datasets/#online_social_network}
}
\references{
Opsahl, T., Panzarasa, P., 2009. Clustering in weighted networks. Social Networks 31 (2), 155-163, doi: 10.1016/j.socnet.2009.02.002

Panzarasa, P., Opsahl, T., Carley, K.M., 2009. Patterns and dynamics of users' behavior and interaction: Network analysis of an online community. Journal of the American Society for Information Science and Technology 60 (5), 911-932

\url{http://toreopsahl.com/2009/03/06/article-patterns-and-dynamics-of-users-behaviour-and-interaction-network-analysis-of-an-online-community/}
}
\examples{
data(onlineNetwork)

# convert timestamp to human-readable
as.POSIXct(1080101515,origin = "1970-01-01")

# plot number in network over time
plot(sapply(seq(from=1080101515, to=1098777142,length.out=100),
      function(t){
        network.size.active(onlineNet,at=t)
       }
       ),ylab= '# members'
)

}
\keyword{datasets}
