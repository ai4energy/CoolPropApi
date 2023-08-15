#!/bin/bash

START=1
END=$1
echo "starting $1 coolprop api servers ..."

for (( c=$START; c<=$END; c++ ))
do
	julia --project=/opt/coolpropapi apiserver.jl &
done

wait
echo "coolprop api servers stopped"