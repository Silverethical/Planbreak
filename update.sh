#!/bin/bash

if [ -z "$1" ]
then
	echo "Please specify a message"
else
	rm -rf Packages*
	dpkg-scanpackages -m ./debs /dev/null > Packages
	bzip2 -k Packages
	git add .
	git commit -m "$1"
	git push
fi
