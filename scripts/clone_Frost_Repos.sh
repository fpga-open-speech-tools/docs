#!/bin/bash
[ ! -d 'simulink_models' ]        && git clone https://github.com/fpga-open-speech-tools/simulink_models.git
[ ! -d 'fpga-open-speech-tools' ] && git clone https://github.com/fpga-open-speech-tools/fpga-open-speech-tools.github.io.git
[ ! -d 'utils' ]                  && git clone https://github.com/fpga-open-speech-tools/utils.git
[ ! -d 'arria10_projects' ]       && git clone https://github.com/fpga-open-speech-tools/arria10_projects.git
[ ! -d 'deployment_manager' ]     && git clone https://github.com/fpga-open-speech-tools/deployment_manager.git
[ ! -d 'hardware' ]               && git clone https://github.com/fpga-open-speech-tools/hardware.git
[ ! -d 'simulink_codegen' ]       && git clone https://github.com/fpga-open-speech-tools/simulink_codegen.git
[ ! -d 'component_library' ]      && git clone https://github.com/fpga-open-speech-tools/component_library.git
[ ! -d 'max10_projects' ]         && git clone https://github.com/fpga-open-speech-tools/max10_projects.git
[ ! -d 'de10nano_projects' ]      && git clone https://github.com/fpga-open-speech-tools/de10nano_projects.git
[ ! -d 'docs' ]                   &&  git clone https://github.com/fpga-open-speech-tools/docs.git
[ ! -d 'autogen_webapp' ]         && git clone https://github.com/fpga-open-speech-tools/autogen_webapp.git
[ ! -d 'simulink_library' ]       && git clone https://github.com/fpga-open-speech-tools/simulink_library.git
