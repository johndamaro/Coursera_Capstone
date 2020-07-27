#
# John D'Amaro
# Coursera Capstone
# IBM Data Science Professional Certificate
#

library(dplyr)
library(tidyr)
library(ggplot2)
library(treemap)

setwd("C:\\Users\\manst\\Desktop\\Coursera\\Coursera_Capstone\\")

mostcommon <- read.csv("mostcommon.csv", sep = ",", header = TRUE, stringsAsFactors = FALSE)

names(mostcommon)[names(mostcommon) == "X1st.Most.Common.Venue"] <- "Most_Common"
names(mostcommon)[names(mostcommon) == "Cluster.Labels"] <- "Cluster_Labels"

### Correcting Cluster Labels
mostcommon["Cluster_Labels"] <- mostcommon["Cluster_Labels"] + 1

#ggplot(mostcommon, aes(x = mostcommon$Cluster_Labels, y = mostcommon$Count, fill = mostcommon$Most_Common)) + 
#  geom_bar(stat="identity", width = 1)

p <- treemap(mostcommon,
             # data
             index=c("Cluster_Labels", "Most_Common"),
             vSize="Count",
             type="index",
             
             # Main
             title="Most Common Venues for each Cluster",
             palette="Paired",
             
             # Borders:
             border.col=c("black", "white", "black"),             
             border.lwds=c(4,2,1),                     
             
             # Labels
             fontsize.labels=c(16, 10, 8),
             fontcolor.labels=c("black", "white", "white"),
             fontface.labels=2,            
             bg.labels=c("transparent"),              
             align.labels=list( c("center", "center"), c("left", "top"), c("center", "center")), 
             overlap.labels=0)