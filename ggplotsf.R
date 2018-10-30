#https://www.r-spatial.org//r/2018/10/25/ggplot2-sf.html

install.packages(c("cowplot", "googleway", "ggplot2", "ggrepel", 
                   "ggspatial", "libwgeom", "sf", "rworldmap", "rworldxtra"))

library("ggplot2")
theme_set(theme_bw())
library("sf")

library("rworldmap")
library("rworldxtra")
library("ggspatial")

world <- getMap(resolution = "high")
class(world)

world <- st_as_sf(world)
class(world)

ggplot(data = world) +
  geom_sf()


ggplot(data = world) +
  geom_sf(aes(fill = POP_EST)) +
  scale_fill_viridis_c(option = "plasma", trans = "sqrt")


ggplot(data = world) +
  geom_sf(aes(fill = POP_EST)) +
  scale_fill_viridis_c(option = "plasma")


ggplot(data = world) +
  geom_sf() +
  coord_sf(xlim = c(152.6, 153.6), ylim = c(-27.7, -27.0))  



  #annotation_scale(location = "bl", width_hint = 0.5) +
  #annotation_north_arrow(location = "bl", which_north = "true", 
  #                       pad_x = unit(0.75, "in"), pad_y = unit(0.5, "in"),
  #                       style = north_arrow_fancy_orienteering) +



ggplot(data = world) +
  geom_sf() +
 # annotation_scale(location = "bl", width_hint = 0.5) +
  #annotation_north_arrow(location = "bl", which_north = "true", 
   #                      pad_x = unit(0.75, "in"), pad_y = unit(0.5, "in"),
    #                     style = north_arrow_fancy_orienteering) +
  coord_sf(xlim = c(-43.00311, -12.46331), ylim = c(113.6594, 153.61194))




ggplot(data = world) +
  geom_sf() +
  annotation_scale(location = "bl", width_hint = 0.5) +
  annotation_north_arrow(location = "bl", which_north = "true", 
                         pad_x = unit(0.75, "in"), pad_y = unit(0.5, "in"),
                         style = north_arrow_fancy_orienteering) +
  coord_sf(xlim = c(152.6, 153.6), ylim = c(-27.7, -27.0)) 


