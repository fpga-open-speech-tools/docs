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
 2. In Powershell, run `aws configure`
    - AWS Access Key ID: provided
    - AWS Secret Access Key: provided
    - Default Region: us-west-2
    - Default Output Format: JSON

## Generating an Example Design
 1. Open MATLAB
 2. Navigate to `[NIH Repos]\simulink_models\config`
 3. Run `pathSetup.m`
 4. Open an example model, in this case, `[NIH Repos]\simulink_models\models\simple_gain_vector\vector_gain.slx`
 5. Click the Run Simulation Button (Green Play Icon) in the toolbar 
 6. Change the dropdown left of the Run Simulation button from "Accelerator" to "Normal"
 7. Click the Green Generate VHDL Button in the bottom left of the top level design
 8. Once complete, run `s3upload(mp,"nih-demos","audiomini/[project_name]",true)` in the MATLAB Command Window

# Configuring the DE10

# Deploying Design to SoC FPGA through Web App