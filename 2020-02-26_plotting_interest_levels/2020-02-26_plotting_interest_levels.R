

#This is from a survey running since summer 2019. The questions were

d<-data.frame(
  row.names=c("Poetry","GAN-network","Minecraft","Only health"),
  value=c(262,396,201,310),
  description=c("Focus on the written poetry: explore how the AI-generated poetry can be made even more relevant and personal, based on trait and ancestry predictions",
                "Generating GAN-network-based art spanning from Rococo landscapes to modern art, then training user-impressions on genetics to provide incrementally better and better personalized precision-art",
                "Generating downloadable Minecraft worlds based on your personal DNA, complete with walkable double helix tunnels, gene-annotations and warp-points for travelling to your favourite gene",
                "Dont spend time on this, stick to health genetics!")
)

png("2020-02-26_plotting_interest_levels/2020-02-26_survey_results.png")
barplot(d[,"value"],names.arg = rownames(d),cex.names=1)
dev.off()

