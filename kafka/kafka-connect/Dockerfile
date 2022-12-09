FROM confluentinc/cp-server-connect-base:latest

ADD ./data /data
# Install connectors
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-datagen:latest