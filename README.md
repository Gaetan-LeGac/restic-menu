# Basic CLI for restic

A very simple tool to use restic without any command line.
The goal is to run incremental backups via cron and restore data where you want and easily.

Only one snapshot repo is supported for now.

## Install

You need to install the restic package:

> sudo apt update && sudo apt install restic

Don't forget to make the script executable:

> sudo chmod +x ./Backup.sh

And then edit config.txt to fit your needs.

## How to use

> ./Backup.sh [Configuration file] [mode]

* Configuration file: 
	- Description: Path to the configuration file
	- Default value: Script path
* Mode: 
	- Description: Running mode
	- Possible values:
		- backup: Do a silent backup (useful for automatisations)
		- Anything else: Show the menu
