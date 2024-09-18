#!/bin/bash
mathvar1=($[1+5])
mathvar2=($[$mathvar1*20])
mathvar3=10
mathvar4=($[$mathvar1*($mathvar2+$mathvar3)])
echo "Variable 1 is $mathvar1. Variable 2 is $mathvar2. Using $mathvar3 for Variable 3, our final Variable 4 is $mathvar4."
