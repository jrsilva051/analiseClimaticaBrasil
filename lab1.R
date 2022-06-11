#Link download dataSet - https://drive.google.com/open?id=1nSwP3Y0V7gncbnG_DccNhrTRxmUNqMqa

#install.packages("readr")
#install.packages("data.table")
#install.packages("dplyr")
#install.packages("ggplot2")

library(readr)
library(dplyr)
library(scales)
library(data.table)
library(ggplot2)

system.time(df <- fread("TemperaturasGlobais.csv"))

cidadesBrasil <- subset(df, Country == 'Brazil')
cidadesBrasil <- na.omit(cidadesBrasil)

cidadesBrasil$dt <- as.POSIXct(cidadesBrasil$dt, format='%Y-%m-%d')
cidadesBrasil$Month <- month(cidadesBrasil$dt)
cidadesBrasil$Year <- year(cidadesBrasil$dt)
View(cidadesBrasil)

floripa <- subset(cidadesBrasil, City == 'Florianópolis')
floripa <- subset(floripa,Year %in% c(1796,1846,1896,1946,1996,2012))
View(floripa)

florpa_plot <- ggplot(floripa, aes(x=(Month), y=AverageTemperature, color=as.factor(Year))) +
  geom_smooth(se=FALSE, fill=NA, size=2) +
  theme_light(base_size=20) +
  xlab("Mês") +
  ylab("Temperatura Média") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média ao longo dos anos em Florianópolis") +
  theme(plot.title =element_text(size=18))

florpa_plot