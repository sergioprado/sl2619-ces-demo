# sl2619-ces-demo

Synaptics SL2619 CES container demo.

## About the demo

The demo essentially loops thru a set of Video clips (mp4) files which are played in a gstreamer pipeline. The clips have associated subtitles (srt files) which are displayed on as an overlay in the upper segment of the display. In parallel, there is a AI model that translates the srt files dynamically to a specified language, and the translated subtitles are displayed as an overlay on the lower segment of the display. The clips loops thru a set of configured languages for translation (Hindi, Chinese and Spanish).

Hardware requirements are a display and a USB Audio output (speaker or headset).

The demo application itself is not included in this repository, and it is provided by the Synaptics team in a compressed file (`subtitle-demo.tgz`).

## Build the container

First login to DockerHub:

```shell
docker login -u <your-docker-hub-user>
```

Then build and push the container to Docker Hub:

```shell
./build.sh [your-docker-hub-user]
```

## Run the container

The container can be manually executed with the following command:

```shell
docker run --name subtitle --device /dev/dri --device /dev/snd \
           -v /var/run/user/0/wayland-1:/var/run/user/0/wayland-1 \
           sergioprado/subtitle-demo:arm64-1.0
```

Make sure you have a display connected to the HDMI port and a USB Audio output (speaker or headset).
