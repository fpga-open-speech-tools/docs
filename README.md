# Frost

## Project Overview
FPGA Open Speech Tools (Frost) contains two key components: The Frost Autogen Framework and Frost Edge. 
### Frost Autogen Framework
The Frost Autogen Framework provides a simple development tool to build audio processing algorithms that target [Frost Hardware](https://fpga-open-speech-tools.github.io/hardware.html). The Framework allows the developer to design processing algorithms using [MATLAB's Simulink](https://www.mathworks.com/products/simulink.html) software. Once the algorithm has been defined and verified, the Frost Autogen Framework generates the HDL, Quartus Project, and Linux Drivers. These components are then deployed to Frost Hardware using the Frost Edge UI.

### Frost Edge
Frost Edge, which is the Frost Edge UI and Deployment Manager, utilizes Amazon Web Service's (AWS) Simple Storage Service (S3) to store the design artifacts required to deploy and control your Frost algorithm. The design artifacts include the `model.json`, the device tree blob, the Linux Kernel Module, and the FPGA raw binary file.  All of these files, except the `model.json`, are generated using the Frost Autogen Software but can also be created manually. The `model.json` defines the hardware target and registers used in the design.

#### Frost Edge S3 Bucket  
The S3 Bucket used by Frost Edge requires a specific folder structure to parse correctly. The `frost-projects` S3 Bucket folder structure can be found below. The first level inside of the S3 Bucket are the project directory folders. These folders divide the projects into different tabs in the Frost Edge UI. For `frost-projects`, the hardware target (audioblade, audiomini, ...) is used to separate the projects. Inside the project directory folders are the project folders, which contain the various programming and driver files. In the Frost Edge UI, the project folders create cards which allow the user to download and deploy the design.
  
**frost-projects**  
```
    ├── audioblade  
    ├── audiomini  
    │   ├── echo  
    │   ├── simple-gain  
    │   └── vector-gain  
    │       ├── model.json  
    │       ├── vector_gain_audio_mini.dtbo  
    │       ├── vector_gain.ko  
    │       └── vector_gain_audio_mini.rbf  
    └── audioresearch  
        ├── Beamer  
        └── dsbf  
```

## [Getting Started](getting_started)

1. Install the [Frost Autogen Framework](getting_started/getting_started_frost_autogen.md)
2. Uploading your design to a [Frost Edge S3 Bucket](getting_started/getting_started_frost_edge_s3.md)
3. Configure your Frost Hardware:
    - [The Audio Mini](getting_started/getting_started_audio_mini.md)
