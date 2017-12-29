#!/bin/bash

# Including functions
source ./functions/menu.sh
source ./functions/repo.sh
source ./functions/backup.sh

# Arguments
dConfig=${1:-$(dirname $0)/config.txt}
mode=${2:-menu}

# Read config file
getConfig $dConfig

# Deal with mode
case $mode in
	"backup")		Sauvegarder ;;	# Silent backup
	*) 				menu ;;			# Menu
esac
