![alt text](swclogo.jpg)
## swc_windows

* This repository contains a script to deploy containerized Windows Operating Systems via docker containers and KVM. For any additional details or inquiries, please contact me at christopher.sargent@sargentwalker.io.
* Tested on Ubuntu 22.04 VM
* [Dockur Windows](https://github.com/dockur/windows/tree/master)

### Docker install for Ubuntu 
1. ssh user@IP
2. sudo -i 
3. curl -fsSL https://get.docker.com -o install-docker.sh && sudo sh install-docker.sh

### Deploy Windows Sever 2022
1. ssh user@IP
2. sudo -i 
3. git clone 
4. cd swc_windows
5. vim .env
* Update password
```
# Set your container details
VERSION=2022
RAM_SIZE=8G
USERNAME=CAS
PASSWORD=31nst31n
DISK_SIZE=64
CPU_CORES=4
```
6. ./windows_deploy.sh
* Verify .sh scripts are executable chmod +x *.sh
7. docker ps 
```
CONTAINER ID   IMAGE             COMMAND                  CREATED             STATUS             PORTS                                                                                                                               NAMES
badb0a8c2e27   dockurr/windows   "/usr/bin/tini -s /r…"   18 minutes ago      Up 18 minutes      0.0.0.0:3389->3389/tcp, 0.0.0.0:3389->3389/udp, :::3389->3389/tcp, :::3389->3389/udp, 0.0.0.0:8007->8006/tcp, [::]:8007->8006/tcp   swc-windows
```
8. docker logs -f swc-windows

![Screenshot](resources/windows1.JPG)

9. http://localhost:8007/

![Screenshot](resources/windows2.JPG)


