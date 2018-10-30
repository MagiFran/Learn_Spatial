# devtools::install_github("Nowosad/spDataLarge")

library(sf)
library(raster)

library(spData)
library(spDataLarge)

#############################
# intro

View(world)
names(world)


plot(world)


summary(world["lifeExp"])

world_mini <- world[1:2, 1:3]
View(world_mini)

plot(world[, 6])

plot(world[, c("type", "continent")])


plot(world["pop"])

world_asia <- world[world$continent == "Asia", ]
asia <- st_union(world_asia)

plot(world["pop"], reset = FALSE)
plot(asia, add = TRUE, col = "red")

#############################
# 2.2.4 Base plot arguments

plot(world["continent"], reset = FALSE)

cex <- sqrt(world$pop) / 10000

world_cents <- st_centroid(world, of_largest = TRUE)

plot(st_geometry(world_cents), add = TRUE, cex = cex)


#############################
# footnote code
world_proj <- st_transform(world, "+proj=eck4")
world_cents <- st_centroid(world_proj, of_largest_polygon = TRUE)
par(mar = c(0, 0, 0, 0))
# plot(st_geometry(world), graticule = TRUE, reset = FALSE)
plot(world_proj["continent"], reset = FALSE, main = "", key.pos = NULL)
g <- st_graticule()
g <- st_transform(g, crs = "+proj=eck4")
plot(g$geometry, add = TRUE, col = "lightgrey")
cex <- sqrt(world$pop) / 10000
plot(st_geometry(world_cents), add = TRUE, cex = cex, lwd = 2, graticule = T)

#############################

india <- world[world$name_long == "India", ]
plot(st_geometry(india), expandBB = c(0, 0.2, 0.1, 1), col = "gray", lwd = 3)
plot(world_asia[0], add = TRUE)

#############################
# 2.2.6 SF Geometries

# note that we use a numeric vector for points
st_point(c(5, 2)) # XY point
# > POINT (5 2)
st_point(c(5, 2, 3)) # XYZ point
# > POINT Z (5 2 3)
st_point(c(5, 2, 1), dim = "XYM") # XYM point
# > POINT M (5 2 1)
st_point(c(5, 2, 3, 1)) # XYZM point
# > POINT ZM (5 2 3 1)


# the rbind function simplifies the creation of matrices
## MULTIPOINT
multipoint_matrix <- rbind(c(5, 2), c(1, 3), c(3, 4), c(3, 2))
plot(st_multipoint(multipoint_matrix))
# > MULTIPOINT (5 2, 1 3, 3 4, 3 2)
## LINESTRING
linestring_matrix <- rbind(c(1, 5), c(4, 4), c(4, 1), c(2, 2), c(3, 2))
plot(st_linestring(linestring_matrix))
# > LINESTRING (1 5, 4 4, 4 1, 2 2, 3 2)

## POLYGON
polygon_list <- list(rbind(c(1, 5), c(2, 2), c(4, 1), c(4, 4), c(1, 5)))
plot(st_polygon(polygon_list))
# > POLYGON ((1 5, 2 2, 4 1, 4 4, 1 5))


## POLYGON with a hole
polygon_border <- rbind(c(1, 5), c(2, 2), c(4, 1), c(4, 4), c(1, 5))
polygon_hole <- rbind(c(2, 4), c(3, 4), c(3, 3), c(2, 3), c(2, 4))
polygon_with_hole_list <- list(polygon_border, polygon_hole)
plot(st_polygon(polygon_with_hole_list))
# > POLYGON ((1 5, 2 2, 4 1, 4 4, 1 5), (2 4, 3 4, 3 3, 2 3, 2 4))


## MULTILINESTRING
multilinestring_list <- list(
  rbind(c(1, 5), c(4, 4), c(4, 1), c(2, 2), c(3, 2)),
  rbind(c(1, 2), c(2, 4))
)
plot(st_multilinestring((multilinestring_list)))
# > MULTILINESTRING ((1 5, 4 4, 4 1, 2 2, 3 2), (1 2, 2 4))

## MULTIPOLYGON
multipolygon_list <- list(
  list(rbind(c(1, 5), c(2, 2), c(4, 1), c(4, 4), c(1, 5))),
  list(rbind(c(0, 2), c(1, 2), c(1, 3), c(0, 3), c(0, 2)))
)
plot(st_multipolygon(multipolygon_list))
# > MULTIPOLYGON (((1 5, 2 2, 4 1, 4 4, 1 5)), ((0 2, 1 2, 1 3, 0 3, 0 2)))


## GEOMETRYCOLLECTION
gemetrycollection_list <- list(
  st_multipoint(multipoint_matrix),
  st_linestring(linestring_matrix)
)
plot(st_geometrycollection(gemetrycollection_list))
# > GEOMETRYCOLLECTION (MULTIPOINT (5 2, 1 3, 3 4, 3 2),
# >   LINESTRING (1 5, 4 4, 4 1, 2 2, 3 2))

#############################
# 2.2.8

lnd_point <- st_point(c(0.1, 51.5)) # sfg object
lnd_geom <- st_sfc(lnd_point, crs = 4326) # sfc object
lnd_attrib <- data.frame( # data.frame object
  name = "London",
  temperature = 25,
  date = as.Date("2017-06-21")
)
lnd_sf <- st_sf(lnd_attrib, geometry = lnd_geom) # sf object






































