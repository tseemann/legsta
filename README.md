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

```
cd $HOME
git clone https://github.com/MDU-PHL/legsta.git
```

## Test

```
cd $HOME/legsta/test
../bin/legsta *.fna
```

## Output

```
FILE  		SBT     flaA    pilE    asd     mip     mompS   proA    neuA
NC_006368.fna   1       1       4       3       1       1       1       1
NC_018140.fna   734     2       6       17      1       1       8       11
```

## Dependencies

* Perl 5.x
* isPcr - [Linux](http://hgwdev.cse.ucsc.edu/~kent/exe/linux/isPcr.zip) | [Mac](http://hgwdev.cse.ucsc.edu/~kent/exe/macIntel/isPcr.zip) | [Source](https://users.soe.ucsc.edu/~kent/src/isPcr.zip)

## Issues

File problems at our [Issue Tracker](https://github.com/MDU-PHL/legsta/issues)

## Authors

* Torsten Seemann
* Andrew Buultjens
* Jason Kwong

## Licence

[GPLv3](https://raw.githubusercontent.com/MDU-PHL/legsta/master/LICENSE)

## References

* [Public Health England - *L.pneumophila* SBT Home Page](http://bioinformatics.phe.org.uk/legionella/legionella_sbt/php/sbt_homepage.php)
* [Gaia *et al* (2005)](http://www.ncbi.nlm.nih.gov/pubmed/15872220)
* [Ratzow *et al* (2007)](http://www.ncbi.nlm.nih.gov/pubmed/17409215)
