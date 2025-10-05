@echo off
echo ========================================
echo  Starting Database + PgAdmin with Docker
echo ========================================
echo.

echo Checking Docker status...
docker info >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Docker is not running!
    echo Please start Docker Desktop first.
    echo.
    pause
    exit /b 1
)

echo Docker is running!
echo.

echo Starting PostgreSQL database and PgAdmin...
docker-compose --profile development up -d db pgadmin

echo.
echo ========================================
echo Database and PgAdmin are starting...
echo ========================================
echo.
echo Database Connection:
echo   Host: localhost
echo   Port: 5432
echo   Database: hospital_db
echo   User: hospital_admin
echo   Password: secure_password_123
echo.
echo PgAdmin Web Interface:
echo   URL: http://localhost:5050
echo   Email: admin@siloam.com
echo   Password: admin123
echo.
echo Checking container status...
timeout /t 3 >nul
docker-compose ps

echo.
echo Press any key to exit...
pause >nul
