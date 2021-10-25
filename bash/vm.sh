function vmnet {
    sudo /usr/lib/vmware/bin/vmware-netcfg 1>/dev/null & disown
}