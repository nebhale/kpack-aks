#!/usr/bin/env zsh

set -eu

kapp delete \
  --yes \
  --namespace kapp \
  --app infrastructure

kapp delete \
  --yes \
  --namespace kapp \
  --app kpack

kubectl delete namespace kapp &> /dev/null
