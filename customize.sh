#!/system/bin/sh

#
# Systemless Hosts by the
# open source loving GL-DP and all contributors;
# Consolidating and extending hosts files from several well-curated sources
# Systemless Hosts by the open source loving GL-DP and all contributors;
# Consolidating and extending hosts files from several well-curated sources

# Checking for installation environment
install_hosts() {
    . $MODPATH/addon/install.sh
    ui_print " Install Unified Hosts (UH)?"
    ui_print " "
    ui_print "  Vol+ = Yes"
    ui_print "  Vol- = No"
    ui_print " "
    if chooseport; then
        ui_print "- Unified Hosts Selected"
        HOSTS_URL="https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
        GIT_URL="https://github.com/StevenBlack/hosts"
        ui_print "- Downloading latest hosts file from $GIT_URL"
        curl -o $MODPATH/hosts $HOSTS_URL
        if [ $? -ne 0 ]; then
            ui_print "Error: Failed to download hosts file."
            exit 1
        fi
    else
        ui_print " Install UH + fakenews + gambling + social ?"
        ui_print " "
        ui_print "  Vol+ = Yes"
        ui_print "  Vol- = No"
        ui_print " "
        if chooseport; then
            ui_print "- Unified hosts + fakenews + gambling + social Selected"
            HOSTS_URL="https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-social/hosts"
            GIT_URL="https://github.com/StevenBlack/hosts"
            ui_print "- Downloading latest hosts file from $GIT_URL"
            curl -o $MODPATH/hosts $HOSTS_URL
            if [ $? -ne 0 ]; then
                ui_print "Error: Failed to download hosts file."
                exit 1
            fi
        else
            ui_print " Install Unified hosts + fakenews + gambling + porn + social?"
            ui_print " "
            ui_print "  Vol+ = Yes"
            ui_print "  Vol- = No"
            ui_print " "
            if chooseport; then
                ui_print "- Unified hosts + fakenews + gambling + porn + social Selected"
                HOSTS_URL="https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts"
                GIT_URL="https://github.com/StevenBlack/hosts"
                ui_print "- Downloading latest hosts file from $GIT_URL"
                curl -o $MODPATH/hosts $HOSTS_URL
                if [ $? -ne 0 ]; then
                    ui_print "Error: Failed to download hosts file."
                    exit 1
                fi
            else
                ui_print "- Exiting"
            fi
        fi
    fi
}

patch_hosts() {
    PATH=/system/etc
    ui_print "- Patching hosts file"
    mkdir -p $MODPATH$PATH
    mv -f $MODPATH/hosts $MODPATH$PATH
}

cleanup() {
    rm -rf $MODPATH/LICENSE
    rm -rf $MODPATH/addon 2>/dev/null
    rm -f $MODPATH/install.sh 2>/dev/null
}

run_install() {
    unzip -o "$ZIPFILE" -x 'META-INF/*' -d $MODPATH >&2
    ui_print " "
    ui_print " Installing & patching hosts"
    install_hosts
    patch_hosts
    ui_print " "
    ui_print " Cleaning up"
    cleanup
    ui_print " "
}

run_install
