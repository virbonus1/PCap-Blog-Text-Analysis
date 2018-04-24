# PCap-Blog-Text-Analysis
Text Analysis of Personal Capital Blog Headlines Using dplyr &amp; ggplot2 in R Studio

Firstly, we want to install all required libraries: magrittr, dplyr, and ggplot2.

Then we read the CSV file including headers and FALSE for stringsAsFactors.

Understand the basic distribution grouping by date, counting it, and adding a geometric line.

Split the date by year, month, and date using stringr::mutate & visualize distribution year-over-year using ggplot.

Download the Udpipe package with the pre-trained English model.  library: udpipe, model: english-ud-2.0-170881.udpipe.

Filter by year if preferred and then annotate text data for all articles.

Plot Part-of-Speech (POS) tags from the given text, nouns, verbs, & adjectives ranked by frequency.

Rapid Automatic Keyword Extraction (RAKE) to visualize keywords in the text data.

Noun-Verb Match (using a sequences of POS tags [noun phrases/verb phrases] to find the most frequently used pairs.

This can be broken down year by year, a group of years, or analyzed as a whole.  Enjoy!
