# Dockerfile
FROM eclipse-mosquitto:2.0.21

# Expose MQTT ports
EXPOSE 1883
EXPOSE 8883
EXPOSE 9001 

# Health check
HEALTHCHECK --interval=30s --timeout=5s \
    CMD mosquitto_pub -h localhost -t '$SYS/broker/uptime' -m 'healthcheck' -q 1 || exit 1

# Run Mosquitto
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]