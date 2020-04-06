#! /bin/bash

fastq-dump --gzip --split-files SRR11284037 


/opt/FastQC/fastqc SRR11284037_1.fastq.gz

/opt/FastQC/fastqc SRR11284037_2.fastq.gz
 

java -jar /opt/Trimmomatic-0.38/trimmomatic \
	PE \
	-phred33 \
	-threads 6 \
	SRR11284037_1.fastq.gz \
	SRR11284037_2.fastq.gz \
	clean_1.fastq.gz \
	unp_1.fastq.gz \
	clean_2.fastq.gz \
	unp_2.fastq.gz \
	ILLUMINACLIP:/opt/Trimmomatic-0.38/adapters/allAdapter.fas:2:30:10 \
	LEADING:30 \
	TRAILING:30 \
	HEADCROP:5 \
	SLIDINGWINDOW:5:30 \
	MINLEN:50 


/opt/FastQC/fastqc clean_1.fastq.gz

/opt/FastQC/fastqc clean_1.fastq.gz


/opt/trinity/Trinity --seqType fq --max_memory 50G --left clean_1.fastq.gz --right clean_2.fastq.gz --CPU 12 --SS_lib_type RF


