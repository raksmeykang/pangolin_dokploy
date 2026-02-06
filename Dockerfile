FROM ubuntu:22.04

# 1. Install tools so the installer doesn't try to install them again
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    sudo \
    jq \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# 2. Pre-download the installer 
RUN curl -fsSL https://static.pangolin.net/get-installer.sh | bash || true
RUN if [ -f "./installer" ]; then chmod +x ./installer; fi

# 3. Stay alive so you can access the Dokploy terminal
CMD ["tail", "-f", "/dev/null"]