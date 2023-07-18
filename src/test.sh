#!/bin/bash

echo "Functional TEST..."
cd src/cat/ && make test 2>../test_cat.log 1>../test_cat.log
cd ../grep/ && make test 2>../test_grep.log 1>../test_grep.log

cd ..
if [[ $(cat ./test_cat.log | tail -6 | grep SUCCESS | awk '{print $2}' | cut -c1-3) != 526 ]]; then
  cat ./test_cat.log
  rm ./test_cat.log
  echo "Functional TEST ERROR(cat)!"
  exit 1
elif [[ $(cat ./test_grep.log | tail -6 | grep SUCCESS | awk '{print $2}' | cut -c1-4) != 1553 ]]; then
  cat ./test_grep.log
  rm ./test_grep.log
  echo "Functional TEST ERROR(grep)!"
  exit 1
else
  rm ./test_cat.log
  rm ./test_grep.log
  echo "Functional TEST OK!"
fi
