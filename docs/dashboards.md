# 📊 Dashboards and UIs

This file contains information about the dashboards and UIs I use in my homelab.

---

## 🟢 Netdata
- **Purpose**: Real-time monitoring and visualization of system and container metrics.
- **Key Features**:
  - One-second granularity system metrics
  - Auto-discovery of services and containers
  - Rich interactive UI accessible via browser (`http://<host>:19999`)
  - Built-in health monitoring and alerting
- **Metrics Tracked**:
  - CPU, RAM, Disk, and Network
  - Disk I/O (e.g., `/dev/sda`, `/dev/nvme0n1`)
  - Docker containers resource usage
  - Active network connections and listening ports
- **Deployment**: Via Docker Compose on each host

- **Dashboards**:
  - **Host Overview**: Displays system resource usage in real time.
  - **Container Metrics**: Shows resource usage for each container.
  - **Network and Disk I/O**: Live tracking of throughput and read/write rates.
  
- **Optional**: [Netdata Cloud](https://app.netdata.cloud) for a unified multi-node view.

---

## 🧩 Portainer
- **Purpose**: Web-based Docker management UI.
- **Key Features**:
  - Manage Docker containers, images, and volumes
  - View container logs and stats
  - Deploy stacks via UI
  - User access control and endpoint management

---

## 📸 Screenshots

> Screenshots can be placed in `assets/screenshots/`

- `netdata-host-overview.png` – Netdata host overview dashboard
- `netdata-docker.png` – Netdata Docker/container metrics
- `portainer-dashboard.png` – Portainer container overview

---

## 🔮 Future Enhancements
- Integrate Netdata with Discord alerts
- Deploy centralized Netdata Cloud monitoring
- Add uptime and service status boards using external tools (optional)

