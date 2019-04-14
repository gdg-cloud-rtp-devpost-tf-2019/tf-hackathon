#!/bin/bash

# $@ represents all arguments
# $# is the count of arguments

# converts the specified files from tsv format to csv
# strips the comment text and the mystery line which looks like
# 
# Assumes the files are in the tf-hackathon filesystem


# where is the root of this project
fs_root_dir="/home/davis/progs/tf-hackathon"

# where to read the input files in .tsv format
tsv_dir=${fs_root_dir}"/tsv"
# where to write the output files
csv_dir=${fs_root_dir}"/csv"
# where the helper bash scripts are located
bin_dir=${fs_root_dir}"/bin"


files_to_process="SN0204288721 SN0204291317 SN0204293125 SN0204295505 SN02042928 SN0204297575 SN02043155 SN0204288539 SN0204300267"

# error handling
yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
try() { "$@" || die "cannot $*"; }



# Pass one: replace tabs with commas
for a_file in $files_to_process ; do
    echo "Pass 1: Convert ${a_file}.tsv to ${a_file}.csv"
    ./mytab2space.sh ${tsv_dir}/${a_file}.tsv ${csv_dir}/${a_file}.csv 
done

# Pass two: cut the first 33 lines
for a_file in $files_to_process ; do
    echo "Pass 2: Remove the initial 33 lines of text in ${a_file}.csv"
    if    [[ "$OSTYPE" == "linux-gnu" ]]; then
        sed -i '1,33d' ${csv_dir}/${a_file}.csv 
    elif  [[ "$OSTYPE" == "darwin"* ]]; then
        # osx uses bsd sed and requires a blank suffix for 
        # inplace edits
        sed -i '' '1,33d' ${csv_dir}/${a_file}.csv 
    else
        die "unknown os type. script line number=$LINENO"
    fi
done

# Pass three: add a header
header="usgs,site_no,date,tidal_high,tidal_high_qc,tidal_low,tidal_low_qc,precipitation_inches,precip_qual_code\n"
for a_file in $files_to_process ; do
    echo "Pass 3: Add header to ${a_file}.csv"
    if    [[ "$OSTYPE" == "linux-gnu" ]]; then
        sed -i "1s;^;${header};" ${csv_dir}/${a_file}.csv 
    elif  [[ "$OSTYPE" == "darwin"* ]]; then
        # osx uses bsd sed and requires a blank suffix for 
        # inplace edits
        sed -i '' "1s;^;${header};" ${csv_dir}/${a_file}.csv 
    else
        die "unknown os type. script line number=$LINENO"
    fi
done


echo "normal exit"


