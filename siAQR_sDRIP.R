install.packages('ggplot2') #install ggplot2

getwd() #see working directory
"/Users/meghanfrederick"
setwd('/Users/meghanfrederick/Desktop/') #set working directory

"/Users/meghanfrederick/Desktop"

display.brewer.all() #display color brewer palettes
library(RColorBrewer)
 
siAQR1 <- read.delim('siAQR attempt1.txt', header = TRUE)
  View(siAQR1)
  head(siAQR1)
  dim(siAQR1)

siAQR2 <- read.delim('siAQR_attempt2_IF_data_R.txt', header = TRUE) #open file

siAQR3 <- read.delim('siAQR_attempt3_R.txt', header = TRUE) #open file
  View(siAQR3)

siAQR3_foci <- read.delim('siAQR_attempt3_foci_R.txt', header = TRUE) #open file 
  View(siAQR3_foci)
  
siAQR4 <- read.delim('siAQR_attempt4_analysis_R.txt', header = TRUE) #open file
  
siAQR5 <- read.delim('siAQR_optimization_R.txt', header = TRUE)
  View(siAQR5)
  head(siAQR5)
  
siAQR6 <- read.delim('siAQR_lipo_v_dharma_r.txt')
View(siAQR6)
head('siAQR_attempt2_IF_data_R.txt')
View('siAQR_attempt2_IF_data_R.txt')

siAQR7 <- read.delim('siAQR_DRIP1_R.txt')



#combine data sets
combined_data <- merge(siAQR7,siAQR4)
View(combined_data)
head(combined_data)
library(ggplot2)

#plot boxplot
color_palette <- c('#88419d', '#8c96c6', '#b3cde3') #hex color codes for palette
color_palette_9 <- c('#cab2d6', '#ff7f00', '#e31a1c','#33a02c','#1f78b4','#fdbf6f', '#fb9a99', '#b2df8a', '#a6cee3')
a <- ggplot(data=siAQR2, aes(x=Treatment, y=CTCF)) + #data for boxplot and define x and y variable
  geom_boxplot(aes(fill = as.factor(Treatment)), outlier.shape = NA, alpha = 0.5) + #make boxplot and color by treatment, remove outlier and alpha adjust opacity of color (1 is 100% opacity)
  facet_wrap(.~Antibody, scales='free')+ #plotting 2 variable(gH2AX and AQR on diffent sclaes)
  geom_jitter(aes(color = as.factor(Treatment)), size = 1.2) + #add data points, color by treatment and change size
  theme_classic()+ #ggplot2 classic theme
  ylab('Total intensity per nuclear area') + xlab('') + theme(legend.position='none')+ #label y axis and no label on x axis
  scale_x_discrete (limits = c('ETO 20uM 4H', 'siCTRL 25 nM 48H', 'siAQR 25nM 48H'), labels = c('ETO', 'siCTRL', 'siAQR'))+ #re-order conditions and re-label conditions
  scale_fill_manual(values = color_palette)+ scale_color_manual(values = color_palette)

b <- ggplot(data=siAQR1, aes(x=Treatment, y=CTCF.per.area)) + #data for boxplot and define x and y variable
  geom_boxplot(aes(fill = as.factor(Treatment)), outlier.shape = NA, alpha = 0.5) + #make boxplot and color by treatment, remove outlier and alpha adjust opacity of color (1 is 100% opacity)
  facet_wrap(.~Antibody, scales='free')+ #plotting 2 variable(gH2AX and AQR on diffent sclaes)
  geom_jitter(aes(color = as.factor(Treatment)), size = 1.2) + #add data points, color by treatment and change size
  theme_classic()+ #ggplot2 classic theme
  ylab('Total intensity per nuclear area') + xlab('') + theme(legend.position='none')+ #label y axis and no label on x axis
  scale_x_discrete (limits = c('ETO', 'siCTRL', 'siAQR'))+
  scale_fill_manual(values = color_palette)+ scale_color_manual(values = color_palette)

c <- ggplot(data=siAQR3, aes(x=Treatment, y=CTCF)) + #data for boxplot and define x and y variable
  geom_boxplot(aes(fill = as.factor(Treatment)), outlier.shape = NA, alpha = 0.5) + #make boxplot and color by treatment, remove outlier and alpha adjust opacity of color (1 is 100% opacity)
  facet_wrap(.~Antibody, scales='free')+ #plotting 2 variable(gH2AX and AQR on diffent sclaes)
  geom_jitter(aes(color = as.factor(Treatment)), size = 1.2) + #add data points, color by treatment and change size
  theme_classic()+ #ggplot2 classic theme
  ylab('Total intensity per nuclear area') + xlab('') + theme(legend.position='none')+ #label y axis and no label on x axis
  scale_x_discrete (limits = c('ETO', 'siCTRL', 'siAQR'))+
  scale_fill_manual(values = color_palette)+ scale_color_manual(values = color_palette)

g <- ggplot(data=siAQR4, aes(x=Treatment, y=CTCF)) + #data for boxplot and define x and y variable
  geom_boxplot(aes(fill = as.factor(Treatment)), outlier.shape = NA, alpha = 0.5) + #make boxplot and color by treatment, remove outlier and alpha adjust opacity of color (1 is 100% opacity)
  facet_wrap(.~Antibody, scales='free')+ #plotting 2 variable(gH2AX and AQR on diffent sclaes)
  geom_jitter(aes(color = as.factor(Treatment)), size = 1.2) + #add data points, color by treatment and change size
  theme_classic()+ #ggplot2 classic theme
  ylab('Total intensity per nuclear area') + xlab('') + theme(legend.position='none')+ #label y axis and no label on x axis
  scale_x_discrete (limits = c('ETO', 'siCTRL', 'siAQR'))+
  scale_fill_manual(values = color_palette)+ scale_color_manual(values = color_palette)

#plot by foci
h <- ggplot(data=siAQR4, aes(x=Treatment, y=gH2AX_Foci)) + #data for boxplot and define x and y variable
  geom_boxplot(aes(fill = as.factor(Treatment)), outlier.shape = NA, alpha = 0.5) + #make boxplot and color by treatment, remove outlier and alpha adjust opacity of color (1 is 100% opacity)
  facet_wrap(.~Antibody, scales='free')+ #plotting 2 variable(gH2AX and AQR on diffent sclaes)
  geom_jitter(aes(color = as.factor(Treatment)), size = 1.2) + #add data points, color by treatment and change size
  theme_classic()+ #ggplot2 classic theme
  ylab('Total intensity per nuclear area') + xlab('') + theme(legend.position='none')+ #label y axis and no label on x axis
  scale_x_discrete (limits = c('ETO', 'siCTRL', 'siAQR'))+
  scale_fill_manual(values = color_palette)+ scale_color_manual(values = color_palette)

i <- ggplot(data=siAQR5, aes(x=Treatment, y=CTCF)) + #data for boxplot and define x and y variable
  geom_boxplot(aes(fill = as.factor(Treatment)), outlier.shape = NA, alpha = 0.5)+ #make boxplot and color by treatment, remove outlier and alpha adjust opacity of color (1 is 100% opacity)
  facet_wrap(.~Antibody, scales='free')+ #plotting 2 variable(gH2AX and AQR on different scales)
  geom_jitter(aes(color = as.factor(Treatment)), size = 1.2) + #add data points, color by treatment and change size
  theme_classic()+ #ggplot2 classic theme
  ylab('Total intensity per nuclear area') + xlab('') + theme(legend.position='none')+#label y axis and no label on x axis
  scale_x_discrete(limits = c('ETO', 'siAQR1F', 'siCTRL1F', 'siAQR1R', 'siCTRL1R', 'siAQR1R1F','siCTRL1R1F', 'siAQR2R','siCTRL2R'))+
  scale_fill_manual(values = color_palette_9)+ scale_color_manual(values = color_palette_9)+ylim()

j <- ggplot(data=siAQR5, aes(x=Treatment, y=gH2AX_Foci))+ #data for boxplot and define x and y variable
  geom_boxplot(aes(fill = as.factor(Treatment)), outlier.shape = NA, alpha = 0.5) + #make boxplot and color by treatment, remove outlier and alpha adjust opacity of color (1 is 100% opacity)
  geom_jitter(aes(color = as.factor(Treatment)), size = 1.2) + #add data points, color by treatment and change size
  theme_classic()+ #ggplot2 classic theme
  ylab('gH2AX foci per cell') + xlab('') + theme(legend.position='none')+
  scale_x_discrete(limits = c('ETO', 'siAQR1F', 'siCTRL1F', 'siAQR1R', 'siCTRL1R', 'siAQR1R1F','siCTRL1R1F', 'siAQR2R','siCTRL2R'))+
  scale_fill_manual(values = color_palette_9)+ scale_color_manual(values = color_palette_9)+ylim(0,20)

#comparison of lipo and dharma
k <- ggplot(data=siAQR6, aes(x=Treatment, y=CTCF)) + #data for boxplot and define x and y variable
  geom_boxplot(aes(fill = as.factor(Treatment)), outlier.shape = NA, alpha = 0.5) + #make boxplot and color by treatment, remove outlier and alpha adjust opacity of color (1 is 100% opacity)
  facet_wrap(.~Antibody, scales='free')+ #plotting 2 variable(gH2AX and AQR on diffent sclaes)
  geom_jitter(aes(color = as.factor(Treatment)), size = 1.2) + #add data points, color by treatment and change size
  theme_classic()+ #ggplot2 classic theme
  ylab('Total intensity per nuclear area') + xlab('') + theme(legend.position='none')+ #label y axis and no label on x axis
  scale_x_discrete (limits = c('siCTRLD', 'siAQRD', 'siAQRL'))+
  scale_fill_manual(values = color_palette)+ scale_color_manual(values = color_palette)

l <- ggplot(data=siAQR6, aes(x=Treatment, y=gH2AX_Foci)) + #data for boxplot and define x and y variable
  geom_boxplot(aes(fill = as.factor(Treatment)), outlier.shape = NA, alpha = 0.5) + #make boxplot and color by treatment, remove outlier and alpha adjust opacity of color (1 is 100% opacity)
  geom_point(aes(color = as.factor(Treatment)), size = 1.2, position = position_jitter(w = 0.3, h = 0)) + #add data points, color by treatment and change size
  theme_classic()+ #ggplot2 classic theme
  ylab('gH2AX foci per cell') + xlab('') + theme(legend.position='none')+ #label y axis and no label on x axis
  scale_x_discrete (limits = c('siCTRLD', 'siAQRD', 'siAQRL'))+
  scale_fill_manual(values = color_palette)+ scale_color_manual(values = color_palette)

#stats for lipo v dharma
mean(siAQR6[which(siAQR6$Treatment == "siCTRLD" & siAQR6$Antibody == "AQR"),]$CTCF) #average for siCTRL AQR intensity
mean(siAQR6[which(siAQR6$Treatment == "siAQRD" & siAQR6$Antibody == "AQR"),]$CTCF) #average for siAQR intensity
mean(siAQR6[which(siAQR6$Treatment == "siAQRL" & siAQR6$Antibody == "AQR"),]$CTCF)

wilcox.test(siAQR6[which(siAQR6$Treatment == "siCTRLD" & siAQR6$Antibody == "gH2AX"),]$CTCF, siAQR6[which(siAQR6$Treatment == "siAQRD" & siAQR6$Antibody == "gH2AX"),]$CTCF)$p.value/2
wilcox.test(siAQR6[which(siAQR6$Treatment == "siCTRLD" & siAQR6$Antibody == "gH2AX"),]$CTCF, siAQR6[which(siAQR6$Treatment == "siAQRL" & siAQR6$Antibody == "gH2AX"),]$CTCF)$p.value/2
wilcox.test(siAQR6[which(siAQR6$Treatment == "siAQRD" & siAQR6$Antibody == "gH2AX"),]$CTCF, siAQR6[which(siAQR6$Treatment == "siAQRL" & siAQR6$Antibody == "gH2AX"),]$CTCF)$p.value/2

wilcox.test(siAQR6[which(siAQR6$Treatment == "siCTRLD" & siAQR6$Antibody == "gH2AX"),]$gH2AX_Foci, siAQR6[which(siAQR6$Treatment == "siAQRD" & siAQR6$Antibody == "gH2AX"),]$gH2AX_Foci)$p.value/2
wilcox.test(siAQR6[which(siAQR6$Treatment == "siCTRLD" & siAQR6$Antibody == "gH2AX"),]$gH2AX_Foci, siAQR6[which(siAQR6$Treatment == "siAQRL" & siAQR6$Antibody == "gH2AX"),]$gH2AX_Foci)$p.value/2
wilcox.test(siAQR6[which(siAQR6$Treatment == "siAQRD" & siAQR6$Antibody == "gH2AX"),]$gH2AX_Foci, siAQR6[which(siAQR6$Treatment == "siAQRL" & siAQR6$Antibody == "gH2AX"),]$gH2AX_Foci)$p.value/2

#DRIP1
#AQR+gH2AX intensity
m <- ggplot(data=siAQR7, aes(x=Treatment, y=CTCF)) + #data for boxplot and define x and y variable
  geom_boxplot(aes(fill = as.factor(Treatment)), outlier.shape = NA, alpha = 0.5) + #make boxplot and color by treatment, remove outlier and alpha adjust opacity of color (1 is 100% opacity)
  facet_wrap(.~Antibody, scales='free')+ #plotting 2 variable(gH2AX and AQR on diffent sclaes)
  geom_jitter(aes(color = as.factor(Treatment)), size = 1.2) + #add data points, color by treatment and change size
  theme_classic()+ #ggplot2 classic theme
  ylab('Total intensity per nuclear area') + xlab('') + theme(legend.position='none')+ #label y axis and no label on x axis
  scale_x_discrete (limits = c('siCTRL', 'siAQR'))+ 
  scale_fill_brewer(palette = "Set1") + scale_color_brewer(palette = "Set1")
m

cb <- display.brewer.all()

  #gH2AX foci
  n <- ggplot(data=siAQR7, aes(x=Treatment, y=gH2AX_Foci)) + #data for boxplot and define x and y variable
  geom_boxplot(aes(fill = as.factor(Treatment)), outlier.shape = NA, alpha = 0.3) + #make boxplot and color by treatment, remove outlier and alpha adjust opacity of color (1 is 100% opacity)
  facet_wrap(.~Antibody, scales='free')+ #plotting 2 variable(gH2AX and AQR on diffent sclaes)
  geom_jitter(aes(color = as.factor(Treatment)), size = 1.2) + #add data points, color by treatment and change size
  theme_classic()+ #ggplot2 classic theme
  ylab('Total intensity per nuclear area') + xlab('') + theme(legend.position='none')+ #label y axis and no label on x axis
  scale_x_discrete (limits = c('siCTRL', 'siAQR'))+
  scale_fill_manual(values = color_palette)+ scale_color_manual(values = color_palette)

#siAQR DRIP
getwd() #see working directory
"/Users/meghanfrederick"
setwd('/Users/meghanfrederick/Desktop/') #set working directory
siAQR8 <- read.delim('siAQR_sDRIP4_R.txt')
color_palette <- c('#88419d', '#8c96c6', '#b3cde3') #hex color codes for palette
  p <- ggplot(data=siAQR8, aes(x=Treatment, y=CTCF)) + #data for boxplot and define x and y variable
    geom_boxplot(aes(fill = as.factor(Treatment)), outlier.shape = NA, alpha = 0.5) + #make boxplot and color by treatment, remove outlier and alpha adjust opacity of color (1 is 100% opacity)
    facet_wrap(.~Antibody, scales='free')+ #plotting 2 variable(gH2AX and AQR on diffent sclaes)
    geom_jitter(aes(color = as.factor(Treatment)), size = 1.2) + #add data points, color by treatment and change size
    theme_classic()+ #ggplot2 classic theme
    ylab('Total intensity per nuclear area') + xlab('') + theme(legend.position='none')+ #label y axis and no label on x axis
    scale_x_discrete (limits = c('siCTRL', 'siAQR'))+ 
    scale_fill_manual(values = color_palette)+ scale_color_manual(values = color_palette)
  #gH2AX foci
  q <- ggplot(data=siAQR8, aes(x=Treatment, y=gH2AX_Foci)) + #data for boxplot and define x and y variable
    geom_boxplot(aes(fill = as.factor(Treatment)), outlier.shape = NA, alpha = 0.3) + #make boxplot and color by treatment, remove outlier and alpha adjust opacity of color (1 is 100% opacity)
    geom_jitter(aes(color = as.factor(Treatment)), size = 1.2) + #add data points, color by treatment and change size
    theme_classic()+ #ggplot2 classic theme
    ylab('gH2AX foci per cell') + xlab('') + theme(legend.position='none')+ #label y axis and no label on x axis
    scale_x_discrete (limits = c('siCTRL', 'siAQR'))+
    scale_fill_manual(values = color_palette)+ scale_color_manual(values = color_palette)
  #averages rep4
  mean(siAQR8[which(siAQR8$Treatment == "siCTRL" & siAQR8$Antibody == "AQR"),]$CTCF) #average for siCTRL AQR intensity
  mean(siAQR8[which(siAQR8$Treatment == "siAQR" & siAQR8$Antibody == "AQR"),]$CTCF) #average for siAQR AQR intensity

  #combined data attempt 3, 4 and DRIP1
o <- ggplot(NULL, aes(x=Treatment, y=gH2AX_Foci)) + #data for boxplot and define x and y variable
  geom_boxplot(data = siAQR4, aes(fill = as.factor(Treatment)), outlier.shape = NA, alpha = 0.5) + #make boxplot and color by treatment, remove outlier and alpha adjust opacity of color (1 is 100% opacity)
  facet_wrap(.~Antibody, scales='free')+ #plotting 2 variable(gH2AX and AQR on diffent sclaes)
  geom_jitter(aes(color = as.factor(Treatment)), size = 1.2) + #add data points, color by treatment and change size
  theme_classic()+ #ggplot2 classic theme
  ylab('Total intensity per nuclear area') + xlab('') + theme(legend.position='none')+ #label y axis and no label on x axis
  scale_x_discrete (limits = c('siCTRL', 'siAQR'))+
  scale_fill_manual(values = color_palette)+ scale_color_manual(values = color_palette)

 mean(siAQR7[which(siAQR7$Treatment == "siCTRL" & siAQR7$Antibody == "AQR"),]$CTCF) #average for siCTRL gH2AX intensity
 mean(siAQR7[which(siAQR7$Treatment == "siAQR" & siAQR7$Antibody == "AQR"),]$CTCF) #average for siAQR gH2AX intensity
 

#gH2AX foci
d <- ggplot(data=siAQR3_foci, aes(x=Treatment, y=gH2AX_Foci)) + #data for boxplot and define x and y variable
  geom_violin()+geom_boxplot(aes(fill = as.factor(Treatment)), outlier.shape = NA, alpha = 0.5, width=0.25) + #make boxplot and color by treatment, remove outlier and alpha adjust opacity of color (1 is 100% opacity)
  geom_point(aes(color = as.factor(Treatment)), size = 1.2, position = position_jitter(w = 0.3, h = 0)) + #add data points, color by treatment and change size
  theme_classic()+ #ggplot2 classic theme
  ylab('gH2AX foci per cell') + xlab('') + theme(legend.position='none')+ #label y axis and no label on x axis
  scale_x_discrete (limits = c('siCTRL', 'siAQR'))+
  scale_fill_manual(values =c('#b3cde3', '#88419d', '#8c96c6'))+ scale_color_manual(values =c('#b3cde3', '#88419d', '#8c96c6'))+ylim(0,8)
  

e <- ggplot(data=siAQR3_foci, aes(x=Treatment, y=gH2AX_Foci)) + #data for boxplot and define x and y variable
  geom_boxplot(aes(fill = as.factor(Treatment)), outlier.shape = NA, alpha = 0.5) + #make boxplot and color by treatment, remove outlier and alpha adjust opacity of color (1 is 100% opacity)
  geom_point(aes(color = as.factor(Treatment)), size = 1.2, position = position_jitter(w = 0.3, h = 0)) + #add data points, color by treatment and change size
  theme_classic()+ #ggplot2 classic theme
  ylab('gH2AX foci per cell') + xlab('') + theme(legend.position='none')+ #label y axis and no label on x axis
  scale_x_discrete (limits = c('siCTRL', 'siAQR'))+
  scale_fill_manual(values = color_palette)+ scale_color_manual(values = color_palette)+ylim(0,8)

#Bar plot

library(dplyr)
ethan.df <- count(Foci, gH2AX_Foci, Treatment)
na.omit(ethan.df)
ethan.df.no.na <- na.omit(ethan.df)
ggplot(ethan.df.no.na, aes(x=Treatment, y=n)) + geom_bar(stat='identity') + facet_wrap(~gH2AX_Foci)
f <- ggplot(ethan.df.no.na, aes(x=Treatment, y=n, fill = as.factor(gH2AX_Foci))) + geom_bar (stat='identity', position = 'dodge') +
  theme_classic()+ ylab('number of cells')+ scale_fill_brewer(palette = "Set2")



#wilcox test p-value
wilcox.test(siAQR2[which(siAQR2$Treatment == "siCTRL 25 nM 48H" & siAQR2$Antibody == "AQR"),]$CTCF, siAQR2[which(siAQR2$Treatment == "siAQR 25nM 48H" & siAQR2$Antibody == "AQR"),]$CTCF)$p.value/2
wilcox.test(siAQR1[which(siAQR1$Treatment == "siCTRL" & siAQR1$Antibody == "AQR"),]$CTCF.per.area, siAQR1[which(siAQR1$Treatment == "siAQR" & siAQR1$Antibody == "AQR"),]$CTCF.per.area)$p.value/2

#wilcox test for AQR intensity siCTRL vs siAQR (siAQR3)
wilcox.test(siAQR3[which(siAQR3$Treatment == "siCTRL" & siAQR3$Antibody == "AQR"),]$CTCF, siAQR3[which(siAQR3$Treatment == "siAQR" & siAQR3$Antibody == "AQR"),]$CTCF)$p.value/2
  #wilcox test for gH2AX intensity siCTRL vs siAQR
  wilcox.test(siAQR3[which(siAQR3$Treatment == "siCTRL" & siAQR3$Antibody == "gH2AX"),]$CTCF, siAQR3[which(siAQR3$Treatment == "siAQR" & siAQR3$Antibody == "gH2AX"),]$CTCF)$p.value/2
  wilcox.test(siAQR4[which(siAQR4$Treatment == "siCTRL" & siAQR4$Antibody == "gH2AX"),]$CTCF, siAQR4[which(siAQR4$Treatment == "siAQR" & siAQR4$Antibody == "gH2AX"),]$CTCF)$p.value/2
  #wilcox test for gH2AX foci
  wilcox.test(siAQR3_foci[which(siAQR3_foci$Treatment == "siCTRL" & siAQR3_foci$Antibody == "gH2AX"),]$gH2AX_Foci, siAQR3_foci[which(siAQR3_foci$Treatment == "siAQR" & siAQR3_foci$Antibody == "gH2AX"),]$gH2AX_Foci)$p.value/2
  wilcox.test(siAQR4[which(siAQR4$Treatment == "siCTRL" & siAQR4$Antibody == "gH2AX"),]$gH2AX_Foci, siAQR4[which(siAQR4$Treatment == "siAQR" & siAQR4$Antibody == "gH2AX"),]$gH2AX_Foci)$p.value/2
  #average of a dataset
#average for AQR intensities
mean(siAQR2[which(siAQR2$Treatment == "siCTRL 25 nM 48H" & siAQR2$Antibody == "AQR"),]$CTCF) #average for siCTRL AQR intensity
mean(siAQR2[which(siAQR2$Treatment == "siAQR 25nM 48H" & siAQR2$Antibody == "AQR"),]$CTCF) #average for siAQR AQR intensity
mean(siAQR2[which(siAQR2$Treatment == "ETO 20uM 4H" & siAQR2$Antibody == "AQR"),]$CTCF)

mean(siAQR1[which(siAQR1$Treatment == "siCTRL" & siAQR1$Antibody == "AQR"),]$CTCF.per.area) #average for siCTRL AQR intensity
mean(siAQR1[which(siAQR1$Treatment == "siAQR" & siAQR1$Antibody == "AQR"),]$CTCF.per.area) #average for siAQR AQR intensity
mean(siAQR1[which(siAQR1$Treatment == "ETO" & siAQR1$Antibody == "AQR"),]$CTCF.per.area)

mean(siAQR3[which(siAQR3$Treatment == "siCTRL" & siAQR3$Antibody == "AQR"),]$CTCF) #average for siCTRL AQR intensity
mean(siAQR3[which(siAQR3$Treatment == "siAQR" & siAQR3$Antibody == "AQR"),]$CTCF) #average for siAQR AQR intensity
mean(siAQR3[which(siAQR3$Treatment == "ETO" & siAQR3$Antibody == "AQR"),]$CTCF) #average for ETO AQR intensity

mean(siAQR4[which(siAQR4$Treatment == "siCTRL" & siAQR4$Antibody == "AQR"),]$CTCF) #average for siCTRL AQR intensity
mean(siAQR4[which(siAQR4$Treatment == "siAQR" & siAQR4$Antibody == "AQR"),]$CTCF) #average for siAQR AQR intensity
mean(siAQR4[which(siAQR4$Treatment == "ETO" & siAQR4$Antibody == "AQR"),]$CTCF) #average for ETO AQR intensity

#stats for siAQR optimization
mean(siAQR5[which(siAQR5$Treatment == "siCTRL1F" & siAQR5$Antibody == "AQR"),]$CTCF) #average for siCTRL AQR intensity
mean(siAQR5[which(siAQR5$Treatment == "siAQR1F" & siAQR5$Antibody == "AQR"),]$CTCF) #average for siAQR AQR intensity
mean(siAQR5[which(siAQR5$Treatment == "ETO" & siAQR5$Antibody == "AQR"),]$CTCF) #average for ETO AQR intensity

mean(siAQR5[which(siAQR5$Treatment == "siCTRL1R" & siAQR5$Antibody == "AQR"),]$CTCF) #average for siCTRL AQR intensity
mean(siAQR5[which(siAQR5$Treatment == "siAQR1R" & siAQR5$Antibody == "AQR"),]$CTCF)

mean(siAQR5[which(siAQR5$Treatment == "siCTRL1R1F" & siAQR5$Antibody == "AQR"),]$CTCF) #average for siCTRL AQR intensity
mean(siAQR5[which(siAQR5$Treatment == "siAQR1R1F" & siAQR5$Antibody == "AQR"),]$CTCF)

mean(siAQR5[which(siAQR5$Treatment == "siCTRL2R" & siAQR5$Antibody == "AQR"),]$CTCF) #average for siCTRL AQR intensity
mean(siAQR5[which(siAQR5$Treatment == "siAQR2R" & siAQR5$Antibody == "AQR"),]$CTCF)
    #for gH2AX foci
wilcox.test(siAQR5[which(siAQR5$Treatment == "siCTRL1F" & siAQR5$Antibody == "gH2AX"),]$gH2AX_Foci, siAQR5[which(siAQR5$Treatment == "siAQR1F" & siAQR5$Antibody == "gH2AX"),]$gH2AX_Foci)$p.value/2
wilcox.test(siAQR5[which(siAQR5$Treatment == "siCTRL1R" & siAQR5$Antibody == "gH2AX"),]$gH2AX_Foci, siAQR5[which(siAQR5$Treatment == "siAQR1R" & siAQR5$Antibody == "gH2AX"),]$gH2AX_Foci)$p.value/2
wilcox.test(siAQR5[which(siAQR5$Treatment == "siCTRL1R" & siAQR5$Antibody == "gH2AX"),]$gH2AX_Foci, siAQR5[which(siAQR5$Treatment == "siAQR1R" & siAQR5$Antibody == "gH2AX"),]$gH2AX_Foci)$p.value/2
wilcox.test(siAQR5[which(siAQR5$Treatment == "siCTRL1R1F" & siAQR5$Antibody == "gH2AX"),]$gH2AX_Foci, siAQR5[which(siAQR5$Treatment == "siAQR1R1F" & siAQR5$Antibody == "gH2AX"),]$gH2AX_Foci)$p.value/2
wilcox.test(siAQR5[which(siAQR5$Treatment == "siCTRL2R" & siAQR5$Antibody == "gH2AX"),]$gH2AX_Foci, siAQR5[which(siAQR5$Treatment == "siAQR2R" & siAQR5$Antibody == "gH2AX"),]$gH2AX_Foci)$p.value/2
  #for gH2AX intensity
wilcox.test(siAQR5[which(siAQR5$Treatment == "siCTRL1F" & siAQR5$Antibody == "gH2AX"),]$CTCF, siAQR5[which(siAQR5$Treatment == "siAQR1F" & siAQR5$Antibody == "gH2AX"),]$CTCF)$p.value/2
wilcox.test(siAQR5[which(siAQR5$Treatment == "siCTRL1R" & siAQR5$Antibody == "gH2AX"),]$CTCF, siAQR5[which(siAQR5$Treatment == "siAQR1R" & siAQR5$Antibody == "gH2AX"),]$CTCF)$p.value/2
wilcox.test(siAQR5[which(siAQR5$Treatment == "siCTRL1R" & siAQR5$Antibody == "gH2AX"),]$CTCF, siAQR5[which(siAQR5$Treatment == "siAQR1R" & siAQR5$Antibody == "gH2AX"),]$CTCF)$p.value/2
wilcox.test(siAQR5[which(siAQR5$Treatment == "siCTRL1R1F" & siAQR5$Antibody == "gH2AX"),]$CTCF, siAQR5[which(siAQR5$Treatment == "siAQR1R1F" & siAQR5$Antibody == "gH2AX"),]$CTCF)$p.value/2
wilcox.test(siAQR5[which(siAQR5$Treatment == "siCTRL2R" & siAQR5$Antibody == "gH2AX"),]$CTCF, siAQR5[which(siAQR5$Treatment == "siAQR2R" & siAQR5$Antibody == "gH2AX"),]$CTCF)$p.value/2

#average for gH2AX intensities  
mean(siAQR2[which(siAQR2$Treatment == "siCTRL 25 nM 48H" & siAQR2$Antibody == "gH2AX"),]$CTCF) #average for siCTRL gH2AX intensity
mean(siAQR2[which(siAQR2$Treatment == "siAQR 25nM 48H" & siAQR2$Antibody == "gH2AX"),]$CTCF) #average for siAQR gH2AX intensity
mean(siAQR2[which(siAQR2$Treatment == "ETO 20uM 4H" & siAQR2$Antibody == "gH2AX"),]$CTCF)

mean(siAQR3[which(siAQR3$Treatment == "siCTRL" & siAQR3$Antibody == "gH2AX"),]$CTCF) #average for siCTRL gH2AX intensity
mean(siAQR3[which(siAQR3$Treatment == "siAQR" & siAQR3$Antibody == "gH2AX"),]$CTCF) #average for siAQR gH2AX intensity
mean(siAQR3[which(siAQR3$Treatment == "ETO" & siAQR3$Antibody == "gH2AX"),]$CTCF) #average for ETO gH2AX intensity

Foci <- subset(siAQR3_foci[which(siAQR3_foci$Treatment == 'siCTRL' & siAQR3_foci$Treatment == 'siAQR'),])

Foci <- subset(siAQR3_foci, Treatment=='siCTRL' | Treatment=='siAQR')
                           
Fociwilcox.test(data1=siCTRL for AQR, data2)$p.value/2 #(data1=siCTRL for AQR, data2) #wilcox test
  
dim()  #dimensions of data
#inspect data
'siAQR_attempt2_IF_data_R.txt' %>% glimpse()

#rename
siAQR2 <- read.delim("~/Desktop/siAQR_attempt2_IF_data_R.txt")
view(IF_data2)

cowplot #allows you to arrange all plots on one page
plot_grid(a, b, etc )
