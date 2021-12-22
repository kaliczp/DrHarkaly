## Dobozábra
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