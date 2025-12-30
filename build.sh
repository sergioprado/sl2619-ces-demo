#!/bin/sh

DOUSER="sergioprado"
DOTAG="subtitle-demo"
DOARCH="arm64"
DOVERSION="${DOARCH}-1.0"

docker buildx build --platform linux/${DOARCH} -t ${DOUSER}/${DOTAG}:${DOVERSION} .
docker push ${DOUSER}/${DOTAG}:${DOVERSION}
