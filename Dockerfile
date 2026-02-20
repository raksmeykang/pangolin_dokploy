# Use the official Pangolin EE image (matches your compose file)
FROM docker.io/fosrl/pangolin:ee-1.15.2

# Set the working directory
WORKDIR /app

# Ensure we have the necessary permissions for the config volume
# This prevents 'Permission Denied' errors in Dokploy
RUN mkdir -p /app/config && chmod -R 755 /app/config

# Document the ports used (Pangolin uses 443 for its internal Traefik)
EXPOSE 80 443

# The entrypoint is already defined in the base image, 
# so we don't need a CMD or ENTRYPOINT line.
