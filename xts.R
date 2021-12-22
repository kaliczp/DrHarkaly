### Időbeli adatok kezelése xts csomaggal
## Csomag betöltése
library(xts)
## xts objektum létrehozása
hark.xts <- xts(x = as.numeric(hark$faj), order.by = hark$ido)     

## Ábrák
plot(hark.xts, type = "p", ylim = c(0.5, 7.5))
plot(hark.xts["2021-04-10"], type = "p", ylim = c(0.5, 7.5))
plot(hark.xts["2021-04"], type = "p", ylim = c(0.5, 7.5))
plot(hark.xts["2021-04-15"], type = "p", ylim = c(0.5, 7.5))
plot(hark.xts["2021-04-1/2021-04-10"], type = "p", ylim = c(0.5, 7.5))

## xts koordinátával
hark.num <- hark
faj.kod <- levels(hark$faj)
hark.num$faj <- as.numeric(hark.num$faj)
hark.xts <- xts(x = hark.num[,c(1,4:6)], order.by = hark$ido)     

h.akt <- hark.xts["2021-04-01"]
h.akt <- hark.xts["2021-04-10"]
h.akt <- hark.xts["2021-04-30"]
plot(eovx ~ eovy , h.akt, asp = TRUE, type="n")
text(h.akt$eovy, h.akt$eovx , h.akt$faj)
