FROM ubuntu:latest

# Set non-interactive mode to prevent prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common \
    iputils-ping \
    tcpdump \
    && add-apt-repository -y ppa:oisf/suricata-stable \
    && apt-get update \
    && apt-get install -y suricata \
    && apt-get clean 
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y net-tools

# Set Suricata to run by default
# CMD ["suricata", "-i", "eth0"]