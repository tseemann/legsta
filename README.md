[![Build Status](https://travis-ci.org/tseemann/legsta.svg?branch=master)](https://travis-ci.org/tseemann/legsta)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
![Don't judge me](https://img.shields.io/badge/Language-Perl_5-steelblue.svg)

# legsta

In silico *Legionella pneumophila* Sequence Based Typing (SBT)

## Background

SBT stands for sequence-based typing.  The purpose of the 
*Legionella pneumophila* SBT scheme is to provide a rapid and easily comparable method
for the epidemiological typing of clinical and environmental isolates of
*Legionella pneumophila* in outbreak investigations.

## Install

### Conda
```
conda install -c conda-forge -c bioconda -c defaults legsta
```
### Homebrew
```
brew install brewsci/bio/legsta
```
### Github
```
cd $HOME
git clone https://github.com/tseemann/legsta.git
cd $HOME/legsta/test
../bin/legsta *.fna *.gbk
```

## Input

The `any2fasta` tool is used to convert input files to FASTA for 
feeding to `isPcr`. It can accept FASTA, Genbank, EMBL, GFF, and
[many other formats](https://github.com/tseemann/any2fasta#motivation).
The files may also be compressed with gzip, bzip2 or zip.

## Output

Output is a TSV file (or CSV if `--csv` is used).
```
% cd legsta/test
% ../bin/legsta NC_006368.fna NC_018140.fna CR628336.1.gbk.gz


FILE  		     SBT     flaA    pilE    asd     mip     mompS   proA    neuA
NC_006368.fna        1       1       4       3       1       1       1       1
NC_018140.fna        734     2       6       17      1       1       8       11
CR628336.1.gbk.gz    1       1       4       3       1       1       1       1

```

## Options

Option        | Description
--------------|-------------------------------------------------------------
`--quiet`     | do not print any informational messages to stderr
`--csv`       | comma-separated output instead of tab-separated
`--noheader`  | don't print table header to output (ie. `FILE SBT flaA ...`) 
`--version`   | print `legsta X.Y.Z` version to stdout and exit

## Dependencies

* Perl >= 5.26
* [any2fasta](https://github.com/tseemann/any2fasta)
* isPcr - [Linux](http://hgwdev.cse.ucsc.edu/~kent/exe/linux/isPcr.zip) | [Mac](http://hgwdev.cse.ucsc.edu/~kent/exe/macIntel/isPcr.zip) | [Source](https://users.soe.ucsc.edu/~kent/src/isPcr.zip)

## Issues

Submit questions or issues to our [Issue Tracker](https://github.com/tseemann/legsta/issues)

## Authors

* Torsten Seemann
* Anders Goncalves Da Silva
* Andrew Buultjens
* Jason Kwong

## Licence

[GPLv3](https://raw.githubusercontent.com/tseemann/legsta/master/LICENSE)

## Acknowledgements

* [Natalie Groves](@grovesn) for providing the latest sequences and profiles from the PHE database

## References

* [Public Health England - *L.pneumophila* SBT Home Page](http://bioinformatics.phe.org.uk/legionella/legionella_sbt/php/sbt_homepage.php)
* [Gaia *et al* (2005)](http://www.ncbi.nlm.nih.gov/pubmed/15872220)
* [Ratzow *et al* (2007)](http://www.ncbi.nlm.nih.gov/pubmed/17409215)
