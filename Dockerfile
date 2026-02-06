# Use Ubuntu 24.04 to match your RK-AD Host OS
FROM ubuntu:24.04

# Install dependencies required by the installer/Pangolin
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /opt/pangolin

# RK-AD Requirement: Download the ARM64 binary directly 
# This mirrors the 'curl | bash' logic for a container environment
RUN curl -fsSL https://static.pangolin.net/get-installer.sh | bash -s -- --bin-only

# Create config directory
RUN mkdir -p /opt/pangolin/config

# Persistence
VOLUME /opt/pangolin/config

# Pangolin default port
EXPOSE 8080

# Start Pangolin pointing to the persistent config
CMD ["/usr/local/bin/pangolin", "server", "--config", "/opt/pangolin/config/pangolin.yaml"]