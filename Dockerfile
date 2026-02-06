FROM ubuntu:24.04
RUN apt-get update && apt-get install -y curl ca-certificates && rm -rf /var/lib/apt/lists/*
WORKDIR /opt/pangolin

# Download the latest Pangolin binary directly
RUN curl -fsSL https://static.pangolin.net/get-installer.sh | bash -s -- --bin-only

# Create config directory
RUN mkdir -p /opt/pangolin/config

# Persistence
VOLUME /opt/pangolin/config

# Port you want to use (Change 8888 to your custom port)
EXPOSE 8888

# Forced Start Command
CMD ["/usr/local/bin/pangolin", "server", "--config", "/opt/pangolin/config/pangolin.yaml", "--port", "8888"]
