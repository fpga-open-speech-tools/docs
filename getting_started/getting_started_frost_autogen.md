# Installing the FrOST Autogen Framework
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

### Python 3.8+
1. In the Windows Command Prompt, check if Python 3 is installed by running
    - `python --version`
2. If Python 3 is not installed, install Python 3.8+ from the Microsoft Store

## Configure the FrOST Autogen Software
1. Create a new folder to store all of the FrOST Repos. This folder will be refered to as the `[FrOST Repos]` Directory in the rest of this guide.
2. In the Windows Command Prompt:  
    1. Navigate to the newly created `[FrOST Repos]` Directory   
    2. Clone the [Docs Repo](https://github.com/fpga-open-speech-tools/docs) into the `[FrOST Repos]` Directory by running    
        - `wsl.exe git clone https://github.com/fpga-open-speech-tools/docs.git`   
    3. Install the FrOST Autogen Software by ruunning   
        - `wsl.exe bash "docs/scripts/FrOST_Autogen_Config.sh"`   
        - Note this will take approximately 30 minutes and requires at least 2GB of free hard drive space.

## Generating an Example Design: The Simple Vector Gain Model
1. Open MATLAB
2. Navigate to `[FrOST Repos]\simulink_models\config`
3. Run `pathSetup.m` - **This has to be run every time MATLAB is opened.**
4. Open an example model, in this case, `[FrOST Repos]\simulink_models\models\simple_gain_vector\vector_gain.slx`
5. Click the Run Simulation Button (Green Play Icon) in the toolbar 
6. Change the dropdown left of the Run Simulation button from "Accelerator" to "Normal"
7. Click the Green Generate VHDL Button in the bottom left of the top level of the design