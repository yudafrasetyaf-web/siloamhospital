@echo off
title CLEAN INSTALL - Siloam Hospital
color 0C

echo ========================================================
echo    CLEAN INSTALL - STARTING FRESH
echo ========================================================
echo.

echo [1/7] Stopping all Node processes...
taskkill /F /IM node.exe >nul 2>&1
timeout /t 2 /nobreak >nul

echo.
echo [2/7] Deleting old node_modules (Frontend)...
cd frontend
if exist "node_modules" rmdir /S /Q node_modules
if exist "package-lock.json" del /F /Q package-lock.json
if exist ".next" rmdir /S /Q .next

echo.
echo [3/7] Deleting old node_modules (Backend)...
cd ..\backend
if exist "node_modules" rmdir /S /Q node_modules
if exist "package-lock.json" del /F /Q package-lock.json
if exist "dist" rmdir /S /Q dist

echo.
echo [4/7] Fresh install Frontend dependencies...
echo This will take 3-5 minutes...
cd ..\frontend
call npm install --force --loglevel=error

echo.
echo [5/7] Fresh install Backend dependencies...
cd ..\backend
call npm install --force --loglevel=error

echo.
echo [6/7] Installing SQLite...
call npm install sqlite3 --save --loglevel=error

echo.
echo [7/7] Setup complete!
echo.
echo ========================================================
echo    CLEAN INSTALL COMPLETE!
echo ========================================================
echo.
echo Sekarang jalankan: START-CLEAN.bat
echo.
pause
