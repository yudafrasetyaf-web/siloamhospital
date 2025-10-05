@echo off
title Start Clean - Siloam Hospital
color 0A

echo ========================================================
echo    STARTING SILOAM HOSPITAL SYSTEM
echo ========================================================
echo.

echo Stopping old processes...
taskkill /F /IM node.exe >nul 2>&1
timeout /t 2 /nobreak >nul

echo.
echo [1/2] Starting Backend Server...
cd backend
start "Backend API - Port 4000" cmd /k "npm run dev"

echo Waiting for backend to initialize...
timeout /t 10 /nobreak >nul

echo.
echo [2/2] Starting Frontend Server...
cd ..\frontend
start "Frontend - Port 3000" cmd /k "npm run dev"

echo.
echo ========================================================
echo    SERVERS STARTING!
echo ========================================================
echo.
echo Backend:  http://localhost:4000/api/v1
echo Frontend: http://localhost:3000
echo.
echo Tunggu 20 detik untuk kompilasi...
timeout /t 20 /nobreak >nul

start http://localhost:3000

echo.
echo ✅ Done! Browser opened.
echo.
pause
