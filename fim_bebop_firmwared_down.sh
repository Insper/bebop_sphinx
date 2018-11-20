fdc drop_all instances
fdc drop_all firmwares
rm /dev/shm/shd_*
sudo systemctl stop firmwared.service
# uncomment line below only in case of buggy firmwares
#sudo rm /usr/share/firmwared/firmwares/*




