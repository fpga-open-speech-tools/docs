# Audio Mini Configuration
## Updating the Linux Image
1. Acquire a uSD Card of at least 16GB
2. Download the [Audio Mini Linux Image](https://frost-release.s3-us-west-2.amazonaws.com/linux-images/audio-mini-image.zip) from the [Frost Website](https://fpga-open-speech-tools.github.io/audio_mini.html)  
3. Unzip the Linux Image  
    - Note: This takes a few minutes to complete
4. Download and Install [balenaEtcher](https://www.balena.io/etcher/)  
5. Launch balenaEtcher and follow the steps to write the Audio Mini Linux Image to the uSD Card 
    - Note: This takes about 20 minutes to write and validate

## Power the Audio Mini and Determine the IP Address
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
    - Update the Serial Port Number - This was determined in step 5
    - Set the speed to `115200`
    - Click Open
7. Power the Audio Mini with the provided 12V DC Adapter
8. In the Putty Terminal, once the Audio Mini is booted, log in with
    - Username: root
    - Password: root
9. In the Putty Terminal, run `ifconfig`
    - Note the IP Address, it will be used in the next section

## Check the Status of the Frost Edge UI and the Deployment Manager
The following command can be run from Putty, however it is recommended to SSH into the Audio Mini using WSL.
  
1. Launch a WSL Terminal
2. SSH into the Audio Mini by running `ssh root@[ip address]`
    - password: root
3. Check the status of the Frost Deployment Manager by running `systemctl status frost_edge_dm.service`
4. Check the status of the Frost Edge UI by running `systemctl status frost_edge_web_app.service`

## Deploying Your Design
1. Connect to the Frost Hardware by navigating to `[ip address]:5000`  
2. Enter the bucket name that was created in Step 2 of *AWS S3 Bucket and the CLI* and click `Update`  
3. Under device, select the correct Frost Hardware  
4. Under the project folder, click the download icon  
5. Once downloaded and installed, the project controls will be available  