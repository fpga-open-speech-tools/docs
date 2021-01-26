# FPGA Open Speech Tools

## Project Overview
FPGA Open Speech Tools (FrOST) contains two key components: The FrOST Autogen Framework and FrOST Edge. 
### FrOST Autogen Framework
The FrOST Autogen Framework provides a simple development tool to build audio processing algorithms that target [FrOST Hardware](https://fpga-open-speech-tools.github.io/hardware.html). The Framework allows the developer to design processing algorithms using [MATLAB's Simulink](https://www.mathworks.com/products/simulink.html) software. Once the algorithm has been defined and verified, the FrOST Autogen Framework generates the HDL, Quartus Project, and Linux Drivers. These components are then deployed to FrOST Hardware using the FrOST Edge UI.

### FrOST Edge
FrOST Edge, which contains the FrOST Edge UI and Deployment Manager, utilize Amazon Web Service's (AWS) Simple Storage Service (S3) to store the design artifacts required to deploy and control your FrOST algorithm. The design artifacts include the `model.json`, the device tree blob, the Linux Kernel Module, and the FPGA raw binary file.  All of these files, except the `model.json`, are generated using the FrOST Autogen Software but can also be created manually. The `model.json` defines the hardware target and registers used in the design.

#### FrOST Edge S3 Bucket  
The S3 Bucket used by Frost Edge requires a specific folder structure to parse correctly. The `frost-projects` S3 Bucket folder structure can be found below. The first level inside of the S3 Bucket are the project directory folders. These folders divide the projects into different tabs in the FrOST Edge UI. For `frost-projects`, the hardware target (audioblade, audiomini, ...) is used to separate the projects. Inside the project directory folders are the project folders, which contain the various programming and driver files. In the FrOST Edge UI, the project folders create cards which allow the user to download and deploy the design.
  
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

## [Getting Started](getting_started\ReadMe.md)
1. Install the [FrOST Autogen Framework](getting_started/getting_started_frost_autogen.md)
2. Create your [FrOST Edge S3 Bucket](getting_started/getting_started_frost_edge_s3.md)
3. Configure your FrOST Hardware:
    - [The Audio Mini](getting_started/getting_started_audio_mini.md)
