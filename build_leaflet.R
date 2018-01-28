
list.files()


require(rgdal)
# Read SHAPEFILE.shp from the current working directory (".")
shape <- readOGR(dsn = ".", layer = "a")

longitudes <- coordinates(shape)[[1]][1][1][[1]][,1]
latitudes  <- coordinates(shape)[[1]][1][1][[1]][,2]

plot(shape)

library(htmlwidgets)
library(leaflet)
library(leaflet.extras)

map <- 
  leaflet() %>% addProviderTiles(providers$Stamen.Toner) %>% addPolylines(lat = latitudes, lng = longitudes)

map <- addControlGPS(map, options = gpsOptions(position = "topleft", activate = TRUE, 
                                               autoCenter = TRUE, maxZoom = 10, 
                                               setView = TRUE))
activateGPS(map)

saveWidget(map, file="index.html")
