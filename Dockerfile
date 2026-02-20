# Use Ubuntu to have a clean slate for the installer
FROM ubuntu:22.04

# Install basic tools needed for the Pangolin script
RUN apt-get update && apt-get install -y curl sudo

# Keep the container running forever so it doesn't restart
CMD ["tail", "-f", "/dev/null"]
