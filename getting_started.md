# Building, Generating, and Uploading to S3
## Installation Requirements
### MATLAB   
1. MATLAB                    - Required  
2. Simulink                  - Required  
3. HDL Coder                 - Required  
4. DSP System Toolbox        - Strongly Suggested, Required for Example Designs  
5. Fixed-Point Designer      - Strongly Suggested, Required for Example Designs  
6. Signal Processing Toolbox - Strongly Suggested, Required for Example Designs  
7. HDL Verifier              - Strongly Suggested  
8. MATLAB Coder              - Strongly Suggested     
9. Simulink Coder            - Strongly Suggested  

### Quartus  
1. Standard - Arria 10 for the Audio Blade and Audio Research, Cyclone V for the Audio Mini  
or 
2. Lite     - Cyclone V for the Audio Mini

### Windows Subsystem for Linux: Ubuntu 18.04 LTS or newer 
#### Run the following install commands 
1. `sudo apt update` 
2. `sudo apt install gcc-arm-linux-gnueabihf -y`  
3. `sudo apt install device-tree-compiler -y` 
4. `sudo apt install wsl -y`
5. `sudo apt install dos2unix -y` 
6. `sudo apt install libncurses-dev -y`
7. `sudo apt install libncurses-dev -y`
8. `sudo apt install libssl-dev -y`

#### Setting Up the Linux SoC-FPGA on WSL
1. `cd ~; git clone https://github.com/fpga-open-speech-tools/linux-socfpga.git`
2. `cd linux-socfpga`
3. `cp arch/arm/configs/openspeech_defconfig .config`
4. `make menu config ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-` - Save and Exit
5. `make prepare ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-`

## Clone the Git Repos
 1. Clone the Docs Repos
 2. Run `./docs/cloneNIH.sh` from WSL
 3. Run `./docs/dtc-overlay.sh` from WSL - This will fail to build a Python 2 package but that doesn't matter

## AWS CLI
 1. Install the [AWS CLI V2](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html) for Windows 

# Configuring the DE10

# Deploying Design to SoC FPGA through Web App