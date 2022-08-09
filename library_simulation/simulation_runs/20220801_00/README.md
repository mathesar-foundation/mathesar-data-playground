# Library simulation run 2022-08-01

Parameters for Jupyter NB:

```python
AUTHOR_DIST_SHAPE = 3
MAX_NUM_AUTHORS = 300

PUBLISHER_DIST_SHAPE = 1
MAX_NUM_PUBLISHERS = 15

TITLES_DIST_SHAPE = 1
NUM_TITLES = 1000

NUM_PATRONS = 1000
```

## SQL file loading instructions

See the [main library simulation README](../../README.md) for general SQL file usage instructions.

## Raw Output

You can load the raw output (i.e., the results of loading the TSV files without changing column or table names) by using `books_n_patrons.sql`. **This file is schema agnostic**. This means that by default, it just loads the required tables and sequences into the `public` schema of your `mathesar` database. Further, it drops any table named `books_sim` or `patrons_sim` in that schema, as well as any dependencies, then recreates them. Use with caution.

## Final data model

You can load the final data model schema as per the storyboard by using `full_data_model_empty_checkouts.sql`. Note, however, that (as should be obvious from the filename) this file loads the data model with an empty checkouts table. It does, however, have all tables and constraints set up as in the storyboard. It loads these tables into a new schema, `"Library Management"`, which will be _completely replaced_ if it already exists. Use with caution.

# Simulated Checkout data

You can load simulated checkout data into the `"Checkouts"` table of the data model schema above by using `checkout_data_<date>_<n_rows>.sql`. There are multiple versions of these data sets, differing by the number of rows, and also the date perspective from which they were run. The setup assumes that you're at a certain date, and the simulation runs from some previous date up to the current time to produce the output. Should one wish to run a fresh simulation directly on the DB, use the `simulate_checkouts.sql` file. See the comments in the head of that file for some instructions on modifying the parameters of the simulation. Some notes are in order in this doc, however:
- The simulation chooses a random patron and matches them to a random item to create a checkout.
- The due date is set to 2 weeks from checkout date.
- The book is checked in according to a (roughly) normal distribution centered at 2 weeks, with a standard deviation of 1 week.
- Some books aren't checked in regardless of due date according to a random variable.
- If the check in would be in the future from the perspective of the simulation date, the book isn't checked in yet.
- A new patron checks out an item every 30 minutes on average, from 10am to 8pm, 7 days per week.
- Overlapping checkouts are disallowed. Books that are checked out and never returned (lost or stolen) are removed from the pool till the end of the simulation. Since we don't (currently) simulate buying more books, this means that a simulation over a long enough time period will see the library collection dwindle.
