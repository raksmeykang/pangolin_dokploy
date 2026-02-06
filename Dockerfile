FROM ubuntu:22.04

# 1. Install required tools for the Pangolin script
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    sudo \
    jq \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# 2. Run the official installer
# Note: We use 'bash' because the script you checked is application/x-sh
RUN curl -fsSL https://static.pangolin.net/get-installer.sh | bash || true

# 3. Give the installer permission and run it
# If the script downloads a file named 'installer', this runs it.
RUN if [ -f "./installer" ]; then chmod +x ./installer && ./installer --accept-license; fi

# Default port for Pangolin Dashboard
EXPOSE 80 443 51820
