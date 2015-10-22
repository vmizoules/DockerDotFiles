# Premier lancement

Lancer la machine

	boot2docker init && boot2docker up && boot2docker ssh

Créer le "bootlocal.sh" dans la VM : 

	cd /var/lib/boot2docker/ && sudo touch bootlocal.sh && sudo chmod 744 bootlocal.sh && sudo echo "cd /c/Users/Vincent/Docker/boot2docker && ./bootlocal.sh" > bootlocal.sh

Créer le container docker-compose :

	cd /c/Users/<username>/Docker/dockerfiles/compose-master
	docker build -t docker-compose .

Pour connaître l'IP de la machine Docker

	boot2docker ip

# Utilisation normale

Lancer la machine

	boot2docker up && boot2docker ssh

Lancer la stack

	docker-compose up

# Mount

Dossier utilisateur Windows automatiquement monté dans la vm docker (dans /c/Users...)

Le dossier /var/www est monté par le `bootlocal.sh`