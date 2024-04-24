FROM debian:12.5-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y --no-install-recommends curl git wget jq bash unzip ca-certificates

# Install yq
RUN wget -q https://github.com/mikefarah/yq/releases/download/v4.43.1/yq_linux_amd64.tar.gz -O - | tar xz && \
  mv yq_linux_amd64 /usr/bin/yq && \
  chmod +x /usr/bin/yq

# cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

CMD bash
