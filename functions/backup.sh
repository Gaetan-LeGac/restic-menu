# Backup
function Sauvegarder {
	commande+="$ComDefaut backup"
	# Dirs to backup
	for dossier in "${dossiers[@]}"; do
	   commande+=" '$dossier'"
	   echo $dossier
	done
	# Dirs to exclude
	for exclu in "${exclure[@]}"; do
	   commande+=" --exclude '$exclu'"
	done
	# Show and run command
	echo $commande
	eval $commande
	commande=""
}

# Restore
function Restaurer {
	# Defining snapshot
	eval "$ComDefaut snapshots"
	echo "Snapshot ? (empty = latest)"
	read Snapshot
	Snapshot=${Snapshot:-latest}
	
	# Custom destination
	echo "Destination ? (empty = original destination)"
	read Destination
	
	# Restore
	for dossier in "${dossiers[@]}"; do
		parentdossier=$(dirname $dossier)
	   eval "$ComDefaut restore $Snapshot --path $dossier --target $Destination$parentdossier"
	done
	echo $commande
	eval $commande
	commande=""
}
