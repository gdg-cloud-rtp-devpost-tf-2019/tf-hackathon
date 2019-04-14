#!/bin/bash

# this is a sed script for replacing tabs with commas.
# Use it to rewrite .tsv files to .csv files.
# You can use inplace editing with sed, but I want
# to preserve the original tsv files.

# USAGE
# ./mytab2space foo.tsv ../csv/foo.csv
#


# TODO:
# determine root file name if only one parameter given
# and use that for .csv file.
#
# add a usage method to determine the number of args
# and print on error

INPUT_FILE=$1
OUTPUT_FILE=$2

sed 's/\t/,/g' $INPUT_FILE > $OUTPUT_FILE

# for inplace sed use -i
# on osx need to do -i ''

