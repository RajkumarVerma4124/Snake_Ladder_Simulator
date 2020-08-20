#!/bin/bash
echo "Welcome to the snake and ladder simulator program"

#Snake and Ladder game played with single player at start position 0(UC1).

#variables
startPosition=0

#The Player rolls the die to get a number between 1 to 6(UC2).
rollDie=$(($RANDOM % 6 + 1))
echo $rollDie
