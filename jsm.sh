#!/usr/bin/env bash

### JSM ###

if [ ! -f "jsmfile" ]
then
    echo
    echo "[ERROR] No jsmfile found"
    exit 1
fi

if [ -z "$1" ]
then
    echo
    echo "[ERROR] Please specify an output file"
    exit 2
fi

if [ -n "$2" ]
then
    echo
    echo "[ERROR] Too many arguments supplied"
    exit 3
fi

echo
echo "jsm is up and running"
echo "Output will be saved to $1"
echo "Press Ctrl-C to stop..."

mkdir -p ".jsm"
mkdir -p "$(dirname "$1")"

while true
do
    while read line
    do
        if [[ ! "${line}" =~ ^# ]] && [ -n "${line}" ]
        then
            if [ -f "${line}" ]
            then
                echo "// BEGIN $(basename ${line})" >> ".jsm/new"
                echo "" >> ".jsm/new"
                cat "${line}" >> ".jsm/new"
                echo "" >> ".jsm/new"
                echo "// END $(basename ${line})" >> ".jsm/new"
            else
                echo "[ERROR] ${line} is not a file"
            fi
        fi
    done < "jsmfile"
    if ! diff ".jsm/old" ".jsm/new" >/dev/null 2>&1
    then
        cp ".jsm/new" "$1"
        echo "Updated $1"
    fi
    mv ".jsm/new" ".jsm/old"
    sleep 2
done

exit 0
