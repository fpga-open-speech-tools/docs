# FPGA Open Speech Tools

## Project Overview

### FrOST Autogen Framework

### FrOST Edge
FrOST Edge, which contains the FrOST Edge UI and Deployment Manager, utilize Amazon Web Service's (AWS) Simple Storage Service (S3) to store the design artifacts required to deploy and control your FrOST algorithm. The design artifacts include the model.json, the device tree blob, the Linux Kernel Module, and the FPGA raw binary file.  All of these files are generated using the FrOST Autogen Software but can also be created manually.

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

## Getting Started
1. Install the [FrOST Autogen Framework](https://github.com/fpga-open-speech-tools/docs/blob/docs-refactor/getting_started/getting_started_frost_autogen.md)
2. Create your [FrOST Edge S3 Bucket](https://github.com/fpga-open-speech-tools/docs/blob/docs-refactor/getting_started/getting_started_frost_edge_s3.md)
3. Configure your FrOST Hardware:
    - [The Audio Mini](https://github.com/fpga-open-speech-tools/docs/blob/docs-refactor/getting_started/getting_started_audio_mini.md)

## Developing with the FrOST Autogen Framework
### Requirements

### Features

## FrOST Command Line Tools
