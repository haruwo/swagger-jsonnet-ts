#!/usr/bin/env bash -ue -o pipefail

cd $(dirname $0)

npm run build
docker-compose up
