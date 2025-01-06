FROM ubuntu:22.04

# Copy the follwing: 
# - the archive containing the Vivado installer 
# - the installation config file 
# - the entrypoint script
COPY FPGAs_AdaptiveSoCs_Unified_2024.2_1113_1001.tar /tmp/
COPY install_config.txt /tmp/
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Extract the archive, install dependencies, install Vivado, and clean up in a single RUN command
RUN apt update -y && \
    apt install -y locales && \
    tar -xf /tmp/FPGAs_AdaptiveSoCs_Unified_2024.2_1113_1001.tar -C /tmp/ && \
    /tmp/FPGAs_AdaptiveSoCs_Unified_2024.2_1113_1001/installLibs.sh && \
    env LANG=en_US.UTF-8 locale-gen --purge en_US.UTF-8 && \
    echo -e 'LANG="en_US.UTF-8"\nLANGUAGE="en_US:en"\n' > /etc/default/locale && \
    /tmp/FPGAs_AdaptiveSoCs_Unified_2024.2_1113_1001/xsetup \
        --agree XilinxEULA,3rdPartyEULA \
        --batch Install \
        --config /tmp/install_config.txt && \
    rm -rf /tmp/FPGAs_AdaptiveSoCs_Unified_2024.2_1113_1001 /tmp/install_config.txt /tmp/FPGAs_AdaptiveSoCs_Unified_2024.2_1113_1001.tar

# Make the entrypoint script executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Set the working directory
WORKDIR /work