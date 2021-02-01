# Prep the build environment
docker build -t aasdk_builder .

#  Execute entrypoint.sh and save build assets in release directory
docker run -v "${PWD}/release":/release aasdk_builder:latest amd64
docker run -v "${PWD}/release":/release aasdk_builder:latest armhf
