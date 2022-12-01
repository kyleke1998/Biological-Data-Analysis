library(edgeR)
infile <- 'merged_file'
group <- factor(c(1,1,1,2,2,2))
outfile <-'analysis_tmm.out'
x <-read.table(infile, row.names=1)
y <-DGEList(counts=x,group=group)
y_adjusted <- calcNormFactors(y)
y <-estimateDisp(y_adjusted)
et <- exactTest(y)
tab <- topTags(et, nrow(x))
write.table(tab, file=outfile, quote=FALSE)
