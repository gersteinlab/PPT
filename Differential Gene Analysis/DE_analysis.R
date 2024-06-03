setwd("~/slayman/protein_model_LLPS/")
library(DESeq2)
library(ggplot2)
library(IHW)


countData <- read.csv('amp.ad.bulk.filteredByCapstone.rawpc.DE_data.csv', header = TRUE, sep = ",")
metaData <- read.csv('amp.ad.bulk.filteredByCapstone.rawpc.DE_meta.csv', header = TRUE, sep = ",")

metaData$msex <- as.factor(as.character(metaData$msex))
metaData$apoe_genotype <- as.factor(as.character(metaData$apoe_genotype))
metaData$age_at_visit_max_scale = scale(metaData$age_at_visit_max, center = TRUE)
colName<- metaData$case_control

condition <- factor(colName, levels = c('Control', 'AD'))
metaData$case <- condition
metaData$msex <- factor(metaData$msex, levels = c('0', '1'))

metaData <- DataFrame(metaData)

############
dds <- DESeqDataSetFromMatrix(countData=countData, 
                              colData=metaData, 
                              design=~ msex + apoe_genotype + case, tidy = TRUE)
dds <- DESeq(dds)
res <- results(dds)
res = na.omit(res)


df_res <- as.data.frame(res)
df_res2 <- na.omit(df_res)

# Define cutoffs for significance
sig_level <- 0.05
log2fc_cutoff <- 0.1

# Create a new column for significance based on p-value and log2 fold change
df_res2$significant <- ifelse(df_res2$pvalue < sig_level & abs(df_res2$log2FoldChange) > log2fc_cutoff, "yes", "no")
sig_genes <- subset(df_res2, significant == "yes")
sig_genes$gene_name <- rownames(sig_genes)
write.table(df_res, file = "Control_AD_covariates_msex_apoe_genotype.txt", row.names = TRUE, col.names = TRUE, sep="\t", quote = FALSE, append = FALSE)


####consider age
dds <- DESeqDataSetFromMatrix(countData=countData, 
                              colData=metaData, 
                              design=~ msex + apoe_genotype + age_at_visit_max_scale+case, tidy = TRUE)
dds <- DESeq(dds)
res <- results(dds)
res = na.omit(res)


df_res <- as.data.frame(res)
df_res2 <- na.omit(df_res)

# Define cutoffs for significance
sig_level <- 0.05
log2fc_cutoff <- 0.1

# Create a new column for significance based on p-value and log2 fold change
df_res2$significant <- ifelse(df_res2$pvalue < sig_level & abs(df_res2$log2FoldChange) > log2fc_cutoff, "yes", "no")
sig_genes <- subset(df_res2, significant == "yes")
sig_genes$gene_name <- rownames(sig_genes)
write.table(df_res, file = "Control_AD_covariates_msex_apoe_genotype_age.txt", row.names = TRUE, col.names = TRUE, sep="\t", quote = FALSE, append = FALSE)


