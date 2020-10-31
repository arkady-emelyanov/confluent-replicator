ARG CONNECT_VERSION
FROM confluentinc/cp-kafka-connect-base:${CONNECT_VERSION}

ARG CONNECT_VERSION
RUN mkdir -p "/usr/share/java"
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-replicator:${CONNECT_VERSION}
