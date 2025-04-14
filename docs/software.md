# 🧰 Installed Software & Services

This homelab uses Docker to manage the following services:

- **Home Assistant**: For home automation and IoT devices.
- **Plex**: Media server for movies, TV shows, and music.
- **Pi-hole**: DNS-based ad blocker.
- **Netdata**: System stats and monitoring
- **File Browser**: Web file manager
- **Homarr**: Homepage/dashboard to organize self-hosted services
- **Immich**: Self-hosted photo and video management solution.
- **ImmichFrame**: Digital photo frame application that interfaces with your immich server.
- **Jellyfin**: Local media streaming platforms
- **Kavita**: Self-hosted cross platform reading server
- **Nginx Proxy Manager**: Reverse proxy
- **Portainer**: Universal container management platform via UI.
- **Prowlarr**: Indexer manager/proxy
- **Radarr**: Movie collection manager
- **Sonarr**: PVR collection manager
- **qBittorrent**: BitTorrent client
- **Tailscale**: WireGuard-based VPN

Each is configured through Docker Compose (in `/services` folder).

## Additional Tools

- **OctoPrint**: Web-based interface for managing and monitoring 3D printing jobs (Creality K1C)
- **SMB server**: Exposes network storage over SMB 2.0 for LAN file sharing (access via Windows/Mac/Linux)

The OctoPrint container is connected to the printer via USB, and the SMB volume points to the 4TB storage SSD.
