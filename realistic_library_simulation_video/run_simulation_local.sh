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
	| psql -h localhost -U mathesar -d $DB_NAME
