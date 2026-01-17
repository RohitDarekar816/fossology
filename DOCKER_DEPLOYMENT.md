# FOSSology Docker Deployment

This repository contains a complete FOSSology deployment setup using Docker Compose. The configuration has been optimized for easy deployment on any server.

## Quick Start (Development)

1. Clone this repository:
```bash
git clone <repository-url>
cd fossology
```

2. Start the services:
```bash
docker compose up -d
```

3. Access FOSSology:
   - Web Interface: http://localhost:81
   - Default login: Check the FOSSology documentation for default credentials

## Production Deployment (Recommended)

For production deployments, use pre-built Docker Hub images:

1. Clone this repository:
```bash
git clone <repository-url>
cd fossology
```

2. Deploy using the production script:
```bash
./deploy-production.sh
```

OR manually:
```bash
docker compose -f docker-compose.prod.yml up -d
```

3. Access FOSSology:
   - Web Interface: http://localhost:81

### Images Used
- **Web Service**: `rohitdarekar816/fossology:web`
- **Scheduler Service**: `rohitdarekar816/fossology:scheduler`
- **Database**: `postgres:16` (official)

## Services

The setup includes three main services:

- **web**: Apache web server serving FOSSology UI (port 81)
- **scheduler**: FOSSology job scheduler
- **db**: PostgreSQL database (internal port 5432)

## Configuration Files

### Apache Configuration
- `docker/apache/fossology.conf`: Apache virtual host configuration
- `docker/apache/setup-apache.sh`: Script that configures Apache on container startup

These files are automatically mounted into the web container and configure Apache to serve the FOSSology web interface correctly.

### Docker Compose
- `docker-compose.yml`: Main orchestration file with all services configured

## Deployment on Different Servers

To deploy on a different server:

1. Ensure Docker and Docker Compose are installed
2. Clone this repository
3. Run `docker compose up -d`
4. Access FOSSology via the server's IP/domain on port 81

## Persistent Data

- Database data is stored in Docker volumes
- Repository data is stored in Docker volumes
- Configuration is embedded in the mounted files

## Health Checks

The web service includes health checks to ensure it's responding properly to API requests.

## Troubleshooting

Check logs with:
```bash
docker compose logs [service-name]
```

Common issues:
- Port 81 must be available
- Ensure sufficient disk space for repository
- Check firewall settings if accessing remotely