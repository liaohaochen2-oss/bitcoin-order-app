#!/bin/bash
set -e

mkdir -p zap-output
chmod 777 zap-output

docker pull ghcr.io/zaproxy/zaproxy:stable

docker run --rm \
  -v "${PWD}/zap-output:/zap/wrk/:rw" \
  ghcr.io/zaproxy/zaproxy:stable \
  zap-baseline.py \
  -t "https://liaohaochen2-oss.github.io/bitcoin-order-app/" \
  -r zap_baseline_report.html \
  -I
