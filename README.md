## My dot-files


### VirtualBox Guest Additions on a GUI-less server

1. Start VirtualBox.
1. Start the host in question.
1. Once the host has booted, click Devices | Insert Guest Additions CD Image.
1. Log in to your guest server.
1. Mount the CD-ROM with the command sudo mount /dev/cdrom /media/cdrom.
1. Change into the mounted directory with the command cd /media/cdrom.
1. Install the necessary dependencies with the command sudo apt-get install -y dkms build-essential linux-headers-generic linux-headers-$(uname -r). (NOTE: `install_all.sh` script installs ModuleAssistent and runs `m-a prepare` which does everthing from this step automatically for Debian distro) 
1. Change to the root user with the command sudo su.
1. Install the Guest Additions package with the command ./VBoxLinuxAdditions.run.
1. Allow the installation to complete.
