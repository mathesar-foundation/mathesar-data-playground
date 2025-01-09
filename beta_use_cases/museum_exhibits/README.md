# Museum Exhabits sample data

This sample dataset represents a museum managing their assets and exhibits across multiple locations.

```mermaid
%% https://mermaid.js.org/syntax/entityRelationshipDiagram.html

erDiagram
    "Acquisition Types" {
        BIGINT id PK
        string type_name
        string description
    }

    "Collections" {
        BIGINT id PK
        string name
        string description
    }

    "Locations" {
        BIGINT id PK
        string name
        string address
    }

    "Exhibits" {
        BIGINT id PK
        string name
        DATE start_date
        DATE end_date
        BIGINT location_id FK
        BOOLEAN featured
        string description
    }

    "Items" {
        BIGINT id PK
        string name
        string serial_number
        DATE acquisition_date
        BIGINT acquisition_type_id FK
        BIGINT collection_id FK
        BIGINT exhibit_id FK
    }

%% Relationships
%%  See: https://mermaid.js.org/syntax/entityRelationshipDiagram.html#relationship-syntax
    "Exhibits" ||--|| "Locations" : "location_id"
    "Items" ||--|| "Acquisition Types" : "acquisition_type_id"
    "Items" ||--|| "Collections" : "collection_id"
    "Items" ||--|| "Exhibits" : "exhibit_id"

```


## Loading Data

The generated SQL file, `generate_data/load_data.sql`, contains all the necessary COPY commands to import data into your database. The data (and the load data file) are produced by the `generate_data.py` file, which can be adjusted and re-run to alter the data if needed.

Load the data into a locally-running Mathesar instance like this:

```shell
# First load the schema and tables
docker exec -i mathesar_dev_db bash -c 'psql -U mathesar' < schema.sql
# Then the sample data
docker exec -i mathesar_dev_db bash -c 'psql -U mathesar' < generated_data.sql
```

## Development

The only requirement is to install dependencies with `pip install -r requirements.txt`.
