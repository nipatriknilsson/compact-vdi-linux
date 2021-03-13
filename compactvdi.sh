#!/bin/bash

function compact()
{
    local r=1
    
    filestamp="$1.stamp"
    file="$1"
    
    if [ -f "$filestamp" ] ; then
        c1=$(stat -c '%Y' "$file")
        c2=$(stat -c '%Y' "$filestamp")
        [ "$c1" -eq "$c2" ] && r=0
    fi

    echo "$file"

    if [ "$r" == "1" ] ; then
        ( VBoxManage showhdinfo "$file" | grep -q -E 'State:[[:space:]]+locked' && echo "Disk file is locked!" ) || ( VBoxManage modifymedium "$file" --compact && touch -r "$file" "$filestamp" || echo "Failed!" )
    else
        echo "Already compacted!"
    fi

    echo
}

find "/home/$USER/VirtualBox VMs" -name '*.vdi' -type f 2>/dev/null | LANG=C sort | while read file; do compact "$file"; done

