#!/bin/sh
set -e

# Generate pgdog.toml from environment variables
cat > /pgdog/pgdog.toml << EOF
[general]
host = "0.0.0.0"
port = 6432
workers = 8
pooler_mode = "transaction"
default_pool_size = 75
min_pool_size = 20
connect_timeout = 15000
idle_timeout = 600000
checkout_timeout = 30000
healthcheck_interval = 30000
healthcheck_timeout = 5000
openmetrics_port = 9090

[[databases]]
name = "${POSTGRES_DB}"
host = "${POSTGRES_HOST}"
port = ${POSTGRES_PORT:-5432}
database_name = "${POSTGRES_DB}"
EOF

# Generate users.toml from environment variables
cat > /pgdog/users.toml << EOF
[[users]]
name = "${POSTGRES_USER}"
password = "${POSTGRES_PASSWORD}"
database = "${POSTGRES_DB}"
EOF

# Execute PgDog
exec /usr/local/bin/pgdog "$@"
