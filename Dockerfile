# Use Ubuntu 24.04 (Matches your RK-AD Host)
FROM ubuntu:24.04

# Install dependencies for the installer
RUN apt-get update && apt-get install -y curl ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/pangolin

# FORCE: Download the latest binary directly (Detects ARM64 automatically)
RUN curl -fsSL https://static.pangolin.net/get-installer.sh | bash -s -- --bin-only

# Create config directory
RUN mkdir -p /opt/pangolin/config

# Persistence Volume
VOLUME /opt/pangolin/config

# Your custom port
EXPOSE 8888

# FORCE START: Point exactly to the config and the port
CMD ["/usr/local/bin/pangolin", "server", "--config", "/opt/pangolin/config/pangolin.yaml", "--port", "8888"]