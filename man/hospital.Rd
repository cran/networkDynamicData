\name{hospital}
\alias{hospital}
\alias{hospital_contact}
\docType{data}
\title{
Hospital ward dynamic contact network
}
\description{
This dataset contains the SocioPatterns temporal network of contacts between patients, patients and health-care workers (HCWs) and among HCWs in a hospital ward in Lyon, France, from Monday, December 6, 2010 at 1:00 pm to Friday, December 10, 2010 at 2:00 pm. The study included 46 HCWs and 29 patients.
}
\usage{data(hospital)}
\format{
  The format is is a \link{networkDynamic} object.
  The network contains the vertex attribute \code{role} with the values: 
  \itemize{
  \item \code{'NUR'}=paramedical staff, i.e. nurses and nurses' aides; 
  \item \code{'PAT'}=Patient; 
  \item \code{'MED'}=Medical doctor; 
  \item \code{'ADM'}=administrative staff
  }
  The \code{net.obs.period} network attribute describes an observation range from 120 to 347640 seconds.  Observations are discrete 20-second intervals. 
}
\details{
The details below are excerpted from the paper describing the dataset:

\subsection{Study Design and Data Collection}{
Data were collected in a short stay geriatric unit (19 beds) of a
university hospital of almost 1000 beds [3] in Lyon, France, from
Monday, December 6, 2010 at 1:00 pm to Friday, December 10,
2010 at 2:00 pm. During that time, 50 professional staff worked in
the unit and 31 patients were admitted. We collected data on the
contacts between 46 staff members (92\% participation rate) and 29
patients (94\% participation rate). The participating staff members
were 27 nurses or nurses' aides, 11 medical doctors and 8
administrative staff.

In the ward, all rooms but 2 were single-bed rooms. Each day 2
teams of 2 nurses and 3 nurses' aides worked in the ward: one of
the teams was present from 7:00 am to 1:30 pm and the other
from 1:30 pm to 8:00 pm. An additional nurse and an additional
nurse' aid were moreover present from 9:00 am to 5:00 pm. Two
nurses were present during the nights from 8:00 pm to 7:00 am. In
addition, a physiotherapist and a nutritionist were present each
day at various points in time, with no fixed schedule, and a social
counselor and a physical therapist visited on demand (in our
analysis they are considered as nurses). Two physicians and 2
interns were present from 8:00 am to 17:00 pm each day. Visits
were allowed from 12:00 am to 8:00 pm but visitors were not
included in the study.

The measurement system, developed by the SocioPatterns
collaboration, is based on small active RFID devices (``tag'')
that are embedded in unobtrusive wearable badges and exchange
ultra-low-power radio packets. The power level is
tuned so that devices can exchange packets only when located
within 1-1.5 meters of one another, i.e., package exchange is used
as a proxy for distance (the tags do not directly measure distances).
Individuals were asked to wear the devices on their chests using
lanyards, ensuring that the RFID devices of two individuals can
only exchange radio packets when the persons are facing each
other, as the human body acts as a RF shield at the frequency used
for communication. In summary the system is tuned so that it
detects and records close-range encounters during which a
communicable disease infection could be transmitted, for example,
by cough, sneeze or hand contact. The information on face-to-face
proximity events detected by the wearable sensors is relayed to
radio receivers installed throughout the hospital ward (bedrooms,
offices and hall).

The system was tuned so that whenever two individuals wearing
the RFID tags were in face-to-face proximity the probability to
detect such a proximity event over an time interval of 20 seconds
was larger than 99\%. We therefore define two individuals to be in
``contact'' during a 20-second interval if and only if their sensors
exchanged at least one packet during that interval. A contact is
therefore symmetric by definition, and in case of contacts involving
three or more individuals in the same 20-second interval, all the
contact pairs were considered. After the contact is established, it is
considered ongoing as long as the devices continue to exchange at
least one packet for every subsequent 20 s interval. Conversely, a
contact is considered broken if a 20-second interval elapses with no
exchange of packets. We emphasize that this is an operational
definition of the human proximity behavior that we choose to
quantify, and that all the results we present correspond to this
precise and specific definition of ``contact''. We make the raw data 
we collected available to the public as Datasets S1-S5 in File S1
and on the website of the SocioPatterns collaboration (www.
sociopatterns.org).
}

\subsection{Terms and conditions}{
The data are distributed to the public under a Creative Commons Attribution-NonCommercial-ShareAlike license \url{http://creativecommons.org/licenses/by-nc-sa/3.0/}. When this data is used in published research or for visualization purposes, please cite the following paper: P. Vanhems et al., Estimating Potential Infection Transmission Routes in Hospital Wards Using Wearable Proximity Sensors, PLoS ONE 8(9): e73970 (2013). Please also acknowledge the SocioPatterns collaboration and provide a link to \url{http://www.sociopatterns.org}.
}
}

\author{
Philippe Vanhems, Alain Barrat, Ciro Cattuto, Jean-Francois Pinton, Nagham Khanafer,
Corinne Regis, Byeul-a Kim, Brigitte Comte, Nicolas Voirin.  info@sociopatterns.org
}
\source{
\url{http://www.sociopatterns.org/datasets/hospital-ward-dynamic-contact-network/}
\url{http://www.plosone.org/article/info\%3Adoi\%2F10.1371\%2Fjournal.pone.0073970}
}

\references{
P. Vanhems et al., Estimating Potential Infection Transmission Routes in Hospital Wards Using Wearable Proximity Sensors, PLoS ONE 8(9): e73970 (2013). \url{http://www.plosone.org/article/info\%3Adoi\%2F10.1371\%2Fjournal.pone.0073970}
}
\examples{
data(hospital_contact)

# get an overview of temporal density
plot(table(get.edge.activity(hospital,as.spellList=TRUE)[,1]),
xlab='time',ylab='activity count',col="#00000055")

# define a mapping of roles to colors
rolecolors<-function(roles){
  roles[roles=='NUR']<-'blue'
  roles[roles=='PAT']<-'gray'
  roles[roles=='MED']<-'green'
  roles[roles=='ADM']<-'orange'
  return(roles)
}

# network plot aggregating across all days
slice<-network.collapse(hospital,rm.time.info=FALSE)
plot(slice,vertex.col=rolecolors(slice\%v\%'role'),
  edge.lwd=slice\%e\%'activity.duration'/300,edge.col='#00000044')
  
# plot one hour of interaction
plot(network.extract(hospital,onset=160000,terminus=163600),
vertex.cex=0.5,vertex.col=rolecolors(hospital\%v\%'role'))

}
\keyword{datasets}
