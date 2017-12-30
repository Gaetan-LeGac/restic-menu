# Command base
ComDefaut="restic"

# Config reading
dossiers=()
exclure=()
function getConfig {
	# Iterate each config file lines
	while IFS='' read -r ligne || [[ -n "$ligne" ]]; do
		# Separate key and value
		decomp=(${ligne//:/ })
		key=${decomp[0]}
		value=${decomp[1]}

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
			"#") 	exclure+=(${decomp[1]}) ;;
			# Add dir to backup / restore
			*)		dossiers+=(${decomp[0]}) ;;
		esac
	done < "$1"
	printf "\n"
}

function Init {
	eval "$ComDefaut init"
}

function Verifier {
	eval "$ComDefaut check"
}

function Fusionner {
	eval "$ComDefaut prune"
}

function Vider {
	eval "$ComDefaut snapshots"
	echo "Snapshot to remove ?"
	read Snapshot
	eval "$ComDefaut forget $Snapshot"
}
