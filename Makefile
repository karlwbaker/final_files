#!/usr/bin/env bash

all: README.md

README.md: 
	echo **Project title**: Guessing Game > README.md
	echo **make run time**: "$$(date)" >> README.md
	echo **Lines of code**: "$$(cat ./guessinggame.sh | wc -l)" >> README.md
