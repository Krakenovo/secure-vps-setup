#!/bin/bash

# ──────────────────────────────────────────────
# 🌐 VPS Production-Ready Setup Script by Daniel
# 🎥 YouTube Edition – für sicheres, stabiles Serverhosting
# ✅ Getestet auf Debian 12 (root required)
# 📺 youtube.com/@TechInsightsDE
# ──────────────────────────────────────────────

echo "🚀 VPS-Setup startet..."

# 1. SYSTEM AKTUALISIEREN
echo "📦 Aktualisiere System..."
apt update && apt upgrade -y

# 2. NEUEN BENUTZER ERSTELLEN
read -p "👤 Neuen Admin-Nutzer anlegen (z. B. daniel): " username
adduser "$username"
usermod -aG sudo "$username"

# 3. SSH-ABSICHERUNG
echo "🔐 SSH absichern..."
sed -i 's/#Port 22/Port 22022/' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl reload sshd

# 4. FIREWALL AKTIVIEREN
echo "🛡️ Aktiviere UFW-Firewall..."
apt install ufw -y
ufw allow 22022/tcp
ufw allow http
ufw allow https
ufw enable

# 5. FAIL2BAN INSTALLIEREN
echo "🚔 Installiere Fail2Ban..."
apt install fail2ban -y
systemctl enable fail2ban
systemctl start fail2ban

# 6. AUTOMATISCHE SICHERHEITSUPDATES
echo "📬 Aktiviere automatische Sicherheitsupdates..."
apt install unattended-upgrades -y
dpkg-reconfigure --priority=low unattended-upgrades

# 7. SWAP EINRICHTEN (optional)
echo "🧠 Erstelle 2GB Swap..."
fallocate -l 2G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap sw 0 0' >> /etc/fstab

# 8. WEBSTACK (NGINX, PHP, MariaDB)
echo "🌐 Installiere Webstack..."
apt install nginx mariadb-server php-fpm php-mysql -y
systemctl enable nginx mariadb
systemctl start nginx mariadb

# 9. SSL VON LET’S ENCRYPT
echo "🔒 Installiere Certbot für SSL..."
apt install certbot python3-certbot-nginx -y
# ➕ SSL-Zertifikat später erstellen mit:
# certbot --nginx -d deine-domain.de

# 10. CACHING (REDIS)
echo "⚡ Installiere Redis für Caching..."
apt install redis-server php-redis -y
systemctl enable redis-server
systemctl start redis-server

# 11. ÜBERWACHUNGSTOOLS
echo "📊 Installiere Monitoring-Tools..."
apt install htop glances dstat -y

# 12. BACKUP-SKRIPT ERSTELLEN
echo "💾 Erstelle einfaches Backup-Skript..."
cat << 'EOF' > /usr/local/bin/vps-backup.sh
#!/bin/bash
tar -czf /root/backup-$(date +%F).tar.gz /etc /var/www /home
EOF
chmod +x /usr/local/bin/vps-backup.sh

# 13. LOGROTATE AKTIVIEREN
echo "🗃️ Stelle sicher, dass Logs rotiert werden..."
apt install logrotate -y

# 14. GIT INSTALLIEREN
echo "🔁 Installiere Git für Versionskontrolle..."
apt install git -y

# 15. SHELL-OPTIMIERUNG (Optional)
echo "🎨 Aktiviere Bash-Verbesserungen (zsh + oh-my-zsh)..."
apt install zsh -y
chsh -s /bin/zsh "$username"
su - "$username" -c "sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""

# 16. NODE.JS & NPM INSTALLIEREN (für Web-Apps)
echo "🛠️ Installiere Node.js + npm..."
apt install curl -y
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt install nodejs -y

# 17. DOKUMENTATIONSSKELETT ERSTELLEN
echo "📁 Erstelle Verzeichnis für Doku & Projektdateien..."
mkdir -p /root/docs
touch /root/docs/server-setup.md

# 18. MOTD ANPASSEN (Nach dem Login Info anzeigen)
echo "🔧 Setze benutzerdefinierte Login-Nachricht..."
echo "Willkommen auf deinem VPS! Pflege ihn gut. – Daniel 🚀" > /etc/motd

# 19. SYSTEM NEUSTART (optional)
read -p "🔁 Jetzt neustarten, um Setup abzuschließen? (j/n): " restart 
if [ "$restart" == "j" ]; then reboot; fi 

# 20. ABSCHLUSS
echo ""
echo "✅ Setup abgeschlossen!"
echo "🔑 Logge dich nun mit: ssh $username@<IP> -p 22022"
echo "📌 Du kannst jetzt deine Website oder App deployen!"
echo "🧠 Vergiss nicht, deine Zugangsdaten und Konfigurationen zu sichern."
echo "🎉 Viel Erfolg mit deinem Server!"
