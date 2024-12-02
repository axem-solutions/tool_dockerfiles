FROM debian:12

# Set environment variable to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies
RUN apt update -y && \
    apt install -y  diffutils \ 
                    git \ 
                    make \ 
                    coreutils \ 
                    perl \ 
                    python3 \ 
                    libxcb-xinerama0 \ 
                    libxcb-icccm4 \ 
                    libxcb-image0 \ 
                    libxcb-keysyms1 \ 
                    libxcb-render-util0 \ 
                    libxkbcommon-x11-0 \
                    libglib2.0-0

# Copy the ModusToolbox .deb package to the container
COPY modustoolbox_3.3.0.16857_Linux_x64.deb /tmp/

# Extract the .deb package
RUN dpkg-deb -x /tmp/modustoolbox_3.3.0.16857_Linux_x64.deb /tmp/modustoolbox

# Copy only the necessary files to the appropriate locations
RUN mkdir -p /opt/Tools/ModusToolbox && \
    cp -r /tmp/modustoolbox/opt/Tools/ModusToolbox/tools_3.3 /opt/Tools/ModusToolbox/ && \
    cp -r /tmp/modustoolbox/opt/Tools/ModusToolbox/resources_3.3.0 /opt/Tools/ModusToolbox/

# Create necessary directories and JSON configuration file
RUN mkdir -p /usr/local/share/Infineon_Technologies_AG/Infineon-Toolbox/ && \
    mkdir -p /root/.local/share/Infineon_Technologies_AG/Infineon-Toolbox/ && \
    echo -e "{\n\
  \"guid\": \"8c6721b5-e369-4d13-bb47-620b6f4cbbb5\",\n\
  \"type\": \"tool\",\n\
  \"featureId\":  \"com.ifx.tb.tool.modustoolbox\",\n\
  \"title\": \"ModusToolbox(TM) Tools Package 3.3\",\n\
  \"version\": \"3.3.0.16857\",\n\
  \"versionNumeric\": 3030000016857,\n\
  \"path\": \"/opt/Tools/ModusToolbox/tools_3.3/dashboard/dashboard\",\n\
  \"exePath\":\"/opt/Tools/ModusToolbox/tools_3.3/dashboard/dashboard\",\n\
  \"toolImage\": \"/opt/Tools/ModusToolbox/tools_3.3/tool-icon-3.3.0.png\",\n\
  \"uninstallPath\":\"modustoolbox-3.3.0\",\n\
  \"description\": \"ModusToolbox(TM) is a set of multi-platform development tools and a comprehensive suite of GitHub-hosted firmware libraries. Together, they enable an immersive development experience for customers creating converged MCU and Wireless systems\",\n\
  \"tags\": \"PSoC 6,PSoC 4,XMC,Wireless Connectivity,Wi-Fi,Bluetooth,AIROC,Embedded Software,Operating System (RTOS/Autosar/Non-Autosar),Middleware (Device Drivers & Libraries),Communication and Connectivity,Firmware (Hardware Abstraction Layer),Bootloader/OTA,Code Example,Development Tools,Compilers,Debugger/Test & Verification Tools,Configuration Tools\",\n\
  \"help\": \"/opt/Tools/ModusToolbox/docs_3.3/doc_landing.html\",\n\
  \"licenses\": \"/opt/Tools/ModusToolbox/\",\n\
  \"release\": \"/opt/Tools/ModusToolbox/docs_3.3/mt_release_notes.pdf\",\n\
  \"additionalPaths\": [{\"name\":\"Project Creator 2.21.0\",\"path\":\"/opt/Tools/ModusToolbox/tools_3.3/project-creator/project-creator\"},{\"name\":\"DFUH Tool 2.50.0\",\"path\":\"/opt/Tools/ModusToolbox/tools_3.3/dfuh-tool/dfuh-tool\"},{\"name\":\"BSP Assistant 1.21.0\",\"path\":\"/opt/Tools/ModusToolbox/tools_3.3/bsp-assistant/bsp-assistant\"},{\"name\":\"Eclipse IDE for ModusToolbox(TM) 3.3\",\"path\":\"/opt/Tools/ModusToolbox/ide_3.3/eclipse/modustoolbox-eclipse\"},{\"name\":\"ModusToolboxTM-Tools-Package-33\",\"path\":\"/opt/Tools/ModusToolbox/tools_3.3/dashboard/dashboard\"}],\n\
  \"attributes\": \"{\\\"entry-name\\\":\\\"ModusToolbox(TM) 3.3 Dashboard\\\",\\\"mtb-type\\\":\\\"tools\\\"}\",\n\
  \"dependencies\": [{\"uuid\":\"\",\"targetFeatureId\":\"com.ifx.tb.tool.modustoolboxprogtools\",\"minVersionNumeric\":1000000000000,\"maxVersionNumeric\":9999999999999},{\"uuid\":\"\",\"targetFeatureId\":\"com.ifx.tb.tool.modustoolboxedgeprotectsecuritysuite\",\"minVersionNumeric\":1000000000000,\"maxVersionNumeric\":9999999999999}]\n\
}" > /usr/local/share/Infineon_Technologies_AG/Infineon-Toolbox/8c6721b5-e369-4d13-bb47-620b6f4cbbb5.json && \
    ln -s /usr/local/share/Infineon_Technologies_AG/Infineon-Toolbox/8c6721b5-e369-4d13-bb47-620b6f4cbbb5.json /root/.local/share/Infineon_Technologies_AG/Infineon-Toolbox/8c6721b5-e369-4d13-bb47-620b6f4cbbb5.json

# Execute the Post-Install Script
RUN /opt/Tools/ModusToolbox/tools_3.3/modus-shell/postinstall

# Clean up
RUN rm -rf /tmp/modustoolbox /tmp/modustoolbox_3.3.0.16857_Linux_x64.deb

WORKDIR /work

# Set the environment variable CY_TOOLS_PATHS to the path of the ModusToolbox tools
ENV CY_TOOLS_PATHS=/opt/Tools/ModusToolbox/tools_3.3
