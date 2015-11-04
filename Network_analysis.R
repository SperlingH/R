# Creation date: 
#   2015-11-02
# Created by: 
#   HS
# Objective: 
#   function for network analysis
# Usage: 
#   plot.network.from.df(df.1, titel, v.interactive = F)
# Input: 
#     df.1: data.frame of interaction pairs
#     nodeinfo: data.frame with "Node" and "Class" of Nodes
#     titel: titel of plot
#     v.interactive: set plot to interactive (T) to move nodes, default is (F)
# Output:
#   plot of network interactions


plot.network.from.df <- function (df.1, titel, nodeinfo, v.interactive = F){
  require(network)
df.netw.2 <- network(df.1, 
                     directed=F,
                     loops = F,
                     multiple = T,
                     bipartite = F)
plot(df.netw.2,
     main=titel,
     vertex.col=nodeinfo$Class,
     interactive = v.interactive,
     jitter = TRUE,
     usearrows = FALSE,
     displaylabels = TRUE,
     label.cex = .7
     )
}

#example data
df.1 <- data.frame(V1 = c("A","A","A","A","B","B","C","D"), 
                   V2 = c("B","C","D","E","A","C","D","E"))
nodeinfo <- data.frame(Node = c("A","B","C","D","E"),
                       Class = c("1","2","1","2","3"))
titel = "Network analysis titel"
plot.network.from.df(df.1, titel, nodeinfo)
