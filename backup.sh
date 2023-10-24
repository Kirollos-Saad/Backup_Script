#!/bin/bash

if [ "$#" -ne 4 ]; then
    echo "Please provide 4 arguments"
    exit 1
fi

src_dir="$1"
dest_dir="$2"
interval="$3"
max_backups="$4"

while true; do
    ls -Rl "$src_dir" > current_status.txt

    changed=$(diff current_status.txt last_status.txt | wc -l)

    if [ "$changed" -eq 0 ]; then
        echo "not changed"

    else
        echo "changed"
        new_date=$(date +'%Y-%m-%d-%H-%M-%S')
        mkdir -p "$dest_dir/$new_date"
        cp -r "$src_dir/" "$dest_dir/$new_date"
        cat current_status.txt > last_status.txt
    fi

    backups=$(ls "$dest_dir" | wc -w)
    echo "$backups"

    if [ "$backups" -gt "$max_backups" ]; then
        file=$(ls "$dest_dir" -tr | head -n 1)
        rm -r "$dest_dir/$file"
    fi

    sleep "$interval"
done
