FROM ubuntu:22.04

# Install essential tools
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    sudo \
    jq \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Download the installer now so it's ready for you
RUN curl -fsSL https://static.pangolin.net/get-installer.sh | bash || true

# Give it execution permissions
RUN if [ -f "./installer" ]; then chmod +x ./installer; fi

# This keeps the container running forever so you can log in
CMD ["tail", "-f", "/dev/null"]