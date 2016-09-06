#!/bin/bash

function getuser() {
    read -p "who are you? " username

    if [ ! -d /home/$username ]; then
        echo "$username is not here"
        exit 1
    fi

    echo "damn right you are!"
}
