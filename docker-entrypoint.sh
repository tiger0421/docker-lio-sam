#!/bin/bash

curl https://raw.githubusercontent.com/tiger0421/docker-lego-loam/master/install.sh > /tmp/install.sh
chmod +x /tmp/install.sh

bash /tmp/install.sh
rm /tmp/install.sh
echo '#!/bin/sh' > /tmp/docker-entrypoint.sh
echo 'bash' >> /tmp/docker-entrypoint.sh
echo 'source /root/catkin_ws/devel/setup.bash' >> /root/.bashrc

exec "$0"
