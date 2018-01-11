blue_txt="$(tput setaf 6)"
green_txt="$(tput setaf 2)"
red_txt="$(tput setaf 1)"
reset_txt="$(tput sgr0)"

function trim {
	echo ${1##*( )}
}

function info {
	echo "${blue_txt}[i] $1${reset_txt}"
}

function err {
	echo "${red_txt}[!] $1${reset_txt}"
}

# Config reading
dossiers=()
exclure=()
function getConfig {
	info "Searching for profiles in $1"
	printf "\n"
	profiles=( $(find $1 -maxdepth 1 -name "*.txt" -print0 | xargs -0) )

	PS3="Profile to load: "
	select profile in "${profiles[@]}" "Enter full path" "Quit" ; do
	    if (( REPLY == 1 + ${#profiles[@]} )) ; then
	        echo "Full path to profile file:"
			read $profile
			break;
		elif (( REPLY == 2 + ${#profiles[@]} )) ; then
			exit
	    elif (( REPLY <= 0 || REPLY > ${#profiles[@]} )) ; then
	        err "Is your keyboard broken ?"
		else
			break;
	    fi
	done

	if [ ! -f $profile ]; then
		err "Error: Can't find $profile . Exiting."
		exit
	fi

	printf "\n"

	# Iterate each config file lines
	while IFS='' read -r ligne || [[ -n "$ligne" ]]; do
		# Separate key and value
		decomp=(${ligne//=/ })
		key=$(trim ${decomp[0]})
		value=$(trim ${decomp[1]})

		# Deal by key
		case ${decomp[0]} in
			# Define repo path
			"repo")
				info "Current repo: ${decomp[1]}"
				ComDefaut+=" -r ${decomp[1]}" ;;
			# Define repo password (unsafe, but useful for cronjob)
			"mdp")
			 	info "Password defined from config"
				export RESTIC_PASSWORD=${decomp[1]} ;;

			# Add dir to exclude from backup
			"sauf") exclure+=(${decomp[1]}) ;;
			# Comment. Nothing to do
			"#") ;;
			# Add dir to backup / restore
			*)		dossiers+=(${decomp[0]}) ;;
		esac
	done < "$profile"
	printf "\n"
}
