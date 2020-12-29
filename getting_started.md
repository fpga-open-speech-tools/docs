# Installing the FrOST Autogen Software
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
1. Install [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10) with Ubuntu 18.04 LTS or newer 

### Python 3.8.X
1. In windows command prompt, run `python --version`
2. Install Python 3.8 from the Microsoft Store

## Configure the FrOST Autogen Software
1. Create a new folder to store all of the FrOST Repos. This folder will be refered to as the `[FrOST Repos]` Directory in the rest of this guide.
2. In WSL:  
  i. Navigate to the newly created `[FrOST Repos]` Directory   
  ii. Clone the [Docs Repo](https://github.com/fpga-open-speech-tools/docs) into the `[FrOST Repos]` Directory. Note this will take approximately 30 minutes and requires at least 2GB of free hard drive space.
    - `git clone https://github.com/fpga-open-speech-tools/docs.git`
    - Note: The `FrOST_Autogen_Config.sh` script will fail if the Docs repo is cloned using GitHub Desktop on Windows. GitHub Desktop converts Unix EOL characters to Dos EOL characters. Use the following steps to convert the Unix EOL Characters to Dos EOL Characters. 
        - `sudo apt update`
        - `sudo apt install dos2unix -y`
        - `dos2unix docs/FrOST_Autogen_Config.sh`
3. From the `[FrOST Repo]` Directory, run `./docs/FrOST_Autogen_Config.sh`

## Generating an Example Design: The Simple Vector Gain Model
1. Open MATLAB
2. Navigate to `[FrOST Repos]\simulink_models\config`
3. Run `pathSetup.m` - **This has to be run every time MATLAB is opened.**
4. Open an example model, in this case, `[FrOST Repos]\simulink_models\models\simple_gain_vector\vector_gain.slx`
5. Click the Run Simulation Button (Green Play Icon) in the toolbar 
6. Change the dropdown left of the Run Simulation button from "Accelerator" to "Normal"
7. Click the Green Generate VHDL Button in the bottom left of the top level of the design

# FrOST AWS S3 Bucket
FrOST Edge, which contains the FrOST Web App and Deployment Manager, utilize Amazon Web Service's (AWS) Simple Storage Service (S3) to store the design artifacts required to deploy and control your FrOST algorithm. The design artifacts include the the model.json, the device tree blob, the Linux Kernel Module, and the FPGA raw binary file.  All of these files are generated using the FrOST Autogen Software but can also be created manually.
  
The S3 Bucket used by Frost Edge requires a specific folder structure to parse correctly. The `frost-projects` S3 Bucket folder structure can be found below. The first level inside of the S3 Bucket are the project directory folders. These folders divide the projects into different tabs in the FrOST Web App. For `frost-projects`, the hardware target (audioblade, audiomini, ...) is used to separate the projects. Inside the project directory folders are the project folders, which contain the various programming and driver files. In the FrOST Web App, the project folders create cards which allow the user to download and deploy the design.
  
**frost-projects**  
```
    |-- audioblade  
    |-- audiomini  
        |-- echo  
        |-- simple-gain  
        |-- vector-gain  
            |-- model.json  
            |-- vector_gain_audio_mini.dtbo  
            |-- vector_gain.ko  
            |-- vector_gain_audio_mini.rbf  
    |-- audioresearch  
        |-- Beamer  
        |-- dsbf  
```
The following steps will guide you through creating an S3 Bucket using the FrOST CloudFormation Template and uploading your first design, the Simple Vector Gain, to your S3 Bucket. 
## Creating an S3 Bucket and the CLI
1. Create an [Amazon Web Services](console.aws.amazon.com) Account and Log In  
    - FrOST Autogen and FrOST Edge only use features on the [AWS Free Tier](https://aws.amazon.com/free/), which is available for one year.  
    - A credit card is required to verify identity. AudioLogic is not liable for any charges or other account issues.  
2. In the top right corner of the main AWS Console Page, Select the [AWS Region](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html) for your new S3 Bucket
    - For AudioLogic Inc based in Bozeman MT, US-West-2 Oregon is the closest AWS region
3. Create a FrOST S3 Bucket using the [FrOST CloudFormation Template](https://github.com/fpga-open-speech-tools/utils/tree/dev/s3)

### Optional - Creating an IAM User to upload programming file via the AWS CLI   
The IAM User is a convenient way to automate the uploading of artifacts to S3 using the [AWS Command Line Interface](https://aws.amazon.com/cli/). It is not required to use the S3 Bucket with FrOST Edge. The following steps provide a simple starting point. This is not a complete guide on configuring an IAM user or security.  
4. [Create an IAM User](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html)  
    - Go to `IAM` by searching the AWS Services  
    - Under IAM Resources, click on `Users`  
    - Click `Add User`  
    - Enter a user name  
    - Under AWS Access Type, select `Programmatic Access`  
    - Configure user permissions  
5. Install the [AWS CLI V2](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html) for Windows   
6. In Powershell, run `aws configure`  
    - AWS Access Key ID: created in step 2  
    - AWS Secret Access Key: created in step 2  
    - Default Region: us-west-2  
    - Default Output Format: JSON  

## Uploading a Project to S3
### MATLAB CLI Upload
1. If you setup an IAM User with the CLI Interface, run `s3upload(mp,"[bucket name]","audiomini/[project_name]",true)` in the MATLAB Command Window.  
### Manual Upload for the Simple Vector Gain
1. Log into the [AWS Console](console.aws.amazon.com)
2. In the AWS Console search bar, enter `S3` and select `S3` under services
3. Enter the S3 bucket created during *AWS S3 Bucket and the CLI* by click on its name.
4. Create a project directory folder in the S3 Bucket from Step 3. `frost-projects` uses the hardware target as the project directory folder, but this naming convention is not required.
5. Enter the folder created in Step 4 and create a folder named `simple_vector_gain`
6. Enter the `simple_vector_gain` folder and upload the following files by clicking the `Upload` Button or by using the `Drag and Drop` functionality
    - `[FrOST Repos]\simulink_models\models\simple_gain_vector\model.json`  
    - `[FrOST Repos]\simulink_models\models\simple_gain_vector\hdlsrc\vector_gain\vector_gain_audio_mini.dtbo`  
    - `[FrOST Repos]\simulink_models\models\simple_gain_vector\hdlsrc\vector_gain\vector_gain.ko`  
    - `[FrOST Repos]\simulink_models\models\simple_gain_vector\hdlsrc\vector_gain\quartus\output_files\vector_gain_audio_mini.rbf`  

# Audio Mini Configuration
## Updating the Linux Image
1. Acquire a uSD Card of at least 16GB
2. Download the [Audio Mini Linux Image](https://frost-release.s3-us-west-2.amazonaws.com/linux-images/audio-mini-image.zip) from the [FrOST Website](https://fpga-open-speech-tools.github.io/audio_mini.html)  
3. Unzip the Linux Image  
    - Note: This takes a few minutes to complete
4. Download and Install [balenaEtcher](https://www.balena.io/etcher/)  
5. Launch balenaEtcher and follow the steps to write the Audio Mini Linux Image to the uSD Card 
    - Note: This takes about 20 minutes to write and validate

## Power the Audio Mini and Finding the IP Address
1. Download and Install [Putty](https://www.putty.org/)
2. Insert the uSD Card with the Audio Mini Linux Image into the Audio Mini
3. Connect an Ethernet cable to the DE10-Nano board and to your local switch or router.
4. Connect the USB Cable from the PC to the DE10-Nano board by plugging it into the UART connector on the DE10-Nano (The UART connector is the female Mini B connector on the right side near the Ethernet connector) 
5. Using Device Manager, locate the serial port of the device
    - In the Windows Search Bar, type `Device Manager`
    - Open the `Ports (COM & LPT)` Dropdown.  If no COM port shows up, you probably have the USB cable plugged into the wrong Mini B port on the DE10-Nano board.
    - Note the COM Number for the USB Serial Port in the List
6. Launch Putty and Configure the Serial Port Settings for the Audio Mini
    - Under Basic Options, Select `Serial`
    - Update the Serial Port Number - This was determined in step 4
    - Set the speed to `115200`
    - Click Open
7. Power the Audio Mini with the provided 12V DC Adapter
8. In the Putty Terminal, once the Audio Mini is booted, log in with
    - Username: root
    - Password: root
9. In the Putty Terminal, run `ifconfig`
    - Note the IP Address, it will be used in the next section

## Deploying Design to SoC FPGA through Web App
1. Connect to the FrOST Hardware by navigating to `[ip address]:5000`  
2. Enter the bucket name that was created in Step 2 of *AWS S3 Bucket and the CLI* and click `Update`  
3. Under device, select the correct FrOST Hardware  
4. Under the project folder, click the download icon  
5. Once downloaded and installed, the project controls will be available  
