library(tidyverse)
C = c(seq(1, 1000, 50))
E = c(seq(1, 1000, 50))
P = c(seq(1, 1000, 50))

df <- expand.grid(C = C, E = E, P = P)

df <- df %>% mutate(col_minus_ext = C-E)

df <- df %>% mutate(pcol_minus_pext = (C/(C+P)) - (E/(E+P)))

jpeg("figures/FigS1.jpg", width = 8.27, height = 11.69, units = "in", res = 300)
plot(df$col_minus_ext, df$pcol_minus_pext,
     col = ifelse(df$pcol_minus_pext > 0, "blue",
                  ifelse(df$pcol_minus_pext < 0, "red", "black")),
     pch = 19)
abline(h = 0, col = "black", lwd = 2)
dev.off()

