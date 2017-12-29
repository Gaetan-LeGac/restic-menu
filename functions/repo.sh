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
		
		# Deal by key
		case ${decomp[0]} in
			# Define repo path
			"repo") ComDefaut+=" -r ${decomp[1]}" ;;
			# Define repo password (unsafe, but useful for cronjob)
			"mdp") 	export RESTIC_PASSWORD=${decomp[1]} ;;
			
			# Add dir to exclude from backup
			"sauf") exclure+=(${decomp[1]}) ;;
			# Comment. Nothing to do
			"#") 	exclure+=(${decomp[1]}) ;;
			# Add dir to backup / restore
			*)		dossiers+=(${decomp[0]}) ;;
		esac
	done < "$1"
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
