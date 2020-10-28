#!/usr/bin/env zsh

set -eu

kubectl get namespace kapp &> /dev/null || kubectl create namespace kapp

kapp deploy \
  --yes \
  --namespace kapp \
  --app kpack \
  --file https://github.com/pivotal/kpack/releases/download/v0.1.2/release-0.1.2.yaml

kapp deploy \
  --yes \
  --namespace kapp \
  --app infrastructure \
  --into-ns default \
  --file secrets.yml \
  --file infrastructure.yml
