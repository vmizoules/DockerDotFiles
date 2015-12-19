# In docker machine: /var/lib/boot2docker/bootlocal.sh
# place: cd /c/Users/Vincent/Docker/boot2docker && ./bootlocal.sh
# then: sudo chmod 744 bootlocal.sh

# script called by internal /var/lib/boot2docker/bootlocal.sh


# mount distant storage
mkdir -p /var/www
mount -t vboxsf www /var/www # www

mkdir -p /var/zz
mount -t vboxsf zz /var/zz # zz

# copy alias
cp .ashrc ~docker/.ashrc
