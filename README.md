# PgDog Connection Pooler

Connection pooling for PostgreSQL with monitoring.

## Setup

```bash
cp .env.example .env
# Edit .env with your database credentials

docker compose up -d
```

## Connect Your App

Point your application to PgDog instead of PostgreSQL directly:

```
postgresql://user:pass@localhost:6432/yourdb
```

## Monitoring

- **Grafana Dashboard**: http://localhost:3001/d/pgdog-monitor
- **Prometheus**: http://localhost:9091
- **Raw Metrics**: http://localhost:9090/metrics

## Configuration

Pool settings in `docker-entrypoint.sh`:

| Setting | Default | Description |
|---------|---------|-------------|
| `default_pool_size` | 75 | Max connections per pool |
| `min_pool_size` | 20 | Warm connections kept ready |
| `pooler_mode` | transaction | Release connection after each transaction |
