export SQL_PLUGIN=postgres
export SQL_HOST=temporal.cfoehvo1ip9p.us-west-2.rds.amazonaws.com
export SQL_PORT=5432
export SQL_USER=postgres
export SQL_PASSWORD=rfn4XDUY5JbLXv9N

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

# -------------------------------------------
# Dev Environment
# -------------------------------------------

git clone https://github.com/temporalio/temporal.git
git checkout tags/v1.15.2
git clone https://github.com/temporalio/helm-charts.git
git checkout tags/v1.15.2
export SQL_PLUGIN=postgres
export SQL_HOST=temporal.cfoehvo1ip9p.us-west-2.rds.amazonaws.com
export SQL_PORT=5432
export SQL_USER=postgres
export SQL_PASSWORD=rfn4XDUY5JbLXv9N

./temporal-sql-tool create-database -database dev_temporal
SQL_DATABASE=dev_temporal ./temporal-sql-tool setup-schema -v 0.0
SQL_DATABASE=dev_temporal ./temporal-sql-tool update -schema-dir schema/postgresql/v96/temporal/versioned

./temporal-sql-tool create-database -database dev_temporal_visibility
SQL_DATABASE=dev_temporal_visibility ./temporal-sql-tool setup-schema -v 0.0
SQL_DATABASE=dev_temporal_visibility ./temporal-sql-tool update -schema-dir schema/postgresql/v96/visibility/versioned

helm dependencies update

helm uninstall -n dev temporal --timeout 900s

helm install -f values/values.postgresql.yaml -f values/values.elasticsearch.yaml -n dev temporal \
  --set grafana.enabled=false \
  --set prometheus.enabled=false . --timeout 900s
