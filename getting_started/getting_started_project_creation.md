# Building a Custom Audio Processing System
## Project Creation
1. Copy the passthrough example project to a new directory within Simulink Models folder
2. Rename the project folder
3. Open the renamed folder and rename the Simulink project
4. Open the model.json file
5. Update the device name to match the renamed Simulink project.  If this step is skipped, the project **will not** compile.
6. Change to the `simulink_models/config` directory and run `pathSetup.m`
7. Change back to the project directory
8. Double-click the Simulink model and select 'Open Model' from the MATLAB prompt

## Testing the Project (Optional)
1. Set the simulation type to `Accelerator`
2. Click the run button in Simulink

## Audio Design
### Audio Processing System
1. Build the custom processing system from HDL synthesizable blocks.  These blocks should primarily be from the HDL coder toolbox, however a subset of other blocks from the Simulink library are synthesizable as well.  Be sure to convert to the appropriate word size at the end of the signal processing with the `Data Type Conversion` block using `fixdt(1,mp.W_bits,mp.F_bits)` as the output data type.
2. Connect the relevant data signals to the Avalon sink (input) and source (output) signals
3. Bring any user-defined signals out of the dataplane and to the top level of the project

### User Control
Registers that are to be controlled must be defined in two locations; in the Simulink model and in the `model.json` file.  The `model.json` file defines the type of control and data widths for the signal while the Simulink model defines how they are connected in the FPGA fabric.

1. Open the `model.json`
2. Add the desired registers to the `registers` field of the `devices` node.  Documentation and examples can be found in [this](getting_started_model_configuration.md) document
3. For each register that must be controlled, create a `From Workspace` block in the top level of the design.
4. Open the `From Workspace` block
5. In the data field for the block, add `mp.register{x}.timeseries` where `x` is the index of the register.  Note, indexing in MATLAB starts at 1.
6.  Set the sample time for the block by entering `mp.Ts_sim` in the `Sample time:` field.
7. Set the Output data type to `double`
8. Add a `Data Type conversion` block for each user defined register
9. Set the output data type of the conversion blocks to `mp.register{x}.dataType` where `x` is the corresponding register

## Deploying the build
1. Set the Simulation type to `Normal` and run the Simulink model
2. Once the Simulation is complete, click the green `Generate VHDL` button in the top level of the Simulink model
3. Follow the [DE10 setup guide](getting_started_audio_mini.md) to setup the Audio Mini
4. Follow the steps in [this](getting_started_frost_edge_s3.md) guide to upload the project files to S3 and test the project

## Model Referencing
*Coming Soon*
