#!/bin/sh

main(){
    printf "What do you want to know about you pc? (cpu, dram, hd, devices)

    
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

}

dram(){

}

hd(){

}

devices(){
    
}