hark <- read.table("harkalyok.txt", sep = "\t", header = TRUE, dec = ",")
plot(hark$gpszh, hark$gpssz)
plot(gpssz ~ gpszh, hark)

## EOV
hark$eovy <- as.numeric(sub(" ", "", hark$eovy))
hark$eovx <- as.numeric(sub(" ", "", hark$eovx))

plot(hark$eovy, hark$eovx, asp = TRUE)

hark$faj <- factor(hark$faj)