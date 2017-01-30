library(ebplot)
library(ggplot2)
library(lubridate)

remove(list = ls())
gc()

source('./data_scripts/paid_search.R')


line_plot(ppc, "OBS", "Clicks")


line_plot(ppc %>% filter(MediaPurchase == "Cruise"), "OBS", "Clicks")
line_plot(ppc, "OBS", "Clicks", facet_x = "MediaPurchase")

seg_plot(ppc, "MediaPurchase", "Impressions")

side_plot(ppc%>% filter(PPCType == "Brand"), "MediaPurchase", c("Impressions", "Clicks", "CTR (%)" = "~ 100 * Clicks / Impressions"))

area_plot(ppc, "OBS", "Clicks", "PPCType")
area_plot(ppc %>% filter(OBS != max(OBS)), "OBS", "Clicks", "PPCType", 'Search.Engine')

side_plot(ppc, "paste(MediaPurchase, PPCType)", c("Impressions", "Clicks", "CTR (%)" = "~ 100 * Clicks / Impressions"))

variable_plot(ppc %>% filter(OBS != max(OBS), year(OBS) == 2016), "OBS", c("Impressions", "Clicks", "~ 100 * Clicks / Impressions"), facet_x = "paste(MediaPurchase, PPCType)")

compare_plot(ppc, "OBS", "clicks", "PPCType")

miles_plot(ppc, 'MediaPurchase', 'Clicks', 'year(OBS)')

share_plot(ppc, 'year(OBS)', 'Clicks', 'MediaPurchase','Search.Engine')


