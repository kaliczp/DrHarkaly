## Fájl beolvasása
hark <- read.table("harkalyok.txt", sep = "\t", header = TRUE, dec = ",")
## Ellenőrző ábrák
plot(hark$gpszh, hark$gpssz)
plot(gpssz ~ gpszh, hark)

## EOV
hark$eovy <- as.numeric(sub(" ", "", hark$eovy))
hark$eovx <- as.numeric(sub(" ", "", hark$eovx))

## Ellenőrző ábra
plot(hark$eovy, hark$eovx, asp = TRUE)

## Taxon rövidítések faktorosítása
hark$faj <- factor(hark$faj)
