# Run with `./run_simulation.sh <your_db_name>` with docker-compose setup
# already running.
# Must have appropriate permissions to use docker.
# If run with no arg, uses `mathesar` DB.
#
DB_NAME=${1-mathesar}
echo "Simulting in DB named $DB_NAME"
SCRIPT_DIR=$(dirname $0)
SQL_DIR=$SCRIPT_DIR/sql_files
cat \
	$SQL_DIR/setup.sql \
    $SQL_DIR/patrons.sql \
    $SQL_DIR/real_books.sql \
    $SQL_DIR/simulation.sql \
    $SQL_DIR/simulate_checkouts.sql \
	| docker exec -i mathesar_db bash -c "psql -U mathesar -d $DB_NAME"
