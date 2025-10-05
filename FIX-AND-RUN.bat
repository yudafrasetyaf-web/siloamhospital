@echo off
title Fix & Run - Siloam Hospital
color 0E

echo ========================================================
echo    FIXING DEPENDENCIES AND RESTARTING
echo ========================================================
echo.

echo Stopping old processes...
taskkill /F /IM node.exe >nul 2>&1
timeout /t 2 /nobreak >nul

echo.
echo [1/3] Installing missing dependencies...
cd frontend
call npm install @babel/runtime tailwindcss-animate class-variance-authority --save --loglevel=error

echo.
echo [2/3] Starting Backend...
cd ..\backend
start "Backend API" cmd /k "npm run dev"
timeout /t 8 /nobreak >nul

echo.
echo [3/3] Starting Frontend...
cd ..\frontend
start "Frontend Web" cmd /k "npm run dev"

echo.
echo ========================================================
echo    SERVERS STARTING!
echo ========================================================
echo.
echo Backend:  http://localhost:4000
echo Frontend: http://localhost:3000
echo.
echo Tunggu 20 detik...
timeout /t 20 /nobreak >nul
start http://localhost:3000

echo.
echo ✅ Done! Check your browser.
pause
