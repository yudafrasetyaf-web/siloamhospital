@echo off
title Siloam Hospital - Starting Servers
color 0A

echo ========================================================
echo    STARTING SILOAM HOSPITAL SYSTEM
echo ========================================================
echo.

echo [1/2] Starting Backend Server...
start "Backend Server - Port 4000" cmd /k "cd /d %~dp0backend && npm run dev"

echo Waiting for backend to initialize...
timeout /t 5 /nobreak >nul

echo [2/2] Starting Frontend Server...
start "Frontend Server - Port 3000" cmd /k "cd /d %~dp0frontend && npm run dev"

echo.
echo ========================================================
echo    SERVERS STARTING!
echo ========================================================
echo.
echo Backend: http://localhost:4000/api/v1
echo Frontend: http://localhost:3000
echo.
echo Tunggu 10-15 detik untuk inisialisasi...
echo Browser akan terbuka otomatis...
echo.

timeout /t 15 /nobreak >nul
start http://localhost:3000

echo.
echo ========================================================
echo    SERVERS RUNNING!
echo ========================================================
echo.
echo Tekan tombol apapun untuk keluar (servers akan tetap running)
pause >nul
