#!/bin/bash
docker run \
    --publish=7473:7474 \
    --publish=7686:7687 \
    --name=neo4j \
    --env=NEO4J_ACCEPT_LICENSE_AGREEMENT=yes \
    --env=NEO4J_dbms_connector_bolt_advertised__address=:7686 \
    --env=NEO4J_AUTH=neo4j/L3tM31n \
    --volume=Neo4jData:/var/lib/neo4j/data \
    -d neo4j:4.3.6-enterprise
