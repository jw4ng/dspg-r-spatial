set.seed(1006)
lnstr_sfg1 <- st_linestring(matrix(runif(6), ncol=2))
set.seed(1043)
lnstr_sfg2 <- st_linestring(matrix(runif(6), ncol=2))

lnstr_sfc <- st_sfc(lnstr_sfg1, lnstr_sfg2)

dfr <- data.frame(id = c("hwy1", "hwy2"), cars_per_hour = c(78, 22))
nstr_sf <- st_sf(dfr, lnstr_sfc)

plot(lnstr_sf, col='black')

nyc_sf_rich <- nyc_sf[nyc_sf$medianinco > 80000, ]    
plot(st_geometry(nyc_sf_rich), add=T, col="red")

postal_zones_sf <- st_read("data/postal_zones/nyc_postal_zones.shp")
str(postal_zones_sf)
plot(st_geometry(postal_zones_sf))

retail_stores_sf <- st_read("data/retail_stores/nyc_retail_stores.shp")
str(retail_stores_sf)
plot(st_geometry(retail_stores_sf))

health_facility_df <- read_csv("data/health_facility.csv")
health_facility_df <- health_facility_df[complete.cases(health_facility_df[, c("Facility Longitude", "Facility Latitude")]), ]
  
str(retail_stores_df)

health_facility_sf <- st_as_sf(health_facility_df, 
          coords = c("Facility Longitude", "Facility Latitude"))
plot(st_geometry(health_facility_sf))

save(retail_stores_sf, health_facility_sf, postal_zones_sf, file="assignment_1.6.RData")
