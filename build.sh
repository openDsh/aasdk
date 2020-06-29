# Prep the build environment
docker build -t aasdk_builder .

#  Execute entrypoint.sh and retrieve the build assets
docker run \
    -v $(pwd)/build:/build \
    -v $(pwd)/release:/release \
    --name aasdk_build_$(date "+%s") \
    aasdk_builder