#!/usr/bin/env bats

setup () {
  name="legsta"
  bats_require_minimum_version 1.5.0
  dir=$(dirname "$BATS_TEST_FILENAME")
  cd "$dir"
  exe="$dir/../bin/$name"
  tab=$'\t'
}

@test "Script syntax check" {
  run -0 perl -c "$exe"
}
@test "Version" {
  run -0 $exe --version
  [[ "$output" =~ "$name " ]]
}
@test "Help" {
  run -0 $exe --help
  [[ "$output" =~ "SBT" ]]
}
@test "No parameters" {
  run ! $exe
}
@test "Bad option" {
  run ! $exe --doesnotexist
}
@test "Null input" {
  run ! $exe /dev/null
  [[ "$output" =~ "ERROR" ]]
}
@test "Quiet mode" {
  run -0 $exe --quiet NC_006368.fna
  [[ ! "$output" =~ "Loaded" ]]
}
@test "Normal input" {
  run -0 $exe --quiet NC_006368.fna
  [[ "${lines[0]}" =~ "FILE${tab}SBT${tab}" ]]
  [[ "${lines[1]}" =~ "${tab}1${tab}1${tab}1${tab}" ]]
}
@test "Option --noheader" {
  run -0 $exe --quiet --noheader NC_006368.fna
  [[ "${lines[0]}" =~ "${tab}1${tab}1${tab}1${tab}" ]]
  [[ ! "$output" =~ "SBT" ]] 
}
@test "Option --csv" {
  run -0 $exe --quiet --csv NC_006368.fna
  [[ "${lines[0]}" =~ "FILE,SBT" ]]
  [[ ! "$output" =~ "${tab}" ]] 
}
@test "Newer SBT" {
  run -0 $exe --quiet -noheader --csv NC_018140.fna
  [[ "${lines[0]}" =~ "NC_018140.fna,734,2,6,17,1,1,8,11" ]]
}
@test "Missing allele" {
  run -0 $exe --quiet -noheader --csv missing_flaA.fna
  [[ "${lines[0]}" =~ "missing_flaA.fna,-,-,14,16,25,7,13,206" ]]
}
@test "Missing primers {
  run -0 $exe --csv FJBS01000000.fna.bz2
  [[ "$output" =~ ",?" ]]
}
@test "Compressed Genbank folder" {
  run -0 $exe --csv CR628336.1.gbk.gz
  [[ "$output" =~ ",4,3,1," ]]
}
