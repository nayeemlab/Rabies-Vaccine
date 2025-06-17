#library
library(forecast)
library(MASS)
library(tseries)
library(forecast)
library(lubridate)
library(ggplot2)
library(zoo)
library(Rcpp)
library(prophet)
library(data.table)
library(dplyr)
library(ggplot2)
options(scipen = 999) ## To disable scientific notation

################################################################################
## Dengue - Data analysis ##
################################################################################
rm(list=ls()) #Remove all previous R objects#
## Packages ##
library(maptools)
library(RColorBrewer)
library(rgeos)
library(rgdal)
library(sp)
library(sf)
library(ggrepel)
library(ggplot2)
library(tidyverse)

setwd('E:\\ResearchProject\\Sumon Bhai\\Rabies Vaccine')
VCData <- read.csv("VCD.csv")
VCDataIn <- VCData[VCData$City_Corporation != 3,]
NROW(VCData)

#bangladesh
shp <- readOGR(dsn = "E:\\ResearchProject\\Sumon Bhai\\Rabies Vaccine\\sle_admbnda_adm4_1m_gov_ocha", "BGD_adm2")

head(shp@data)
xLon = VCData$Longitude
xLat = VCData$Latitude

#SL.map <- fortify(shp, region = "NAME_2")

map4 <- ggplot() + 
  geom_polygon(data = shp, aes(x = long, y = lat, group = group), colour = "cadetblue", fill = "azure2") +
  labs(title = "Location of animal bite patients (Outside Dhaka)") +
  xlab(label="Longitute") + ylab(label="Latitute")
map4
map5 <- map4 +  geom_point(data=VCData, aes(x=Longitude, y=Latitude), colour = "black", size = 2)+ 
  theme(axis.text = element_text(size = 12),
        axis.title = element_text(size = 12),
        plot.title = element_text(size = 15))
map5
map6 <- map5 +  geom_point(data=VCData, aes(x=90.40583656722403, y=23.77627819803267), shape=25, colour = "red", fill="red", size = 2)+ 
  theme(axis.text = element_text(size = 12),
        axis.title = element_text(size = 12),
        plot.title = element_text(size = 15))


map6


#Dhaka

setwd('E:\\ResearchProject\\Sumon Bhai\\Rabies Vaccine')
VCData <- read.csv("VCD.csv")
VCDataIn <- VCData[VCData$City_Corporation != 3,]
VCDataIn$City_Corporation
library(grid)
shp <- readOGR(dsn = "E:\\ResearchProject\\Sumon Bhai\\Rabies Vaccine\\bgd_adm_bbs_20201113_shp", "bgd_admbnda_adm4_bbs_20201113")
head(shp@data)
shp <- shp[shp$ADM2_EN=="Dhaka",]

#  shp <- shp[shp$ADM4_EN=="Ward No-01" | shp$ADM4_EN=="Ward No-02" | shp$ADM4_EN=="Ward No-03" 
# #            | shp$ADM4_EN=="Ward No-04" | shp$ADM4_EN=="Ward No-05" | shp$ADM4_EN=="Ward No-06"
# #            | shp$ADM4_EN=="Ward No-07 (Part)" | shp$ADM4_EN=="Ward No-08" | shp$ADM4_EN=="Ward No-09"
# #            | shp$ADM4_EN=="Ward No-10" | shp$ADM4_EN=="Ward No-11" | shp$ADM4_EN=="Ward No-12"
# #            | shp$ADM4_EN=="Ward No-13" | shp$ADM4_EN=="Ward No-14 (part)" | shp$ADM4_EN=="Ward No-15 (part)"
# #            | shp$ADM4_EN=="Ward No-16" | shp$ADM4_EN=="Ward No-17 (Part)" | shp$ADM4_EN=="Ward No-18"
# #            | shp$ADM4_EN=="Ward No-19" | shp$ADM4_EN=="Ward No-20 (Part)" | shp$ADM4_EN=="Ward No-21"
# #            | shp$ADM4_EN=="Ward No-22" | shp$ADM4_EN=="Ward No-23" | shp$ADM4_EN=="Ward No-24"
# #            | shp$ADM4_EN=="Ward No-25" | shp$ADM4_EN=="Ward No-26" | shp$ADM4_EN=="Ward No-27"
# #            | shp$ADM4_EN=="Ward No-28" | shp$ADM4_EN=="Ward No-29" | shp$ADM4_EN=="Ward No-30"
# #            | shp$ADM4_EN=="Ward No-31" | shp$ADM4_EN=="Ward No-32" | shp$ADM4_EN=="Ward No-33"
# #            | shp$ADM4_EN=="Ward No-34" | shp$ADM4_EN=="Ward No-35" | shp$ADM4_EN=="Ward No-36"
# #            | shp$ADM4_EN=="Ward No-37" | shp$ADM4_EN=="Ward No-38 (Part)" | shp$ADM4_EN=="Ward No-39"
# #            | shp$ADM4_EN=="Ward No-40 (Part)" | shp$ADM4_EN=="Ward No-41" | shp$ADM4_EN=="Ward No-42"
# #            | shp$ADM4_EN=="Ward No-43" | shp$ADM4_EN=="Ward No-44" | shp$ADM4_EN=="Ward No-45"
# #            | shp$ADM4_EN=="Ward No-46" | shp$ADM4_EN=="Ward No-46 (Part)" | shp$ADM4_EN=="Ward No-47 (part)" 
# #            | shp$ADM4_EN=="Ward No-48 (Part)"
# #            | shp$ADM4_EN=="Ward No-49" | shp$ADM4_EN=="Ward No-50" | shp$ADM4_EN=="Ward No-51 (part)"
# #            | shp$ADM4_EN=="Ward No-52" | shp$ADM4_EN=="Ward No-53" | shp$ADM4_EN=="Ward No-54"
# #            | shp$ADM4_EN=="Ward No-55" | shp$ADM4_EN=="Ward No-56 (part)" | shp$ADM4_EN=="Ward No-57"
# #            | shp$ADM4_EN=="Ward No-58" | shp$ADM4_EN=="Ward No-59" | shp$ADM4_EN=="Ward No-60"
# #            | shp$ADM4_EN=="Ward No-61" | shp$ADM4_EN=="Ward No-62" | shp$ADM4_EN=="Ward No-63 (Part)"
# #            | shp$ADM4_EN=="Ward No-64" | shp$ADM4_EN=="Ward No-65" | shp$ADM4_EN=="Ward No-66 (Part)"
# #            | shp$ADM4_EN=="Ward No-67 (part)" | shp$ADM4_EN=="Ward No-68 (part)" | shp$ADM4_EN=="Ward No-69"
# #            | shp$ADM4_EN=="Ward No-70" | shp$ADM4_EN=="Ward No-71 (Part)" | shp$ADM4_EN=="Ward No-72"
# #            | shp$ADM4_EN=="Ward No-73" | shp$ADM4_EN=="Ward No-74" | shp$ADM4_EN=="Ward No-75"
# #            | shp$ADM4_EN=="Ward No-76 (Part)" | shp$ADM4_EN=="Ward No-77" | shp$ADM4_EN=="Ward No-78"
# #            | shp$ADM4_EN=="Ward No-79" | shp$ADM4_EN=="Ward No-80 (Part)" | shp$ADM4_EN=="Ward No-81"
# #            | shp$ADM4_EN=="Ward No-82" | shp$ADM4_EN=="Ward No-83" | shp$ADM4_EN=="Ward No-83"
# #            | shp$ADM4_EN=="Ward No-84" | shp$ADM4_EN=="Ward No-85" | shp$ADM4_EN=="Ward No-86"
# #            | shp$ADM4_EN=="Ward No-87" | shp$ADM4_EN=="Ward No-88" | shp$ADM4_EN=="Ward No-89"
# #            | shp$ADM4_EN=="Ward No-90" | shp$ADM4_EN=="Ward No-91" | shp$ADM4_EN=="Ward No-92"
# #            | shp$ADM4_EN=="Ward No-98 (rest. Area)",] 

shp$ADM4_EN
head(shp@data)
xLon = VCDataIn$Longitude
xLat = VCDataIn$Latitude

#SL.map <- shp(shp, region = "ADM2_EN")

map1 <- ggplot() + 
  geom_polygon(data = shp, aes(x = long, y = lat, group = group), colour = "cadetblue", fill = "azure2") +
  labs(title = "Location of animal bite patients (Dhaka City)") +
  xlab(label="Longitute") + ylab(label="Latitute")
map1

map2 <- map1 +  geom_point(data=VCDataIn, aes(x=Longitude, y=Latitude), colour = "black", size = 2)+
  theme(axis.text = element_text(size = 12),
        axis.title = element_text(size = 12),
        plot.title = element_text(size = 15))


map2


library(ggforce)

map3 <- map2 +  geom_point(data=VCDataIn, aes(x=90.40583656722403, y=23.77627819803267), shape=25, colour = "red", fill="red", size = 4)+
  theme(axis.text = element_text(size = 12),
        axis.title = element_text(size = 12),
        plot.title = element_text(size = 15))


map3



# Add scale and North arrow
library(ggspatial)
map4 <- map3 +
  ggspatial::annotation_north_arrow(
    location = "br", which_north = "true",
    pad_x = unit(0.4, "in"), pad_y = unit(0.4, "in"),
    style = ggspatial::north_arrow_nautical(
      fill = c("grey40", "white"),
      line_col = "grey20",
      text_family = "ArcherPro Book"
    )
  )
map4


library(gridExtra)
tiff("MapBoth.tiff", units="in", width=14, height=7, res=300)
gridExtra::grid.arrange(map6,map4, ncol=2)
dev.off()
