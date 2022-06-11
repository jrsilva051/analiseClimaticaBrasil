setwd("C:/Users/junior.silva/OneDrive - Ibratan Ilimitada/Documentos/pessoal/DataScience/CursoMachineLearningR/Lab_1_BigData")
getwd()

#Link download dataSet - https://drive.google.com/open?id=1nSwP3Y0V7gncbnG_DccNhrTRxmUNqMqa


#install.packages("readr")
#install.packages("data.table")
#install.packages("dplyr")
#install.packages("ggplot2")

library(readr)
library(dplyr)
library(scales)
library(data.table)

system.time(df <- fread("TemperaturasGlobais.csv"))

cidadesBrasil <- subset(df, Country == 'Brazil')
cidadesBrasil <- na.omit(cidadesBrasil)

cidadesBrasil$dt <- as.POSIXct(cidadesBrasil$dt, format='%Y-%m-%d')
cidadesBrasil$Month <- month(cidadesBrasil$dt)
cidadesBrasil$Year <- year(cidadesBrasil$dt)
View(cidadesBrasil)