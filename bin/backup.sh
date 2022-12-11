#!/usr/bin/env bash

set -e
set -x



cat $HOME/Repozytoria/.backup.conf | grep -e '^[^#]' | xargs -I {} sh -c 'echo "Backing up: $1" && mkdir -p $HOME/.rsync-buffer/Repozytoria/$1 && cd $HOME/Repozytoria/$1 && git bundle create --quiet $HOME/.rsync-buffer/Repozytoria/$1/$(date "+%Y-%m-%d").pack --all' -- {}
rsync --archive /home/eternalsh/.rsync-buffer/Repozytoria /mnt/d/Backup/WSL

