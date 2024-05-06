ui_print "- Unified Hosts + fakenews + gambling Selected"
HOSTS_URL="https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts"
GIT_URL="https://github.com/StevenBlack/hosts"
ui_print "- Downloading latest hosts file from $GIT_URL"
curl -o $MODPATH/hosts $HOSTS_URL
    if [ $? -ne 0 ]; then
    ui_print "Error: Failed to download hosts file."
    exit 1
fi