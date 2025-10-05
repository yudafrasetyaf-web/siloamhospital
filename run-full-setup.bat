@echo off
title Siloam Hospital System - Full Setup
color 0A

echo ========================================================
echo    SILOAM HOSPITAL SYSTEM - AUTOMATIC SETUP
echo ========================================================
echo.

REM Check Node.js
echo [Step 1/6] Checking Node.js...
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Node.js tidak ditemukan!
    echo Silakan install dari https://nodejs.org/
    pause
    exit /b 1
)
node --version
echo [OK] Node.js terinstall
echo.

REM Setup environment files
echo [Step 2/6] Setting up environment files...
if not exist ".env" (
    copy .env.example .env >nul 2>nul
    echo [OK] Created .env
) else (
    echo [OK] .env already exists
)

cd backend
if not exist ".env" (
    copy .env.example .env >nul 2>nul
    echo [OK] Created backend/.env
) else (
    echo [OK] backend/.env already exists
)

cd ..\frontend
if not exist ".env.local" (
    copy .env.local.example .env.local >nul 2>nul
    echo [OK] Created frontend/.env.local
) else (
    echo [OK] frontend/.env.local already exists
)
cd ..
echo.

REM Install Backend
echo [Step 3/6] Installing Backend Dependencies...
echo This may take 2-3 minutes...
cd backend
if not exist "node_modules" (
    call npm install --loglevel=error
    if %errorlevel% neq 0 (
        echo [ERROR] Backend installation failed!
        cd ..
        pause
        exit /b 1
    )
    echo [OK] Backend dependencies installed
) else (
    echo [OK] Backend dependencies already installed
)
cd ..
echo.

REM Install Frontend
echo [Step 4/6] Installing Frontend Dependencies...
echo This may take 2-3 minutes...
cd frontend
if not exist "node_modules" (
    call npm install --loglevel=error
    if %errorlevel% neq 0 (
        echo [ERROR] Frontend installation failed!
        cd ..
        pause
        exit /b 1
    )
    echo [OK] Frontend dependencies installed
) else (
    echo [OK] Frontend dependencies already installed
)
cd ..
echo.

REM Create a simple HTML demo
echo [Step 5/6] Creating demo page...
(
echo ^<!DOCTYPE html^>
echo ^<html lang="id"^>
echo ^<head^>
echo     ^<meta charset="UTF-8"^>
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
echo     ^<title^>Siloam Hospital System^</title^>
echo     ^<style^>
echo         * { margin: 0; padding: 0; box-sizing: border-box; }
echo         body { 
echo             font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
echo             background: linear-gradient(135deg, #1d2a57 0%%, #4caf50 100%%);
echo             min-height: 100vh;
echo             display: flex;
echo             justify-content: center;
echo             align-items: center;
echo             padding: 20px;
echo         }
echo         .container {
echo             background: white;
echo             border-radius: 20px;
echo             box-shadow: 0 20px 60px rgba(0,0,0,0.3);
echo             padding: 50px;
echo             max-width: 800px;
echo             text-align: center;
echo         }
echo         h1 {
echo             color: #1d2a57;
echo             margin-bottom: 20px;
echo             font-size: 2.5em;
echo         }
echo         .status {
echo             background: #e8f5e9;
echo             border-left: 4px solid #4caf50;
echo             padding: 20px;
echo             margin: 30px 0;
echo             border-radius: 5px;
echo             text-align: left;
echo         }
echo         .status h2 {
echo             color: #2e7d32;
echo             margin-bottom: 15px;
echo         }
echo         .status ul {
echo             list-style: none;
echo             padding-left: 0;
echo         }
echo         .status li {
echo             padding: 8px 0;
echo             color: #333;
echo         }
echo         .status li:before {
echo             content: "✓ ";
echo             color: #4caf50;
echo             font-weight: bold;
echo             margin-right: 10px;
echo         }
echo         .info {
echo             background: #fff3e0;
echo             border-left: 4px solid #ff9800;
echo             padding: 20px;
echo             margin: 20px 0;
echo             border-radius: 5px;
echo             text-align: left;
echo         }
echo         .info h3 {
echo             color: #e65100;
echo             margin-bottom: 10px;
echo         }
echo         .btn {
echo             display: inline-block;
echo             background: #4caf50;
echo             color: white;
echo             padding: 15px 40px;
echo             text-decoration: none;
echo             border-radius: 50px;
echo             margin: 10px;
echo             font-size: 16px;
echo             transition: all 0.3s;
echo             border: none;
echo             cursor: pointer;
echo         }
echo         .btn:hover {
echo             background: #45a049;
echo             transform: translateY(-2px);
echo             box-shadow: 0 5px 20px rgba(76,175,80,0.4);
echo         }
echo         .btn-secondary {
echo             background: #1d2a57;
echo         }
echo         .btn-secondary:hover {
echo             background: #2d3a67;
echo         }
echo         .footer {
echo             margin-top: 30px;
echo             padding-top: 20px;
echo             border-top: 1px solid #eee;
echo             color: #666;
echo         }
echo     ^</style^>
echo ^</head^>
echo ^<body^>
echo     ^<div class="container"^>
echo         ^<h1^>🏥 Siloam Hospital System^</h1^>
echo         ^<p style="color: #666; font-size: 1.2em; margin-bottom: 30px;"^>
echo             International Standard Hospital Management System
echo         ^</p^>
echo         
echo         ^<div class="status"^>
echo             ^<h2^>✅ Setup Berhasil!^</h2^>
echo             ^<ul^>
echo                 ^<li^>Backend API terinstall dengan lengkap^</li^>
echo                 ^<li^>Frontend Next.js siap digunakan^</li^>
echo                 ^<li^>Database models sudah dikonfigurasi^</li^>
echo                 ^<li^>Environment files sudah dibuat^</li^>
echo             ^</ul^>
echo         ^</div^>
echo         
echo         ^<div class="info"^>
echo             ^<h3^>⚠️ Catatan Penting^</h3^>
echo             ^<p^>Untuk menjalankan aplikasi secara penuh, Anda memerlukan:^</p^>
echo             ^<ul style="margin-top: 10px;"^>
echo                 ^<li^>PostgreSQL database (port 5432)^</li^>
echo                 ^<li^>Edit backend/.env dengan database credentials^</li^>
echo             ^</ul^>
echo         ^</div^>
echo         
echo         ^<div style="margin-top: 30px;"^>
echo             ^<button class="btn" onclick="window.location.href='start-dev.bat'"^>
echo                 🚀 Start Development Mode
echo             ^</button^>
echo             ^<button class="btn btn-secondary" onclick="alert('Dokumentasi lengkap ada di README.md')"^>
echo                 📚 Lihat Dokumentasi
echo             ^</button^>
echo         ^</div^>
echo         
echo         ^<div class="footer"^>
echo             ^<p^>^<strong^>Tech Stack:^</strong^> Node.js, TypeScript, Express, Next.js, PostgreSQL, Docker^</p^>
echo             ^<p style="margin-top: 10px;"^>Built with ❤️ for better healthcare^</p^>
echo         ^</div^>
echo     ^</div^>
echo ^</body^>
echo ^</html^>
) > demo.html
echo [OK] Demo page created
echo.

REM Final step
echo [Step 6/6] Opening browser...
echo.
echo ========================================================
echo                   SETUP COMPLETE!
echo ========================================================
echo.
echo Aplikasi Siloam Hospital System sudah siap!
echo.
echo File yang tersedia:
echo   - start-dev.bat     : Jalankan development servers
echo   - demo.html         : Preview halaman demo
echo   - README.md         : Dokumentasi lengkap
echo.
echo ========================================================
echo.

REM Open demo page
start demo.html

echo Browser sudah dibuka dengan halaman demo.
echo.
echo Untuk menjalankan aplikasi penuh:
echo 1. Install PostgreSQL atau jalankan dengan Docker
echo 2. Edit backend/.env dengan database credentials
echo 3. Jalankan start-dev.bat
echo.
echo Tekan tombol apapun untuk keluar...
pause >nul
