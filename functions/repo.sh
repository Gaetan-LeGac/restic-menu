# Repo menu
function menu {
	PS3="Todo in current repo: "
	options=(
		"Initialize"
		"Check"
		"Remove useless data"
		"Re-build index file"

		"${green_txt}Backup${reset_txt}"
		"${green_txt}Restore${reset_txt}"

		"Manage Snapshots"

		"Quit"
	)
	select opt in "${options[@]}"
	do
		case $opt in
			"Initialize") 			Init ;;
			"Check") 				Verifier ;;
			"Remove useless data")  Clean ;;
			"Re-build index file")  Rebuild ;;

			"${green_txt}Backup${reset_txt}") 	Sauvegarder ;;
			"${green_txt}Restore${reset_txt}") 	Restaurer ;;

			"Manage Snapshots") 	MenuSnap ;;

			"Quit")		exit ;;
			*) err "Are you drunk ?";;
		esac
		printf "=====================================\n"
	done
}


function Init {
	eval "$ComDefaut init"
}
function Verifier {
	eval "$ComDefaut check"
}
function Clean {
	eval "$ComDefaut prune"
}
function Rebuild {
	eval "$ComDefaut rebuild-index"
}
