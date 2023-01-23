# This script is made to set a cron task used to save your shared files
# To configure the cron, change the variable below:

source utils/tools.sh;

# Path to shared folder
shared="/var/www/cdn.alexishenry.eu/public/shared";

# Save folder path
saved="/home/alexis/save_my_files";

function crontab() {
	if [[ ! -d ${saved} ]]; then
		throw "Save folder specified [ ${saved} ] does not exist" true;
	elif [ "$EUID" -ne 0 ]; then 
		throw "Please, run this script as root" true;
	fi
	echo "cp -r ${shared} ${saved}/cdn_save_\$(date +%s)" > /etc/cron.hourly/cdn-autosave
}

crontab;