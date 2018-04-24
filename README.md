# PCap-Blog-Text-Analysis
Text Analysis of Personal Capital Blog Headlines in R Studio

1. Install all required libraries: magrittr, dplyr, ggplot2, stringr, lattice and udpipe.

2. Read the CSV file including headers and FALSE for stringsAsFactors.

3. Understand the basic distribution grouping by date, counting it, and adding a geometric line.

4. Split the date by year, month, and date using stringr::mutate & visualize distribution year-over-year using ggplot.

5. Download the Udpipe package with the pre-trained English model.  library: udpipe, model: english-ud-2.0-170881.udpipe.

6. Filter by year if preferred and then annotate text data for all articles.

7. Plot Part-of-Speech (POS) tags from the given text, nouns, verbs, & adjectives ranked by frequency.

8. Rapid Automatic Keyword Extraction (RAKE) to visualize keywords in the text data.

9. Noun-Verb Match (using a sequences of POS tags [noun phrases/verb phrases] to find the most frequently used pairs.

10. This can be broken down year by year, a group of years, or analyzed as a whole.  Enjoy!
