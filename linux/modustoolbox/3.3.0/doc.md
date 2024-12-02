# ModusToolbox

## How to build
The Dockerfile intalls the ModusToolbox deb file and the required dependencies. 
The ModusToolbox deb file must be downloaded from the Infineon website and placed in the same 
directory as the Dockerfile. 

The deb file can be downloaded from the following link: 
https://softwaretools.infineon.com/tools/com.ifx.tb.tool.modustoolbox

!!! Note
The deb file can't be downloaded automatically via the Dockerfile, becuase it is only 
available after logging in to the Infineon website. 

Run the following command to build the Docker image:
`docker build -t modustoolbox:3.3.0 .`

## Additional notes
The ModusToolbox installer contains components that are not needed for the Docker image (e.g. the 
Eclipse IDE). The Dockerfile only installs the tool-set and the required dependencies.