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

## Raw Output

You can load the raw output (i.e., the results of loading the TSV files without changing column or table names) by using `books_n_patrons.sql`. **This file is schema agnostic**. This means that by default, it just loads the required tables and sequences into the `public` schema of your `mathesar` database. Further, it drops any table named `books_sim` or `patrons_sim` in that schema, as well as any dependencies, then recreates them. Use with caution.

## Final data model

TODO
