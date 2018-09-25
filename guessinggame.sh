#!/usr/bin/env bash
# File: guessinggame.sh

input counter=0                                      # user guesses, number of guesses
num_files=$(ls -l | grep -v ^l | wc -l)              # num file in cwd (excluding link files (-v ^l)

echo "Let's play a game! You guess how many files are in the current directory and I'll tell you if you are too low or too high. Keep guessing until you get the answer!"

prompt_user () {
	counter=$((counter + 1))                     # count valid & nonvalid (non-int) guesses

	# read user input to "input" variable
	if (( "$counter" > "1" )); then              # my IF statement
		read -p "Take another guess: " input
	else
		read -p "Take a guess: " input
	fi
}

validate_input () {
	if [[ $input =~ [0-9]+ ]] ; then
		x=x
	else
		echo "Only decimal integers are valid input."
		guessing_game
	fi
}

respond_to_user () {
	while (( $input != $num_files )); do         # my LOOP
		if (( $input > $num_files )); then
			echo Too high
			prompt_user
		elif (( $input < $num_files )); then
			echo Too low
			prompt_user
		fi
	done
	
	echo Congratulations! You guessed right in only $counter tries!
}

guessing_game () {                                   # my FUNCTION (POSIX-flavored syntax), same as `function prompt_user {`
	prompt_user
	validate_input
	respond_to_user
}

guessing_game
