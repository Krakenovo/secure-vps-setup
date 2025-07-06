# Secure VPS Setup 🛡️

![Secure VPS Setup](https://img.shields.io/badge/Secure%20VPS%20Setup-Ready-brightgreen)

Welcome to the **Secure VPS Setup** repository! This project focuses on hardening your Virtual Private Server (VPS) with essential tools and configurations. We cover a variety of topics to ensure your server runs securely and efficiently. You can find the latest releases [here](https://github.com/Krakenovo/secure-vps-setup/releases). Download and execute the files as needed.

## Table of Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [Topics Covered](#topics-covered)
4. [Installation](#installation)
5. [Configuration](#configuration)
6. [Usage](#usage)
7. [Monitoring](#monitoring)
8. [Backup Strategy](#backup-strategy)
9. [SSL Setup](#ssl-setup)
10. [Firewall Configuration](#firewall-configuration)
11. [Database Setup](#database-setup)
12. [Web Server Configuration](#web-server-configuration)
13. [Contributing](#contributing)
14. [License](#license)

## Introduction

Setting up a secure VPS is crucial for any online application. This repository provides a comprehensive guide to help you implement best practices in server security. With the right setup, you can protect your data and ensure your applications run smoothly.

## Features

- SSH hardening
- Automated backups
- SSL certificate management with Certbot
- Fail2ban for intrusion prevention
- Firewall setup
- Database management with MariaDB
- Monitoring tools
- Web server configuration with Nginx
- PHP and Redis support
- Swap file management

## Topics Covered

This repository addresses the following topics:

- **Backups**: Ensure your data is safe with regular backups.
- **Certbot**: Automate SSL certificate issuance and renewal.
- **Fail2ban**: Protect your server from unauthorized access.
- **Firewall**: Configure a firewall to block unwanted traffic.
- **MariaDB**: Manage your databases securely.
- **Monitoring**: Keep an eye on server performance.
- **Nginx**: Set up a reliable web server.
- **PHP**: Run your applications smoothly.
- **Redis**: Use caching for improved performance.
- **SSH Hardening**: Secure your SSH connections.
- **SSL**: Implement secure connections.
- **Swap**: Manage memory efficiently.
- **Webserver**: Optimize your web server setup.

## Installation

To get started, clone this repository to your local machine:

```bash
git clone https://github.com/Krakenovo/secure-vps-setup.git
cd secure-vps-setup
```

You can also download the latest release from the [Releases section](https://github.com/Krakenovo/secure-vps-setup/releases) and execute the necessary scripts.

## Configuration

After cloning the repository, you will find configuration files for each service. Follow the instructions in each directory to set up the services according to your needs.

### SSH Hardening

To harden your SSH configuration, modify the `/etc/ssh/sshd_config` file. Some key changes include:

- Disable root login: `PermitRootLogin no`
- Change the default SSH port: `Port 2222`
- Use key-based authentication.

### Firewall Setup

Use UFW (Uncomplicated Firewall) to set up your firewall. Here are some basic commands:

```bash
sudo ufw allow 2222/tcp   # Allow SSH on custom port
sudo ufw allow 'Nginx Full' # Allow HTTP and HTTPS
sudo ufw enable
```

## Usage

Once your server is configured, you can start using the services. For example, after setting up Nginx, you can place your web files in the `/var/www/html` directory.

## Monitoring

Monitoring is essential for maintaining server health. Consider using tools like:

- **htop**: For real-time system monitoring.
- **Netdata**: For detailed performance metrics.
- **Prometheus**: For metrics collection and monitoring.

### Installation Example

To install htop, run:

```bash
sudo apt install htop
```

## Backup Strategy

Implement a robust backup strategy. Use tools like `rsync` or `tar` for file backups. Schedule backups with `cron` to automate the process.

### Example Cron Job

To run a backup every day at 2 AM, add the following line to your crontab:

```bash
0 2 * * * /path/to/backup-script.sh
```

## SSL Setup

Using Certbot makes SSL management straightforward. Install Certbot and run:

```bash
sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx
```

Follow the prompts to secure your domain with SSL.

## Firewall Configuration

A well-configured firewall is your first line of defense. Regularly review and update your firewall rules. Consider using tools like `fail2ban` to automatically block suspicious IP addresses.

### Fail2ban Installation

To install Fail2ban, run:

```bash
sudo apt install fail2ban
```

Configure it by editing the `/etc/fail2ban/jail.local` file.

## Database Setup

For database management, use MariaDB. Install it with:

```bash
sudo apt install mariadb-server
```

Secure your installation by running:

```bash
sudo mysql_secure_installation
```

Follow the prompts to set up your database securely.

## Web Server Configuration

Nginx is a powerful web server. Configure your server blocks in `/etc/nginx/sites-available/`. Remember to test your configuration with:

```bash
sudo nginx -t
```

And reload Nginx to apply changes:

```bash
sudo systemctl reload nginx
```

## Contributing

Contributions are welcome! If you have suggestions or improvements, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

For more information, visit the [Releases section](https://github.com/Krakenovo/secure-vps-setup/releases) to stay updated with the latest changes and improvements.