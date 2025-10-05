@echo off
echo ========================================
echo  Starting Database with Docker
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

echo Starting PostgreSQL database...
docker-compose up -d db

echo.
echo ========================================
echo Database is starting...
echo ========================================
echo.
echo Connection Details:
echo   Host: localhost
echo   Port: 5432
echo   Database: hospital_db
echo   User: hospital_admin
echo   Password: secure_password_123
echo.
echo Checking container status...
timeout /t 3 >nul
docker-compose ps

echo.
echo Press any key to exit...
pause >nul
