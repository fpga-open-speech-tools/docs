# Building, Generating, and Uploading to S3
## Installation Requirements
### MATLAB   
1. [MATLAB](https://www.mathworks.com/downloads/) - Required  
2. Simulink                  - Required
3. Toolboxes:  
    1. HDL Coder                 - Required   
    2. MATLAB Coder              - Required     
    3. Simulink Coder            - Required 
    4. Fixed-Point Designer      - Required  
    5. DSP System Toolbox        - Strongly Suggested, Required for Example Designs  
    6. Signal Processing Toolbox - Strongly Suggested, Required for Example Designs  
    7. HDL Verifier              - Strongly Suggested  

### Quartus 
1. [Standard](https://fpgasoftware.intel.com/20.1/?edition=standard) - Arria 10 for the Audio Blade and Audio Research, Cyclone V for the Audio Mini  
or 
2. [Lite](https://fpgasoftware.intel.com/20.1/?edition=lite&platform=windows) - Cyclone V for the Audio Mini

### Windows Subsystem for Linux
1. Install [WLS](https://docs.microsoft.com/en-us/windows/wsl/install-win10) with Ubuntu 18.04 LTS or newer 

## Configure the FrOST Autogen Software
 1. In WSL, clone the [Docs Repo](https://github.com/fpga-open-speech-tools/docs) into the `[FrOST Repos]` Directory 
    - `sudo git clone https://github.com/fpga-open-speech-tools/docs.git`
    - Note: The `Frost_Autogen_Config.sh` script will fail if the Docs repo is cloned using GitHub Desktop on Windows.   
      GitHub Desktop converts unix EOL characters to dos EOL characters. Use `dos2unix` to convert the file.
 2. From the `[FrOST Repo]` Directory, run `./docs/Frost_Autogen_Config.sh`

## AWS CLI
 1. Install the [AWS CLI V2](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html) for Windows 
 2. In Powershell, run `aws configure`
    - AWS Access Key ID: provided
    - AWS Secret Access Key: provided
    - Default Region: us-west-2
    - Default Output Format: JSON

## Generating an Example Design
 1. Open MATLAB
 2. Navigate to `[FrOST Repos]\simulink_models\config`
 3. Run `pathSetup.m` - This has to be run every time MATLAB is opened.
 4. Open an example model, in this case, `[FrOST Repos]\simulink_models\models\simple_gain_vector\vector_gain.slx`
 5. Click the Run Simulation Button (Green Play Icon) in the toolbar 
 6. Change the dropdown left of the Run Simulation button from "Accelerator" to "Normal"
 7. Click the Green Generate VHDL Button in the bottom left of the top level of the design
 8. Once complete, run `s3upload(mp,"nih-demos","audiomini/[project_name]",true)` in the MATLAB Command Window

# Configuring the DE10

# Deploying Design to SoC FPGA through Web App