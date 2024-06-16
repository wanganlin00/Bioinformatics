

# 计数矩阵

library(arrow, warn.conflicts = FALSE)
raw_logCount <- read_tsv_arrow("data/TCGA-DLBC.htseq_counts.tsv.gz")
# gtf_v22_transcripts <- read_delim("data/probeMap_hugo_gencode_good_hg19_V24lift37_probemap")

### 根据 ENSEBML 编码左连接
# gene_logCount <- raw_logCount |> 
#     left_join(gtf_v22_transcripts, by = c("Ensembl_ID" = "id")) |> 
#     dplyr::select(gene, starts_with("TCGA") )
# 加载org.Hs.eg.db包
# library(AnnotationDbi)
# library(org.Hs.eg.db)
# 
# ensembl_ids <- raw_logCount$Ensembl_ID
# gene_name_mapping <- mapIds(org.Hs.eg.db, keys = ensembl_ids, column = "SYMBOL", keytype = "ENSEMBL")

gene_logCount <- raw_logCount 
gene_Count <- gene_logCount |> 
    mutate_if(is.numeric,~2^(.)-1)
