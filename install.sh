
echo "deb http://plf.parrot.com/sphinx/binary `lsb_release -cs`/" | sudo tee /etc/apt/sources.list.d/sphinx.list > /dev/null

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 508B1AE5

sudo apt-get update

sudo apt-get install mesa-utils

sudo apt-get install parrot-sphinx

cp bebop2_pfe.drone /opt/parrot-sphinx/usr/share/sphinx/drones/

cp bebop2nolan.drone /opt/parrot-sphinx/usr/share/sphinx/drones/



