@echo off
title Siloam Hospital System - FULL APP
color 0A

echo ========================================================
echo    SILOAM HOSPITAL SYSTEM - STARTING FULL APP
echo ========================================================
echo.

REM Install sqlite3 for backend
echo [1/4] Installing SQLite package for backend...
cd backend
call npm install sqlite3 --save-dev --loglevel=error

echo.
echo [2/4] Setting up environment for SQLite...
if not exist ".env" (
    (
        echo NODE_ENV=development
        echo PORT=4000
        echo JWT_SECRET=siloam-hospital-secret-key-2025
        echo JWT_EXPIRES_IN=7d
        echo CORS_ORIGIN=http://localhost:3000
        echo LOG_LEVEL=info
    ) > .env
    echo Created .env file
)

echo.
echo [3/4] Starting Backend API Server...
start "Backend API - Port 4000" cmd /k "cd /d %~dp0backend && npm run dev"

echo Waiting for backend to start...
timeout /t 8 /nobreak >nul

echo.
echo [4/4] Starting Frontend Server...
cd ..\frontend
start "Frontend - Port 3000" cmd /k "cd /d %~dp0frontend && npm run dev"

echo.
echo ========================================================
echo    SERVERS STARTING!
echo ========================================================
echo.
echo Backend API:  http://localhost:4000/api/v1
echo Frontend Web: http://localhost:3000
echo.
echo Database: SQLite (file-based, no installation needed)
echo Database File: backend\database.sqlite
echo.
echo Tunggu 15-20 detik untuk inisialisasi lengkap...
echo Browser akan terbuka otomatis...
echo.

timeout /t 15 /nobreak >nul
start http://localhost:3000

echo.
echo ========================================================
echo    ✅ APPLICATION RUNNING!
echo ========================================================
echo.
echo Buka browser ke: http://localhost:3000
echo.
echo Untuk menghentikan: Tutup kedua window CMD yang terbuka
echo.
pause
