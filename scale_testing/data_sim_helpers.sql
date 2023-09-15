-- Depends on msar and __msar schemata.
-- This file has some functions for creating test data at relatively large scale.

CREATE OR REPLACE FUNCTION msar.create_manytab(n integer) RETURNS integer AS $$
/* Create n tables in a new schema called manytab */
DECLARE
  i integer;
  manytab_oid oid;
BEGIN
PERFORM msar.drop_schema('manytab', true, true);
PERFORM msar.create_schema('manytab', true);
manytab_oid := 'manytab'::regnamespace::oid;
FOR i in 1..n
  LOOP
    PERFORM msar.add_mathesar_table(
      manytab_oid, 'tab_' || i::text,
      '[{"name": "col1", "type": {"name": "text"}}, {"name": "col2", "type": {"name": "integer"}}]',
      null, null
    );
    EXECUTE format(
      'INSERT INTO manytab.tab_%s (col1, col2) VALUES (''abc'', 123), (''def'', 456)', i
    );
  END LOOP;
RETURN n;
END;
$$ LANGUAGE plpgsql RETURNS NULL ON NULL INPUT;


CREATE OR REPLACE FUNCTION msar.drop_schema_tables(sch_oid oid) RETURNS integer AS $$/*
Drop all tables from a schema one at a time.

This function is useful to avoid memory issues that may prevent dropping schemata with many tables
or columns.

Args:
  sch_oid: The OID of the schema whose tables we should drop.
*/
DECLARE
  r RECORD;
  i integer := 0;
BEGIN
FOR r in SELECT oid AS roid FROM pg_class WHERE relnamespace=sch_oid AND relkind='r'
  LOOP
    PERFORM msar.drop_table(r.roid, true, true);
    i := i + 1;
  END LOOP;
RETURN i;
END;
$$ LANGUAGE plpgsql RETURNS NULL ON NULL INPUT;


CREATE OR REPLACE FUNCTION
msar.create_manycols(tab_num integer, col_num integer) RETURNS integer AS $$
/* Create tab_num tables with col_num columns each, in a schema called manycols. */
DECLARE
  i integer;
  j integer;
  k integer;
  manycols_oid oid;
BEGIN
PERFORM msar.drop_schema('manycols', true, true);
PERFORM msar.create_schema('manycols', true);
manycols_oid := 'manycols'::regnamespace::oid;
FOR i in 1..tab_num
  LOOP
    PERFORM msar.add_mathesar_table(manycols_oid, 'tab_' || i::text, null, null, null);
    FOR j in 1..(col_num - 1)
      LOOP
        PERFORM msar.add_columns(
          'manycols',
          'tab_' || i::text,
          '[{"type": {"name": "text"}, "default": "substr(md5(random()::text), 24)"}]',
          true
        );
      END LOOP;
    FOR k in 1..10
      LOOP
        EXECUTE format('INSERT INTO manycols.tab_%s (id) VALUES (DEFAULT)', i);
      END LOOP;
  END LOOP;
  RETURN tab_num * col_num;
END;
$$ LANGUAGE plpgsql RETURNS NULL ON NULL INPUT;
