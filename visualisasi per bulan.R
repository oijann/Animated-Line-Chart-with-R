otomobil=read.csv(file.choose(),header=TRUE, sep=",")
View(otomobil)
names(otomobil)

otomobil$Month <- format(ISOdate(2004,4:12,1),"%B")[otomobil$Month]

library(ggplot2)
library(plotly)
library(gganimate)

ggplot(otomobil, aes(Day, Kumulatif, group = Month)) + 
  geom_line() + 
  geom_segment(aes(xend = 31, yend = Kumulatif), linetype = 2, colour = 'grey') + 
  geom_point(size = 2) + 
  geom_text(aes(x = 31.1, label = Month), hjust = 0) + 
  transition_reveal(Day) + 
  coord_cartesian(clip = 'off') + 
  labs(title = 'Penjualan Kumulatif', y = 'Penjualan') + 
  theme_minimal() + 
  theme(plot.margin = margin(5.5, 40, 5.5, 5.5))
