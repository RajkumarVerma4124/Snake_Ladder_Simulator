#!/bin/bash
echo -e "Welcome to the snake and ladder simulator program \n"

#Snake and Ladder game played with single player at start position 0(UC1).

#constant
startPosition=0

#The Player rolls the die to get a number between 1 to 6(UC2).
rollDie=$(($RANDOM % 6 + 1))

#The Player checks for a Option For No Play, Ladder or Snake.(UC3).
checkOption=$(($RANDOM % 3))
playerPosition=$startPosition

if [[ $checkOption -eq 0 ]]
then
	echo -e "No Play Option \n"
	playerPosition=$playerPosition
elif [[ $checkOption -eq 1 ]]
then
	echo -e "Ladder Option \n"
	playerPosition=$((playerPosition + rollDie))
elif [[ $checkOption -eq 2 ]]
then
	echo -e "Snake Option \n"
	currentPosition=$(($playerPosition - $rollDie))
	if [ $currentPosition -gt 0 ]
	then
		playerPosition=$((playerPosition - rollDie))
	else
		playerPosition=$playerPosition
	fi
fi
echo "Die Rolled With Value of : "$rollDie
echo "The Player Current Position After Die Rolled : "$playerPosition
