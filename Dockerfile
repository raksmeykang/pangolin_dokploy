# RK-AD Standard: Pinned version to avoid config regressions
FROM fosrl/pangolin:0.1.0-beta

# Ensure config directory exists
RUN mkdir -p /opt/pangolin/config

# Standard volume for persistence
VOLUME /opt/pangolin/config

EXPOSE 8080