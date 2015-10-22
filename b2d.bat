echo off
boot2docker ssh ls /c/Users/%USERNAME%/Docker
pause

echo "lire ce fichier"
il peut être interessant
exit

boot2docker start
boot2docker ssh sudo cp -f %unixpath%/profile /var/lib/boot2docker/profile
boot2docker ssh sudo /etc/init.d/docker restart
boot2docker ssh cp -f %unixpath%/profile .ashrc
boot2docker ssh