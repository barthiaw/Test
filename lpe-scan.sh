@@ -0,0 +1,140 @@
# ! /bin/bash

# Vérifiez les répertoires accessibles en écriture par le monde
echo -e " \033[1;34m---------------------------------------- -------------- "
echo -e " Vérification des répertoires accessibles en écriture par tout le monde... "
echo -e " ---------------------------------------------- -------\033[0m "
echo  " Les répertoires accessibles en écriture par tout le monde sont des répertoires dans lesquels n'importe quel utilisateur du système peut écrire. Cela peut constituer un risque pour la sécurité si des fichiers sensibles sont stockés dans ces répertoires. "
trouver / -type d -perm -2 ! -path " /sys* " -exec ls -ld {} \;  2> /dev/null
echo -e " \033[1;34m---------------------------------------- --------------\033[0m "

# Vérifier les exécutables SUID
echo -e " \033[1;34m---------------------------------------- -------------- "
echo -e " Vérification des exécutables SUID... "
echo -e " ---------------------------------------------- -------\033[0m "
echo  " SUID (Set User ID) est une permission qui permet à un utilisateur d'exécuter un fichier avec les permissions du propriétaire du fichier. "
echo  " Cela peut être un risque pour la sécurité si le fichier appartient à root ou s'il s'agit d'un programme qui permet aux utilisateurs d'exécuter des commandes arbitraires. "
trouver / -type f -perm -4000 -exec ls -ld {} \;  2> /dev/null
echo -e " \033[1;34m---------------------------------------- --------------\033[0m "

# Vérifier les exécutables SGID
echo -e " \033[1;34m---------------------------------------- -------------- "
echo -e " Vérification des exécutables SGID... "
echo -e " ---------------------------------------------- -------\033[0m "
echo  " SGID (Set Group ID) est une autorisation qui permet à un utilisateur d'exécuter un fichier avec les autorisations du groupe du fichier. "
echo  " Cela peut constituer un risque pour la sécurité si le fichier appartient à un groupe avec des autorisations excessives ou s'il s'agit d'un programme qui permet aux utilisateurs d'exécuter des commandes arbitraires. "
trouver / -type f -perm -2000 -exec ls -ld {} \;  2> /dev/null
echo -e " \033[1;34m---------------------------------------- --------------\033[0m "

# Vérifier les fichiers SUID/SGID non autorisés
echo -e " \033[1;34m---------------------------------------- -------------- "
echo -e " Recherche de fichiers SUID/SGID non autorisés... "
echo -e " ---------------------------------------------- -------\033[0m "
echo  " Les autorisations SUID/SGID ne doivent être définies que sur des exécutables approuvés. Si elles sont définies sur un fichier non approuvé ou inconnu, cela peut indiquer un risque de sécurité. "
trouver / -perm /6000 -exec ls -ld {} \;  2> /dev/null
echo -e " \033[1;34m---------------------------------------- --------------\033[0m "

# Vérifier les fichiers .bash_history
echo -e " \033[1;34m---------------------------------------- -------------- "
echo -e " Vérification des fichiers .bash_history... "
echo -e " ---------------------------------------------- -------\033[0m "
echo  " Les fichiers .bash_history contiennent un enregistrement de toutes les commandes qui ont été saisies dans le shell bash. Ces fichiers doivent être protégés pour empêcher tout accès non autorisé à des informations potentiellement sensibles. "
trouver / -nom .bash_history -exec ls -ld {} \;  2> /dev

# Vérifiez le répertoire .ssh
echo -e " \033[1;34m---------------------------------------- -------------- "
echo -e " Vérification du répertoire .ssh... "
echo -e " ---------------------------------------------- -------\033[0m "
echo  " Les répertoires .ssh contiennent des fichiers liés à l'accès Secure Shell (SSH) au système. Ces fichiers doivent être protégés pour empêcher tout accès non autorisé. "
trouver / -nom .ssh -exec ls -ld {} \;  2> /dev/null
echo -e " \033[1;34m---------------------------------------- --------------\033[0m "

# Vérifier le fichier d'hôtes connu
echo -e " \033[1;34m---------------------------------------- -------------- "
echo -e " Vérification du fichier d'hôtes_connus... "
echo -e " ---------------------------------------------- -------\033[0m "
echo  " Le fichier known_hosts contient une liste de tous les serveurs SSH auxquels le système s'est connecté dans le passé. Il est utilisé pour empêcher les attaques de l'homme du milieu. "
trouver / -nom des_hôtes_connus -exec ls -ld {} \;  2> /dev/null
echo -e " \033[1;34m---------------------------------------- --------------\033[0m "

# Vérifier le fichier authorised_keys
echo -e " \033[1;34m---------------------------------------- -------------- "
echo -e " Vérification du fichier de clés autorisées... "
echo -e " ---------------------------------------------- -------\033[0m "
echo  " Le fichier authorized_keys contient une liste de clés publiques autorisées à accéder au système via SSH. Il doit être protégé pour empêcher tout accès non autorisé. "
trouver / -nom clés_autorisées -exec ls -ld {} \;  2> /dev/null
echo -e " \033[1;34m---------------------------------------- --------------\033[0m "

# Vérifier les fichiers de mot de passe
echo -e " \033[1;34m---------------------------------------- -------------- "
echo -e " Vérification des fichiers de mot de passe... "
echo -e " ---------------------------------------------- -------\033[0m "
echo  " Les fichiers de mots de passe, tels que /etc/shadow, contiennent des mots de passe cryptés pour tous les utilisateurs du système. Ces fichiers doivent être protégés pour empêcher tout accès non autorisé et le piratage des mots de passe. "
trouver / -nom " *ombre* " -exec ls -ld {} \;  2> /dev/null
echo -e " \033[1;34m---------------------------------------- --------------\033[0m "

# Vérifier les fichiers de configuration ssh
echo -e " \033[1;34m---------------------------------------- -------------- "
echo -e " Vérification des fichiers de configuration ssh... "
echo -e " ---------------------------------------------- -------\033[0m "
echo  " Les fichiers de configuration SSH, tels que /etc/ssh/sshd_config, contiennent les paramètres du serveur SSH. Ces fichiers doivent être configurés de manière sécurisée pour empêcher tout accès non autorisé. "
trouver / -name " sshd_config " -exec ls -ld {} \;  2> /dev/null
echo -e " \033[1;34m---------------------------------------- --------------\033[0m "

# Vérifier les ports ouverts
echo -e " \033[1;34m---------------------------------------- -------------- "
echo -e " Vérification des ports ouverts... "
echo -e " ---------------------------------------------- -------\033[0m "
echo  " Les ports ouverts sont des ports réseau qui ont un service d'écoute actif. Ces ports doivent être sécurisés pour empêcher tout accès non autorisé. "
netstat -tulpn
echo -e " \033[1;34m---------------------------------------- --------------\033[0m "

# Vérifier les modules du noyau
echo -e " \033[1;34m---------------------------------------- -------------- "
echo -e " Vérification des modules du noyau... "
echo -e " ---------------------------------------------- -------\033[0m "
echo  " Les modules du noyau sont des morceaux de code qui peuvent être chargés dans le noyau lors de l'exécution pour étendre les fonctionnalités du noyau. Ces modules doivent être surveillés pour empêcher le chargement de modules malveillants ou non autorisés. "
lsmod
echo -e " \033[1;34m---------------------------------------- --------------\033[0m "

# Vérifier les tâches cron
echo -e " \033[1;34m---------------------------------------- -------------- "
echo -e " Vérification des tâches cron... "
echo -e " ---------------------------------------------- -------\033[0m "
echo  " Cron est un démon qui exécute des tâches planifiées. Ces tâches, appelées tâches cron, doivent être surveillées pour empêcher l'exécution de tâches malveillantes ou non autorisées. "
crontab -l
echo -e " \033[1;34m---------------------------------------- --------------\033[0m "

# Vérifier les utilisateurs connectés
echo -e " \033[1;34m---------------------------------------- -------------- "
echo -e " Vérification des utilisateurs connectés... "
echo -e " ---------------------------------------------- -------\033[0m "
echo  " Les utilisateurs connectés peuvent avoir accès à des ressources système sensibles. Il est important de surveiller et de contrôler l'accès à ces ressources. "
qui
echo -e " \033[1;34m---------------------------------------- --------------\033[0m "

# Vérifier les processus en cours d'exécution
echo -e " \033[1;34m---------------------------------------- -------------- "
echo -e " Vérification des processus en cours d'exécution... "
echo -e " ---------------------------------------------- -------\033[0m "
echo  " Les processus en cours d'exécution peuvent utiliser des ressources système ou avoir la capacité d'accéder à des données sensibles. Il est important de surveiller et de contrôler ces processus. "
ps aux
echo -e " \033[1;34m---------------------------------------- --------------\033[0m "

# Vérifier les processus d'écoute
echo -e " \033[1;34m---------------------------------------- -------------- "
echo -e " Vérification des processus d'écoute... "
echo -e " ---------------------------------------------- -------\033[0m "
echo  " Les processus d'écoute sont des processus qui attendent des connexions entrantes. Ces processus doivent être surveillés pour empêcher tout accès non autorisé. "
lsof -i -P -n
echo -e " \033[1;34m---------------------------------------- --------------\033[0m "

# Vérifier les descripteurs de fichiers ouverts
echo -e " \033[1;34m---------------------------------------- -------------- "
echo -e " Vérification des descripteurs de fichiers ouverts... "
echo -e " ---------------------------------------------- -------\033[0m "
echo  " Les descripteurs de fichiers sont des références à des fichiers ouverts. Ils peuvent être utilisés pour accéder à des données sensibles ou pour manipuler des ressources système. Il est important de surveiller et de contrôler l'accès à ces descripteurs. "
lsof -nP +c 15
echo -e " \033[1;34m---------------------------------------- --------------\033[0m "

echo -e " \033[1;32mlpe-scan terminé !\033[0m "
