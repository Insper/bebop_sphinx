    sudo apt-key del 421C365BD9FF1F717815A3895523BAEEB01FA116

    sudo apt update

    gpg --keyserver hkp://ha.pool.sks-keyservers.net:80  --recv-keys 421C365BD9FF1F717815A3895523BAEEB01FA116

    gpg --export --armor 421C365BD9FF1F717815A3895523BAEEB01FA116 | sudo apt-key add -


