# Basic CLI for restic

A very simple tool to use restic without any command line with profile files.

![Preview](https://raw.githubusercontent.com/Gaetan-LeGac/restic-menu/master/preview.png "Preview")

## Install

You need to install the restic package:

> sudo apt update && sudo apt install restic

Don't forget to make the script executable:

> sudo chmod +x ./Backup.sh

And then edit config.txt to fit your needs.

## How to use

To show Menu, simply type:

> ./Backup.sh

You can define a specific profile(s) path and automatically run a task (nice for cron tasks):

> ./Backup.sh [Profiles path] [Action]

* Profile path (Optional)
	- Description: Path to the profiles directory.
		I can also be a file path to load immediatly.
	- Default value: ./config (relative to script path)
* Task (Optional)
	- Description: Task to run
	- Possible values:
		- backup (Default)
		- Anithing else: show the menu

## Profile file

Config file is really simple: key = value :)
You can check ./profiles/example.txt to see possible keys.

## I hope i will be as usefull as in my case ;)

Don't hesitate to make it better, I know I'm not a god about Bash.
