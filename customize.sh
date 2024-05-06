#!/system/bin/sh

# Systemless Hosts by the open source loving GL-DP and all contributors;
# Consolidating and extending hosts files from several well-curated sources

install_hosts() {
    . $MODPATH/addon/install.sh
    ui_print " Install Unified Hosts (UH)?"
    ui_print " "
    ui_print "  Vol+ = Yes"
    ui_print "  Vol- = No"
    ui_print " "
    if chooseport; then
        . $MODPATH/host-installer/uh.sh
    else
        ui_print " Install UH + fakenews + gambling + social ?"
        ui_print " "
        ui_print "  Vol+ = Yes"
        ui_print "  Vol- = No"
        ui_print " "
        if chooseport; then
            . $MODPATH/host-installer/uhfgs.sh
        else
            ui_print " Install Unified hosts + fakenews + gambling + porn + social?"
            ui_print " "
            ui_print "  Vol+ = Yes"
            ui_print "  Vol- = No"
            ui_print " "
            if chooseport; then
                . $MODPATH/host-installer/uhfgps.sh
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
    ui_print "- Installing & patching hosts"
    install_hosts
    patch_hosts
    ui_print " "
    ui_print "- Cleaning up"
    cleanup
    ui_print " "
}

run_install
