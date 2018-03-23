#!/bin/zsh

DB_OPTS=""
USAGE=(echo "Usage: $0 -s input_dir {-d output_dir NYI} [-j jar_directory]")

# path with the dem-to-json repo
BAPATH=./dem-to-json/target
SOURCEDIR=./dota/dem
DESTDIR=./dota/json
JARDIR=./dem-to-json/target
LOGGING=false

while getopts "djhs" c
do
	case $c in
		s)  DB_OPTS=$DB_OPTS" --source="$OPTARG;;
		d)  DB_OPTS=$DB_OPTS" --destination="$OPTARG;;
		j)  DB_OPTS=$DB_OPTS" --demtojsonjarpath="$OPTARG;;
		l)  LOGGING=true;;
		h)  echo $USAGE 1>&2; exit 2;;
	esac
done

while test $# -gt 0;
do
	case "$1" in
		--source=*)
			SOURCEDIR="$optarg";;
		--destination=*)
			DESTDIR="$optarg";;
		--demtojsonjarpath=*)
			JARDIR="$optarg";;
		*)
			$USAGE 1 1>&2 ; exit 2;;
	esac
done

if $LOGGING ; then
	for elem in $(ls $SOURCEDIR/*.dem) ; do
		echo "converting $elem"
		# suppress verbose output, write errors to error.log
		java -jar $JARDIR/dem-to-json-1.3.one-jar.jar $SOURCEDIR/$elem \
			$DESTDIR/$(sed -e '$s/dem/json/' <<< "$elem") 1>/dev/null 2>./error.log
	done
else
	for elem in $(ls $SOURCEDIR | grep .dem) ; do
		echo "converting $elem"
		# suppress verbose output
		java -jar $JARDIR/dem-to-json-1.3.one-jar.jar $SOURCEDIR/$elem \
			$DESTDIR/$(sed -e '$s/dem/json/' <<< "$elem") 1>/dev/null
	done
fi
