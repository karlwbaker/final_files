#!/usr/bin/env bash

all: README.md

README.md: 
	echo **Project title**: Guessing Game "<br />"  > README.md
	echo **make run time**: "$$(date)" "<br />"  >> README.md
	echo **Lines of code**: "$$(cat ./guessinggame.sh | wc -l)" >> README.md
