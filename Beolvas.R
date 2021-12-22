hark <- read.table("harkalyok.txt", sep = "\t", header = TRUE, dec = ",")
plot(hark$gpszh, hark$gpssz)
plot(gpssz ~ gpszh, hark)

## EOV
hark$eovy <- as.numeric(sub(" ", "", hark$eovy))
hark$eovx <- as.numeric(sub(" ", "", hark$eovx))

plot(hark$eovy, hark$eovx, asp = TRUE)

hark$faj <- factor(hark$faj)

## dobozábra
plot(mag ~ faj, hark)
boxplot(hark$mag)
boxplot(mag ~ faj, hark, col="lightblue", xlab = "Faj", ylab = "Magasság [m]")
as.POSIXct(sub("T", " ", hark$ido), tz = "UTC")
hark$ido <- as.POSIXct(strptime(hark$ido, "%Y-%m-%dT%H:%M:%S", tz = "UTC"))

## Idő szerint
plot(hark$ido, hark$faj, yaxt = "n")
axis(side = 2, at = 1:7, labels = levels(hark$faj))

## Egy nap
plot(as.numeric(faj) ~ ido, hark[hark$ido < as.POSIXct("2021-04-11") & hark$ido > as.POSIXct("2021-04-10"),])

## xts csomaggal
library(xts)
hark.xts <- xts(x = as.numeric(hark$faj), order.by = hark$ido)     
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
