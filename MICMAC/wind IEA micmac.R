

##
# Analyzing the micmac scores for the wind IEA model #####################################
##


dat = read.csv("wind model micmac scores.csv")

head(dat)


dat$Type <- factor(dat$Type, levels = c("Driver", 
                                        "Pressure", 
                                        "State Change", 
                                        "Impact to Ecosystem Services",
                                        "Management or Policy Response"))

dat = dat[rowSums(dat[, c(3,4)] == 0) < 2,]


library(ggplot2)
library(labeling)
library(ggrepel)
ggplot(data = dat, aes(x = micmac.exposure, y = micmac.influence,  color = Type)) + 
  geom_point(size=3) + 
  scale_colour_manual(values = c("#FC8D62", "#8DA0CB", "#E78AC3", "#A6D853", "#FFD92F")) +
  geom_text_repel(aes(label = Label), color = "black", size = 2.5, max.overlaps = 50) +
  #geom_text(aes(label = Label), color = "black", 
  #          position = "jitter", hjust=0.6, vjust=1.1, size = 2.5) +
  labs(title = "Micmac scores IEA Wind model", x = "Micmac exposure", y = "Micmac influence") +
  theme_minimal() +
  geom_vline(xintercept = 0.5) + geom_hline(yintercept = 0.5)
