# STA518_Final_Project_Shiny_Tree
The goal is to make a shiny app that allows users to explore FASTA sequences by plotting sequence graphs and phylogenetic trees. As well as with features to downloads and generate figures/pdfs. 

# What is this project? / What is its goal?
This project is going to be a Shiny App where users can observe similarities, differences and connections in DNA/RNA/protein sequences in the from of a FASTA file. A FASTA file is a text base sequence of nucleotides or proteins that are represented using single-letter codes in the file. This format is common in all bioinformatic/biochemistry/molecular biology field.

How we will observe these behaviors of multiple sequences is through the uses of phylogenetic trees. Which are a form of tree diagram linking the evolutionary relationship between the sequences. 

![Phylogenetic Tree Example](https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Forganismalbio.biosci.gatech.edu%2Fwp-content%2Fuploads%2F2018%2F12%2F1600px-Phylogenetic_tree-of-life-corrected.png&f=1&nofb=1)

Image source from [Organismal Biology](https://organismalbio.biosci.gatech.edu/biodiversity/phylogenetic-trees/)

The goal of this project is to generate a shiny application that is allows the user to upload a FASTA file and then output both a phylogenetic tree diagram and the sequence alignment for the diagram. From there the user can overseer and explore the difference in sequences and their relations. A feature that I would also like to have for this is a place where the user can a figure description or legend and export their diagram and text into a paper ready figure for publications.
# How is this different than what already exists?
There are many desktops phylogenetic tree diagram programs but so far from most of my experience in the field the websites often look like they’re still in the 90s and early 2000s of design and there is not much standard set up for exporting for paper publications.

# Who are the users intended for this app?
The intended audience for this would are new to the field as well as experts. I will not be providing the analysis summary for their results which I understand would make a general user have harder time understanding their results.

# What are the limitations of this app?
This app is limited in the input sequences, since if there are errors in the sequence, I will not be checking for those. As well as they are being aligned by a specific way, I will not be providing any flexibility in the alignment algorithms as it becomes more complex and more like other alignment programs available. I want to focus more on the tree diagram generation and exporting of figures for this project.

