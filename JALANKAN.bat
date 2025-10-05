@echo off
title Siloam Hospital System
color 0A

echo ========================================================
echo    STARTING SILOAM HOSPITAL SYSTEM
echo ========================================================
echo.

echo [1/2] Starting Backend...
cd backend
start "Backend API" cmd /c "npm run dev"

echo.
echo [2/2] Starting Frontend...
cd ..\frontend
timeout /t 8 /nobreak
start "Frontend Web" cmd /c "npm run dev"

echo.
echo ========================================================
echo.
echo Backend:  http://localhost:4000
echo Frontend: http://localhost:3000
echo.
echo Tunggu 20 detik, browser akan terbuka...
echo.
timeout /t 20 /nobreak
start http://localhost:3000

echo ✅ Aplikasi sudah running!
echo.
pause
