\name{davisDyn}
\alias{davisDyn}
\alias{davisActorsDyn}
\docType{data}
\title{
dynamic versions of the Southern Women Data Set (Davis)
}
\description{
This is a data set of 18 women observed over a nine-month period. During that period, various subsets of these women had met in a series of 14 informal social events. The data recored which women met for which events. The data is originally from Davis, Gardner and Gardner (1941) via UCINET and stored as a \code{\link[networkDynamic]{networkDynamic}} object.  
}
\usage{
data("davisDyn")
data("davisActorDyn")
}

\format{
  a \code{\link[networkDynamic]{networkDynamic}} data object
}
\details{
This version includes event timings according to the chart extracted by Berger-Wolf from Davis, et al. stored as instantaneous events in numeric POSIX time. In both networks the vertices are marked as 'always active', although the actuall availibility for event membership is not known.  This version includes the two (overlapping) group classifications reported by Davis, et al. (via Freeman).  The name "Myra" is corrected from the latentnet version of the dataset.  

The \code{davisDyn} object is a bi-partite network relating the actors to the events. 

The \code{davisActorsDyn} is one-mode projection of the bipartite network to create a network of the women mutually connected by the events they attend. 



The documentation below is taken from Freeman (2003) in his usual lucid description. See the reference to the paper below:

In the 1930s, five ethnographers, Allison Davis, Elizabeth Stubbs Davis, Burleigh B. Gardner, Mary R. Gardner and J. G. St. Clair Drake, collected data on stratification in Natchez, Mississippi (Warner, 1988, p. 93). They produced the book cited below [DGG] that reported a comparative study of social class in black and in white society. One element of this work involved examining the correspondence between people's social class levels and their patterns of informal interaction. DGG was concerned with the issue of how much the informal contacts made by individuals were established solely (or primarily) with others at approximately their own class levels. To address this question the authors collected data on social events and examined people's patterns of informal contacts.

In particular, they collected systematic data on the social activities of 18 women whom they observed over a nine-month period. During that period, various subsets of these women had met in a series of 14 informal social events. The participation of women in events was uncovered using "interviews, the records of participant observers, guest lists, and the newspapers"" (DGG, p. 149). Homans (1950, p. 82), who presumably had been in touch with the research team, reported that the data reflect joint activities like, "a day's work behind the counter of a store, a meeting of a women's club, a church supper, a card party, a supper party, a meeting of the Parent-Teacher Association, etc."

This data set has several interesting properties. It is small and manageable. It embodies a relatively simple structural pattern, one in which, according to DGG, the women seemed to organize themselves into two more or less distinct groups. Moreover, they reported that the positions - core and peripheral - of the members of these groups could also be determined in terms of the ways in which different women had been involved in group activities. At the same time, the DGG data set is complicated enough that some of the details of its patterning are less than obvious. As Homans (1950, p. 84) put it, "The pattern is frayed at the edges." And, finally, this data set comes to us in a two-mode "woman by event" form. Thus, it provides an opportunity to explore methods designed for direct application to two-mode data. But at the same time, it can easily be transformed into two one-mode matrices (woman by woman or event by event) that can be examined using tools for one-mode analysis.

Because of these properties, this DGG data set has become something of a touchstone for comparing analytic methods in social network analysis. Davis, Gardner and Gardner presented an intuitive interpretation of the data, based in part on their ethnographic experience in the community. Then the DGG data set was picked up by Homans (1950) who provided an alternative intuitive interpretation. In 1972, Phillips and Conviser used an analytic tool, based on information theory, that provided a systematic way to reexamine the DGG data. Since then, this data set has been analyzed again and again. It reappears whenever any network analyst wants to explore the utility of some new tool for analyzing data.

}
\source{
This dataset was re-assembled from multiple sources:

Davis, A., Gardner, B. B. and M. R. Gardner (1941) Deep South, Chicago: The University of Chicago Press.

Breiger R. (1974). The duality of persons and groups. Social Forces, 53, 181-190

Linton C. Freeman (2003). Finding Social Groups: A Meta-Analysis of the Southern Women Data, In Ronald Breiger, Kathleen Carley and Philippa Pattison, eds. Dynamic Social Network Modeling and Analysis. Washington: The National Academies Press.  http://intersci.ss.uci.edu/wiki/pub/FreemanSouthernWomen85.pdf

Berger-Wolf, T. Y., & Saia, J. (2006). A framework for analysis of dynamic social networks. In Proceedings of the 12th ACM SIGKDD international conference on Knowledge discovery and data mining (pp. 523-528). ACM.  http://www.cs.unm.edu/~saia/papers/kdd.pdf

Krivitsky P and Handcock M (2015). _latentnet: Latent Position and Cluster Models for Statistical Networks_. The Statnet Project
(<URL: http://www.statnet.org>). R package version 2.7.1, <URL: http://CRAN.R-project.org/package=latentnet>.
}

\section{License}{
  Unknown. Based on original publication date, the data are believed to be public domain and have been previously widely circulated in various accademic sources. 
}

\examples{
data(davisDyn)
davisDyn

# convert the dates of the events from numeric seconds
as.POSIXlt(get.change.times(davisDyn),origin="1970-01-01")

data(davisActorsDyn)
davisActorsDyn
}
\keyword{datasets}
