export SQL_PLUGIN=postgres
export SQL_HOST=temporal.cfoehvo1ip9p.us-west-2.rds.amazonaws.com
export SQL_PORT=5432
export SQL_USER=postgres
export SQL_PASSWORD=TEST

./temporal-sql-tool create-database -database temporal
SQL_DATABASE=temporal ./temporal-sql-tool setup-schema -v 0.0
SQL_DATABASE=temporal ./temporal-sql-tool update -schema-dir schema/postgresql/v96/temporal/versioned

./temporal-sql-tool create-database -database temporal_visibility
SQL_DATABASE=temporal_visibility ./temporal-sql-tool setup-schema -v 0.0
SQL_DATABASE=temporal_visibility ./temporal-sql-tool update -schema-dir schema/postgresql/v96/visibility/versioned


export SQL_PLUGIN=mysql
export SQL_HOST=temporal-db.cfoehvo1ip9p.us-west-2.rds.amazonaws.com
export SQL_PORT=3306
export SQL_USER=admin
export SQL_PASSWORD=TEST

./temporal-sql-tool create-database -database temporal
SQL_DATABASE=temporal ./temporal-sql-tool setup-schema -v 0.0
SQL_DATABASE=temporal ./temporal-sql-tool update -schema-dir schema/mysql/v57/temporal/versioned

./temporal-sql-tool create-database -database temporal_visibility
SQL_DATABASE=temporal_visibility ./temporal-sql-tool setup-schema -v 0.0
SQL_DATABASE=temporal_visibility ./temporal-sql-tool update -schema-dir schema/mysql/v57/visibility/versioned
