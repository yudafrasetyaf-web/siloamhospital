@echo off
title Siloam Hospital - Frontend Demo
color 0B

echo ========================================================
echo    SILOAM HOSPITAL SYSTEM - FRONTEND DEMO
echo ========================================================
echo.

echo Starting Frontend Server...
echo.
echo Frontend akan berjalan di: http://localhost:3000
echo.
echo CATATAN: Ini demo UI saja (tanpa backend/database)
echo Untuk fitur lengkap, install PostgreSQL atau Docker
echo.
echo Browser akan terbuka otomatis dalam 10 detik...
echo.

cd frontend
start "Siloam Frontend" cmd /k "npm run dev"

timeout /t 10 /nobreak >nul
start http://localhost:3000

echo.
echo ========================================================
echo    FRONTEND RUNNING!
echo ========================================================
echo.
pause
