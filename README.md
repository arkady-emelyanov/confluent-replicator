# Confluent Replicator bi-directional setup

* Create a topic in DC1: `echo "init" | kafkacat -P -b localhost:9093 -t dc1-topic`
* Setup replication DC1 -> DC2 (DC2 pulls data from DC1): `./setup_dc1_to_dc2.sh`
* Setup replication DC2 -> DC1 (DC1 pulls data from DC2): `./setup_dc2_to_dc1.sh`
* Connect consumer to DC1: `kafkacat -C -b localhost:9093 -t dc1-topic -q`
* Connect consumer to DC2: `kafkacat -C -b localhost:9094 -t dc1-topic -q`
* Produce to DC1: `echo "dc1-message" | kafkacat -P -b localhost:9093 -t dc1-topic`
* Produce to DC2: `echo "dc2-message" | kafkacat -P -b localhost:9094 -t dc1-topic`

Both consumers (DC1 and DC2) should display following messages:
```
init
dc1-message
dc2-message
```

## Links

* [Replicator Docker Demo](https://docs.confluent.io/current/multi-dc-deployments/replicator/replicator-docker-tutorial.html#replicator)
* [Confluent Examples](https://github.com/confluentinc/examples)
