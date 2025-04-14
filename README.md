# 🏠 My Homelab Setup

Welcome to my personal homelab! This is a self-hosted setup running on a compact yet powerful ThinkCentre M920q. Everything here is designed to help me manage media, automate home devices, block ads, and explore new self-hosting tools — all from my own local hardware.

---

## ⚙️ Hardware Specs

- **Model**: ThinkCentre M920q
- **CPU**: Intel i5-8400 @ 2.80GHz
- **RAM**: 16 GB
- **Storage**:
  - 4TB NVMe SSD (media/data storage)
  - 512GB SATA SSD (OS and tools)

---

## 🧰 Software Stack

- **Operating System**: Ubuntu 24.04.1 LTS
- **Container Runtime**: Docker

### 🛠️ Running Services (via Docker)
| Service         | Description                         |
|-----------------|-------------------------------------|
| filebrowser     | Web file manager                    |
| homarr          | Homepage dashboard for services     |
| homeassistant   | Home automation platform            |
| immich          | Self-hosted photo/video backup      |
| immichframe     | Digital photo frame for Immich      |
| jellyfin        | Media server (TV/movies)            |
| kavita          | Manga & comic reader                |
| netdata         | Real-time system monitoring         |
| nginx-proxy     | Reverse proxy for containers        |
| pihole          | Network-wide ad blocking            |
| plex            | Streaming server                    |
| portainer       | Docker UI management                |
| prowlarr        | Indexer manager for Sonarr/Radarr   |
| qbittorrent     | Torrent client                      |
| radarr          | Movie downloader/manager            |
| sonarr          | TV series downloader/manager        |
| octoprint       | 3D printer management (Creality K1C)|
| smb-server      | Network file sharing (SMB 2.0)      |
| tailscale       | Secure VPN access                   |

---

## 🎯 Purpose

This homelab is focused on **self-hosting**. I use it to:

- Host and manage my media locally
- Automate my smart home devices
- Block network-wide ads
- Manage and monitor my **3D printer (Creality K1C)** via OctoPrint
- Share files across devices using **SMB 2.0**
- Test out new self-hosted apps
- Learn more about Docker, networking, and Linux

---

## 📐 Architecture

The lab is containerized using Docker, managed via Portainer and Nginx reverse proxy. It includes:
- Dockerized service stack
- Tailscale for secure remote access
- Netdata for system monitoring
- SMB server for LAN file sharing
- OctoPrint container connected to a USB 3D printer

More detailed diagrams and configurations can be found in the [docs](./docs) and [diagrams](./diagrams) folders.

---

## 🗃️ Storage Layout

The system uses two main disks:
- `sda` (500GB): Main OS disk (`/`)
- `nvme0n1` (3.6TB): Split into:
  - `/mnt/Media`: Used by Plex, Jellyfin, Kavita, etc.
  - `/mnt/Data`: Shared data for immich, backups, etc.

These paths are mounted into respective containers using Docker volumes.

---

## 📸 Screenshots, diagrams, and service configs coming soon!

Stay tuned 🚀
