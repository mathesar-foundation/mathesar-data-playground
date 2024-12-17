# Hardware Store sample data

This sample dataset represents a chain of hardware stores managing their inventory and rentals.

```mermaid
%% https://mermaid.js.org/syntax/entityRelationshipDiagram.html

erDiagram
%% https://mermaid.js.org/syntax/entityRelationshipDiagram.html

    store_locations {
        BIGINT id PK
        string name
        string address
    }

    customers {
        BIGINT id PK
        string first_name
        string last_name
        string email
        string phone
        string address
    }

    assets {
        BIGINT id PK
        string name
        string serial_number
        NUMERIC rental_price
        NUMERIC sale_price
        string rental_period
        string location
        BIGINT store_id FK
    }

    transactions {
        BIGINT id PK
        BIGINT asset_id FK
        BIGINT customer_id FK
        string transaction_type
        TIMESTAMP transaction_date
        NUMERIC total_charge
        string note
    }

    rentals {
        BIGINT id PK
        BIGINT transaction_id FK
        TIMESTAMP rental_start
        TIMESTAMP rental_end
        TIMESTAMP time_out
        TIMESTAMP time_in
        INTERVAL rental_time
    }

%% Relationships
%%  See: https://mermaid.js.org/syntax/entityRelationshipDiagram.html#relationship-syntax
    assets ||--|{ store_locations : "store_id"
    transactions ||--|| assets : "asset_id"
    transactions ||--|{ customers : "customer_id"
    rentals ||--|| transactions : "transaction_id"

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
