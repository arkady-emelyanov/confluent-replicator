#!/usr/bin/env bash

HEADER="Content-Type: application/json"
DATA=$(cat <<EOF
{
  "name": "replicator-dc2-to-dc1-topic1",
  "config": {
    "connector.class": "io.confluent.connect.replicator.ReplicatorSourceConnector",
    "topic.whitelist": "dc1-topic",
    "key.converter": "io.confluent.connect.replicator.util.ByteArrayConverter",
    "value.converter": "io.confluent.connect.replicator.util.ByteArrayConverter",
    "src.kafka.bootstrap.servers": "dc2:9092",
    "src.consumer.group.id": "replicator-dc2-to-dc1",
    "src.kafka.timestamps.topic.replication.factor": 1,
    "confluent.topic.replication.factor": 1,
    "provenance.header.enable": "true",
    "header.converter": "io.confluent.connect.replicator.util.ByteArrayConverter",
    "dest.kafka.bootstrap.servers": "dc1:9092",
    "tasks.max": "1"
  }
}
EOF
)

curl -X POST -H "${HEADER}" --data "${DATA}" http://localhost:8083/connectors
