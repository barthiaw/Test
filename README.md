# Linux-Privilege-Escalation
Un script conçu pour aider à identifier les vulnérabilités et les erreurs de configuration sur un système Linux

C'est un outil utile pour effectuer une évaluation rapide de la sécurité d'un système, mais il est important de noter qu'il ne s'agit pas d'un outil de sécurité complet et qu'il ne doit pas être utilisé en remplacement d'une évaluation de sécurité plus approfondie.

Le script vous aide à trouver
répertoires accessibles en écriture par le monde
Exécutables SUID
Exécutables SGID
fichiers SUID/SGID non autorisés
fichiers .bash_history
répertoire .ssh
fichier d'hôtes connus
fichierauthorized_keys
fichiers de mot de passe
fichiers de configuration ssh
ports ouverts
modules du noyau
tâches cron
utilisateurs connectés
processus en cours d'exécution
processus d'écoute
descripteurs de fichiers


- Comment l'exécuter

#chmod +x lpe-scan.sh
#./lpe-scan.sh

- Sauvegarder le resultat dans le fichier txt
#./lpe-scan.sh > scan-results.txt
