FROM ubuntu:22.04

# Copy the archive containing the Vivado installer and the installation config file to the container
COPY FPGAs_AdaptiveSoCs_Unified_2024.2_1113_1001.tar /tmp/
COPY install_config.txt /tmp/

# Extract the archive
RUN tar -xf /tmp/FPGAs_AdaptiveSoCs_Unified_2024.2_1113_1001.tar -C /tmp/ && \
    rm /tmp/FPGAs_AdaptiveSoCs_Unified_2024.2_1113_1001.tar

RUN apt update -y

# Install necessary dependencies using the provided script
RUN ./tmp/FPGAs_AdaptiveSoCs_Unified_2024.2_1113_1001/installLibs.sh

RUN apt install locales

# Set the locale
RUN env LANG=en_US.UTF-8 locale-gen --purge en_US.UTF-8 \
	&& echo -e 'LANG="en_US.UTF-8"\nLANGUAGE="en_US:en"\n' > /etc/default/locale

# Install Vivado
RUN ./tmp/FPGAs_AdaptiveSoCs_Unified_2024.2_1113_1001/xsetup \
    --agree XilinxEULA,3rdPartyEULA \
    --batch Install \
    --config /tmp/install_config.txt

# Set the environment variables
RUN source /opt/Xilinx/Vivado/2024.2/settings64.sh

# Clean up
RUN rm -rf /tmp/FPGAs_AdaptiveSoCs_Unified_2024.2_1113_1001 && \
    rm /tmp/install_config.txt