# Sensate IoT - Smart Energy

The Sensate IoT Smart Energy project implements an IoT solution for (Dutch)
Smart Meters. The project consists of several repository's:

- DSMR parser;
- DSMR web client (implementator of this service);
- Several customer facing apps;
- DSMR database project (OLAP);
- DSMR product database (this project).

## Database projects

The data related to DSMR projects is disributed acros several sources:

- Sensate IoT Data Platform;
- The OLAP database;
- The DSMR product database.

The product database holds meta data about the DSMR product, such as:

- Customers;
- User accounts;
- Mapping from accounts to sensor IDs;
- Product tokens.

Basically, this database exists in order to be able to productize the DSMR
application, in a secure way.
