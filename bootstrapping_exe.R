#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

print(args[1])
print(args[2])
#setwd("/Users/jeku7901/olwin_dowell_labs/reanalysis_09_26_20/bootstrapping/")
pruned.merged.tab.noTRs.numeric <- read.csv(args[1], header = T, row.names = 1)
pruned.merged.tab.noTRs.numeric <- data.matrix(pruned.merged.tab.noTRs.numeric)

tmp7 <- data.frame()
for (j in 1:ncol(pruned.merged.tab.noTRs.numeric))
{
  tmp1 <- list()
  tmp2 <- data.frame()
  tmp3 <- data.frame()
  tmp4 <- data.frame()
  tmp5 <- c()
  tmp6 <- data.frame()
  for (i in 1:nrow(pruned.merged.tab.noTRs.numeric))
  {
    if(pruned.merged.tab.noTRs.numeric[i,j] == 0){}
    else {
      tmp1[[i]] <- rep(row.names(pruned.merged.tab.noTRs.numeric)[i], pruned.merged.tab.noTRs.numeric[i,j]) # Fix the 0's
      tmp2 <- data.frame(unlist(as.vector(tmp1))) # turns it into a longform df
    }
  }
  for (k in 1:500) # 500 subsamples of 5600 barcodes each time
  {
    tmp3 <- sample(tmp2[,1], 10000) # samples 5600 from this longform df
    tmp4 <- as.data.frame(table(tmp3)) #tabulates the repeat number for this 5600 subsample
    tmp5 <- length(which(tmp4$Freq > 0)) # unique (make more than 0) ---- 
    tmp6[k,1] <- c(tmp5)
  }
  var.name <- paste(as.character(colnames(pruned.merged.tab.noTRs.numeric)[j]), "bootstrapped", sep = ".")
  colnames(tmp6) <- var.name
  tmp7[1:500,j] <- tmp6
  print(j)
}


write.table(tmp7, args[2])
