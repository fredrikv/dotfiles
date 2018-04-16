#!/bin/bash
cd $(dirname $0)

FILENAME="./$(hostname).sh"
if [ -f "$FILENAME" ]
then
	"$FILENAME"
else
	cp template.sh "$FILENAME" && arandr "$FILENAME"
fi
