#!/bin/bash

# Fail hard and fast
set -eo pipefail

export HOST_IP=${HOST_IP:-172.17.42.1}
export CLUSTERNAME=${CLUSTERNAME:-logstash}
export CONFD_BACKEND=${CONFD_BACKEND:-env}

# Loop until confd has updated the logstash config
until /confd -onetime -backend $CONFD_BACKEND -config-file /etc/confd/conf.d/elasticsearch.toml; do
  sleep 5
done

/elasticsearch/bin/elasticsearch -Des.config=/data/elasticsearch.yml