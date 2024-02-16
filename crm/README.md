# CRM sample data

This sample data is designed to work like Mathesar's internal CRM

## Usage

## Loading data

The CRM sample data is in `generated_data.sql`.

Load it into your local Mathesar development environment like so:

```
docker exec -i mathesar_dev_db bash -c 'psql -U mathesar' < generated_data.sql
```

## Modifying and re-generating the data

1. Make adjustments as necessary in `source_Data`. Data in here is generated with a mix if manual grunt work, LLM wizardry, and text-based massaging.

1. Run the script:

    ```
    ./generate.py
    ```

    This regenerates the `generated_data.sql` file from the source data.

