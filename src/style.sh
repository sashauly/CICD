#!/bin/bash

echo "STYLE TEST..."
cd ./src
cd ./cat && make clang 2>../style.log && cd ..
cd ./grep && make clang 2>../style.log && cd ..

if [[ $(cat ./style.log | wc -l) -eq 0 ]]; then
  echo "STYLE TEST OK!"
  rm ./style.log
  exit 0
else
  echo "STYLE TEST ERROR!"
  cat ./style.log
  rm ./style.log
  exit 1
fi
