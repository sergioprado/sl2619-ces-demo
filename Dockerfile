# image to unpack demo application
FROM debian:bullseye-slim AS app-image

# avoid interactive prompts during build
ENV DEBIAN_FRONTEND=noninteractive

# extract subtitle-demo.tgz into /home/root/
RUN mkdir -p /home/root
COPY subtitle-demo.tgz /tmp/subtitle-demo.tgz
RUN tar -xzf /tmp/subtitle-demo.tgz -C /home/root/ && rm -f /tmp/subtitle-demo.tgz

# base runtime image
FROM debian:bullseye-slim

# avoid interactive prompts during build
ENV DEBIAN_FRONTEND=noninteractive

# install required Debian packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    procps \
    vim \
    python3 \
    python3-pip \
    python3-venv \
    python3-gi \
    python3-pysrt \
    fontconfig \
    fonts-dejavu \
    fonts-liberation \
    gir1.2-gstreamer-1.0 \
    gstreamer1.0-tools \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    gstreamer1.0-alsa \
    gstreamer1.0-x \
    && apt-get clean && apt-get autoremove && rm -rf /var/lib/apt/lists/*

# copy application
RUN mkdir -p /home/root
COPY --from=app-image /home/root/subtitlev4 /home/root/subtitlev4

# install Python requirements
RUN pip3 install --no-cache-dir -r /home/root/subtitlev4/requirements.txt

# install run-demo.sh and set as entrypoint
COPY run-demo.sh /usr/bin/run-demo.sh
ENTRYPOINT ["/usr/bin/run-demo.sh"]
