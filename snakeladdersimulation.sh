#!/bin/bash
echo -e "Welcome to the snake and ladder simulator program \n"

#Snake and Ladder game played with single player at start position 0(UC1).

#constant
startPosition=0
playerPosition=$startPosition

#Ensure the player gets to exact winning position 100(UC5).
function  startGame(){
	#Repeat till the Player reaches the winning position 100(UC4). 
	while [ $playerPosition -lt 100 ]
	do
		#The Player rolls the die to get a number between 1 to 6(UC2).
		rollDie=$(($RANDOM % 6 + 1))

		#The Player checks for a Option For No Play, Ladder or Snake.(UC3).
		checkOption=$(($RANDOM % 3))

		if [[ $checkOption -eq 0 ]]
		then
			#No Play Option
			playerPosition=$playerPosition
			echo "Current Player Position With No Play Option : $playerPosition"
		elif [[ $checkOption -eq 1 ]]
		then
			if [[ "$(($playerPosition + $rollDie))" -gt "100" ]]		
			then
				continue
			else
				#Ladder Option
				playerPosition=$((playerPosition + rollDie))
				echo "Current Player Position With Ladder Option And Dice With $rollDie : $playerPosition"
			fi
		elif [[ $checkOption -eq 2 ]]
		then
			#Snake Option
			currentPosition=$(($playerPosition - $rollDie))
			if [ $currentPosition -gt 0 ]
			then
				playerPosition=$((playerPosition - rollDie))
			else
				playerPosition=$playerPosition
			fi
			echo "Current Player Position With Snake Option And Dice With $rollDie : $playerPosition"
		fi
	done
	echo "Player Reached The Winning Position :"$playerPosition
}
startGame
