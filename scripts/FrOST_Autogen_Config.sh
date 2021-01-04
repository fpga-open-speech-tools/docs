#!/bin/bash
# Install WSL Packages
echo "Updating and Installing Packages..."
sudo apt update;
sudo apt install gcc-arm-linux-gnueabihf -y;
sudo apt install wsl -y;
sudo apt install make -y;
sudo apt install dos2unix -y;
sudo apt install libssl-dev -y;

# Install the Device Tree Compiler
echo "Installing the Device Tree Compiler."
sudo dos2unix docs/scripts/dtc_installer.sh
./docs/scripts/dtc_installer.sh 

# Clone the FrOST Repos
echo "Cloning the FrOST Git Repos."
sudo dos2unix docs/scripts/clone_Frost_Repos.sh
./docs/scripts/clone_Frost_Repos.sh

# Clone and Configure Linux-SOCFPGA
cd ~; echo "Moving to Home Directory of WSL."
[ ! -d 'linux-socfpga' ] && git clone https://github.com/fpga-open-speech-tools/linux-socfpga.git;
cd linux-socfpga;
echo "make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- openspeech_defconfig"
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- openspeech_defconfig;
echo "make prepare ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-"
make prepare ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-;
