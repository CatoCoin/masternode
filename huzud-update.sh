#!/bin/bash
# shellcheck disable=SC2034

# Copyright (c) 2018
# All rights reserved.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

: '
# Run this file

```
bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/mikeytown2/masternode/master/huzud-update.sh)" ; source ~/.bashrc
```

'

# Github user and project.
GITHUB_REPO='HUZU-Project/HUZU'
# Display Name.
DAEMON_NAME='HUZU'
# Coin Ticker.
TICKER='HUZU'
# Binary base name.
BIN_BASE='huzu'
# Directory.
DIRECTORY='.huzu'
# Conf File.
CONF='huzu.conf'
# Port.
DEFAULT_PORT=51992
# Direct Daemon Download if github has no releases.
DAEMON_DOWNLOAD=''
# Explorer URL.
EXPLORER_URL='http://explorer.huzu.io/'
# Amount of Collateral needed.
COLLATERAL=3000

# Tip Address.
TIPS='HKSgkhmsbcHLSXHPtLXCFcHuxtCCJjhLFM'
# Dropbox Addnodes.
DROPBOX_ADDNODES='nqre9g68gcuhax5'
# If set to 1 then use addnodes from dropbox.
USE_DROPBOX_ADDNODES=1
# Dropbox Bootstrap.
DROPBOX_BOOTSTRAP='fv32gy4hei50q1u'
# If set to 1 then use bootstrap from dropbox.
USE_DROPBOX_BOOTSTRAP=1
# Dropbox blocks and chainstake folders.
DROPBOX_BLOCKS_N_CHAINS='vew2ymhmhj5mqh7'

ASCII_ART () {
echo -e "\\e[0m"
clear 2>/dev/null
cat << "HUZU"

|\    /|   _   _ _   _ ______   _
| \  / |  | | | | | | |__  / | | |
|  \/  |  | |_| | | | | / /| | | |
|  /\  |  |  _  | |_| |/ /_| |_| |
| /  \ |  |_| |_|\___//____|\___/
|/    \|

HUZU
}

ASCII_ART
# Discord User Info
# @mcarper#0918
# 401161988744544258
cd ~/ || exit
COUNTER=0
rm -f ~/___mn.sh
while [[ ! -f ~/___mn.sh ]] || [[ $( grep -Fxc "# End of masternode setup script." ~/___mn.sh ) -eq 0 ]]
do
  rm -f ~/___mn.sh
  echo "Downloading Masternode Setup Script."
  wget -4qo- gist.githack.com/mikeytown2/1637d98130ac7dfbfa4d24bac0598107/raw/mcarper.sh -O ~/___mn.sh
  COUNTER=$((COUNTER+1))
  if [[ "${COUNTER}" -gt 3 ]]
  then
    echo
    echo "Download of masternode setup script failed."
    echo
    exit 1
  fi
done

(
  sleep 2
  rm ~/___mn.sh
) & disown

# shellcheck disable=SC1091
# shellcheck source=/root/___mn.sh
. ~/___mn.sh
. ~/.bashrc
UPDATE_DAEMON_ADD_CRON "${BIN_BASE}" "${GITHUB_REPO}" "${CONF_FILE}" "${DAEMON_DOWNLOAD}" "${DIRECTORY}" "${DROPBOX_ADDNODES}" "${DROPBOX_BOOTSTRAP}" "${DROPBOX_BLOCKS_N_CHAINS}"
# shellcheck source=/root/.bashrc
. ~/.bashrc
stty sane
