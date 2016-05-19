# But

Simplifier l'utilisation de docker toolbox à travers boot2docker (en attendant que Docker pour Windows sorte de sa beta privé).

# Initialisation

Créer la machine

	docker-machine create default --driver virtualbox

Lancer la machine

	docker-machine start && docker-machine ssh

Créer le "bootlocal.sh" dans la VM :

	cd /var/lib/boot2docker/ && sudo touch bootlocal.sh && sudo chmod 744 bootlocal.sh && echo "cd /c/Users/Vincent/DockerDotFiles/boot2docker && ./bootlocal.sh"|sudo sudo tee bootlocal.sh

*NB : modifiez bien le chemin "/c/Users/Vincent..." pour correspondre à votre installation.*

Créer le container docker-compose :

	cd /c/Users/<windowsUsername>/<repositoryName>/dockerfiles/docker-compose
	docker build -t docker-compose .

C'est fini !

# Utilisation normale

Lancer la machine

	docker-machine start && docker-machine ssh

Lancer la stack de votre choix

	docker-compose up

# Explications techniques

## Montages

Le dossier utilisateur de Windows est automatiquement monté dans la VM boot2docker (dans /c/Users/...)

Le dossier `/var/www` est monté par le script `bootlocal.sh`.

# Troubleshooting

Les scripts fonctionnent mal ? Des "?" apparaissent ? -> regarder du côté des caractères de retour à la ligne Windows
- supprimer les ^M sous vi
- sous Sublime Text : View > Line Ending > Unix
