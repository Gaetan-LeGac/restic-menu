function menu {
	PS3="What's on your mind bro ? "
	options=(
		"Initialize repo" 
		"Backup" "Restore" 
		"Check repo"
		"Clean data" 
		"Remove snapshot" 
		"Quit"
	)
	select opt in "${options[@]}"
	do
		case $opt in
			"Initialize repo") 	Init ;;
			
			"Backup") 	Sauvegarder ;;
			"Restore") 	Restaurer ;;
			
			"Check repo") 	Verifier ;;
			"Clean data") 	Fusionner ;;
			"Remove snapshot") 	Vider ;;
			
			"Quit")		exit ;;
			*) echo "Are you drunk ?";;
		esac
		printf "=====================================\n"
	done
}
