# Automation

This file details the automation tools and processes used in my homelab.

## Terraform
I use Terraform to automate the creation and management of resources in my homelab.

### Terraform Files
- `main.tf`: Contains infrastructure configurations like VMs, storage, networking.
- `variables.tf`: Contains all variable definitions.
- `outputs.tf`: Contains the output variables for infrastructure details.

## Ansible
I use Ansible for configuration management and automation of software installation.

### Ansible Playbooks
- `install_plex.yml`: Automates the installation of Plex Media Server.
- `setup_home_assistant.yml`: Automates the setup of Home Assistant.
