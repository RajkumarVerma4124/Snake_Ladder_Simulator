#!/bin/bash
echo -e "Welcome to the snake and ladder simulator program \n"

#Snake and Ladder game played with single player at start position 0(UC1).

#array
declare -A player
declare -A playerDieCount

#variables
player[1]=0
player[2]=0
playerDieCount[1]=0
playerDieCount[2]=0
players=1

#constant
startPosition=0
dieRolled=0
playerPosition=$startPosition

#Ensure the player gets to exact winning position 100(UC5).
function  startGame(){
	#Repeat till the Player reaches the winning position 100,The Player rolls the die to get a number between 1 to 6(UC2).
	rollDie=$(($RANDOM % 6 + 1))
	
	#The Player checks for a Option For No Play, Ladder or Snake.(UC3).
	checkOption=$(($RANDOM % 3))
		
	#No. of times the dice played to win the game (UC6).
	dieRolled=$((dieRolled+1))
	i=$1
	playerPosition=${player[$i]}
	playerDieCount[$i]=$((${playerDieCount[$i]} + 1))	
	
	if [[ $checkOption -eq 0 ]]
	then
		#No Play Option
		player[$i]=$playerPosition
		echo -e "Player $i Got No Play Option : $playerPosition \n"
	fi

	if [[ $checkOption -eq 1 ]]
	then
		#Ladder Option
		currentPosition=$(($playerPosition + $rollDie))
		if [[ $currentPosition -le 100 ]]		
		then
			playerPosition=$(($playerPosition + $rollDie))
			player[$i]=$playerPosition
		else
			player[$i]=$playerPosition
		fi
		echo -e "Player $i Got Ladder Option With Dice Value $rollDie  : $playerPosition \n"
	fi

	if [[ $checkOption -eq 2 ]]
	then
		#Snake Option
		currentPosition=$(($playerPosition - $rollDie))
		if [ $currentPosition -ge 0 ]
		then
			playerPosition=$(($playerPosition - $rollDie))
			player[$i]=$playerPosition
		else
			player[$i]=$playerPosition
		fi
		echo -e "Player $i Got Snake Option With Dice Value $rollDie : $playerPosition \n"
	fi

	if [ $checkOption -eq 1 -a ${player[$i]} -ne 100 ]
	then
		startGame $i
	fi
}

#Playing the game with 2 Player and reporting which Player won the game (UC7).

#Main Code
while true
do
	if [ $players -eq 1 ] 
	then
		startGame 1
		players=2
		if [ ${player[1]} -eq 100 ]
		then
			echo -e "Player 1 won with dice count of ${playerDieCount[$i]} \n"
			break
		else
			continue
		fi
	fi	

	if [ $players -eq 2 ]
	then
		startGame 2
		players=1
		if [ ${player[2]} -eq 100 ]
		then
			echo -e "Player 2 won with dice count of ${playerDieCount[$i]} \n"
			break
		else
			continue
		fi

	fi
done
echo "Total No. Of Dice Count In This Game : $dieRolled"
dieCount=$(($dieRolled - ${playerDieCount[$i]}))
echo "Other Player Loss with dice count of $dieCount"
