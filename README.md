# 🚀 VPS Setup – YouTube Edition by Daniel

Dieses Skript richtet deinen **Debian 12 VPS** in wenigen Minuten **produktionsbereit**, **sicher** und **einsatzfähig** ein.

> 🛡️ Enthält: SSH-Hardening, Firewall, Fail2Ban, Swap, Webserver (NGINX, PHP, MariaDB), SSL (Certbot), Redis, Monitoring, Backups und mehr.

--- 

## 📺 Tutorial-Video
👉 YouTube-Kanal: [TechInsightsDE](https://youtube.com/@TechInsightsDE)

---

## ⚙️ Voraussetzungen
- ✅ Debian 12 (root Zugriff)
- ✅ Frischer Server ohne Vorinstallation
- 🧰 Voraussetzung: Git ist erforderlich zum Klonen (`apt install git -y`)
- 📡 Empfohlen: VPS mit min. 1 GB RAM und 1 CPU

---

## 🏁 Schnellstart
```bash
apt update && apt install git -y
git clone https://github.com/daaanieltv/secure-vps-setup
cd secure-vps-setup
chmod +x setup.sh
./setup.sh
```
Folge den Anweisungen im Skript – nach wenigen Minuten ist dein Server bereit für den produktiven Einsatz!

🔐 **Was wird eingerichtet?**

| Bereich       | Tools / Einstellungen                      |
|---------------|--------------------------------------------|
| System        | Updates, Benutzer, SSH-Hardening           |
| Sicherheit    | UFW, Fail2Ban, automatische Updates        |
| Webserver     | NGINX, PHP, MariaDB, Let's Encrypt (SSL)   |
| Performance   | Redis, Swapfile                            |
| Überwachung   | htop, glances, dstat                       |
| Backup        | Einfaches Tar-Backup per Cron/Skript       |
| Dev-Tools     | Git, Node.js, ZSH + Oh My Zsh              |

📝 Lizenz
MIT License – Forken, erweitern und gerne teilen – Link zurück ist Liebe! ❤️

✉️ Kontakt
Fragen? → youtube.com/@TechInsightsDE
