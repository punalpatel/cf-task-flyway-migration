#!/bin/bash
echo "$(date +'%s')-$(git rev-parse --short HEAD)"