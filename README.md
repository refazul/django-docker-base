# Django Docker Base

A production-ready Django application template with Docker containerization, featuring PostgreSQL database and minimal host system footprint.

## ✨ Features

- 🐳 **Fully Dockerized** - Zero configuration on your host machine (only Docker required)
- 🗄️ **PostgreSQL Database** - Production-grade database with persistent storage
- 🚀 **Django REST Framework** - Ready for API development
- 🔒 **Environment-based Configuration** - Secure credential management
- 🏭 **Production Ready** - Includes Gunicorn for production deployment
- 📦 **Minimal Footprint** - All dependencies contained within Docker

## 📋 Prerequisites

- [Docker](https://docs.docker.com/get-docker/) (with Docker Compose)
- That's it! 🎉

## 🚀 Quick Start (Development)

### 1. Clone the Repository

```bash
git clone https://github.com/refazul/django-docker-base
cd django-docker-base
```

### 2. Set Up Environment Variables

Copy the example environment file and configure it:

```bash
cp .env.example .env
```

Edit `.env` with your preferred values:
- Database credentials
- Django secret key
- Allowed hosts
- Debug settings
- Port configurations

### 3. Build and Start the Containers

```bash
docker compose up -d --build
```

This will:
- Build the Django application container
- Pull and start PostgreSQL container
- Set up networking between services
- Create persistent volume for database

### 4. Create a Superuser

```bash
docker compose run --rm web bash
```

Inside the container:

```bash
python manage.py createsuperuser
```

Exit the container:

```bash
exit
```

### 5. Access the Application

- **Application**: http://localhost
- **Admin Panel**: http://localhost/admin

## 🛠️ Common Commands

### Start the Application

```bash
docker compose up -d
```

### Stop the Application

```bash
docker compose down
```

### View Logs

```bash
docker compose logs -f web
```

### Run Django Management Commands

```bash
docker compose run --rm web python manage.py <command>
```

Examples:
```bash
# Run migrations
docker compose run --rm web python manage.py migrate

# Create migrations
docker compose run --rm web python manage.py makemigrations

# Collect static files
docker compose run --rm web python manage.py collectstatic

# Open Django shell
docker compose run --rm web python manage.py shell
```

### Access Container Shell

```bash
docker compose run --rm web bash
```

### Rebuild Containers

```bash
docker compose up -d --build
```

## 📁 Project Structure

```
.
├── django_project/          # Django project settings
│   ├── settings.py          # Main configuration
│   ├── urls.py              # URL routing
│   └── wsgi.py              # WSGI entry point
├── static/                  # Static files (CSS, JS, images)
├── media/                   # User-uploaded files
├── docker-compose.yml       # Docker services definition
├── docker-compose.override.yml  # Local development overrides
├── docker-compose.prod.yml  # Production configuration
├── Dockerfile               # Container image definition
├── requirements.txt         # Python dependencies
├── .env.example             # Environment variables template
├── manage.py                # Django management script
└── wait-for-db.py          # Database initialization helper
```

## 🔧 Configuration

### Environment Variables

Key environment variables in `.env`:

| Variable | Description | Example |
|----------|-------------|---------|
| `DB_NAME` | PostgreSQL database name | `db` |
| `DB_USER` | Database user | `admin` |
| `DB_PASSWORD` | Database password | `pass` |
| `DB_HOST` | Database host | `db` |
| `DB_PORT` | Database port | `5432` |
| `SECRET_KEY` | Django secret key | `your-secret-key` |
| `DEBUG` | Debug mode | `False` |
| `APP_PORT` | Application port | `8000` |
| `ALLOWED_HOSTS` | Allowed hostnames | `localhost,127.0.0.1` |

### Production Deployment

For production deployment, use:

```bash
docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d --build
```

Make sure to:
- Set `DEBUG=False` in `.env`
- Use a strong `SECRET_KEY`
- Configure proper `ALLOWED_HOSTS` and `CSRF_TRUSTED_ORIGINS`
- Set up SSL/TLS certificates
- Configure reverse proxy

## 🧪 Development

### Adding Python Packages

1. Add package to `requirements.txt`
2. Rebuild the container:
   ```bash
   docker compose up -d --build
   ```

### Database Migrations

After making model changes:

```bash
docker compose run --rm web python manage.py makemigrations
docker compose run --rm web python manage.py migrate
```

## 🐛 Troubleshooting

### Container won't start

```bash
# Check logs
docker compose logs web

# Rebuild from scratch
docker compose down -v
docker compose up -d --build
```

### Database connection issues

Ensure database service is running:
```bash
docker compose ps
```

### Permission issues

```bash
# Fix permissions
sudo chown -R $USER:$USER .
```

## 📦 Tech Stack

- **Framework**: Django
- **API**: Django REST Framework
- **Database**: PostgreSQL 16
- **Server**: Gunicorn
- **Containerization**: Docker & Docker Compose
- **Python**: 3.13

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- Django Software Foundation
- Docker Community
- All contributors who help improve this project

---

**Note**: Remember to never commit your `.env` file with sensitive credentials. Always use `.env.example` as a template.
