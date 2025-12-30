#!/bin/sh

DOUSER="$1"
DOTAG="subtitle-demo"
DOARCH="arm64"
DOVERSION="${DOARCH}-1.0"

if [ -z "$DOUSER" ]; then
    DOUSER="sergioprado"
fi

docker buildx build --platform linux/${DOARCH} -t ${DOUSER}/${DOTAG}:${DOVERSION} .
docker push ${DOUSER}/${DOTAG}:${DOVERSION}
