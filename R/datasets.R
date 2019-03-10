#' Foundations of Applied Statistics
#'
#' This package contains important functions and datasets that will be used throughout the course.
#'
#' @docType package
#' @name fastats
#' @aliases fastats fastats-package
NULL

#' Human Genome Diversity Project (HGDP) dataset
#'
#' The Human Genome Diversity Project (HGDP) genotyped 1,043 individuals from
#' Africa, Europe, the Middle East, South and Central Asia, East Asia, Oceania and the Americas.
#' There are over 650,000 single nucleotide polymorphisms (SNPs). Note that this
#' dataset is preprocessed and there are 940 individuals and 50,000 SNPs.
#' 
#' @aliases geo_loc HGDP_subset
#' @format A tibble data frame
"HGDP_subset"


#' Exome Aggregation Consortium (ExAC)
#'
#' The Exome Aggregation Consortium (ExAC) is a consortium that seeks to combine data from different human exome sequencing projects.
#' One publicly available portion of their data is the list of all variant sites they have found along with metadata.
#' We have prepared a small portion (100,000 sites) of that data consisting of identifying information for each variant
#' (variants are uniquely identified bya reference SNP ID) along with the functional information for each variant as listed in Ensembl.
#' The glossary for functional terms is available on the Ensembl website.
#'
#' @source \url{http://exac.broadinstitute.org/}
#' @format A tibble data frame
"ExAC"


#' Internet Movie Database (IMBD)
#'
#' High budget TV shows have been wildly popular in recent years, e.g. the $120
#' million cost for The Get Down on Netflix and the $100 million cost
#' for Westworld on HBO. We've sourced data for TV show episodes from the
#' Internet Movie Database. We pulled all TV show episodes that have been
#' rated at least 200 times. In TV, the primary creative forces tend to be the
#' producers, so we have pulled that information as well.
#'
#' @source \url{https://www.imdb.com/}
#' @format A tibble data frame
"IMDB"

#' Crash dataset
#'
#' We have provided a dataset consisting of motor vehicle accidents in the borough of Manhattan.
#' The original data was downloaded from New York City's Open Data initiative.
#'
#' @aliases crashes crashes_update
#' @source \url{https://data.cityofnewyork.us/Public-Safety/NYPD-Motor-Vehicle-Collisions/h9gi-nx95}
#' @format Data frames: crashes, crashes_update
"crashes"


#' Hedenfalk dataset
#'
#' The gene expression dataset is generated from a two-channel
#' microarray experiment with a referencesample. Gene expression in
#' this experiment is measured from RNA purified from the tumors and reference.
#' The values of the gene expression data are base-2 log of the gene expression
#' ratio. Morepositive corresponds to more gene expression
#' in the tumor sample. A value of 1 means there is twice
#' as much RNA from the tumor sample when compared to RNA
#' from the reference sample. Similarly, 2 corresponds to four times as
#' much, -1 corresponds to one half as much, -2 corresponds to one quarter
#' as much, etc. Note that the gene_idcolumn consists of integers that serve
#' as placeholders and do not directly map to human genes. There are 22 tumors
#' analyzed, and the labels and mutations are documented.
#' @docType data
#' @name hedenfalk_study
#' @aliases hedenfalk hedenfalk_info
#' @format Two data frames: hedenfalk (expression), hedenfalk_info (design)
NULL

#' 2016 election data
#'
#' For this problem, we have provided county level data for the recent 2016
#' US presidential election. See url below to see how data was generated.
#'
#' @source \url{https://github.com/jdstorey/asdscourse/blob/master/scripts/election_data.R}
#' @format A tibble data frame
"election2016"

#' Cystic fibrosis dataset
#'
#' This dataset contains information on cystic fibrosis across 80 families.
#'
#' @format A data frame
"cystic_fibrosis"

#' Genotype data for homework
#' @format A data frame
"genotypes"

#' Simulated RNA-Seq data
#'
#' The rows are the genes and the columns are the
#' individuals. The data points are counts corresponding to the number of
#' times the experimenter observed RNA transcribed from that gene.
#'
#' @format A data frame
"rna_seq"

#' Endotoxin data set
#'
#' @docType data
#' @name endtoxin_study
#' @aliases endotoxin_exprs endotoxin_info
#' @format  Two data frames: endotoxin (expression), endotoxin_info (design)
NULL

#' Kidney data set
#' @docType data
#' @name kidney_study
#' @aliases kidney_exprs kidney_info
#' @format Two data frames: kidney (expression), kidney_info (design)
NULL

#' Smoker data set
#' @docType data
#' @name smoker_study
#' @aliases smoker smoker_info
#' @format Two data frames: smoker (expression), smoker_info (design)
NULL

#' Smith and Kruglyak dataset
#'
#' The yeast data set contains 2820 genotypes in 109 yeast F1 segregants from a cross
#' between parental lines BY and RM. They also measured gene expression on 4482 genes in each of these segregants when growing in two different
#' Carbon sources, glucose and ethanol.
#' @docType data
#' @name yeast_study
#' @aliases exp.e exp.g exp.pos marker marker.pos
#' @format Four data frames: exp.e (expression), exp.g (genotype), exp.pos, marker, marker.pos
NULL
