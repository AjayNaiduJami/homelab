# 🧪 My Homelab Setup

[![Docker](https://img.shields.io/badge/Docker-Compose-blue?logo=docker)](https://www.docker.com/)
[![Uptime](https://img.shields.io/badge/Uptime-99.9%25-brightgreen)](#)
[![License](https://img.shields.io/github/license/yourusername/homelab)](LICENSE)
[![Last Updated](https://img.shields.io/github/last-commit/yourusername/homelab)](https://github.com/yourusername/homelab)

Welcome to my homelab repository! This setup is powered by **Docker Compose** and designed to run efficiently on a local machine with both SSD (`/mnt/Data`) and HDD (`/mnt/Media`) mounts. It features a mix of self-hosted services for **media**, **automation**, **networking**, and **monitoring**.

---

## 📸 Screenshots

> Replace these with actual screenshots from your homelab UIs!

### 🔧 Homarr Dashboard

![Homarr Dashboard](screenshots/homarr.png)

### 🎬 Plex Library

![Plex Media](screenshots/plex.png)

### 📊 Netdata System Monitoring

![Netdata Monitoring](screenshots/netdata.png)

---

## 📁 Folder Structure

/mnt
├── Media
│ ├── Movies/ # Used by Plex, Jellyfin, Radarr
│ ├── TV/ # Used by Plex, Jellyfin, Sonarr
│ ├── Books/ # Used by Kavita
│ ├── Photos/ # Used by Immich
│ └── config folders
└── Data
├── Downloads/ # Used by qBittorrent, Sonarr, Radarr
├── config folders


---

## 📦 Services

### 🎬 Media Management

| Service      | Description                              | URL Example               |
|--------------|------------------------------------------|---------------------------|
| **Plex**         | Media streaming server                   | `http://<IP>:32400`       |
| **Jellyfin**     | Open-source media system                 | `http://<IP>:8096`        |
| **Kavita**       | Manga/Book reader                        | `http://<IP>:5000`        |
| **Radarr**       | Movie downloader                         | `http://<IP>:7878`        |
| **Sonarr**       | TV show downloader                       | `http://<IP>:8989`        |
| **qBittorrent**  | Torrent client                           | `http://<IP>:8080`        |
| **Prowlarr**     | Indexer manager                          | `http://<IP>:9696`        |

### 🏠 Home Automation

| Service        | Description                              |
|----------------|------------------------------------------|
| **Home Assistant** | Central automation & device controller   |

### 📊 Monitoring & Dashboard

| Service        | Description                        |
|----------------|------------------------------------|
| **Netdata**    | Real-time system monitoring        |
| **Filebrowser**| File explorer in your browser      |
| **Homarr**     | Beautiful dashboard homepage       |

### 🌐 Network & Access

| Service              | Description                        |
|----------------------|------------------------------------|
| **Tailscale**        | Secure remote access & VPN         |
| **NGINX Proxy Manager** | Reverse proxy with SSL support     |

### 📸 Photo Management

| Service | Description                        |
|---------|------------------------------------|
| **Immich**  | Photo and video backup and gallery |

---

## 🔧 How to Use

### 1. Clone this Repo

```bash
git clone https://github.com/yourusername/homelab.git
cd homelab
```

### 2. Customize .env and Volumes
Update environment variables and volume paths in your `docker-compose` files to match your system.

### 3. Start Services

```bash
docker-compose up -d
```
If split into multiple files:
```bash
docker-compose -f media.yml -f infra.yml up -d
```

### 4. Access Web UIs
Open your browser and visit the listed ports (replace <IP> with your server IP or localhost).

---

## 🧠 Why This Setup?
- Organized Volumes — /mnt/Media for heavy media storage, /mnt/Data for configs and lightweight data.
- Modular Docker Compose — Easy to manage or scale.
- Reverse Proxy + VPN — Secure and remote-ready.
- Backup-Ready — Clear folder mappings for snapshot/rsync backups.

---

## 🗺️ To-Do / Future Additions
- Setup automatic backups
- Monitor uptime with Uptime Kuma
- Add Grafana + Prometheus for advanced monitoring
- Setup CI/CD with GitHub Actions
- Deploy Vaultwarden for password management

---

## 💬 Credits & Thanks
Inspired by:
- Awesome-Selfhosted
- LinuxServer.io
- Homarr
- YouTube channels like NetworkChuck & IBRACORP