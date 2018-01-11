# Snapshots menu
function MenuSnap {
	ListeSnaps
	printf "\nSnapshot to deal with: "
	read Snapshot

	PS3="Action on snapshot $Snapshot: "
	options=(
		"List files"
		"Remove"

		"Back to repo menu"
	)
	select opt in "${options[@]}"
	do
		case $opt in
			"List files") 				FichiersSnap ;;
			"Remove") 					SupprSnap ;;

			"Back to repo menu") 		break ;;

			*) err "I agree with you.";;
		esac
		printf "=====================================\n"
	done
	printf "\n"
	menu
}

function ListeSnaps {
	eval "$ComDefaut snapshots"
}
function FichiersSnap {
	eval "$ComDefaut ls $Snapshot"
}
function SupprSnap {
	echo "Snapshot ID to remove ?"
	read Snapshot
	eval "$ComDefaut forget $Snapshot"
}
