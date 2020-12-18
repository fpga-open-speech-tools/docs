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

### Python 3.8.X
1. In windows command prompt, run `python --version`
2. Install Python 3.8 from the Microsoft Store

## Configure the Frost Autogen Software
1. Create a new folder to store all of the Frost Repos. This folder will be refered to as the `[Frost Repos]` Directory in the rest of this guide.
2. In WSL:  
  i. Navigate to the newly created `[Frost Repos]` Directory   
  ii. Clone the [Docs Repo](https://github.com/fpga-open-speech-tools/docs) into the `[Frost Repos]` Directory 
    - `sudo git clone https://github.com/fpga-open-speech-tools/docs.git`
    - Note: The `Frost_Autogen_Config.sh` script will fail if the Docs repo is cloned using GitHub Desktop on Windows. GitHub Desktop converts Unix EOL characters to Dos EOL characters. Use the following steps to convert the Unix EOL Characters to Dos EOL Characters. 
        - `sudo apt update`
        - `sudo apt install dos2unix -y`
        - `sudo dos2unix docs/FrOST_Autogen_Config.sh`
3. From the `[FrOST Repo]` Directory, run `./docs/Frost_Autogen_Config.sh`

## AWS S3 Bucket and the CLI
1. Create an AWS Account and Log In
2. Create an [S3 Bucket](https://github.com/fpga-open-speech-tools/utils/tree/dev/s3) using the Frost CloudFormation Template

**Optional - Creating an IAM User to upload programming file via the AWS CLI**   
The following steps provide a simple starting point. This is not a complete guide on configuring an IAM user or security.  
3. Create an IAM User  
    - Go to `IAM` by searching the AWS Services  
    - Under IAM Resources, click on `Users`  
    - Click `Add User`  
    - Enter a user name  
    - Under AWS Access Type, select `Programmatic Access`  
    - Configure user permissions  
4. Install the [AWS CLI V2](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html) for Windows   
5. In Powershell, run `aws configure`  
    - AWS Access Key ID: created in step 2  
    - AWS Secret Access Key: created in step 2  
    - Default Region: us-west-2  
    - Default Output Format: JSON  

## Generating an Example Design
1. Open MATLAB
2. Navigate to `[Frost Repos]\simulink_models\config`
3. Run `pathSetup.m` - This has to be run every time MATLAB is opened.
4. Open an example model, in this case, `[Frost Repos]\simulink_models\models\simple_gain_vector\vector_gain.slx`
5. Click the Run Simulation Button (Green Play Icon) in the toolbar 
6. Change the dropdown left of the Run Simulation button from "Accelerator" to "Normal"
7. Click the Green Generate VHDL Button in the bottom left of the top level of the design
8. Once complete, Upload the files to the S3 Bucket created above
    - Either create or go into the Frost Hardware Folder - ex. `audiomini`
    - Create a folder for the project and copy the following files into it
        - model.json
        - `[project].dtbo`
        - `[project].ko`
        - `[project].rbf`
    - Or run `s3upload(mp,"[bucket name]","audiomini/[project_name]",true)` in the MATLAB Command Window

# Deploying Design to SoC FPGA through Web App
1. Connect to the Frost Hardware by navigating to `[ip address]:5000`  
2. Enter the bucket name that was created in AWS S3 Bucket - Step 2 and click `Update`  
3. Under device, select the correct Frost Hardware  
4. Under the project folder, click the download icon  
5. Once downloaded and installed, the project controls will be available  
