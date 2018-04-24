# Install required libraries
library(magrittr)
library(dplyr)
library(ggplot2)

# Read CSV File
blog <- read.csv("C:\\Users\\cmendez\\Downloads\\PCBlog.csv", header=T, stringsAsFactors = F)

# Date Came Over Differently. Rename Accordingly.
colnames(blog)[1] <- "Date"

# Understand Basic Distribution
blog %>% group_by(Date) %>% count() %>% ggplot() + geom_line(aes(Date,n,group=1))

# Split Year, Month, and Date
library(stringr)

more_blog <- blog %>% mutate(year = str_sub(Date,7,10),
                             month = str_sub(Date,1,2),
                             date = str_sub(Date,4,5))

# Visualize Distribution Year Over Year
more_blog %>% group_by(year) %>% count()  %>% ggplot() + geom_bar(aes(year,n), stat ='identity')

# Download Udpipe Package w/ Pre-Trained Model
install.packages("udpipe")
library(udpipe)

model <- udpipe_download_model(language = "english")
udmodel_english <- udpipe_load_model(file = 'english-ud-2.0-170801.udpipe')

# Filter for 2017
more_blog$year
blog2017 <- more_blog[more_blog$year==2017,]
blog2017

# Annotate the Text Data For All Articles
s <- udpipe_annotate(udmodel_english,more_blog$Headline)
x <- data.frame(s)

# Plot Part-of-Speech (POS) Tags From the Given Text
library(lattice)
stats <- txt_freq(x$upos)
stats$key <- factor(stats$key, levels = rev(stats$key))
barchart(key ~ freq, data = stats, col = "light blue", 
         main = "UPOS (Universal Parts of Speech)\n frequency of occurrence", 
         xlab = "Freq")

# What Are the Most Recurring Nouns?
stats <- subset(x, upos %in% c("NOUN")) 
stats <- txt_freq(stats$token)
stats$key <- factor(stats$key, levels = rev(stats$key))
barchart(key ~ freq, data = head(stats, 20), col = "royalblue", 
         main = "Most occurring nouns", xlab = "Freq")

## ADJECTIVES
stats <- subset(x, upos %in% c("ADJ")) 
stats <- txt_freq(stats$token)
stats$key <- factor(stats$key, levels = rev(stats$key))
barchart(key ~ freq, data = head(stats, 20), col = "purple", 
         main = "Most occurring adjectives", xlab = "Freq")

## VERBS
stats <- subset(x, upos %in% c("VERB")) 
stats <- txt_freq(stats$token)
stats$key <- factor(stats$key, levels = rev(stats$key))
barchart(key ~ freq, data = head(stats, 20), col = "grey", 
         main = "Most occurring Verbs", xlab = "Freq")

## Using Rapid Automatic Keyword Extraction (RAKE)
stats <- keywords_rake(x = x, term = "lemma", group = "doc_id", 
                       relevant = x$upos %in% c("NOUN", "ADJ"))
stats$key <- factor(stats$keyword, levels = rev(stats$keyword))
barchart(key ~ rake, data = head(subset(stats, freq > 3), 20), col = "red", 
         main = "Keywords identified by RAKE", 
         xlab = "Rake")

## NOUN-VERB MATCH
## Using a sequence of POS tags (noun phrases / verb phrases)
x$phrase_tag <- as_phrasemachine(x$upos, type = "upos")
stats <- keywords_phrases(x = x$phrase_tag, term = tolower(x$token), 
                          pattern = "(A|N)*N(P+D*(A|N)*N)*", 
                          is_regex = TRUE, detailed = FALSE)
stats <- subset(stats, ngram > 1 & freq > 3)
stats$key <- factor(stats$keyword, levels = rev(stats$keyword))
barchart(key ~ freq, data = head(stats, 20), col = "magenta", 
         main = "Keywords - simple noun phrases", xlab = "Frequency")









