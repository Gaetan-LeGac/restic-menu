#!/bin/bash

# Including functions
source ./functions/utils.sh

source ./functions/repo.sh
source ./functions/snap.sh

source ./functions/backup.sh

# ...
info "Made with <3 by Gaëtan Le Gac for GNU/Linux users who feel sentiments for their precious data :)"

# Default command
ComDefaut="restic"

# Arguments
dConfig=${1:-$(dirname $0)/profiles}
mode=${2:-menu}

# Read config file
getConfig $dConfig

# Deal with mode
case $mode in
	"backup")		Sauvegarder ;;
	# TODO: More options (I don't need it for the moment)
	*) 				menu ;;
esac
