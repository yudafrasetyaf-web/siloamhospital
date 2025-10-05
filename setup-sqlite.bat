@echo off
title Setup SQLite Database
color 0A

echo ========================================================
echo    SETUP SQLITE DATABASE (No PostgreSQL Needed!)
echo ========================================================
echo.

echo [Step 1/3] Installing SQLite package...
cd backend
call npm install sqlite3 --save

echo.
echo [Step 2/3] Switching to SQLite configuration...
copy /Y src\utils\database-sqlite.ts src\utils\database.ts

echo.
echo [Step 3/3] Updating environment...
echo SQLITE_MODE=true >> .env

echo.
echo ========================================================
echo    SQLITE SETUP COMPLETE!
echo ========================================================
echo.
echo Database akan otomatis dibuat saat server dijalankan.
echo File database: backend\database.sqlite
echo.
echo Sekarang jalankan: start-servers.bat
echo.
pause
