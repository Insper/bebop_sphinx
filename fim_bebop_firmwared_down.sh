fdc drop_all instances
fdc drop_all firmwares
rm /dev/shm/shd_*
sudo systemctl stop firmwared.service
sudo rm /usr/share/firmwared/firmwares/*




