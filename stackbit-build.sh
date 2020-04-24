#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5ea23139a6f5f2001afaa2a1/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5ea23139a6f5f2001afaa2a1
curl -s -X POST https://api.stackbit.com/project/5ea23139a6f5f2001afaa2a1/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5ea23139a6f5f2001afaa2a1/webhook/build/publish > /dev/null
