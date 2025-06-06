# Library Simulation

This directory holds a number of files for simulating a library data set associated with our first use-case storyboard. The simulation runs via the Jupyter notebook in this directory, and outputs a pair of TSVs, `books_sim.tsv` and `patrons_sim.tsv`.

## Running the Jupyter notebook

- Make a virutalenv: `venv`
- Activate it: `source venv/bin/activate`
- Install dependencies: `pip install -r requirements.txt`
- Run the notebook: `jupyter-notebook`
- Follow the instructions in the console.

## Loading simulation outputs

Under `simulation_runs`, you'll find directories containing data sets organized by the date of the simulation run, with a suffix. Each such directory should also contain a `README.md` file describing (at a minimum) the parameters used for the simulation in question.

## Raw TSVs

Under `simulation_runs/<run_id>/raw_tsvs`, you'll find the raw TSVs output by the simulation run in question. These can be loaded into Mathesar using the normal table importing from a TSV process. You can also load them manually into your DB using the `\copy` command if desired. This is not recommended, however. Better to use the provided SQL files, described below.

## SQL files

Under the `simulation_runs/<run_id>/sql_files` directory, you'll find a number of SQL files, each of which loads data associated with the simulation into your DB. These should be run via:

``` sh
docker exec -i mathesar_db bash -c 'psql -U mathesar' < path/to/thefile.sql
```
This will run the indicated file within the Postgres DB Docker container. The specific SQL files should be described in the run-specific `README.md` file.
