#!/bin/bash

# Including functions
source ./functions/utils.sh

source ./functions/repo.sh
source ./functions/snap.sh

source ./functions/backup.sh

# Default command
ComDefaut="restic"

# Arguments
dConfig=${1:-$(dirname $0)/config}
mode=${2:-menu}

# Read config file
getConfig $dConfig

# Deal with mode
case $mode in
	"backup")		Sauvegarder ;;	# Silent backup
	*) 				menu ;;			# Menu
esac
