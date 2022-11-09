!#/bin/bash
$ROOTCMD npm install -g yarn
$ROOTCMD adduser --disabled-password --disabled-login misskey
$ROOTCMD sudo -u misskey -D /home/misskey git clone --recursive https://github.com/misskey-dev/misskey.git
$ROOTCMD sudo -u misskey -D /home/misskey/misskey git checkout master
$ROOTCMD sudo -u misskey -D /home/misskey/misskey yarn install
$ROOTCMD sudo -u misskey -D /home/misskey/misskey cp .config/example.yml .config/default.yml
$ROOTCMD sudo -u misskey -D /home/misskey/misskey NODE_ENV=production yarn build
$ROOTCMD sudo -u misskey -D /home/misskey/misskey yarn run init
$ROOTCMD sudo -u misskey -D /home/misskey/misskey /etc/systemd/system/misskey.service
fcopy /etc/systemd/system/misskey.service
$ROOTCMD sudo -u misskey systemctl daemon-reload
$ROOTCMD sudo -u misskey systemctl enable misskey
