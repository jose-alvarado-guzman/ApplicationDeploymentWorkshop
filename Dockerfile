FROM neo4j:3.4.6-enterprise
MAINTAINER Jose A Alvarado "jaa2220@colubia.edu"
LABEL name="Neo4j with datafile" \ 
      version=1.0
ARG IMPORT_DIR=/var/lib/neo4j/import
COPY workshopData.csv ${IMPORT_DIR}
