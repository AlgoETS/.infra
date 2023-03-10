# 1) Download Hummingbot install, start, and update script
wget https://raw.githubusercontent.com/hummingbot/hummingbot/master/installation/docker-commands/create.sh
wget https://raw.githubusercontent.com/hummingbot/hummingbot/master/installation/docker-commands/start.sh
wget https://raw.githubusercontent.com/hummingbot/hummingbot/master/installation/docker-commands/update.sh

# 2) Enable script permissions
chmod a+x *.sh

# 3) Create a hummingbot instance
./create.sh