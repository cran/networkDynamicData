\name{concurrencyComparisonNets}
\alias{concurrencyComparisonNets}
\alias{base}
\alias{middle}
\alias{monog}
\docType{data}
\title{
A synthetic dataset of three simulated dynamic networks with epidemic spread.
}
\description{
Three single-mode undirected dynamic networks with an infection started from a single seed, The networks were simulated using the tergm and EpiModel packages. All three networks have the same size, relationship duration distribution and cross-sectional mean degree,  but different cross-sectional degree distributions. They are intended as examples for 
illustrating and comparing the effects of concurrent overlapping partnerships on the connectivity and dynamic transmission potential of networks.  
}
\usage{data(concurrencyComparisonNets)}
\format{
  Three \code{networkDynamic} objects
  \describe{
    \item{\code{base}}{a dynamic network with a poisson cross-sectional degree distribution}
    \item{\code{middle}}{a dynamic network with half the fraction of persons with degree > 1 (having concurrent partners), compared to the base network}
    \item{\code{monog}}{a dynamic network with a bernoulli (0,1) cross-sectional degree distribution}
  }
}
\details{
Each network has the following shared characteristics:  1000 nodes, 100
timesteps, a cross-sectional mean degree that varies stochastically around 0.75,
and an exponential relationship duration distribution with a mean of 25
timesteps (due to censoring effects, the naive mean duration calculation
using all observed partnerships will be around 20).  The only difference in
the three networks is the cross-sectional degree distribution, varying from
Bernoulli (monog) to Poisson (base), which represent a range from strict serial
monogamy in partnerships, to the levels of concurrency that would be
present if partnerships are formed independently, without regard for
any existing partnerships (an Erdos-Renyi graph). This is accomplished 
by modifying the the formation model of the STERGM used to simulate 
edge dynamics (see accompanying code for details).

After simulating the dynamic network, a trivial disease simulation is
implemented from a single seed in each network, with transmission
probability set to 1.0.  For each discordant partnership formed,
transmission is therefore guaranteed in one timestep, and the infections
trace out the size of a forward-reachable component in each network.
Note that because the dynamic network is simulated in its entirety first,
this implies the partnership formation/dissolution process is independent
of the disease state of the node and the network.

Each network has a dynamic 'status' nodal attribute indicating the
infection status of each node at each timestep in each network.  Comparison of the
prevalence and trajectories of the status variable provide insight into the
impact of concurrent partnerships on network connectivity and
transmission potential. Note that the first infected state does not occur until time 2. 

The networks were simulated using the EpiModel package and the code below.

\subsection{Terms and Conditions}{
The concurrencyComparisonNets data are provided under the tergms of the Creative Commons Attribution 3.0 License: \url{http://creativecommons.org/licenses/by/3.0/us/}  

Please cite the dataset authors and the networkDynamicData package (\code{citation(package='networkDynamicData')}) with any redistribution or published use of this data. 

}
}
\author{
Martina Morris \email{morrism@uw.edu} and Li Wang \email{lxwang@gmail.com}
}

\source{
\url{https://statnet.org}
}
\references{
Morris M., Kurth A., Hamilton D.T., Moody J., and Wakefield S., for The Network Modeling Group (2009) "Concurrent Partnerships and HIV Prevalence Disparities by Race: Linking Science and Public Health Practice" \emph{American Journal of Public Health} 1023-1031, Vol 99, No. 6 

Jenness S, Goodreau S, Wang L and Morris M (2014). \emph{EpiModel: Mathematical Modeling of Infectious Disease}. The Statnet Project
(\url{https://statnet.org}). R package version 0.95, \url{https://CRAN.R-project.org/package=EpiModel}.
}


\examples{
data(concurrencyComparisonNets)

\dontrun{

# compare plots of each network at time 50
plot(network.extract(base,at=50),vertex.cex=0.5,edge.lwd=2)
plot(network.extract(monog,at=50),vertex.cex=0.5,edge.lwd=2)
plot(network.extract(middle,at=50),vertex.cex=0.5,edge.lwd=2)

# compare mean duration. These are at ~20, due to censoring
mean(as.data.frame(base)$duration)
mean(as.data.frame(middle)$duration)
mean(as.data.frame(monog)$duration)

# compare infection time series

plot(sapply(1:100,function(t){
    sum(get.vertex.attribute.active(base,'status',at=t)==1)
  }),col='black',xlab='time step', ylab='# infected'
)
points(sapply(1:100,function(t){
     sum(get.vertex.attribute.active(monog,'status',at=t)==1)
   }),col='blue')
points(sapply(1:100,function(t){
     sum(get.vertex.attribute.active(middle,'status',at=t)==1)
   }),col='red')
}   

## The code below can be used generate the three example networks using EpiModel (v1.1.2)
## note that the networks have some attached simulation control variables deleted before 
## being saved as the datasets. More recent versions of EpiModel use a different
## representation of the infection status variable. 

\dontrun{

library(EpiModel)

# === example network parameters setup ===

params.base = list(
  sim.length = 100,
  size = 1000,
  mean.deg = .75,
  mean.rel.dur = 25,
  
  net = network.initialize(1000, directed = F),
  formation = ~edges,
  dissolution = ~offset(edges)
)

params.middle = list(
  sim.length = 100,
  size = 1000,
  mean.deg = .75,
  mean.rel.dur = 25,
  
  net = network.initialize(1000, directed = F),
  formation = ~edges+concurrent,
  dissolution = ~offset(edges),
  targets = 90  # concurrent = 90
)

params.monog = list(
  sim.length = 100,
  size = 1000,
  mean.deg = .75,
  mean.rel.dur = 25,
  
  net = network.initialize(1000, directed = F),
  formation = ~edges+concurrent,
  dissolution = ~offset(edges),
  targets = 0  # concurrent = 0
)


# === function for estimating stergm, simulating network, and simulating epidemic ===

net.init <- function(params, nsims, adjust=F) {
  for (name in names(params)) assign(name, params[[name]])
  
  message('network init')
  
  # generate initial network (defaults if not specified in params)
  if (!exists('net', inherits=F)) {
    net <- network.initialize(size,directed=F)
    net
  }
  if (!exists('formation', inherits=F)) {
    formation = ~edges
  }
  if (!exists('dissolution', inherits=F)) {
    dissolution = ~offset(edges)
  }
  
  if (!is.null(mean.deg)) {
    target.edges <- size/2 * mean.deg
    density = target.edges / choose(size,2)
  } else {
    target.edges <- round(density*choose(size, 2))
  }
  print(target.edges)
  
  # cludge to fix the monogamy bias in simulate
  if (adjust) target.edges = target.edges*adjust
  
  # target stats that does not include edges
  if (exists('targets', inherits=F)) {
    target.stats = c(target.edges, targets)
  } else {
    target.stats = target.edges
  }
  
  coef.diss <- dissolution_coefs(dissolution, mean.rel.dur)
  
  # estimate the stergm
  
  net.est = netest(net, formation, dissolution, target.stats, coef.diss
                       ,set.control.ergm=control.ergm(MCMLE.maxit=200))
  
  stats.form = update(formation, ~.+concurrent)
  
  # simulate the dynamic network
  #net.sim = netsim(net.est, nsteps = sim.length, nsims=nsims, stats.form=stats.form,
  #                        control = control.simulate.network(MCMC.burnin.add=10))
        
  # simulate the network dynamics and the epidemic      
  net.sim = netsim(net.est, 
                   param.net(inf.prob=1),
                   init.net(i.num=1),
                   control.net(type='SI',
                               nsteps = sim.length, 
                               nsims=nsims,
                               keep.network = TRUE)
                   )
                               
  
  
  
  #trans.sim = epiNet.simTrans(net.sim, "SI", vital=FALSE, i.num=1, trans.rate=1, tea=TRUE)
  
  #print(summary(net.sim$stats[[1]]))
  #plot(net.sim$stats[[1]][,'edges'], ylab='edges', xlab='time')
  
  return(get_network(net.sim, sim = 1))
}


# === simulate example networks ===

base <- net.init(params.base, 1)

middle <- net.init(params.middle, 1)

monog <- net.init(params.monog, 1)

}

}
\keyword{datasets}
