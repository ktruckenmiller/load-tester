#!/bin/sh
echo $@
if [ -z "${S3_LOCATION}" ]; then
  # no config file, so do standard stuff
  exec bzt -l /tmp/artifacts/bzt.log $@
else
  aws s3 cp ${S3_LOCATION} my-config.yml
  exec bzt -l /tmp/artifacts/bzt.log my-config.yml
fi
