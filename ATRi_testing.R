getwd() #see working directory
"/Users/meghanfrederick"
setwd('/Users/meghanfrederick/Desktop/') #set working directory
library(ggplot2)
display.brewer.all() #display color brewer palettes
library(RColorBrewer)
view ('atri1')

# This github stuff is really fun :)
  
atri1 <- read.delim('ATRi_testing_R.txt')
#plot gH2AX foci
b <- ggplot(data=atri1, aes(x=Treatment, y=gH2AX_Foci)) + #data for boxplot and define x and y variable
  geom_boxplot(aes(fill = as.factor(Treatment)), outlier.shape = NA, alpha = 0.3) + #make boxplot and color by treatment, remove outlier and alpha adjust opacity of color (1 is 100% opacity)
  facet_wrap(.~Antibody, scales='free')+ #plotting 2 variable(gH2AX and AQR on diffent sclaes)
  geom_jitter(aes(color = as.factor(Treatment)), size = 1.2) + #add data points, color by treatment and change size
  theme_classic()+ #ggplot2 classic theme
  ylab('gH2AX foci per cell') + xlab('') + theme(legend.position='none')+ #label y axis and no label on x axis
  scale_x_discrete (limits = c('DMSO2ul', 'DMSO3ul', 'PB', 'VE821', 'VE821+PB', 'VE822', 'VE822+PB', 'AZD', 'AZD+PB',))+ ylim(0, 25)
  scale_fill_brewer(palette = "Set2")
  
c <- ggplot(data=atri1, aes(x=Treatment, y=CTCF)) + #data for boxplot and define x and y variable
  geom_boxplot(aes(fill = as.factor(Treatment)), outlier.shape = NA, alpha = 0.3) + #make boxplot and color by treatment, remove outlier and alpha adjust opacity of color (1 is 100% opacity)
  facet_wrap(.~Antibody, scales='free')+ #plotting 2 variable(gH2AX and AQR on diffent sclaes)
  geom_jitter(aes(color = as.factor(Treatment)), size = 1.2) + #add data points, color by treatment and change size
  theme_classic()+ #ggplot2 classic theme
  ylab('Total intensity per nuclear area') + xlab('') + theme(legend.position='none')+ #label y axis and no label on x axis
  scale_x_discrete (limits = c('DMSO2ul', 'DMSO3ul', 'PB', 'VE821', 'VE821+PB', 'VE822', 'VE822+PB', 'AZD', 'AZD+PB'))+ ylim(0,150)+
  scale_fill_brewer(palette = "Set2")

#means gH2AX foci
mean(atri1[which(atri1$Treatment == "DMSO2ul" & atri1$Antibody == "gH2AX"),]$gH2AX_Foci)
mean(atri1[which(atri1$Treatment == "DMSO3ul" & atri1$Antibody == "gH2AX"),]$gH2AX_Foci)
mean(atri1[which(atri1$Treatment == "PB" & atri1$Antibody == "gH2AX"),]$gH2AX_Foci)
mean(atri1[which(atri1$Treatment == "VE821" & atri1$Antibody == "gH2AX"),]$gH2AX_Foci)
mean(atri1[which(atri1$Treatment == "VE821+PB" & atri1$Antibody == "gH2AX"),]$gH2AX_Foci)
mean(atri1[which(atri1$Treatment == "VE822" & atri1$Antibody == "gH2AX"),]$gH2AX_Foci)
mean(atri1[which(atri1$Treatment == "VE822+PB" & atri1$Antibody == "gH2AX"),]$gH2AX_Foci)
mean(atri1[which(atri1$Treatment == "AZD" & atri1$Antibody == "gH2AX"),]$gH2AX_Foci)
mean(atri1[which(atri1$Treatment == "AZD+PB" & atri1$Antibody == "gH2AX"),]$gH2AX_Foci)
#means gH2AX intensity
mean(atri1[which(atri1$Treatment == "DMSO2ul" & atri1$Antibody == "gH2AX"),]$CTCF)
mean(atri1[which(atri1$Treatment == "DMSO3ul" & atri1$Antibody == "gH2AX"),]$CTCF)
mean(atri1[which(atri1$Treatment == "PB" & atri1$Antibody == "gH2AX"),]$CTCF)
mean(atri1[which(atri1$Treatment == "VE821" & atri1$Antibody == "gH2AX"),]$CTCF)
mean(atri1[which(atri1$Treatment == "VE821+PB" & atri1$Antibody == "gH2AX"),]$CTCF)
mean(atri1[which(atri1$Treatment == "VE822" & atri1$Antibody == "gH2AX"),]$CTCF)
mean(atri1[which(atri1$Treatment == "VE822+PB" & atri1$Antibody == "gH2AX"),]$CTCF)
mean(atri1[which(atri1$Treatment == "AZD" & atri1$Antibody == "gH2AX"),]$CTCF)
mean(atri1[which(atri1$Treatment == "AZD+PB" & atri1$Antibody == "gH2AX"),]$CTCF)