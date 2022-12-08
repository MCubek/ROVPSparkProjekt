# ROVPSparkProjekt
FER Spark Streaming GeoData Project

To run kafka and connectors in docker locally:

1. Position bash command line to kafka directory with docker-compose
    ```Bash
    cd kafka
    ```
3. Build the required images
    ```Bash
    docker-compose build && docker-compose pull
    ```
5. Start required services
    ```Bash
    docker-compose -f docker-compose.yaml -f kafka-connect/submit-connectors.yaml up -d
    ```
6. Open Confluent Platform interface or Kafka-UI
    - http://localhost:8080
    - http://localhost:9021

7. To stop services
    ```Bash
    docker-compose -f docker-compose.yaml -f kafka-connect/submit-connectors.yaml down
    ```