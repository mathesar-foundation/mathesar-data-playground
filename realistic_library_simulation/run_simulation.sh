# Run with `source run_simulation.sh <your_db_name>` with docker-compose setup
# already running.
# Must have appropriate permissions to use docker.
# If run with no arg, uses `mathesar` DB.
#
DB_NAME=${1-mathesar}
echo "Simulting in DB named $DB_NAME"
cat setup.sql patrons.sql real_books.sql simulation.sql simulate_checkouts.sql \
	| docker exec -i mathesar_db bash -c "psql -U mathesar -d $DB_NAME"
