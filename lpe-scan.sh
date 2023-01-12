#!/bin/bash

# Vérification des reportoires world-writable
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Recherche de répertoires en écriture mondiale world-writable ..."
echo -e "-----------------------------------------------------\033[0m"
echo "Les répertoires world-writable sont des répertoires qui peuvent être écrits par n’importe quel utilisateur sur le système. Cela peut être un risque de sécurité si des fichiers sensibles sont stockés dans ces répertoires."
find / -type d -perm -2 ! -path "/sys*" -exec ls -ld {} \; 2>/dev/null
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Vérification des SUID exécutables
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Vérification des SUID exécutables..."
echo -e "-----------------------------------------------------\033[0m"
echo "SUID (Set User ID) est une permission qui permet à un utilisateur d’exécuter un fichier avec les autorisations du propriétaire du fichier."
echo "Cela peut être un risque de sécurité si le fichier appartient à root ou s’il s’agit d’un programme qui permet aux utilisateurs d’exécuter des commandes arbitraires."
find / -type f -perm -4000 -exec ls -ld {} \; 2>/dev/null
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Vérification des SGID exécutables
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Checking for SGID executables..."
echo -e "-----------------------------------------------------\033[0m"
echo "SGID (Set Group ID) est une permission qui permet à un utilisateur d’exécuter un fichier avec les autorisations du groupe du fichier."
echo "Cela peut être un risque de sécurité si le fichier est détenu par un groupe avec des permissions excessives ou si c’est un programme qui permet aux utilisateurs d’exécuter la commande arbitraire."
find / -type f -perm -2000 -exec ls -ld {} \; 2>/dev/null
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Vérification des fichiers SUID/SGID non autorisés
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Vérification des fichiers SUID/SGID non autorisés..."
echo -e "-----------------------------------------------------\033[0m"
echo "Les permissions SUID/SGID ne doivent être définies que sur les exécutables de confiance. Si elles sont définies sur un fichier non fiable ou inconnu, cela peut indiquer un risque de sécurité."
find / -perm /6000 -exec ls -ld {} \; 2>/dev/null
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Vérification des fichiers . bash_history
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Vérification des fichiers . bash_history..."
echo -e "-----------------------------------------------------\033[0m"
echo "le fichier .bash_history les fichiers contiennent un enregistrement de toutes les commandes entrées dans le shell bash. Ces fichiers devraient être protégés pour empêcher l’accès non autorisé à des renseignements potentiellement sensibles."
find / -name .bash_history -exec ls -ld {} \; 2>/dev

# Vérification des fichiers .ssh 
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Vérification des fichiers .ssh..."
echo -e "-----------------------------------------------------\033[0m"
echo "Les fichiers .ssh contiennent des fichiers liés à l’accès sécurisé au système par Shell (SSH). Ces fichiers doivent être protégés pour empêcher tout accès non autorisé."
find / -name .ssh -exec ls -ld {} \; 2>/dev/null
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Vérification des known hosts file
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Vérification des known hosts file..."
echo -e "-----------------------------------------------------\033[0m"
echo "Le fichier known_hosts contient une liste de tous les serveurs SSH auxquels le système s’est connecté dans le passé. Il est utilisé pour prévenir les attaques."
find / -name known_hosts -exec ls -ld {} \; 2>/dev/null
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Vérification des fichiers authorized_keys
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Vérification des fichiers authorized_keys..."
echo -e "-----------------------------------------------------\033[0m"
echo "Les fichiers authorized_keys contient une liste des clés publiques qui sont autorisées à accéder au système par SSH. Il devrait être protégé pour empêcher l’accès non autorisé."
find / -name authorized_keys -exec ls -ld {} \; 2>/dev/null
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Vérifier les password files
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Vérifier les password files..."
echo -e "-----------------------------------------------------\033[0m"
echo "Password files, comme /etc/shadow, contiennent des mots de passe chiffrés pour tous les utilisateurs du système. Ces fichiers doivent être protégés pour empêcher l’accès non autorisé et le craquage de mots de passe."
find / -name "*shadow*" -exec ls -ld {} \; 2>/dev/null
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Vérification des fichiers de configuration ssh configuration
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Vérification des fichiers de configuration ssh configuration..."
echo -e "-----------------------------------------------------\033[0m"
echo "Le fichier de configuration SSH, tel que/etc/ssh/sshd_config, contient les paramètres du serveur SSH. Ces fichiers doivent être configurés de manière sécurisée pour empêcher tout accès non autorisé."
find / -name "sshd_config" -exec ls -ld {} \; 2>/dev/null
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Vérification des Ports ouverts
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Vérification des Ports ouverts..."
echo -e "-----------------------------------------------------\033[0m"
echo "Les ports ouverts sont des ports réseau qui ont un service d’écoute actif. Ces ports devraient être sécurisés pour empêcher l’accès non autorisé."
netstat -tulpn
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Vérification des kernel modules
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Vérification des kernel modules..."
echo -e "-----------------------------------------------------\033[0m"
echo "Les Kernel modules sont des morceaux de code qui peuvent être chargés dans le noyau à l’exécution pour étendre les fonctionnalités du noyau. Ces modules devraient être surveillés pour empêcher le chargement de modules malveillants ou non autorisés.."
lsmod
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Vérification des cron jobs
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Vérification des cron jobs..."
echo -e "-----------------------------------------------------\033[0m"
echo "Cron est un daemon qui exécute des tâches planifiées. Ces tâches, appelées tâches cron, doivent être surveillées pour empêcher l’exécution de tâches malveillantes ou non autorisées."
crontab -l
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Vérification des users logged
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Vérification des users logged..."
echo -e "-----------------------------------------------------\033[0m"
echo "Les utilisateurs connectés peuvent avoir accès à des ressources système sensibles. Il est important de surveiller et de contrôler l’accès à ces ressources."
who
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Vérification des running processes
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Vérification des running processes..."
echo -e "-----------------------------------------------------\033[0m"
echo "Les processus en cours peuvent utiliser les ressources du système ou avoir la capacité d’accéder à des données sensibles. Il est important de surveiller et de contrôler ces processus."
ps aux
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Vérification des process en écoute 
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Vérification des process en écoute..."
echo -e "-----------------------------------------------------\033[0m"
echo "Les processus d’écoute sont des processus en attente de connexions entrantes. Ces processus devraient être surveillés pour empêcher l’accès non autorisé."
lsof -i -P -n
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

# Vérification des file descriptors ouverts
echo -e "\033[1;34m-----------------------------------------------------"
echo -e "Vérification des file descriptors ouverts..."
echo -e "-----------------------------------------------------\033[0m"
echo "File descriptors sont des références à des fichiers ouverts. Ils peuvent être utilisés pour accéder à des données sensibles ou pour manipuler les ressources du système. Il est important de surveiller et de contrôler l’accès à ces descripteurs."
lsof -nP +c 15
echo -e "\033[1;34m-----------------------------------------------------\033[0m"

echo -e "\033[1;32mlpe-scan complete!\033[0m"
