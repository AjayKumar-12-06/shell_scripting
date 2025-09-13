#!/bin/bash

movie=("RRR", "devara", "adf")

echo "print the movie :" ${movie[0]}

echo "print all the movies :"${movie[@]}

echo "number of movies passed:" ${#movie[@]}

