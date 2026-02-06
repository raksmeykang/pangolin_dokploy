# RK-AD FORCED DEPLOYMENT
FROM fosrl/pangolin:latest
# Ensure the config directory exists for the mount
RUN mkdir -p /opt/pangolin/config
# Standard volume for persistence
VOLUME /opt/pangolin/config
# We expose your custom port (let's use 8888 as the example)
EXPOSE 8888
# Override the start command to force the port and config path
CMD ["pangolin", "server", "--config", "/opt/pangolin/config/pangolin.yaml", "--port", "8888"]