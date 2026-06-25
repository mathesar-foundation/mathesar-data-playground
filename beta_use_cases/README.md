# Use Case Datasets

This directory includes datasets for use on the "use cases" landing pages for mathesar.org.

## Loading into Mathesar

Each dataset has a `schema.sql` and `generated_data.sql` file which can be loaded into Mathesar. Each `schema.sql` file will drop an existing schema with the same name and create a new one.

Here's an example of loading these into a locally-running Mathesar instance.

```shell
# (Optional) Generate the data
python {use_case_name}/generate_data.py

# First load the schema and tables
docker exec -i mathesar_dev_db bash -c 'psql -U mathesar' < {use_case_name}/schema.sql
# Then the sample data
docker exec -i mathesar_dev_db bash -c 'psql -U mathesar' < {use_case_name}/generated_data.sql
```

## Philosophy

These datasets use a mix of "low fidelity" faker data and more domain-specific hardcoded strings to create fake, but plausible, datasets for various Mathesar use cases.

Timestamp columns that would be used for auditing, soft deletes, and so on have been omitted to reduce clutter.

Column IDs are always `BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY`.

## Development

The only requirement is to install dependencies with `pip install -r requirements.txt`.
