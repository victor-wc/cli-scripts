#!/bin/sh

main(){
    printf "What do you want to know about you pc? (cpu, dram, hd, devices) \n"
    read -r option
    
    if [ "$option" = "cpu" ]; then
        if [ -z "$option" ]; then
            echo 'You need to pass a input'
            exit 1
        else
            cpu
        fi
    else
        if [ "$option" = "dram" ]; then
            if [ -z "$option" ]; then
                echo 'You need to pass a input'
                exit 1
            else
                dram
            fi
        else
            if [ "$option" = "hd" ]; then
                if [ -z "$option" ]; then
                    echo 'You need to pass a input'
                    exit 1
                else
                    hd
                fi
            else
                if ["$option" = "devices"]; then
                    if [-z "$option" ]; then
                        echo 'You need to pass a input'
                        exit 1
                    else
                        devices
                    fi
                else
                    general_overview
                fi
            fi
        fi
    fi
}

cpu(){
    echo "\n"
    echo "==============================================================="
    lscpu | awk '{l[NR] = $0} END {
        print l[1]
        print "\n"
        print l[2]
        print "\n"
        print l[5]
        print "\n"
        print l[14]
        print "\n"
        print l[16]
        }'
    echo "==============================================================="
}

dram(){
    sudo dmidecode -t memory | grep -i size
    echo "\n"
    echo "==============================================================="
    sudo dmidecode -t memory | grep -i size | awk '{l[NR] = $0} END {
        for (i=1; i<=NR; i+5){
                print l[i]
                print "\n"
            }
        }'
    echo "==============================================================="

}

hd(){
    echo "\n"
    echo "==============================================================="
    sudo lshw -short -C disk | awk '{l[NR] = $0} END {
        print l[1]
        print "\n"
        for (i=3; i<=NR; i++){
                print l[i]
                print "\n"
            }
        }'
    echo "==============================================================="
}

devices(){
    lsusb
}

general_overview(){
    lshw
}

main "$@"
