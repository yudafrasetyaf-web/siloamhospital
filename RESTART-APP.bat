@echo off
title Siloam Hospital - RESTART
color 0C

echo ========================================================
echo    STOPPING ALL SERVERS
echo ========================================================
echo.

echo Killing existing Node.js processes...
taskkill /F /IM node.exe >nul 2>&1
timeout /t 2 /nobreak >nul

echo.
echo ========================================================
echo    STARTING FRESH
echo ========================================================
echo.

echo [1/3] Installing missing frontend dependencies...
cd frontend
call npm install caniuse-lite browserslist --save --loglevel=error

echo.
echo [2/3] Starting Backend Server (Port 4000)...
cd ..\backend
start "Backend API" cmd /k "npm run dev"

echo Waiting for backend...
timeout /t 10 /nobreak >nul

echo.
echo [3/3] Starting Frontend Server (Port 3000)...
cd ..\frontend
start "Frontend Web" cmd /k "npm run dev"

echo.
echo ========================================================
echo    SERVERS RESTARTING
echo ========================================================
echo.
echo Backend:  http://localhost:4000/api/v1
echo Frontend: http://localhost:3000
echo.
echo Tunggu 20 detik untuk inisialisasi...
echo.

timeout /t 20 /nobreak >nul
start http://localhost:3000

echo.
echo ✅ Application restarted!
echo.
pause
