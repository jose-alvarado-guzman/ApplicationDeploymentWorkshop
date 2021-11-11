LOAD CSV WITH HEADERS FROM 'file:///workshopData.csv' AS data
WITH *,split(data.ParticipantType,',') AS labels,toInteger(data.ID) AS ID
MERGE(p:Person {id:ID})
    ON CREATE
        SET p.id=ID,
            p.name=data.Name,
            p.year=data.StudentYear,
            p.type=labels,
            p.registrationDate=data.RegistrationDate
MERGE(e:Email {address:data.Email})
    ON CREATE
        SET e.address=data.Email
MERGE(i:Institution {name:data.Institution})
    ON CREATE
        SET i.name=data.Institution
MERGE(p)-[:HAS_EMAIL]->(e)
MERGE(p)-[:PART_OF_INSTITUTION]->(i);
