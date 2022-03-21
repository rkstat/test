require(fda)
require(fds)
require(tidyverse)
require(reshape2) 
require(depthTools)

# MBD (Modified Band Depth)
pinch.mbd <- MBD(t(pinch))
pinch.dat <- data.frame(t(pinch), id = seq_len(20), MBD = c(pinch.mbd$MBD),
                        check.names = FALSE)
pinch.dat.long <- pivot_longer(pinch.dat, c(-id, -MBD), names_to = "t") %>%
  mutate(t = as.numeric(t))
ggplot(pinch.dat.long, aes(x=t, y=value, color=MBD, group=id)) + geom_line() +
  scale_color_gradientn(colours = rainbow(4), trans="reverse") + 
  ggtitle("Modified Band Depth for Pinch Dataset") +
  xlab("Time (in ms)") + ylab("Force")
