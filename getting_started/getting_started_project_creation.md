# Building a Custom Audio Processing System
## Project Creation
1. Copy the passthrough example project to a new directory within Simulink Models folder
2. Rename the project folder
3. Open the renamed folder and rename the Simulink project
4. Open the model.json file
5. Update the device name to match the renamed Simulink project

## Audio Design
### Audio Processing System
1. Double-click the Simulink model and select 'Open Model' from the MATLAB prompt
2. Open the dataplane subsystem from the top level design
3. Build the custom processing system from HDL synthesizable blocks.  These blocks should primarily be from the HDL coder toolbox, however a subset of other blocks from the Simulink library are synthesizable as well.
4. Connect the relevant data signals to the Avalon sink (input) and source (output) signals
5. Bring any user-defined signals out of the dataplane and to the top level of the project

### User Control
Registers that are to be controlled must be defined in two locations; in the Simulink model and in the `model.json` file.  The `model.json` file defines the type of control and data widths for the signal while the Simulink model defines how they are connected in the FPGA fabric.

1. Open the `model.json`
2. Add the desired registers to the `registers` field of the `devices` field.  Documentation and examples can be found in [this](getting_started_model_configuration.md) document
3. For each register that must be controlled, create a `From Workspace` variable in the top level of the design.
4. Open the `From Workspace` block


## Model Referencing
*Coming Soon*