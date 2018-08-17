# docker_auto_install_script

Bash script that automatically installs Docker Community Edition (CE).

## How to auto install latest version of Docker CE (do not run with sudo or as root):
```bash
bash install.sh
```

## System Requirements:

Distributor ID: Ubuntu

Description:    Ubuntu 16.04.5 LTS

Release:        16.04

Codename:       xenial

- sudo must be installed and enabled for the current non-root
```bash
echo $USER
```
with the NOPASSWD option. It can be done by editing the following file (for instance using vim):
```bash
sudo vim /etc/sudoers
```
and changing the line
```bash
%sudo   ALL=(ALL:ALL)
```
to
```bash
%sudo   ALL=(ALL:ALL) NOPASSWD:ALL
```
- for the previous point to work,
```bash
echo $USER
```
must be in the sudoers group as well, by modification of the file /etc/group
