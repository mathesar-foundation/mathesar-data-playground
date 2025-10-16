# Movie Rentals _lite_


1. Ensure your Mathesar development environment is running (because we'll use that PostgreSQL server).

1. cd into the directory containing this README file.

1. Create a new database called `movie_rentals_lite`

    ```
    docker exec -i mathesar_dev_db psql \
      -U mathesar \
      -d postgres \
      -c 'CREATE DATABASE movie_rentals_lite;'
    ```

1. Load the _full_ movie rentals data into it.

    ```
    unzip -p ../movie_rentals/movie_rentals.sql.zip \
      | docker exec -i mathesar_dev_db bash \
      -c 'psql -U mathesar -d movie_rentals_lite'
    ```

1. Run the transformation to delete most of the data.

    ```
    cat transformation.sql | docker exec -i mathesar_dev_db \
      psql --single-transaction -U postgres -d movie_rentals_lite
    ```

1. Export the results

    ```
    docker exec \
      -i mathesar_dev_db pg_dump \
      -U mathesar \
      -d movie_rentals_lite \
      -n movie_rentals \
      --no-owner \
      --no-acl \
      > movie_rentals_lite.sql
    ```
